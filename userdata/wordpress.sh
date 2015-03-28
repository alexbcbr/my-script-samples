sudo apt-get update

#(tasksel permite selecionar packages)
sudo apt-get install tasksel 

#Selecione o LAMP no taskcel
sudo tasksel

wget http://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo service mysql start

mysql -u root -p
> create user 'ubuntu'@'localhost' IDENTIFIED BY 'password';
> create database wordpressdb;
> grant all privileges on wordpressdb.* to ubuntu@localhost;
> flush privileges;

cp wp-config-sample.php wp-config.php
#Modificar usuario, senha e nome do banco de dados
#Gerar keys em http://api.wordpress.org/secret-key/1.1/salt
#e copiar no wp-config.php

sudo cp -r * /var/www/html
cd /var/www/html
mv index.html index.html.backup
sudo addgroup www
sudo usermod -a -G www ubuntu
sudo chgrp -R www /var/www/html
sudo chmod 2775 /var/www/html
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type d -exec sudo chmod 0664 {} +
sudo service apache2 restart

#Migrando o database para RDS
#mysqldump -u ubuntu -p --databases wordpress-db | mysql --host=<RDS-Endpoint> --port=3306 --user=ubuntu --password=<password>
mysqldump -u ubuntu -p --databases wordpressdb | mysql --host=mydbinstance.us-eats-1.rds.amazonaws.com --port=3306 --user ubuntu --password=password
mysqldump -u root -p --databases demo | mysql --host=dbdemo.cftexyidv059.sa-east-1.rds.amazonaws.com -u dbadmin --password=Passw0rd

## Instalar o Varnish (Cache & http reverse proxy)

#Habilitar repos externos
sudo apt-get install apt-transport-https
sudo su
curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add -
echo "deb http://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
sudo apt-get update
sudo apt-get install varnish
sudo service varnish status
sudo vim /etc/varnish/default.vcl
#mudar host & port
sudo service varnish reload
sudo vim /etc/default/varnish
#descomentar a diretiva DAEMON_OPTS e mudar a porta para 80
sudo service varnish reload







