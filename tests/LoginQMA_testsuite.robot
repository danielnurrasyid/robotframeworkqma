*** Settings ***
Documentation    Testing Login QMA Site
Library    SeleniumLibrary
Resource    ../resources/login_resources.robot
# Test Setup    Open My Browser
# Test Teardown    login_resources.Close Browser
Suite Setup    Open My Browser
Suite Teardown    login_resources.Close Browser
Test Template    Login

*** Test Cases ***
Username benar dan password benar    daniel    daniel202103003
    [Tags]    Positive
    [Documentation]    Mencoba Testing Positive dengan data daniel
Username benar dan password salah    daniel    123
    [Tags]    Negative
Username salah dan password salah     asd    asd
    [Tags]    Negative 

# LoginQMA
#     [Tags]    Positive Test
#     Login    daniel    daniel202103003

# LoginQMA2
#     [Tags]    Negative Test
#     Invalid Login    daniel    123

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

# Login
#     [Arguments]    ${username}    ${password}
#     Input Username    ${username}
#     login_resources.Input Password    ${password}
#     Click Login Button
#     Verify Success Login

# Invalid Login
#     [Arguments]    ${username}    ${password}
#     Input Username    ${username}
#     login_resources.Input Password    ${password}
#     Click Login Button
#     Verify Invalid Login

