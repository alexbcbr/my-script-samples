from datetime import datetime

#Aplicacao demo para pegar dados do teclado e imprimir os valores na tela em um o
#

#Produto A
def camiseta():
	codProduto = 1
	nome_Produto = "Camiseta"
	disponibilidadeEstoque = True

	return nome_Produto

hora = datetime.now()
produto = raw_input("Forneca o codigo do produto ?")
qt_comprada = raw_input("Quantidade comprada ?")

print len(produto)

if produto == "1":
	print "Foram compradas %s - %s, do produto %s, " \
	"no dia %s/%s/%s %s:%s" %(qt_comprada, camiseta().upper(), produto, hora.day, hora.month, hora.year, \
						  hora.hour, hora.minute)

elif produto == "2":
	print "Foram compradas %s - %s, do produto %s, " \
	"no dia %s/%s/%s %s:%s" %(qt_comprada, camiseta().upper(), produto, hora.day, hora.month, hora.year, \
						  hora.hour, hora.minute)

else:
	print "Produto invalido"


