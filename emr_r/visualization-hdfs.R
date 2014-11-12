# Read file from HDFS using RHadoop
# Author: Alex Coqueiro
# API Support: https://github.com/RevolutionAnalytics/RHadoop/wiki/user-rhdfs-Home

# Eg: source("~/emr_r/visualizacao.R")
# set R environments
Sys.setenv(HADOOP_CMD="/home/hadoop/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/home/hadoop/contrib/streaming/hadoop-streaming.jar")
Sys.setenv(JAVA_HOME="/usr/java/latest/jre")

# load librarys
library(rmr2)
library(rhdfs)

# initiate rhdfs package
hdfs.init()

# parameters definition of file
arq.in.format = 
  make.input.format(
    "csv", 
    sep = ",")

# read file from hdfs
unl <- from.dfs("/tmp/data/unemployment2.csv", 
                format = arq.in.format)

initial.dir<-getwd()

# data structure (table with aggregation)
df = data.frame(unl$val$V1, unl$val$V2, unl$val$V3)
un1 <- table(df$unl.val.V1, df$unl.val.V2, df$unl.val.V3, dnn=c("Ethinicity", "Region","Sex"))

# visualization (show graph)
library(vcd)
mosaic(un1, shade=TRUE, legend=TRUE);

