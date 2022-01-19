#!/bin/bash

if [ $# -lt 1 ]; then
	echo "$0 <etsittävän sanan osa> <kirjaimet joita sanassa ei ole>"
	echo "Etsii 5 kirjaimisia sanoja, tuntemattomat kirjaimet merkitään pisteellä." 
	echo "Esimerkiksi: $0 'lin..' u etsii sanoja, jotka alkavat kirjaimilla lin ja sanassa ei ole u-kirjanta."

else
	sana=$1
	loppu=$#
	poista=""
	#luo merrkijono poistettavista kirjaimista
	for  (( i=2; i<=$loppu; i++ )) 
	do
		poista+=$2
		if [ $i -lt $loppu ]; then
 			poista+='\|'
		fi

		shift
	done

#echo poista on $poista. pituus ${#poista}

	if [ ${#poista} -gt 0 ]; then
		grep -ow  '^'${sana} sanat.txt  | uniq  | grep -v ${poista}
	else
		grep -ow  '^'${sana} sanat.txt  | uniq

	fi

fi
