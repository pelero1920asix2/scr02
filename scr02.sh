#!/bin/bash
#
###FUNCIONS
function crea {
	if [ ! -d $1 ]
	then
		mkdir $1
		echo "Creat el directori $1"
	fi
	return 0
}

####PROGRAMA PRINCIPAL
#
# Comprova si s'executa com a root
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
#
opc='s'
DIR=/mnt/cpseg
n=0
until [[ $opc != 's' ]];
do
	clear
	crea $DIR.$n
	(( n++ ))
	echo -n "Vols continuar (s/n)?: "
	read opc
done
exit 0
