*** Settings ***
Library     SeleniumLibrary
Library    XML
Library    String

*** Variables ***
${browser}  chrome
${url}  https://www.saucedemo.com/

*** Test Cases ***
LoginTest    
    open browser    ${url}   ${browser}
    Maximize Browser Window
    loginToApplication
    Should Be Equal    standard_user    standard_user    
    Should Be Equal    secret_sauce    secret_sauce	
    Title Should Be    Swag Labs
    [Teardown]    Close Browser

*** Keywords ***
loginToApplication
    input text  id:user-name    standard_user
    input password  id:password    secret_sauce
    click element   xpath://input[@id='login-button']      
    Element Should Contain    xpath://span[@class='title']    PRODUCTS
    click element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    click element   xpath://a[@class='shopping_cart_link']
    Element Should Contain      xpath://span[@class='title']    YOUR CART
    click element   xpath://button[@id='checkout']
    Element Should Contain   xpath://span[@class='title']    CHECKOUT: YOUR INFORMATION
    input text    id:first-name   Madhu
    input text    id:last-name    Sudhan
    input text    id:postal-code    560078
    click element   xpath://input[@id='continue']
    Element Should Contain   xpath://span[@class='title']    CHECKOUT: OVERVIEW
    click element   xpath://button[@id='finish']
    Element Should Contain    xpath://span[@class='title']    CHECKOUT: COMPLETE!
    
