# Mostra o tipo de terminal da console 

echo $TERM

if test "$TERM" = "vt100"
then
	USAR_CORES=0

else
	USAR_CORES=1
fi
