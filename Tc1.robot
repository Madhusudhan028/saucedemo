*** Settings ***
Library     SeleniumLibrary
Test Setup    Open Application
Test Teardown    Close Browser

*** Variables ***
${browser}  chrome
${url}  https://www.saucedemo.com/

*** Keywords ***
Open Application    
    open browser    ${url}   ${browser}
    Maximize Browser Window

Sign-in to Web Application
    input text  id:user-name    standard_user
    Should Be Equal    standard_user    standard_user
    input password  id:password    secret_sauce
    Should Be Equal    secret_sauce    secret_sauce	
    click element   xpath://input[@id='login-button']   

Purchase Section
    Element Should Contain    xpath://span[@class='title']    PRODUCTS
    click element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    click element   xpath://a[@class='shopping_cart_link']

My Cart List
    Element Should Contain      xpath://span[@class='title']    YOUR CART
    click element   xpath://button[@id='checkout']

Receiver Data
    Element Should Contain   xpath://span[@class='title']    CHECKOUT: YOUR INFORMATION
    input text    id:first-name   Madhu
    input text    id:last-name    Sudhan
    input text    id:postal-code    560078
    click element   xpath://input[@id='continue']

Order Summary
    Element Should Contain   xpath://span[@class='title']    CHECKOUT: OVERVIEW
    click element   xpath://button[@id='finish']

Purchase Completion
    Element Should Contain    xpath://span[@class='title']    CHECKOUT: COMPLETE!
    
*** Test Cases ***
Login End-to-end Saucedemo  
    Title Should Be    Swag Labs
    Sign-in to Web Application
    Purchase Section  
    My Cart List
    Receiver Data
    Order Summary
    Purchase Completion
