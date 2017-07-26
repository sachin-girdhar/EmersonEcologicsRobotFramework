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

[TC-001]-Launching the browser and search and Add To Cart Product
  Launch Browser
  Login
  Assertion on HomePage
  #Search Product
  Click To AddCart Icon
  Verify Quantity before and after Increment No of Products
  Verify Quantity before and after Decrement No of Products
  Close Browser Session

[TC-002]-Launching the browser and search and Update Cart Quantity from Input bar
    Launch Browser
    Login
    Assertion on HomePage
    Click To AddCart Icon
    Increment Quantity After Clear input
    Close Browser Session