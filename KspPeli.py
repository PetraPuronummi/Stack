#Petra Puronummi

# kivi vs paperi paperi voittaa
# kivi vs sakset kivi voittaa
# paperi vs sakset sakset voittaa

def pelilogiikka(käyttäjä,tietokone):
    
    if käyttäjä == tietokone:
        return 'Tasapeli'
    elif käyttäjä == 'kivi':
        if tietokone == 'sakset':
            return 'Kivi voittaa'
        else:
            return 'paperi voittaa'
    elif käyttäjä == 'paperi':
        if tietokone == 'kivi':
            return 'paperi voittaa'
        else:
            return 'sakset voittaa'
    elif käyttäjä == 'sakset':
        if tietokone == 'paperi':
            return 'sakset voittaa'
        else:
            return 'kivi voittaa'
