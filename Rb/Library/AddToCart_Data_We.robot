*** Settings ***
Library    Selenium2Library

*** Variables ***
${Search_X}                 id=input-1
${SearchIconButton_X}       xpath=//a[@ng-click='vm.searchNow(searchText)']
${SearchedProdLink_X}       xpath=//div[@id='main']//h3/a
${SearchProductAddTocartLink_X}   xpath=//div[@id='main']//a[@ng-if='!vm.disableShoppingCart()']
${CartIcon}                     xpath=//span[contains(text(),'Cart')]
${ExpressCheckoutCart_x}        xpath=//li/a[contains(text(),'View or Edit Cart')]
${ExpressCheckoutButton}          xpath=//div/a/span[contains(text(),'EXPRESS CHECKOUT')]
${CVVCode}                         name=cvvCode
#${AddToCartProduct_X}               xpath=//div[@id='main']//product-quantity-from/div[1]/a
${AddToCartProduct_X}                xpath=/html/body/div[1]/div/div/div/div[3]/div[2]/div[2]/ul/li[1]/div/product-card/div/div/div[3]/div[2]/div/product-quantity-from/div[1]/a
${ButtonMinus_X}                        xpath=//div[@class='layout-row']//button[@ng-click='$ctrl.decrement()']
${ButtonPlus_X}                        xpath=//div[@class='layout-row']//button[@ng-click='$ctrl.increment()']
${updateButton_X}                   xpath=//div[@class='layout-row']//button[@ng-if='!$ctrl.updating']
${PriceAtPopUp_X}                   xpath=//div[@class='total-price-wrapper']//h2
${SubTotal_X}                       xpath=//span[@class='sub-total cart-summary-number ng-binding']
${NoOfIteminCart_X}                 xpath=//span[@class='cart-item cart-summary-number ng-binding']
${QuantityToAddCart}                xpath=(//div[@class='layout-row']//input)[1]
${Quantity_Input}               xpath=//div[@class='layout-row']//input[@name='quantity']
${ViewOrEditCartLink}              xpath=//div[@id='navbar-main']//a[contains(text(),'View or Edit Cart')]
${continue_shopping}       xpath=//button[@id='continueShoppingBtn']
${UpdateButton}            xpath=(//button[@class='update-quantity-button md-button md-ink-ripple hide-xs hide-sm'])[1]
${ButtonMinusAtMyCart}     xpath=(//button[@class='rectangle-quantity decrement-button'])[1]
${ButtonPlusAtMyCart}      xpath=(//button[@class='rectangle-quantity increment-button'])[1]
${UpdateButtonWhileVisible}        xpath=//button[@class='update-quantity-button md-button md-ink-ripple hide-xs hide-sm active']
${NotOfItemsInCart}         xpath=//div[@flex='20']//span
${Delete_Button}            xpath=//button[@class='delete-item']
${Remove_Button}            xpath=//button[@class='confirm-remove md-button md-ink-ripple']


###                                     Search Product                                        ##################

${ProductName}            AY111
${URL}            https://qa-ares.emersonecologics.com/
${BROWSER}        CHROME
${un}             prac1407@yap.com
${pw}             Test@1234
${Tit}            Emerson Ecologics
${TimeOut}        200 Seconds
${CVVCodeValue}        111


