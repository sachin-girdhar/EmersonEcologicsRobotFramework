*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${login_page_email}                 id=EmailAddress
${login_page_password}              id=Password
${login_page_login_button}          xpath=/html/body/div/main/div/form/div[2]/button/span


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


