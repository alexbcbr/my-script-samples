#!/usr/bin/python

# Enviar uma mensagem para o SNS

import boto

print "Inicio Envio de mensagem SNS"

sns = boto.connect_sns()
sns = boto.sns.connect_to_region('sa-east-1')

topics = sns.get_all_topics()
mytopics = topics["ListTopicsResponse"]["ListTopicsResult"]["Topics"]
mytopic_arn = mytopics[0]["TopicArn"]

msg = "Hi there\nI am sending this message over boto.\nYour booty Jan"
subj = "SNS message over boto"
res = sns.publish(mytopic_arn, msg, subj)

#q = sns.publish(topic='sns-govdemo', message='Python', subject='Assunto de Python', target_arn=None, message_structure=None, message_attributes=None)
#q = sns.publish(topic='sns-govdemo', message='Python', subject='Assunto de Python')

print "Fim de envio de mensagem SNS"