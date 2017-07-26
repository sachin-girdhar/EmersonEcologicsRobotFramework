*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${login_page_email}                 id=EmailAddress
${login_page_password}              id=Password
${login_page_login_button}          xpath=/html/body/div/main/div/form/div[2]/button/span



##                               Merge With Other FrameWork -RB                                       ############

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



###### Strings Variables ######


*** Keywords ***
###### Page Object Public Methods ######
Login To EE Portal
    [Arguments]    ${ee_username1}     ${ee_password1}      ${browser1}
    Open Browser Session                ${ee_portal_url}    ${browser1}
    Set Browser Implicit Wait           10
    Enter EE Portal Credentials         ${ee_username1}   ${ee_password1}
    Click EE Login Button




Enter EE Portal Credentials
    [Arguments]    ${user_email1}  ${user_password1}
    Click Element                       xpath=//*[@id="hero-fma-area"]/div/ul/li[1]/div[3]/div/div[2]/div[1]/a
    Input Text                          ${login_page_email}       ${user_email1}
    Input Password                      ${login_page_password}    ${user_password1}

Click EE Login Button
    Click Element                       ${login_page_login_button}




##                               Merge With Other FrameWork -RB                                       ############

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