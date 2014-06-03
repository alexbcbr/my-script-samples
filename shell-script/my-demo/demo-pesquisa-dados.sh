#!/bin/bash

# Aplicacao de demo  de texto de exemplo que captura dados e imprime resultado 
#

echo "Digite o código do produto: "
read codProduto

if test "$codProduto" = "1"
then
	echo "Produto $codProduto é camiseta"
else
	echo "Produto $codProduto é calca"
fi
