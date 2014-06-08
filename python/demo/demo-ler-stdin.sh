#!/bin/bash

# Verifica se há paratro com o arquivo
if [ -z "$1" ]
then
   echo "nao tem parametro"
   ARQUIVO="demo-ler-stdin.py"
else
   ARQUIVO="$1"
   echo "tem parametro"
fi

cat $ARQUIVO | python demo-ler-stdin.py 

