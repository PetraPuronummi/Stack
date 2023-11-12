#Petra Puronummi

import unittest
import KspPeli

class KspTest(unittest.TestCase):
    def testiKunOnTasapeli(self):
        käyttäjä = 'sakset'
        tietokone = 'sakset'
        result = KspPeli.pelilogiikka(käyttäjä,tietokone)
        self.assertEqual(result, 'Tasapeli')
    def testiKunKiviVoittaa(self):
        käyttäjä = 'kivi'
        tietokone = 'sakset'
        result = KspPeli.pelilogiikka(käyttäjä,tietokone)
        self.assertEqual(result, 'Kivi voittaa')
    def testiKunSaksetVoittaa(self):
        käyttäjä = 'paperi'
        tietokone = 'sakset'
        result = KspPeli.pelilogiikka(käyttäjä,tietokone)
        self.assertEqual(result, 'sakset voittaa')
    def testiKunPaperiVoittaa(self):
        käyttäjä = 'paperi'
        tietokone = 'kivi'
        result = KspPeli.pelilogiikka(käyttäjä,tietokone)
        self.assertEqual(result, 'paperi voittaa')

if(__name__ == "__main__"):
    unittest.main()