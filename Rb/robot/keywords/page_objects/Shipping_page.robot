*** Settings ***
Documentation       EE - LogIn - Page Object
Resource            ../base_ui_keywords.robot


*** Variables ***
###### Locators Variables ######
${Select_Address}       id=selectAddressBtn
${Address_View}         xpath=//md-tab-body[@aria-hidden='false']//md-list-item[@role='listitem']
${use_this_Address}     xpath=//button/span[contains(text(),' USE THIS ADDRESS')]
${delivery_options}     id=viewDeliveryOptionsBtn
${delivery_options1}    xpath=html/body/div[1]/div[2]/div/div/div/div/shipping-options/div[2]/div[4]/div/div/button
${UPS_STD}              xpath=//button[@class='rectangle']/strong[contains(text(),'UPS Standard')]
${Select_Payement}      id=selectPaymentBtn
${DidUmeanPopUp}             xpath=//tbody[@ng-repeat='suggestedAddress in pop.recommendedAddresses']//td[1]
###### Strings Variables ######


*** Keywords ***

ADD Address

     Wait Until Element Is Visible      ${Select_Address}   10
     Click Element       ${Select_Address}
     Wait Until Element Is Visible      ${Address_View}
     Click Element       ${Address_View}
#     Wait Until Element Is Enabled        ${use_this_Address}
#     Click Element   ${use_this_Address}

Click on Delivery
     Scroll Page    DOWN
     Wait Until Element Is Visible      ${delivery_options}    30
     Double Click Element   ${delivery_options}
      #  Run Keyword And Ignore Error   Double Click Element   ${delivery_options1}
#      Wait Until Element Is Visible      ${DidUmeanPopUp}    30
#      Sleep  10
#      Double Click Element    ${DidUmeanPopUp}
#      Wait Until Element Is Visible      ${use_this_Address}    30
#      Sleep  5
#      Double Click Element    ${use_this_Address}
#      Log To Console    Element have clicked

Select Shipping option
     Wait Until Element Is Visible      ${UPS_STD}   30
     Sleep   10
     Double Click Element      ${UPS_STD}
     Sleep   10
     Wait Until Element Is Visible      ${Select_Payement}   60
     Click Element      ${Select_Payement}

