*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
Login Test
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text   name:username  standard_user
    Input Text   name:password  secret_sauce
    Click Element  name:Login
    Close Browser

*** Keywords ***
