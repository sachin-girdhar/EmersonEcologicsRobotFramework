*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${Select_Address}       id=selectAddressBtn
${Address_View}         css=button.md-no-style
${use_this_Address}     xpath=//*[@id="existing-address"]/md-dialog/div/div/div/button
${delivery_options}     id=viewDeliveryOptionsBtn
${delivery_options1}    xpath=html/body/div[1]/div[2]/div/div/div/div/shipping-options/div[2]/div[4]/div/div/button
${UPS_STD}              xpath=html/body/div[1]/div[2]/div/div/div/div/shipping-options/div[2]/div[5]/div[3]/div[2]/button
${Select_Payement}      id=selectPaymentBtn
###### Strings Variables ######


*** Keywords ***

ADD Address

     Wait Until Element Is Visible      ${Select_Address}
     Click Element       ${Select_Address}
     Wait Until Element Is Visible      ${Address_View}
     Click Element       ${Address_View}
     Wait Until Element Is Enabled        ${use_this_Address}
     Click Element   ${use_this_Address}

Click on Delivery

     Wait Until Element Is Enabled      ${delivery_options}    30
     Double Click Element   ${delivery_options}
     Run Keyword And Ignore Error   Double Click Element   ${delivery_options1}


Select Shipping option
     Wait Until Element Is Visible      ${UPS_STD}   30
     Click Element      ${UPS_STD}
     Sleep   30
     Wait Until Element Is Visible      ${Select_Payement}   60
     Click Element      ${Select_Payement}

