#!/usr/bin/python

# Realizar as operacoes de CRUD em uma tabela de DynamoDB
#

import boto.dynamodb2

from boto.dynamodb2.fields import HashKey, RangeKey, AllIndex
from boto.dynamodb2.table import Table
from boto.dynamodb2.items import Item
from boto.dynamodb2.types import NUMBER
from boto.dynamodb2.types import STRING

studentsTable = Table("Estudantes",
	connection= boto.dynamodb2.connect_to_region('us-west-2'))

#Gravando os dados diretamente no Dynamo

print "Inclusao de registros"

studentsTable.put_item(data={
     'identidade': '1',
     'nome': 'Alex',
     'endereco': 'Rua epaminondas, 10',
})

# Colocando os dados em memoria e depois persistindo
sueli = Item(studentsTable, data={
     'identidade': '2',
     'nome': 'Sueli',
     'cidade': 'Sao Paulo',
})
sueli.save()

print "Pesquisa de registros"

result_set = studentsTable.scan()
for estudante in result_set:
    print estudante['identidade']

estudantePesquisado = studentsTable.get_item(identidade='1')
print estudantePesquisado['nome']

print "Atualizacao de registros"
estudantePesquisado['nome'] = 'Coqueiro'
print estudantePesquisado['nome']

print "Apagar um atributo"
del estudantePesquisado['endereco']

print "Commit de dados"
estudantePesquisado.save()

print "Apagar um item"
estudantePesquisado.delete()

print "Fim"