#!/usr/bin/python

# Ler mensagens na fila do SQS

import boto.sqs

print "Inicio leitura de mensagem SQS"

sqs = boto.connect_sqs()
sqs = boto.sqs.connect_to_region('sa-east-1')

q = sqs.get_queue('DevOps')

#Quantidade de mensagens na fila
print q.count()

qtMensagensSolicitadas = 2
rs = q.get_messages(qtMensagensSolicitadas)

#Quantidade de mensagens que foram realmente lidas
print len(rs)

qtMensagens = 0
while qtMensagens < len(rs):
	m = rs[qtMensagens]
	print m.get_body()
	q.delete_message(m)
	qtMensagens = qtMensagens + 1

print "Fim da leitura de mensagem SQS"