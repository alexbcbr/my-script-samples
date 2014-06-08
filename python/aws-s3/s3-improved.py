#!//usr/bin/python

import boto
import os.path
import sys
import os
import glob
from boto.s3.key import Key

action = sys.argv[1]
bucket_name = sys.argv[2]

s3 = boto.connect_s3()

#Verifica se o bucket nao existe
if action == "create-bucket":
	if not s3.lookup(bucket_name):
		print "Criando o bucket"
		s3.create_bucket(bucket_name)

#criar uma nova key no s3

if action == "create-object":
	bucket = s3.get_bucket(bucket_name)
	key = Key(bucket)
	key.key = sys.argv[3]
	key.set_contents_from_string(sys.argv[4])

if action == "upload-txt-file":
	print "Inicio de upload"
	bucket = s3.get_bucket(bucket_name)
	print "upload de arquivos: " + bucket_name
	for file in glob.glob("*.txt"):
		key = bucket.new_key("files/" + file)
		key.set_contents_from_filename(file, encrypt_key=True, reduced_redundancy=True)
		print "Arquivo uploaded" + file


if action == "delete-bucket":
	bucket = s3.get_bucket(bucket_name)
	for key in bucket.list():
		key.delete()
	s3.delete_bucket(bucket_name)

if action == "create-website":
	print "vou criar meu website"
	bucket = s3.create_bucket(bucket_name)
	index_file = bucket.new_key('index.html')
	index_file.content_type = "text/html"
	error_file = bucket.new_key('error.html')
	error_file.content_type = "text/html"

	index_html = "<html><head><title>Comin soon</title></head><body><h1>Comming</h1></body></html>"
	error_html = "<html><head><title>Comin soon</title></head><body><h1>Error</h1></body></html>"

	error_file.set_contents_from_string(error_html, policy='public-read')
	index_file.set_contents_from_string(index_html, policy='public-read')

	bucket.configure_website('index.html', 'error.html')
	print "website URL " + bucket.get_website_endpoint()


	
