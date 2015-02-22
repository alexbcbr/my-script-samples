#!/bin/bash
yum update -y
yum install -y httpd php
service httpd start
chkconfig httpd on
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php