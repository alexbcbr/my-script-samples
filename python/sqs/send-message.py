#!/usr/bin/python

# Enviar uma mensagem para o SQS
# Necessario instalar o pacote simplejson para fazer teste com json  (sudo pip install simplejson)
# Texto livre nao requer este pacote

import boto, uuid, simplejson

print "Inicio Envio de mensagem SQS"

sqs = boto.connect_sqs()
sqs = boto.sqs.connect_to_region('sa-east-1')

q = sqs.create_queue('DevOps')

message = q.new_message("Teste via python")
q.write(message)

message = q.new_message(body=simplejson.dumps({'nome': 'ALEX' , 'idade': '10'}))
q.write(message)

print "Fim de envio de mensagem SQS"