#!/usr/bin/python

# Conectar BD no MySQL
# Necessario instalar conector de MYSQL para Python
# http://dev.mysql.com/doc/connector-python/en/connector-python-installation-source-unix.html

import mysql.connector
from mysql.connector import errorcode

print "Inicio de Processamento"

config = {
  'user': 'usario_bd',
  'password': 'senha_bd',
  'host': 'govinstance.cftexyidv059.sa-east-1.rds.amazonaws.com',
  'database': 'db_demo',
  'raise_on_warnings': True,
}

try:
#	cnx = mysql.connector.connect(user='usuario', password='senha',
#                              host='govinstance.cftexyidv059.sa-east-1.rds.amazonaws.com',
#                              database='db_demo')

	cnx = mysql.connector.connect(**config)

except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Erro de acesso com usuario e senha")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database nao existe")
  else:
    print(err)

else:
  cnx.close()

print "Fim de conexao com banco de dados MySQL"