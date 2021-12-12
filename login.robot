*** Settings ***
Documentation      test suite of the login screen 
#Importação da biblioteca do Selenium para utilização no Robot
Library     SeleniumLibrary

***Test Cases***

Success Login
    Open Browser        https://app.dev.time.ly/login       chrome
    Input Text          css=#email      alexandre_coture@hotmail.com
    Input Text          css=#password       Coture@123
    Click Button        xpath=//*[contains(@class, 'btn btn-lg btn-block btn-warning text-uppercase app-color')]

    #Keyword  para validação se realmente está logado, verifica o avatar 
    Wait Until Element is Visible       css=#accountSettingsDropdown        8
    Close Browser

Invalid Login
    Open Browser        https://app.dev.time.ly/login       chrome
    Input Text          css=#email      alexandre_co@hotmail.com
    Input Text          css=#password       Coture@123
    Click Button        xpath=//*[contains(@class, 'btn btn-lg btn-block btn-warning text-uppercase app-color')]
    Wait Until Element Is Visible            xpath=//*[contains(text(), 'Wrong email or password.')]        5
    Close Browser

Empty field
    Open Browser        https://app.dev.time.ly/login       chrome
    Click Button        xpath=//*[contains(@class, 'btn btn-lg btn-block btn-warning text-uppercase app-color')]
    Wait Until Element Is Visible            xpath=//*[contains(text(), 'Email is required')]        5
    Wait Until Element Is Visible            xpath=//*[contains(text(), 'Password is required')]        5
    Close Browser