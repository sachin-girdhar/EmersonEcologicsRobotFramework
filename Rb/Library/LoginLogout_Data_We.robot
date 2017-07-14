*** Settings ***
Library    Selenium2Library

*** Variables ***
#########          Data               ###############
${URL}            https://stage-ares.emersonecologics.com/
${BROWSER}        CHROME
${un}             jmeterprac1@mailinator.com
${pw}             Test@1234
${Tit}            Emerson Ecologics





#########     Webelement     #################
${Login/RegisterLink_X}            xpath=//*[@id='navbar-main']/div/div/ul/li[2]/a
${userName_X}                      name=EmailAddress
${Password_X}                      id=Password
${LoginButton_X}                   xpath=//button[contains(text(),'Submit')]





