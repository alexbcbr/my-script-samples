#!/bin/bash

# Aplicacao de demo  de texto de exemplo que captura dados e imprime resultado 
#

echo "Digite o código do produto: "
read codProduto

if [ $codProduto -eq "1" ]
then
	echo "Produto $codProduto é camiseta"

elif [ $codProduto -eq "2"]
then
	echo "Produto $codProduto é calca"

else
	echo "Produto $codProduto não cadastrado"

fi
