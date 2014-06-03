#!/bin/sh
#
# gera_arquivo.sh - Gera arquivo texto caso não exista ou le arquivo caso 
# 		    arquivo seja encontrado. Se for letras ele reclama mas grava#
#

echo "Nome do arquivo:"
read FILENAME

# Check for the filename

if [ -s ${FILENAME}_DAT ]; then
        # Read content of the file
        FILECONTENT=`cat ${FILENAME}_DAT`
        echo "O conteudo do arquivo é $FILECONTENT"

else
        echo "Forneça os dados para criar o arquivo"
        read FILECONTENT

	if [ "$FILECONTENT" -le 1 ]; then
		echo "Valor de numero 1 é permitido"
	else
		if [ "$FILECONTENT" -ge 100 ]; then
			echo "Numero 100 não é permitido"
		else
        		# Write the content into a new file.
        		echo $FILECONTENT > ${FILENAME}_DAT
        	fi
        fi
fi

