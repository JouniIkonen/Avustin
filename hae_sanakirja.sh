#!/bin/bash


# hakee sanalistan sivulta: https://kaino.kotus.fi/sanat/nykysuomi/
if [ ! -f sanat.txt ]; then

	wget https://kaino.kotus.fi/sanat/nykysuomi/kotus-sanalista-v1.tar.gz
	tar xfz kotus-sanalista-v1.tar.gz

	# grep poistaa <s>  </s> tagien ulkopuoleiset osat xml tiedostosta
	# sed lauseke poistaa itse <s> ja </s> tagit  
	# syntyvä sanalista ohjeataan tiedostoon sanat.txt
	grep -o '<s>.*</s>' kotus-sanalista_v1/kotus-sanalista_v1.xml | sed -e 's/\(<s>\|<\/s>\)//g' > sanat.txt

	echo "Sanakirjatiedosto haettu ja muunneettu sanat.txt tiedostoksi"

else
	echo "Sanakirjatiedosto sanat.txt on jo olemassa"
fi

