#!/bin/sh
yum -y install tomcat8 tomcat8-webapps
chkconfig tomcat8 on
service tomcat8 start
