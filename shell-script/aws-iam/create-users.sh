#!/bin/bash

# create-users.sh - Criar um conjunto de usuarios no IAM e associa-los a um grupo bucket
#
# Exemplos:
# $./create-users 5

inicio=0;
total_contas=$1;

[ $inicio -lt $total_contas ] && o=+

# Criar o grupo
aws iam create-group --group-name demo

while [ $inicio -ne $total_contas ]; do
	username="user"$inicio
	echo $username

	# Criar os usuarios
	aws iam create-user --user-name $username

	# Atribuir uma senha
	aws iam create-login-profile --user-name $username --password password

	# Associar usuarios ao grupo
	aws iam add-user-to-group --group-name demo --user-name $username

	eval "inicio=$((inicio $o 1))"
done


