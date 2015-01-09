#!/bin/bash

# add-policy.sh - Adiciona politica restritiva para usuarios demo
#
# Exemplos:
# $./add-policy.sh

aws iam put-group-policy --group-name demo --policy-name demo-group-policy-minimum --policy-document file://demo-user-policy.json



