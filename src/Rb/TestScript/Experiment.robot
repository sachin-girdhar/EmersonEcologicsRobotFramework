*** Settings ***
Library    Selenium2Library

*** Variables ***
${xp}         xpath=//*[@id='navbar-main']/div/div/ul/li[2]/a
${Text}       Log In/Register
${Message}    Log In/Register
${count2} =     30

*** Test Cases ***
sum of variables
  ${calculatedTotalPrice} =    set variable    20
  ${productPrice1} =    set variable    10

  ${calculatedTotalPrice} =    Evaluate    ${calculatedTotalPrice}+${productPrice1}
  ${count}     Convert To Integer   ${calculatedTotalPrice}


  Log To Console     ${count}
  open Browser     https://stage-ares.emersonecologics.com/     CHROME
  sleep   20
  Run keyword if   	 ${count} == ${count2}		 Click Element   	 ${xp}


*** Keywords ***



Assert on Login Register Link
  open Browser     https://stage-ares.emersonecologics.com/     CHROME
  sleep   20
  Run keyword if   	 ${count} == 30 		 Click Element   	 ${xp}
