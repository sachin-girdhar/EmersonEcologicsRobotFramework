*** Settings ***
Library    Selenium2Library


*** Variables ***
###### Locators Variables ######
${Login/RegisterLink_X}     xpath=//*[@id='navbar-main']/div/div/ul/li[2]/a
${userName_X}               name=EmailAddress
${Password_X}               id=Password
${LoginButton_X}            xpath=//button[contains(text(),'Submit')]
${GlobalSearch_X}           id=input-1
${SearchIconButton_X}       xpath=//a[@ng-click='vm.searchNow(searchText)']
${SearchedProdLink_X}       xpath=//div[@id='main']//h3/a
${SearchProductAddTocartLink_X}   xpath=//div[@id='main']//a[@ng-if='!vm.disableShoppingCart()']
${CartIcon}                 xpath=//span[contains(text(),'Cart')]
${ExpressCheckoutCart_x}        xpath=//li/a[contains(text(),'View or Edit Cart')]
${ExpressCheckout}          xpath=//div/a/span[contains(text(),'EXPRESS CHECKOUT')]
${CVVCode}                  name=cvvCode




####### Input Data##############

