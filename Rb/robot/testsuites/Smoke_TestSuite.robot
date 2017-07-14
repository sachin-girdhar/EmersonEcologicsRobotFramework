*** Settings ***
Documentation       Suite for testing Patient Portal [Profile page]

######   Imported Page Objects    #####
Resource            ../keywords/page_objects/login_page.robot
Resource            ../keywords/page_objects/dashboard_page.robot
Resource            ../keywords/page_objects/Shipping_page.robot
Resource            ../keywords/page_objects/Payment_page.robot
Resource            ../resources/dependencies.robot

Test Setup          #Login And Navigate To login Page
Test Teardown       #Close Browser Session
Force Tags          UI




*** Test Cases ***

#####    About You Section    #####
Login section verification
     Login To EE Portal  jmeterprac1@mailinator.com      Test@1234       CHROME
     Verify Dashboard Launched
     Add Multiple Items to Cart
     Check Out1
     ADD Address
     Click on delivery
     select shipping option
     Enter Credit Card Details
     Place Order

