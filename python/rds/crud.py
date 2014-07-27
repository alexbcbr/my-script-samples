#!/usr/bin/python

# Acessar dados no MySQL
# Sintaxe: ./crud.py usuario senha
#
# Necessario instalar conector de MYSQL para Python
# http://dev.mysql.com/doc/connector-python/en/connector-python-installation-source-unix.html

import sys
import mysql.connector
from datetime import date, datetime, timedelta

print "Inicio de Processamento"

usuario = sys.argv[1]
senha = sys.argv[2]

print "Usuario: " + usuario
print "Senha:" + senha

config = {
  'user': usuario,
  'password': senha,
  'host': 'govinstance.cftexyidv059.sa-east-1.rds.amazonaws.com',
  'database': 'db_demo',
  'raise_on_warnings': True,
}

cnx = mysql.connector.connect(**config)

cursor = cnx.cursor()

# Pesquisar clientes
query = ("SELECT nome, telefone FROM cliente")
cursor.execute(query)

for (nome, telefone) in cursor:
  print("{}, {}".format(nome, telefone))


# Incluir clientes
add_clientes = ("INSERT INTO cliente "
               "(nome, telefone, dt_nascimento, cep, endereco) "
               "VALUES (%s, %s, %s, %s, %s)")

data_cliente = ('Geraldo', '123-4568', date(1977, 6, 14), '0000', 'Rua Epaminondas, 10')

cursor.execute(add_clientes, data_cliente)

cliente_id = cursor.lastrowid

print cliente_id

cnx.commit()

cnx.close()

print "Fim de operacao no MySQL"