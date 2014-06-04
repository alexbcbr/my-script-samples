#!/usr/bin/python

# Ler arquivo de propriedades
#

H = dict(line.strip().split('=') for line in open('filename.txt'))

print H
print H['property1']
print H['property2']
