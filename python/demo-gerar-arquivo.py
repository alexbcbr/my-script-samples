my_list = [i**2 for i in range(1,11)]
# Generates a list of squares of the numbers 1 - 10

#Escreve dados em um arquivo
f = open("output.txt", "w")

for item in my_list:
    f.write(str(item) + "\n")

f.close()

#Le dados de um arquivo
my_file = open("output.txt", "r+")

print my_file.read()

my_file.close()


#Le somente uma linha
my_file = open("output.txt", "r+")

print my_file.readline()

my_file.close()


########### Automaticamente fechar o arquivo
with open("text.txt", "w") as textfile:
	textfile.write("Success!")
