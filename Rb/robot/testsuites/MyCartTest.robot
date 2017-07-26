*** Settings ***
Documentation       Suite for testing Patient Portal [Profile page]

######   Imported Page Objects    #####
Resource            ../keywords/page_objects/login_page.robot
Resource            ../keywords/page_objects/dashboard_page.robot
Resource            ../keywords/page_objects/Shipping_page.robot
Resource            ../keywords/page_objects/Payment_page.robot
Resource            ../resources/dependencies.robot
Resource            ../keywords/page_objects/ContinueShopping_Page.robot



*** Test Cases ***

TC-003]-Launching the browser and search and Update Cart Quantity from MyCartPage
     Launch Browser
     Login
     Assertion on HomePage
     Click To AddCart Icon
     Increase and Decrease Quantity of Product at My Cart Page
     Verify Update Button after Increasing No of Products
     Verify Update Button after Decreasing No of Products
     Close Browser Session

[TC-004]-Launching the browser and search and Delete Cart Item
    Launch Browser
    Login
    Assertion on HomePage
    Delete Items from Cart
    Close Browser Session
