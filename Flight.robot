Petra Puronummi
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Test Cases ***
Open the browser
    Open Browser    http://blazedemo.com/ 
    ...    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Page Should Contain    Welcome to the Simple Travel Agency!
    Sleep    2

Choosing flights
    ${Lähtevä}    Set Variable    Boston
    ${saapuva}    Set Variable    Cairo
    Select From List By Value   xpath://select[@name='fromPort']  ${Lähtevä}
    Select From List by Value   xpath://select[@name='toPort']    ${saapuva}

    Page Should Contain Button    css:input[type='submit']
    Click Button    css:input[type='submit']

    Page Should Contain    Flights from ${lähtevä} to ${saapuva}
    Page Should Contain Element    xpath:/html/body/div[2]/table/tbody/tr[1]/td[1]

   #kirjoita muuttujiin muistiin lennon hinta, numero ja lentoyhtiö 
*** Variables ***
${hinta}    $472.56
${numero}    43
${lentoyhtiö}    Virgin America

*** Test Cases ***
Flight details
    Click Button    xpath:/html/body/div[2]/table/tbody/tr[1]/td[1]/input
    #Tarkista aukeavalta sivulta, että muuttujaan kirjoittamasi matkan hinta, lentoyhtiö ja lennon numero löytyvät sivulta 
    # Täytyy muuttaa muuttujat oikeiksi koska ne vaihtuu siellä seuraavalla sivulla
    ${tarkkahinta}    Get Text    xpath:/html/body/div[2]/p[3]
    ${hinta}    Set Variable    ${tarkkahinta}
    Log    Lennon hinta:${hinta}

    ${tarkkanumero}    Get Text    xpath:/html/body/div[2]/p[2]
    ${numero}    Set Variable    ${tarkkanumero}
    Log    Lennon numbah:${numero}

    ${tarkkayhtiö}    Get Text    xpath:/html/body/div[2]/p[1]
    ${lentoyhtiö}    Set Variable    ${tarkkayhtiö}
    Log    Lentoyhtiö:${lentoyhtiö}

    Page Should Contain    ${hinta}
    Page Should Contain    ${numero}
    Page Should Contain    ${lentoyhtiö}

    #tallena muuttujaan lennon kokonaishinta
    ${kokonaishinta}    Get Text    xpath:/html/body/div[2]/p[5]/em
    Set Variable    ${kokonaishinta}

Book the Flight
    #Täytä matkustajan tiedot kaavakkeelle (aseta kortin kuukausi ja vuosi globaaleiksi muuttujiksi)
    Click Element    name:inputName
    Input Text    name:inputName    Maija
    Sleep    1
    Click Element    name:address
    Input Text    name:address    hölmölätie 5
    Sleep    1
    Click Element    name:city
    Input Text    name:city    Kaarleby
    Sleep    1
    Click Element    name:state
    Input Text    name:state    Funlandia
    Sleep    1
    Click Element    name:zipCode
    Input Text    name:zipCode    5555
    Sleep    1
    Click Element    name:cardType
    Select From List By Label    name:cardType    Diner's Club
    Sleep    1
    Click Element    id:creditCardNumber
    Input Text    id:creditCardNumber    9900775
    Sleep    1
    Click Element    id:creditCardMonth
    Input Text    id:creditCardMonth    02    
    Sleep    1
    Click Element    id:creditCardYear
    Input Text    id:creditCardYear    2016
    Sleep    1
    Click Element    id:nameOnCard
    Input Text    id:nameOnCard    maija meikäläinen

    Set Global Variable    ${korttikk}    02
    Set Global Variable    ${korttiv}    2016
    #/${nimi}kun laittaa kenoviivan se menee suoraa muuttujaks oli sitten numero tai ei
    Sleep    2
    Click Button    id:rememberMe

    Click Button    xpath:/html/body/div[2]/form/div[11]/div/input
    Sleep    2
Cheking all necessary things
    Page Should Contain    Thank you for your purchase today!
    #Tarkista, että vanhentumisaika on oikein
    ${loppuaika}    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[5]/td[2]    
    Run keyword and ignore error    Should Be Equal As Strings    ${loppuaika}    ${korttikk} /${korttiv}
    #Tarkista, että kokonaishinta on oikein
    ${loppuhinta}    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[3]/td[2]
    Run keyword and ignore error    Should Be Equal    ${hinta}    ${loppuhinta}
    
    Close Browser