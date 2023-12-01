*** Settings ***
Documentation    Testing Login QMA Site
Library    SeleniumLibrary
Resource    ../resources/keywords/login_resources.robot
Test Setup    Open My Browser
Test Teardown    login_resources.Close Browser

*** Variables ***
${USERNAME_ACCOUNT}    daniel
${PASSWORD_ACCOUNT}    daniel202103003

*** Test Cases ***
LoginQMA
    [Tags]    Positive Test
    Login    ${USERNAME_ACCOUNT}    ${PASSWORD_ACCOUNT}

LoginQMA2
    [Tags]    Negative Test
    Invalid Login    ${USERNAME_ACCOUNT}    123

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    login_resources.Input Password    ${password}
    Click Login Button
    Click Sidebar Toggle
    Verify Success Login

Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    login_resources.Input Password    ${password}
    Click Login Button
    Verify Invalid Login

