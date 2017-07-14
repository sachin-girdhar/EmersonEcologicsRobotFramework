*** Settings ***
Library    Selenium2Library
Resource            C:/Users/vivek.jha/workspace/Robot-Script/robot/keywords/page_objects/Library.robot

*** Variables ***
${APP}            AY111
${URL}            https://stage-ares.emersonecologics.com/
${BROWSER}        CHROME
${un}             jmeterprac1@mailinator.com
${pw}             Test@1234
${Tit}            Emerson Ecologics
${TimeOut}        200 Seconds
${CVVCodeValue}        111

*** Test Cases ***
[TC-001]-Launching the browser and search and launch the 'Emerson' Application on Google.com
   Launch Browser
   Search Application On Google
   Assertion on HomePage
 #  Launch Application


*** Keywords ***
Launch Browser
    open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Search Application On Google
    Double Click Element    ${Login/RegisterLink_X}
    Input Text      ${userName_X}     ${un}
    Input Text      ${Password_X}     ${pw}
    Click Button    ${LoginButton_X}

Assertion on HomePage
  ${title}=   Log Title
  Should Be Equal As Strings    ${title}   ${Tit}
  Log To Console   ${title}
  Log To Console   ${Tit}
  Input Text    ${GlobalSearch_X}    ${APP}
  Double Click Element    ${SearchIconButton_X}
  Wait Until Element Is Visible    ${SearchedProdLink_X}      20 Seconds
  Double Click Element    ${SearchedProdLink_X}
  Wait Until Element Is Visible    ${SearchProductAddTocartLink_X}      20 Seconds
  Double Click Element    ${SearchProductAddTocartLink_X}
  Double Click Element    ${CartIcon}
  Double Click Element    ${ExpressCheckoutCart_x}
  Wait Until Element Is Visible    ${ExpressCheckout}    ${TimeOut}
  Double Click Element    ${ExpressCheckout}
  Wait Until Element Is Visible  ${CVVCode}    ${TimeOut}
  Input Text    ${CVVCode}    ${CVVCodeValue}
  Close Browser




Launch Application
    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Element     link=User-Friendly Techy-Help