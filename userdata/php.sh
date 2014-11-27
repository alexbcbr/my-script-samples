#!/bin/bash
yum update -y
yum install -y apache php
service httpd start
chkconfig httpd on
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php