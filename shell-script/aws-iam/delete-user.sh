#!/bin/bash

# delete-users.sh - Apaga todos os usuarios e grupos criados para a demot
#
# Exemplos:
# $./delete-users

# Remove usuarios do grupo
aws iam remove-user-from-group --user-name user1 --group-name demo
aws iam remove-user-from-group --user-name user2 --group-name demo
aws iam remove-user-from-group --user-name user3 --group-name demo


# Apaga os usuarios
aws iam delete-login-profile --user-name user1
aws iam delete-login-profile --user-name user2
aws iam delete-login-profile --user-name user3

# Apagar o login profile
aws iam delete-user --user-name user1
aws iam delete-user --user-name user2
aws iam delete-user --user-name user3


# Criar o grupo
aws iam delete-group --group-name demo

