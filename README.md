# Avustin

Avustin on työkalu, jolla voi etsiä Sanuli:n (https://sanuli.fi/) hukassa olevia sanoja.

Työkalu toimii komentorivillä Linuxissa (ja oletettavasti myös windowssin WSL:ssä).

**Käyttönotto**

Aja skripti `./hae_sankirja.sh`

Skripti hakee sanalistan sivulta: https://kaino.kotus.fi/sanat/nykysuomi/
ja muokkaa xml muotoisesta tiedostosta sanalistan tiedostoon sanat.txt (jota varsinainen työkalu käyttää).

**Sanojen etsiminen** 
 
Sanoja etsitään ajamalla skripti ja antamalla parametreiksi arvaus, kirjaimet joita sanassa ei ole, sekä kirjaimet joita sanassa tulee esiintyä. Arvauksessa pistemerkki (.) toimii merkkinä haetusta kirjaimesta (katso esimerkit).

`./avustin.sh <osa_sana> <kielletyt_kirjaimet> <pakolliset_kirjaimet> ` 

Skripti palauttaa listan sanakirjan sanoista, jotka voivat toteuttaa annetut ehdot.


Esimerkiksi:

`./avustin.sh li...`    - etsii viisimerkkisia sanoja jotka alkavat kirjaimilla li

`./avustin.sh li... usk `  - etsii viisimerkkisiä sanoja jotka alkavat kirjaimilla li ja sanassa ei ole kirjaimia u, s tai k

`./avustin.sh l.... usk at`  - etsii viisimerkkisiä sanoja jotka alkavat kirjaimella l ja sanassa ei ole kirjaimia u, s tai k, mutta sanassa täytyy olla kirjaimet a ja t

`./avustin.sh lin.tu`        - etsii viisimerkkisiä sanoja jotka alkavat kirjaimilla li ja lopuvat kirjaimiin tu


Sanan kokoa ei ole rajattu:

`./avustin.sh li...ä t'

liereä
lilliä
lipevä
lirinä


