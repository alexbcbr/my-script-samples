#!/bin/bash
#
# crawler_estadao.sh - Busca noticias do estadao no caderno de economia
#                      e grava o resultado no arquivo noticias-economia.txt
#
# Exemplos:
# $./estadao_crawler.sh 
# Inclui mais informacoes no arquivo destino
#
# $./estadao_crawler.sh -n 
# reseta o arquivo destino e cria novo conjunto de informacoes
#
# $./estadao_crawler.sh -f chuva 
# procura palavra chave chuva no arquivo gerado no crawler
#
# Historico:
# Versao 1.0 - Versão inicial do crawler
# Versao 1.1 - Inclui mecanismo de busca por palavra chave
#
#-----------------------------------------------------

OUTPUT_FILE="data/crawler-estadao-noticias-economia.txt"

case "$1" in
    -f)
	grep $2 $OUTPUT_FILE
	echo $2
	exit 0
	;;
    -n)
	rm $OUTPUT_FILE
	;;
esac

curl -s -w '\n' http://economia.estadao.com.br/EN/rss/economia.xml | fgrep '<description><![CDATA[' | cut -d '[' -f 3 | sed 's/\<\/description\>//g' >> $OUTPUT_FILE

