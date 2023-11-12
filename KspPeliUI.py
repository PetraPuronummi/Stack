#Petra Puronummi

import random 
import KspPeli

käyttäjä = input("Valitse seuraavista; kivi, sakset tai paperi ")

#ensin käyttäjä valitsee ja sitten kone arpoo
vaihtoehdot = ["kivi","sakset","paperi"]
tietokone = random.choice(vaihtoehdot)
#näyttää mitä kumpikin valitsi
print(f"\nSinä valitsit {käyttäjä}, kone valitsi {tietokone}.\n")

#voittojakauma
print(KspPeli.pelilogiikka(käyttäjä, tietokone))

