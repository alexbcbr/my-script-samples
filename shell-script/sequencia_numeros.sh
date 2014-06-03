#!/bin/bash
#
#
# sequencia_numeros.sh - o comando recebe 2 numeros e apresenta todo o intervalo entre eles
#
# $ ./sqr.sh 10 5
# uso em script: for i in $(seq 5 10); do comandos; done

o=+
initial_value=1
final_value=${1:-1}

[ "$2" ] && {

	initial_value=$1;
	final_value=$2;
}

[ $initial_value -gt $final_value ] && o=-

while [ $initial_value -ne $final_value ]; do
	echo $initial_value
	eval "initial_value=$((initial_value $o 1))"
done

echo $final_value



