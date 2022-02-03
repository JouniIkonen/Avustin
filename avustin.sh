#!/bin/bash
# Tämä skripti etsii sanakirjaan sopivia sanoja annetuilla hakuehdoilla


function parsi_kirjaimet ()
{
	merkkijono=""
	pituus=${#kasattavat_kirjaimet}
	pituus2=$((pituus-1))
	for (( i=0; i<$pituus; i++ ))
	do
		merkkijono+=${kasattavat_kirjaimet:i:1}
		if [ $i -lt $pituus2 ]; then
			merkkijono+='\|'
                fi


	done 
	echo $merkkijono
	
}

if [ $# -lt 1 ]; then
	echo "$0 <etsittävän sanan osa> <kirjaimet joita sanassa ei ole> <kirjaimet joita on pakko olla>"
	echo "Etsii 5 kirjaimisia sanoja, tuntemattomat kirjaimet merkitään pisteellä." 
	echo "Esimerkiksi: $0 'li...' us p  etsii sanoja, jotka alkavat kirjaimilla li, sanassa ei ole u:ta ja s:ää ja sanassa on  p-kirjain"

else
	sana=$1
	loppu=$#

	# kasaa merkkijonoa, jolla haetaan sanoja 
	komento="grep -ow '^${sana}' sanat.txt | uniq"

	# Jos käyttäjä on antanut kirjaimia joita ei saa esiintyä sanassa, niin lisää ne hakulausekkeeseen
	if [ ${#2} -gt 0 ]; then

		kasattavat_kirjaimet=$2
		kielletyt_kirjaimet=$(parsi_kirjaimet)
		komento+=" | grep -v $kielletyt_kirjaimet"
	fi

	# Jos käyttäjä on antanut kirjaimia joita täytyy esiintyä sanassa, niin lisää ne hakulausekkeeseen
	if [ ${#3} -gt 0 ]; then
		kasattavat_kirjaimet=$3
		pakolliset_kirjaimet=$(parsi_kirjaimet)
		komento+=" | grep  $pakolliset_kirjaimet"
	fi




	eval $komento
fi
