#!/bin/bash
#
# disparar_request_curl.sh - Multiplos requests para teste
#
# Exemplos:
# $./disparar_request_curl.sh http://54.94.141.70 10
#
# Historico:
# Versao 1.0 - Versão inicial
#
#-----------------------------------------------------

MENSAGEM_USO="
Uso: $0 [-h]
	Primeiro parametro define a URL e o segundo parametro define
	a quantidade de requests
"
if test "$1" = '-h'
then
	echo "$MENSAGEM_USO"
	exit 0
fi

echo "*** Inicio de Requests ***"

vlr_total=$2
vlr_current=1
while [ $vlr_current -le $vlr_total ]
do
	curl -s -R -w '\n' $1 -o /dev/null
	echo $vlr_current
	(( vlr_current++ ))
done

echo "*** Fim de Requests ***"