#!//usr/bin/python

import boto.ec2

print '*** Apagar todos os Snapshots ***'

ec2 = boto.ec2.connect_to_region('sa-east-1')

snapshots = ec2.get_all_snapshots()

for snapshot in snapshots:
	if snapshot.description == "backup script":
		print "Deletado : "+ snapshot.id
		snapshot.delete()


print '*** Snapshots foram limpos com sucesso ***'