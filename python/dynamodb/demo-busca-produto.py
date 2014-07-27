#!/usr/bin/python

#Aplicacao demo integradno python e dynamoDB
#

import boto.dynamodb2
import exceptions

from datetime import datetime
from boto.dynamodb2.table import Table

studentsTable = Table("Estudantes",
	connection= boto.dynamodb2.connect_to_region('us-west-2'))

def existeRegistro(hash_key, value):
    try:
        item = studentsTable.get_item(identidade=value)
        print "Aluno: %s " %(item['nome'])
    except boto.dynamodb2.exceptions.ItemNotFound:
    	print "Aluno nao encontrado "
        item = None
    except boto.dynamodb.exceptions.DynamoDBKeyNotFoundError:
    	print "Aluno nao encontrado "
        item = None
    return item

empresa = {'nome' : "FIAP", 'empregados' : 105, 'Faturamento' : 10623.12}
hora = datetime.now()
print empresa['nome']

id = raw_input("Forneca a identidade do estudante ?")

existeRegistro('identidade', id)
