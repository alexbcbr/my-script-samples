# Indicar a imagem base
FROM ubuntu

# Criar um arquivo
RUN touch /stuff

MAINTAINER Alex BC

# Atualizar os repos e instalar o apache
RUN apt-get update && apt-get install -y apache2 curl

#append no arquivo para inicializar o apache de forma automatica
RUN echo "service apache2 start" >> /etc/bash.bashrc 

#Montar o datasouce (do Dockerpath) na maquina host
#ADD /home/teste/data/  /var/www/html
ADD index.html /var/www/html/

# Abrir Porta 8080
EXPOSE 8080

## Incluir parametros abaixo no host do docker para atribuir um ip fixo
## auto docker0
## iface docker0 inet static
## address 176.17.0.251
## netmask 255.255.0.0
## 
## em linha de comando
## $ sudo ifup docker0
## $ docker build -t apache-a .

#### rodar o docker com configuracoes de rede do host e como daemon
## $ docker run --net=host -d -t apache-a