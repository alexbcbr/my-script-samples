DEBUG=1

#Funcao de debug
Debug() {
   [ "$DEBUG" = 1 ] && echo "$*"
}


TXT="gritaria"
TXT="    $TXT     "

Debug "Txt com espaco"
TXT=$(echo $TXT | tr ' ' '!')
TXT=$(echo $TXT | tr a-z A-Z)

Debug "Txt sem espaco: [$TXT]"

echo "$TXT"

