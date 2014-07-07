#!//usr/bin/python
#
# Criar um bucket no S3. Esta aplicacao esta usando as credenciais em ~/.aws/credentials
#

import boto
from boto.s3.connection import Location

# imprime todas as regioes disponiveis
print '\n'.join(i for i in dir(Location) if i[0].isupper())

# conecta e cria a regiao em sao paulo
conn = boto.connect_s3()
bucket = conn.create_bucket('alexbc.la.test', location=Location.SAEast)


