*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/login_variables.robot

*** Keywords ***
Open My Browser
    Open Browser    ${QMA_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    ${VERIFY_NEX}
    
Close Browser
    SeleniumLibrary.Close Browser

Input Username
    [Arguments]    ${username}
    Input Text    ${TEXTFIELD_USERNAME}    ${username}   

Input Password
    [Arguments]    ${password}
    SeleniumLibrary.Input Password    ${TEXTFIELD_PASSWORD}    ${password}

Click Login Button
    Sleep    ${TIMEOUT}
    Click Button    ${BUTTON_LOGIN}

Verify Invalid Login
    Wait Until Element Is Visible    ${POPUP_FAILED}
    Page Should Contain    ${MESSAGE_FAILED_LOGIN}
    Click Element    ${BUTTON_CLOSE_POPUP_FAILED}

Verify Success Login
    Wait Until Element Is Visible    ${BUTTON_TOGGLE}

Verify my Profile
    Wait Until Element Is Visible      ${LABEL_NAME}
    Page Should Contain    ${VERIFY_MY_NAME}

Click Sidebar Toggle
    Sleep    ${TIMEOUT}
    Click Element    ${BUTTON_TOGGLE}
    Verify my Profile

Click Logout Button
    Click Sidebar Toggle
    Scroll Element Into View    ${SIDE_PREFERENCES}
    Click Element    ${SIDE_PREFERENCES}
    Sleep    ${TIMEOUT}
    Click Element    ${BUTTON_LOGOUT}
    Sleep    ${TIMEOUT}
    Click Button    ${BUTTON_CONFIRM_LOGOUT}