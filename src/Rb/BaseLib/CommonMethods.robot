*** Settings ***
Library    Selenium2Library



*** Variables ***



*** Test Cases ***



*** Keywords ***


Wait unitil Element is Visible
   [Arguments]           ${Element}    ${TimeOut}
   Wait Until Element Is Visible   ${Element}   ${TimeOut}

