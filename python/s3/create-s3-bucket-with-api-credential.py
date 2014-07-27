#!//usr/bin/python
import boto

#Capturando credential de access key e secret access key de arquivo de propriedades
prop = dict(line.strip().split('=') for line in open('../../../credential.config'))

#Acessando as permissoes definidas na policy do usuario para estabelecer a criacao do bucket
conn = boto.connect_s3(prop['access_key_id'], prop['secret_access_key'])

bucket = conn.create_bucket('alexbc3.la.test')


