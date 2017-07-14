*** Settings ***
Library    Selenium2Library
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/Library/AddToCart_Data_We.robot
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/BaseLib/CommonMethods.robot

*** Variables ***

${TimeOut}       20 Seconds

${Element is not Prsent message}   Element is not prsent
${One count} =   1



*** Keywords ***
Search Product
   Input Text       ${Search_X}      ${ProductName}
   Double Click Element    ${SearchIconButton_X}
   Wait Until Element Is Visible   ${AddToCartProduct_X}    ${TimeOut}
   Double Click Element     ${AddToCartProduct_X}

Add to Cart
    [Arguments]  ${add_cart}
    Sleep   3
    Wait Until Element Is Visible   ${add_cart}  10
    Double Click Element  ${add_cart}


Click To AddCart Icon
 # Wait Until Element Is Visible   ${AddToCartProduct_X}    ${TimeOut}
  #Click Element      ${AddToCartProduct_X}
  # sleep   30

      @{Items}=     Create List     N7670
      : For  ${Item}  IN RANGE    0       1
        \   Wait Until Element Is Visible   id=input-1
        \   log  ${Items[${Item}]}
        \   Input text      id=input-1  ${Items[${Item}]}
        \   Double Click Element   ${SearchIconButton_X}

        \   ${Status}=   Run Keyword And Ignore Error    Add to Cart  ${AddToCartProduct_X}
        \   Log   ${Status}


Verify Quantity before and after Decrement No of Products
    wait until element is enabled   ${NoOfIteminCart_X}
    ${Quantity}   Get Text   ${NoOfIteminCart_X}
    ${Quantity_Int}   Convert To Integer   ${Quantity}
    Log To Console    ${Quantity_Int}

   # Run Keyword If   Page Should Not Contain Element   ${updateButton_X}     ${Element is not Prsent message}

    Wait Until Element Is Visible   ${ButtonMinus_X}      ${TimeOut}
    Double Click Element   ${ButtonMinus_X}
    sleep  10
    Double Click Element   ${updateButton_X}
    Wait Until Element Is Visible    ${NoOfIteminCart_X}      ${TimeOut}
    sleep  10
    ${QuantityAfterUpdate}   Get Text   ${NoOfIteminCart_X}
    ${QuantityAfterUpdate_Int}  Convert To Integer  ${QuantityAfterUpdate}
    ${QuantityAfterUpdate_Int} =  Evaluate  ${QuantityAfterUpdate_Int}+${One count}
    Log To Console    ${QuantityAfterUpdate_Int}
    Run Keyword If    ${Quantity_Int} == ${QuantityAfterUpdate_Int}     Log To Console    ${QuantityAfterUpdate_Int}
    Log To Console    ${QuantityAfterUpdate_Int}



Verify Quantity before and after Increment No of Products

   Wait Until Element Is Visible   ${ButtonPlus_X}        ${TimeOut}
   Double Click Element   ${ButtonPlus_X}
   sleep   10
   Double Click Element   ${updateButton_X}
   Wait Until Element Is Visible    ${NoOfIteminCart_X}      ${TimeOut}
   sleep   10
   ${QuantityAfterUpdate1}   Get Text   ${NoOfIteminCart_X}
   ${QuantityAfterUpdate2}   Convert To Integer   ${QuantityAfterUpdate1}
   Log To Console    ${QuantityAfterUpdate2}
   Run Keyword If    ${QuantityAfterUpdate_Int} ==  ${QuantityAfterUpdate2}  Log To Console     Quantitiy is Matching


Increment Quantity After Clear input
   Sleep   10
  Clear Element Text    ${Quantity_Input}
  ${Disableattribute}=   Get Element Attribute   ${updateButton_X}@disabled
  Log To Console   ${Disableattribute}
  Assert Message Equals     ${Disableattribute}    true
  Double Click Element   ${ButtonPlus_X}
  ${Disableattribute1}=   Get Element Attribute   ${updateButton_X}@disabled
  Log To Console   ${Disableattribute1}
  Double Click Element    ${updateButton_X}

  ${Disableattribute}=  Get Element Attribute   ${ButtonMinus_X}@disabled
  Log To Console   ${Disableattribute}
  Assert Message Equals     ${Disableattribute}    true
  Sleep   5
  Double Click Element   ${ButtonPlus_X}
  Sleep    5
  Double Click Element    ${updateButton_X}
  Sleep    3
  ${QuantityAfterUpdate1}   Get Text   ${NoOfIteminCart_X}
  ${QuantityAfterUpdate2}   Convert To Integer   ${QuantityAfterUpdate1}
  Log To Console    ${QuantityAfterUpdate2}
  Sleep    3
  Double Click Element   ${ButtonMinus_X}
  Sleep    5
  Double Click Element    ${updateButton_X}
  Sleep    5
  ${QuantityAfterUpdate}   Get Text   ${NoOfIteminCart_X}
  ${QuantityAfterUpdate_INt}   Convert To Integer   ${QuantityAfterUpdate}
  Log To Console    ${QuantityAfterUpdate_INt}
  ${QuantityAfterUpdate_Int} =  Evaluate  ${QuantityAfterUpdate_INt}+${One count}
  Log To Console    ${QuantityAfterUpdate_Int}
  Run Keyword If    ${QuantityAfterUpdate2} == ${QuantityAfterUpdate_Int}     Log To Console    ${QuantityAfterUpdate_Int}
  Log To Console    ${QuantityAfterUpdate_Int}


Increase and Decrease Quantity of Product at My Cart Page
   Double Click Element    ${continue_shopping}
   Sleep   5
   Double Click Element    ${cart}
   Sleep   5
   Double Click Element    ${ExpressCheckout}

