*** Settings ***
Documentation    Testing Login QMA Site
Library    SeleniumLibrary
Resource    ../resources/keywords/login_resources.robot
Suite Setup    Open My Browser
Suite Teardown    login_resources.Close Browser
Test Template    Login

*** Variables ***
${USERNAME}    daniel
${PASSWORD}    daniel202103003

*** Test Cases ***
Username benar dan password benar    ${USERNAME}    ${PASSWORD}
    [Tags]    Positive
    [Documentation]    Mencoba Testing Positive dengan data daniel
Username benar dan password salah    ${USERNAME}    123
    [Tags]    Negative
Username salah dan password salah     asd    asd
    [Tags]    Negative 

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    login_resources.Input Password    ${password}
    Click Login Button
    ${LoggedIn}    Run Keyword And Return Status    Verify Success Login
    Run Keyword If    ${LoggedIn} == True
    ...        Verify Success Login
    ...    ELSE    
    ...        Verify Invalid Login
    Run Keyword If    ${LoggedIn} == True    Click Logout Button
