*** Settings ***
Library    Selenium2Library

*** Variables ***
#########          Data               ###############
${URL}            https://stage-ares.emersonecologics.com/
${BROWSER}        CHROME
${un}             prac1407@yap.com

${Tit}            Emerson Ecologics
${pw}             Test@1234




#########     Webelement     #################
${Login/RegisterLink_X}            xpath=//*[@id='navbar-main']/div/div/ul/li[2]/a
${userName_X}                      name=EmailAddress
${Password_X}                      id=Password
${LoginButton_X}                   xpath=//button[contains(text(),'Submit')]





