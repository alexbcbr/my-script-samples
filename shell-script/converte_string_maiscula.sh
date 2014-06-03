#!/bin/bash
#
# ./letra_maiscula - converte qualquer sequencia de letras em maisculo
#
# Exemplo: $./converte_string__maiscula alex
#	   ALEX
#

echo "$1" | tr a-z A-Z
