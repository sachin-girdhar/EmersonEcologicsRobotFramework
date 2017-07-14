*** Settings ***
Library    Selenium2Library
Resource   ../Library/LoginLogout_Data_We.robot



*** Keywords ***
Launch Browser
    open Browser      ${URL}     ${BROWSER}
    Maximize Browser Window

Login
    Double Click Element    ${Login/RegisterLink_X}
    Input Text      ${userName_X}     ${un}
    Input Text      ${Password_X}     ${pw}
    Click Button    ${LoginButton_X}

Assertion on HomePage
  ${title}=   Log Title
  Should Be Equal As Strings    ${title}   ${Tit}
  Log To Console   ${title}
  Log To Console   ${Tit}




