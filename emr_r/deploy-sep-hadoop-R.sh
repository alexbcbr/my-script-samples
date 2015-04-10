#!/bin/bash
#
# deploy-sep-hadoop-R.sh - Deploy an environment with Hadoop and R and run a R script to plot a graph
#
# Exemplos:
# $./deploy-sep-hadoop-R.sh pt sa-east-1 hadoop-keypair sep.emr.demo
# $./deploy-sep-hadoop-R.sh es us-west-2 oregon-hadoop-keypair sep.emr.demo4
# 
#
# Revisions:
# Versao 1.0 - First version for MacOSX and Linux
#
# Future Releases:
# Script multiplatform
# Ingestion & Output data in S3
#
#-----------------------------------------------------

if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]
then
	language=$1
	region=$2
	keypair=$3
	keypair_pem=$keypair".pem"
	az=$region"b"
	bucket=$4
else
	echo "***************************************************"
	echo "*** ERROR: Parameters are Invalid ! ***"
	echo "You also need to install AWS CLI as well as you must configure your credentials <aws configure>"
	echo "Sintax: ./deploy-sep-hadoop-R.sh <language en|es|pt> <region> <keypair.pem> <bucket>"
	echo "Example: ./deploy-sep-hadoop-R.sh en us-east-1 virginia sep.emr.demo"
	echo "***************************************************"
	exit 1
fi

case "$language" in
   en)
	welcome_message="... Beginnning ..."
	waiting_message="... Cluster Provisioning in progress ..."
	closing_message="... Image available in your computer ..."
	;;
   es)
	welcome_message="... Iniciar procesamiento ..."
	waiting_message="... Aprovisionamiento de Cluster ..."
	closing_message="... Imagen disponible en su computadora ..."
	;;
   pt)
	welcome_message="... Inicio de Processamento ..."
	waiting_message="... Aguardando Provisionamento do Cluster ..."
	closing_message="... Imagem disponivel no seu computador ..."
	;;
   *)
	echo "*** Error: Language is not supported ***"
	exit 1
	;;
esac

echo $welcome_message

aws configure set preview.emr true

bucket_creation=$(aws s3 mb s3://$bucket --region $region 2> sep-error.log)
if [ -s "sep-error.log" ]
then
	echo "*** ERROR: sep-error.log was created ***"
 	cat sep-error.log
 	exit 1
else
 	echo "Bucket crated"
fi

git clone https://github.com/awslabs/emr-bootstrap-actions.git
aws s3 sync emr-bootstrap-actions s3://$bucket/emr-bootstrap-actions/ --region $region

mkdir logs
touch logs/init.log
aws s3 sync logs s3://$bucket/logs/ --region $region

clusterid=$(aws emr create-cluster --enable-debugging --log-uri s3://$bucket/logs --ami-version 3.2.1 --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.xlarge InstanceGroupType=CORE,InstanceCount=2,InstanceType=m3.xlarge --bootstrap-actions Path=s3://$bucket/emr-bootstrap-actions/R/Hadoop/emR_bootstrap.sh,Name=CustomAction,Args=[--rstudio,--rexamples,--plyrmr,--rhdfs] --steps Name=HDFS_tmp_permission,Jar=s3://elasticmapreduce/libs/script-runner/script-runner.jar,Args=s3://$bucket/emr-bootstrap-actions/R/Hadoop/hdfs_permission.sh --region $region --ec2-attributes KeyName=$keypair,AvailabilityZone=$az --no-auto-terminate --name sep-EMR-R --tags Name=SEP_EMR_R)
echo $clusterid
clusterid=$(echo $clusterid | cut -d'|' -f5 | tr -d ' ' | tr -d "\"" | tr -d "}")
echo $clusterid

status="0"

while [ $status -eq "0" ]; do
	echo $waiting_message
	status=$(aws emr describe-cluster --cluster-id $clusterid --region $region | grep "State" | grep "RUNNING" | wc -l)
	sleep 15
done

aws emr list-instances --cluster-id j-3PECZXHMVUH1Z --region us-east-1 --instance-group-types MASTER
ipmaster=$(aws emr list-instances --cluster-id $clusterid --region $region --instance-group-types MASTER | grep PublicIpAddress)
echo $ipmaster

ipmaster=$(echo $ipmaster | cut -d'|' -f4 | tr -d ' ')
echo $ipmaster

chmod 400 $keypair_pem

scp -i $keypair_pem -o StrictHostKeyChecking=no visualization-demo.R hadoop@$ipmaster:visualization-demo.R
scp -i $keypair_pem -o StrictHostKeyChecking=no visualization-hdfs.R hadoop@$ipmaster:visualization-hdfs.R
scp -i $keypair_pem -o StrictHostKeyChecking=no setup.R hadoop@$ipmaster:setup.R

scp -i $keypair_pem -o StrictHostKeyChecking=no data/unemployment2.csv hadoop@$ipmaster:unemployment2.csv

ssh -i $keypair_pem -o StrictHostKeyChecking=no hadoop@$ipmaster 'hadoop fs -mkdir /tmp/data/'
ssh -i $keypair_pem -o StrictHostKeyChecking=no hadoop@$ipmaster 'hadoop fs -put unemployment2.csv /tmp/data/unemployment2.csv'

ssh -i $keypair_pem -o StrictHostKeyChecking=no hadoop@$ipmaster 'sudo Rscript setup.R'
ssh -i $keypair_pem -o StrictHostKeyChecking=no hadoop@$ipmaster 'Rscript visualization-hdfs.R'

scp -i $keypair_pem -o StrictHostKeyChecking=no hadoop@$ipmaster:output-analysis.png output-analysis.png

echo $closing_message
