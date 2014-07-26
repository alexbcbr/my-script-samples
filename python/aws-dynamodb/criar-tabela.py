#!/usr/bin/python

#Criar uma tabela no DynamoDB
#

import boto.dynamodb2

from boto.dynamodb2.fields import HashKey, RangeKey, AllIndex
from boto.dynamodb2.table import Table
from boto.dynamodb2.types import NUMBER
from boto.dynamodb2.types import STRING

print "Criacao de Tabela Key/Value Pair no Dynamo"

students = Table.create('Estudantes', schema=[
     HashKey('identidade'),
],connection= boto.dynamodb2.connect_to_region('us-west-2'))

#customers = Table.create('customers3', schema=[
#     HashKey('account_type', data_type=NUMBER),
#     RangeKey('last_name'),
# ], throughput={
#     'read': 5,
#     'write': 15,
# }, indexes=[
#     AllIndex('EverythingIndex', parts=[
#         HashKey('account_type', data_type=NUMBER),
#     ])
# ],connection= boto.dynamodb2.connect_to_region('us-west-2'))

print "Fim de criacao de tabela"