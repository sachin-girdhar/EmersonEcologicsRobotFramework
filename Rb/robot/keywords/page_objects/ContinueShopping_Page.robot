*** Settings ***
Library    Selenium2Library
Resource    ../base_ui_keywords.robot

*** Variables ***

${TimeOut}                        20 Seconds

${Element is not Prsent message}  Element is not prsent
${One count} =   1
${Invisible_Update}               update-quantity-button md-button md-ink-ripple hide-xs hide-sm
${CountOfItemsBeforeChange1}
${Zero_count}  =                  set variable     0

${Search_X}                       id=input-1
${SearchIconButton_X}             xpath=//a[@ng-click='vm.searchNow(searchText)']
${SearchedProdLink_X}             xpath=//div[@id='main']//h3/a
${SearchProductAddTocartLink_X}   xpath=//div[@id='main']//a[@ng-if='!vm.disableShoppingCart()']
${CartIcon}                       xpath=//span[contains(text(),'Cart')]
${ExpressCheckoutCart_x}          xpath=//li/a[contains(text(),'View or Edit Cart')]
${ExpressCheckoutButton}          xpath=//div/a/span[contains(text(),'EXPRESS CHECKOUT')]
${CVVCode}                        name=cvvCode
#${AddToCartProduct_X}            xpath=//div[@id='main']//product-quantity-from/div[1]/a
${AddToCartProduct_X}             xpath=//a[@class='add-cart']
${ButtonMinus_X}                  xpath=//div[@class='layout-row']//button[@ng-click='$ctrl.decrement()']
${ButtonPlus_X}                   xpath=//div[@class='layout-row']//button[@ng-click='$ctrl.increment()']
${updateButton_X}                 xpath=//div[@class='layout-row']//button[@ng-if='!$ctrl.updating']
${PriceAtPopUp_X}                 xpath=//div[@class='total-price-wrapper']//h2
${SubTotal_X}                     xpath=//span[@class='sub-total cart-summary-number ng-binding']
${NoOfIteminCart_X}               xpath=//span[@class='cart-item cart-summary-number ng-binding']
${QuantityToAddCart}              xpath=(//div[@class='layout-row']//input)[1]
${Quantity_Input}                 xpath=//div[@class='layout-row']//input[@name='quantity']
${ViewOrEditCartLink}             xpath=//div[@id='navbar-main']//a[contains(text(),'View or Edit Cart')]
${continue_shopping}              xpath=//button[@id='continueShoppingBtn']
${UpdateButton}                   xpath=(//button[@class='update-quantity-button md-button md-ink-ripple hide-xs hide-sm'])[1]
${ButtonMinusAtMyCart}            xpath=(//button[@class='rectangle-quantity decrement-button'])[1]
${ButtonPlusAtMyCart}             xpath=(//button[@class='rectangle-quantity increment-button'])[1]
${UpdateButtonWhileVisible}       xpath=//button[@class='update-quantity-button md-button md-ink-ripple hide-xs hide-sm active']
${NotOfItemsInCart}               xpath=//div[@flex='20']//span
${Delete_Button}                  xpath=//button[@class='delete-item']
${Remove_Button}                  xpath=//button[@class='confirm-remove md-button md-ink-ripple']
${AddToCartIconWhileDisable}      xpath=//a[@class='add-cart']/..

###                                     Input Data                                       ##################


${URL}                            https://qa-ares.emersonecologics.com/
${BROWSER}                        CHROME
${un}                             prac1407@yap.com
${pw}                             Test@1234
${Tit}                            Emerson Ecologics
${TimeOut}                        20 Seconds
${CVVCodeValue}                   111


*** Keywords ***
Search Product
   [Arguments]    ${ProductName}
   Input Text       ${Search_X}      ${ProductName}
   Double Click Element    ${SearchIconButton_X}


Add Product To Cart
   Sleep   10
   Double Click Element     ${AddToCartProduct_X}

Verify Add To Cart Button IsEnable
  Sleep   10
  ${classAttributeAddToCartIcon}   Get Element Attribute   ${AddToCartIconWhileDisable}@class
  Log To Console   ${classAttributeAddToCartIcon}

#Add to Cart
#    [Arguments]  ${add_cart}
#    Sleep   3
#    Wait Until Element Is Visible   ${add_cart}  10
#    Double Click Element  ${add_cart}


Click To AddCart Icon
 # Wait Until Element Is Visible   ${AddToCartProduct_X}    ${TimeOut}
  #Click Element      ${AddToCartProduct_X}
  # sleep   30

      @{Items}=     Create List     AY111
      : For  ${Item}  IN RANGE    0       1
        \   Wait Until Element Is Visible   id=input-1
        \   log  ${Items[${Item}]}
        \   Input text      id=input-1  ${Items[${Item}]}
        \   Double Click Element   ${SearchIconButton_X}
        \   Add to Cart  ${AddToCartProduct_X}



Verify Quantity before and after Decrement No of Products
    wait until element is enabled   ${NoOfIteminCart_X}
    ${Quantity}   Get Text   ${NoOfIteminCart_X}
    ${Quantity_Int}   Convert To Integer   ${Quantity}
    Log To Console    ${Quantity_Int}

   # Run Keyword If   Page Should Not Contain Element   ${updateButton_X}     ${Element is not Prsent message}

    Wait Until Element Is Visible   ${ButtonMinus_X}      ${TimeOut}
    Double Click Element   ${ButtonMinus_X}
    #sleep  10
    Wait Until Element Is Visible   ${updateButton_X}    10
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
   Sleep  10
   Double Click Element   ${ButtonPlus_X}
   sleep   10
   Double Click Element   ${updateButton_X}
   Wait Until Element Is Visible    ${NoOfIteminCart_X}      ${TimeOut}
   sleep   10
   ${QuantityAfterUpdate1}   Get Text   ${NoOfIteminCart_X}
   ${QuantityAfterUpdate2}   Convert To Integer   ${QuantityAfterUpdate1}
   Log To Console    ${QuantityAfterUpdate2}
   # Run Keyword If    ${QuantityAfterUpdate_Int} ==  ${QuantityAfterUpdate2}  Log To Console     Quantitiy is Matching


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
   Sleep  10
   Double Click Element    ${continue_shopping}
   Sleep   5
   Double Click Element    ${CartIcon}
   ${CountOfItemsBeforeChange}   Get Text  ${NotOfItemsInCart}
   Log To Console   ${CountOfItemsBeforeChange}
   ${CountOfItemsBeforeChange1}    Convert To Integer    ${CountOfItemsBeforeChange}
   Log To Console   ${CountOfItemsBeforeChange1}
   Sleep   5
   Double Click Element    ${ViewOrEditCartLink}


Verify Update Button after Increasing No of Products
   Sleep  10
   ${Disable_Update}   Get Element Attribute   ${UpdateButton}@class
   Log To Console     ${Invisible_Update}
   Should be equal as strings    ${Disable_Update}    ${Invisible_Update}
   Log To Console     ${Disable_Update}
   Sleep  5
   Double Click Element   ${ButtonPlusAtMyCart}
   Sleep  10
   Double Click Element         ${UpdateButtonWhileVisible}


Verify Update Button after Decreasing No of Products
     Sleep  5
     ${Disable_Update}   Get Element Attribute   ${UpdateButton}@class
     Log To Console     ${Invisible_Update}
     Should be equal as strings    ${Disable_Update}    ${Invisible_Update}
     Log To Console     ${Disable_Update}
     Sleep  15
     Double Click Element    ${ButtonMinusAtMyCart}
     Sleep  5
     Double Click Element         ${UpdateButtonWhileVisible}
     Sleep   15
     Double Click Element    ${CartIcon}
     ${CountOfItemsAfterChange}    Get Text    ${NotOfItemsInCart}
     Log To Console    ${CountOfItemsAfterChange}
     ${CountOfItemsAfterChange1}   Convert To Integer    ${CountOfItemsAfterChange}
     Log To Console    ${CountOfItemsAfterChange1}
    # Run Keyword If    ${CountOfItemsBeforeChange1} == ${CountOfItemsAfterChange1}     Log To Console    ${CountOfItemsAfterChange1}


Delete Items from Cart
      Double Click Element    ${CartIcon}
      ${CountOfItemsAfterChange}    Get Text    ${NotOfItemsInCart}
      Log To Console    ${CountOfItemsAfterChange}
      ${CountOfItemsAfterChange1}   Convert To Integer    ${CountOfItemsAfterChange}
      Log To Console    ${CountOfItemsAfterChange1}
      Double Click Element    ${ViewOrEditCartLink}
      Sleep  10
      Double Click Element    ${Delete_Button}
      Sleep  3
      Double Click Element    ${Remove_Button}
      Sleep  3
      Double Click Element    ${CartIcon}
      Sleep  3
      ${CountOfItemsAfterDelete}    Get Text    ${NotOfItemsInCart}
      ${CountOfItemsAfterDelete1}   Convert To Integer    ${CountOfItemsAfterDelete}
     # Run Keyword If   ${CountOfItemsAfterDelete1} ==  0   Log To Console       ${CountOfItemsAfterDelete}











