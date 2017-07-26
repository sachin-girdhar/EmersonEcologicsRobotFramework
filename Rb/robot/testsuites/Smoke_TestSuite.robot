*** Settings ***
Documentation       Suite for testing Patient Portal [Profile page]

######   Imported Page Objects    #####
Resource            ../keywords/page_objects/login_page.robot
Resource            ../keywords/page_objects/dashboard_page.robot
Resource            ../keywords/page_objects/Shipping_page.robot
Resource            ../keywords/page_objects/Payment_page.robot
Resource            ../resources/dependencies.robot
Resource            ../keywords/page_objects/ContinueShopping_Page.robot



#Test Setup         Login And Navigate To login Page
#Test Teardown      Close Browser Session
#Force Tags          UI




*** Test Cases ***

#####    About You Section    #####
Login section verification
     #Login To EE Portal    jmeterprac1@mailinator.com      Test@1234       CHROME
     Launch Browser
     Login
     Sleep  5
     Verify Dashboard Launched
     Add Multiple Items to Cart
     Check Out1
     ADD Address
     Click on delivery
     select shipping option
     Enter Credit Card Details
     Place Order

#[TC-001]-Launching the browser and search and Add To Cart Product
#  Launch Browser
#  Login
#  Assertion on HomePage
#  #Search Product
#  Click To AddCart Icon
#  Verify Quantity before and after Increment No of Products
#  Verify Quantity before and after Decrement No of Products
#  Close Browser Session
#
#[TC-002]-Launching the browser and search and Update Cart Quantity from Input bar
#    Launch Browser
#    Login
#    Assertion on HomePage
#    Click To AddCart Icon
#    Increment Quantity After Clear input
#    Close Browser Session
#
#[TC-003]-Launching the browser and search and Update Cart Quantity from MyCartPage
#     Launch Browser
#     Login
#     Assertion on HomePage
#     Click To AddCart Icon
#     Increase and Decrease Quantity of Product at My Cart Page
#     Verify Update Button after Increasing No of Products
#     Verify Update Button after Decreasing No of Products
#     Close Browser Session
#
#[TC-004]-Launching the browser and search and Delete Cart Item
#    Launch Browser
#    Login
#    Assertion on HomePage
#    Delete Items from Cart
#    Close Browser Session