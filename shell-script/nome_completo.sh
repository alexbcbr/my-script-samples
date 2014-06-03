#!/bin/bash
#
# nome_completo.sh - Busca o nome completo do usuario
#
# Exemplos:
# $./nome_completo.sh jose
# Jose Moreira
#
# Historico:
# Versao 1.0 - Versão inicial procurando no /etc/passwd
# Versao 1.1 - Adicionando suporte a help e versionamento
#
#-----------------------------------------------------

ordenar=0 

MENSAGEM_USO="
Uso: $0 [-h]
	-h Mostra esta tela de ajuda e sai
"


# Tratamento das opções de linha de comando
case "$1" in
   -h)
	echo "$MENSAGEM_USO"
	exit 0
	;;
   -s)
	ordenar=1
	;;
   -V)
	echo -n $(basename "$0") 
	grep '^# Versao ' "$0" | tail -1 | cut -d - -f1 | tr -d \# 
	exit 0
	;;
   *)
	if test -n "$1"
	then
	   echo Opcao Invalida: $1
	   exit 1
	fi
	;;
esac

#
lista=$(cut -d: -f1,5 /etc/passwd)

if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi

echo "$lista" | tr : \\t


