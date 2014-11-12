# Read file from files ystem
# Author: Alex Coqueiro

# Eg: source("~/wd/my-script-samples/emr_r/visualization-filesystem.R")

initial.dir<-getwd()
un <- read.csv("~/wd/my-script-samples/emr_r/data/unemployment.csv")
un1 <- table(un$Ethinicity, un$Region, un$Sex, dnn=c("Ethinicity", "Region","Sex"))

library(vcd)
mosaic(un1, shade=TRUE, legend=TRUE);

