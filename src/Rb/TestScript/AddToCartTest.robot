*** Settings ***
Library    Selenium2Library
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/Structure/AddToCartFn.robot
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/BaseLib/LoginandLogout.robot
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/BaseLib/CommonMethods.robot




*** Test Cases ***
#[TC-001]-Launching the browser and search and Add To Cart Product
#  Launch Browser
#  Login
#  Assertion on HomePage
#  #Search Product
#  Click To AddCart Icon
#  Verify Quantity before and after Decrement No of Products
#  Verify Quantity before and after Increment No of Products
#  Close Browser Session

[TC-002]-Launching the browser and search and Update Cart Quantity from Input bar
    Launch Browser
    Login
    Assertion on HomePage
    Click To AddCart Icon
    Increment Quantity After Clear input

[TC-003]-Launching the browser and search and Update Cart Quantity from MyCartPage
     Launch Browser
     Login
     Assertion on HomePage
     Click To AddCart Icon
     Increase and Decrease Quantity of Product at My Cart Page
