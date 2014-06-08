#!//usr/bin/python
import boto
from boto.s3.key import Key

conn = boto.connect_s3()

#bucket = conn.create_bucket(
#	host = "eduabc.com")

for bucket in conn.get_all_buckets():
	print bucket.name

#key = bucket.new_key('hello.txt')
#key.set_contents_from_string('Ola mundo')

bucket = conn.get_bucket('eduabc.com')
print bucket.list()

k = Key(bucket)
k.key = 'main.h'
#upload o arquivo
k.set_contents_from_filename('main.h')

#download do arquivo
k.get_contents_to_filename('main.novo')



