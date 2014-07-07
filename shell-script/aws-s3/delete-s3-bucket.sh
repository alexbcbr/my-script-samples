#!/bin/bash

# delete-s3-bucket.sh - Apaga um bucket no s3 usando o AWS CLI
#
# Exemplos:
# $./delete-s3-bucket.sh meu.bucket.alex

aws s3 rb s3://$1 --force


