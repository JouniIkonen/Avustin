# Avustin

Avustin on työkalu, jolla voi ratkaista Sanuli:n (sanuli.fi) hukassa olevia sanoja.

Työkalu toimii komentorivillä Linuxissa (ja oletettavasti myös windowssin WSL:ssä.)

**Käyttönotto**

Aja skripti `./hae_sankirja.sh`

Skripti hakee sanalistan sivulta: https://kaino.kotus.fi/sanat/nykysuomi/
ja muokkaa xml muotoisesta tiedostosta sanalistan tiedostoon sanat.txt (jota varsinainen työkalu käyttää)

** Sanojen etsiminen ** 
 
Sanoja etsitään ajamalla skripti ./avustin.sh  ja antamalla parametreiksi arvaus, sekä lista kirjaimista joita sanassa ei ole. Arvauksessa pistemerkki (.) toimii merkkinä haetusta kirjaimuesta.

Skripti palauttaa listan sanakirjan sanoista, jotka voivat toteuttaa annetut ehdot.


Esimerkiksi:

`./avustin.sh li...`    - etsii viisimerkkisia sanoja jotka alkavat kirjaimilla li

`./avustin.sh li... u s k `  - etsii viisimerkkisiä sanoja jotka alkavat kirjaimilla li ja sanassa ei ole kirjaimia u, s tai k

`./avustin.sh lin.tu`        - etsii viisimerkkisiä sanoja jotka alkavat kirjaimilla li ja lopuvat kirjaimiin tu.

