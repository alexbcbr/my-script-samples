#Extrair a coluna 2 de todas as linhas, tudo antes e tudo depois da coluna 2
cut -c2 teste.txt
cut -c2- teste.txt
cut -c-2 teste.txt


# Extrair o primeiro campo baseado no delimitador :
cut -d':' -f1 /etc/passwd

# Seleciona multiplos campos de um arquivo
grep "/var/root" /etc/passwd | cut -d':' -f1,3,5

# quantidade de linhas, palavras e caracteres
wc test.txt

# junta 2 arquivos colocando virgula
paste -d, file1 file2

# classifica um arquivo
sort -r arquivo.txt


