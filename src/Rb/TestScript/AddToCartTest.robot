*** Settings ***
Library    Selenium2Library
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/Structure/AddToCartFn.robot
Resource   C:/Users/vivek.jha/PycharmProjects/Rb/BaseLib/LoginandLogout.robot





*** Test Cases ***
[TC-001]-Launching the browser and search and Add To Cart Product
  Launch Browser
  Login
  Assertion on HomePage
  #Search Product
  Click To AddCart Icon
  Verify Quantity before and after Decrement No of Products
  Verify Quantity before and after Increment No of Products

