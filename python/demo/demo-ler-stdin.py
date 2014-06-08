import sys
from datetime import datetime

#ler stdin e imprimir a quantidade de linhas encontradas no arquivo
#

print datetime.now()
print "**********************************"

data = sys.stdin.readlines()
print "Encontrada", len(data), "linhas."

print "**********************************"
print datetime.now()

