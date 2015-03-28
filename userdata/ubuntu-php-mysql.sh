#!/bin/bash
apt-get install -y apache2 php5 vim wget unzip php5-mysql
service apache2 status
apt-get install -y mysql-server
apt-get install -y php5-memcached
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php