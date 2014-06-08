#!/usr/bin/python

#Aplicacao demo demonstrando diversas instrucoes em python
#

from datetime import datetime

def camiseta():
	codProduto = 1
	nome_Produto = "Camiseta"
	disponibilidadeEstoque = True
	return nome_Produto

def preco_total(quantidade, preco_unitario):
	preco_final = quantidade*preco_unitario
	return preco_final

def melhor_desconto(*args):
    print max(args)
    return max(args)

empresa = {'nome' : "FIAP Roupas", 'empregados' : 105, 'Faturamento' : 10623.12}
del empresa['Faturamento']

empresa['empregados'] = 200

tamanho_roupa = ["pequeno", "medio", "grande", "extra-grande"];
tamanho_roupa.append("extra-pequeno")
tamanho_roupa.remove("extra-grande")
tamanho_roupa.sort()


hora = datetime.now()
print empresa['nome']
print empresa['empregados']

produto = raw_input("Forneca o codigo do produto ?")
qt_comprada = raw_input("Quantidade comprada ?")

print "*** Tamanhos disponiveis: ***"
for number in tamanho_roupa:
   print number
print "*****************************"

print type(qt_comprada)

print len(produto)

if produto == "1":
	print "Foram compradas %s - %s, do produto %s, " \
	"no dia %s/%s/%s %s:%s" %(qt_comprada, camiseta().upper(), produto, hora.day, hora.month, hora.year, \
						  hora.hour, hora.minute)
	print "Preco Total: %d" %(preco_total(int(qt_comprada), 5))
	print melhor_desconto(5, 10, 15)
	print tamanho_roupa[2]

elif produto == "2":
	print "Foram compradas %s - %s, do produto %s, " \
	"no dia %s/%s/%s %s:%s" %(qt_comprada, camiseta().upper(), produto, hora.day, hora.month, hora.year, \
						  hora.hour, hora.minute)

else:
	print "Produto invalido"

