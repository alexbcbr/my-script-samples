#!/usr/bin/python

#Criar uma tabela no DynamoDB com indice
#

import boto.dynamodb2

from boto.dynamodb2.fields import HashKey, RangeKey, KeysOnlyIndex, AllIndex
from boto.dynamodb2.table import Table
from boto.dynamodb2.types import NUMBER

print("Criacao de Tabela Key/Value Pair no Dynamo")

users = Table.create('users', schema=[
     HashKey('account_type', data_type=NUMBER),
     RangeKey('last_name'),
 ], throughput={
     'read': 5,
     'write': 15,
 }, indexes=[
     AllIndex('EverythingIndex', parts=[
         HashKey('account_type', data_type=NUMBER),
         RangeKey('last_name'),
     ])
 ],

# Definindo paramtro na regiao
connection= boto.dynamodb2.connect_to_region('us-west-2'))