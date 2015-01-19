# Procedimento para pre-warm do EBS
#
lsblk

df -kh

sudo file -s /dev/xvdf

dd if=/dev/zero of=/dev/xvdf bs=1M

sudo mkfs -t ext4 /dev/xvdf

sudo mkdir /data

sudo mount /dev/xvdf /data

#Configuracao do /etc/fstab indicando rw para a particao e 0 (nao fazer dump para backup) 2 (faze check disk no 2 volume)
#/dev/xvdf   /home/ec2-user/data ext4    defaults,nofail 0       2

sudo mount -a

sudo chown ec2-user:ec2-user /data


