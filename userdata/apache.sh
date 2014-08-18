#!/bin/sh
yum -y install httpd
chkconfig httpd on
/etc/init.d/httpd start
