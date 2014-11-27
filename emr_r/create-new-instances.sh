aws configure set preview.emr true

git clone https://github.com/awslabs/emr-bootstrap-actions.git

aws emr create-cluster --enable-debugging --log-uri s3://sep.emr/logs --ami-version 3.2.1 --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m1.medium InstanceGroupType=CORE,InstanceCount=5,InstanceType=m1.medium --bootstrap-actions Path=s3://sep.emr/emr-bootstrap-actions/R/Hadoop/emR_bootstrap.sh,Name=CustomAction,Args=[--rstudio,--rexamples,--plyrmr,--rhdfs] --steps Name=HDFS_tmp_permission,Jar=s3://elasticmapreduce/libs/script-runner/script-runner.jar,Args=s3://sep.emr/emr-bootstrap-actions/R/Hadoop/hdfs_permission.sh --region us-west-2 --ec2-attributes KeyName=oregon-hadoop-keypair,AvailabilityZone=us-west-2a --no-auto-terminate --name emR-example-medium-4

