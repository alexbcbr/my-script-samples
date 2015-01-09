#!/bin/bash

# delete-users.sh - Apaga todos os usuarios e grupos criados para a demot
#
# Exemplos:
# $./delete-users 5

inicio=0;
total_contas=$1;

[ $inicio -lt $total_contas ] && o=+

while [ $inicio -ne $total_contas ]; do
	username="user"$inicio
	echo $username

	# Remove usuarios do grupo
	aws iam remove-user-from-group --user-name $username --group-name demo

	# Apaga os usuarios
	aws iam delete-login-profile --user-name $username

	# Apagar o login profile
	aws iam delete-user --user-name $username

	eval "inicio=$((inicio $o 1))"
done

# Remover todas as policies de um grupo
#aws iam list-group-policies --group-name demo
#aws iam delete-group-policy --group-name demo --policy-name AdministratorAccess-demo-201411241517

# Criar o grupo
aws iam delete-group --group-name demo

