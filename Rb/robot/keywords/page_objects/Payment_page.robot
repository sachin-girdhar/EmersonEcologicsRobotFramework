*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${Review_Order}      id=reviewOrderBtn
${Place_Order}       id=placeOrderBtn
${cvv}               id=cvvInput
${Existing_cc}       id=selectExistingCC
${option_2}          xpath=html/body/div[3]/md-select-menu/md-content/md-option[1]
###### Strings Variables ######


*** Keywords ***

Enter Credit Card Details
    Click Element   ${Existing_cc}
    Click Element   ${option_2}
    Click Element   ${cvv}
    Input Text  ${cvv}     208


Place Order
    Click Element       ${Review_Order}
    Wait Until Element Is Visible       ${Place_Order}      60
    Click Element       ${Place_Order}
