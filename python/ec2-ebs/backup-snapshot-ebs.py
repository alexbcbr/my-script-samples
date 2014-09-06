#!//usr/bin/python

import boto.ec2

print '*** Inicio de Backup com ***'

# Conectando na regiao default
# ec2 = boto.connect_ec2()
#
# Pegando a regiao dinamicamente e passando por parametro
# r = boto.ec2.get_region('ap-southeast-1')
# conn = boto.connect_ec2( region=r)

ec2 = boto.ec2.connect_to_region('sa-east-1')

volumes = ec2.get_all_volumes()

for volume in volumes:
	print volume.id
	ec2.create_snapshot(volume.id, 'backup script')


print '*** Fim de Backup ***'