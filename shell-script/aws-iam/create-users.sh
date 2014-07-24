#!/bin/bash

# create-users.sh - Criar um conjunto de usuarios no IAM e associa-los a um grupo bucket
#
# Exemplos:
# $./create-users

# Criar os usuarios
aws iam create-user --user-name user1
aws iam create-user --user-name user2
aws iam create-user --user-name user3

# Atribuir uma senha
aws iam create-login-profile --user-name user1 --password password
aws iam create-login-profile --user-name user2 --password password
aws iam create-login-profile --user-name user3 --password password

# Criar o grupo
aws iam create-group --group-name demo

# Associar usuarios ao grupo
aws iam add-user-to-group --group-name demo --user-name user1
aws iam add-user-to-group --group-name demo --user-name user2
aws iam add-user-to-group --group-name demo --user-name user3


