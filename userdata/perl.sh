#Instalar o perl (centos/aws linux)
sudo yum install perl-Switch perl-Sys-Syslog perl-LWP-protocol-https

#Instalar o perl (other linux)
sudo apt-get install unzip libwww-perl libcrypt-ssleay-perl

#instalar scripts perl para monitorar memoria
wget http://labfiles.linuxacademy.com/livelab/cloudwatchscripts.tar.gz
tar -zxvf cloudwatchscripts.tar.gz 

~/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --swap-util --swap-used --disk-space-util --disk-space-used --disk-space-avail --memory-units=megabytes --disk-space-units=gigabytes --disk-path=/dev/xvda1
