*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${Review_Order}      id=reviewOrderBtn
${Place_Order}       id=placeOrderBtn
${cvv}               id=cvvInput
${Existing_cc}       id=selectExistingCC
${option_2}          xpath=//md-option[@ng-value='creditCard']
###### Strings Variables ######


*** Keywords ***

Enter Credit Card Details
    Click Element   ${Existing_cc}
    Sleep  3
    Double Click Element   ${option_2}
    Wait Until Element Is Visible    ${cvv}
    Click Element   ${cvv}
    Input Text  ${cvv}     208


Place Order
    Click Element       ${Review_Order}
#    Wait Until Element Is Visible       ${Place_Order}      60
    Sleep  10
    Click Element       ${Place_Order}
