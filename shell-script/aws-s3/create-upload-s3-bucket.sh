#!/bin/bash

# create-upload-s3-bucket.sh - Criar um bucket no s3 usando o AWS CLI
#
# Exemplos:
# $./create-upload-s3-bucket.sh meu.bucket.alex

aws s3 mb s3://$1
aws s3 cp create-s3-bucket.sh s3://$1
aws s3 sync . s3://$1

