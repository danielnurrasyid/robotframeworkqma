*** Settings ***
Documentation    Testing Login QMA Site
Library    SeleniumLibrary
Resource    ../resources/login_resources.robot
Test Setup    Open My Browser
Test Teardown    login_resources.Close Browser

*** Variables ***
${USERNAME}    daniel
${PASSWORD}    daniel202103003

*** Test Cases ***
LoginQMA
    [Tags]    Positive Test
    Login    ${USERNAME}    ${PASSWORD}

LoginQMA2
    [Tags]    Negative Test
    Invalid Login    ${USERNAME}    123

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    login_resources.Input Password    ${password}
    Click Login Button
    Verify Success Login

Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    login_resources.Input Password    ${password}
    Click Login Button
    Verify Invalid Login

