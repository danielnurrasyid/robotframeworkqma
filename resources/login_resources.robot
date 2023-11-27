*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${QMA_URL}    https://testingqa-office.nexcloud.id/testingqa/automation/webui/login
${BROWSER}    chrome
${TEXTFIELD_USERNAME}    username
${TEXTFIELD_PASSWORD}     password
${BUTTON_LOGIN}    Log in
${POPUP_FAILED}    failed
${MESSAGE_FAILED_LOGIN}    Oops! Login failed. Try Again.
${TIMEOUT}    1

*** Keywords ***
Open My Browser
    Open Browser    ${QMA_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Nex
    
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

Click Logout Button
    Scroll Element Into View    //body/div[1]/div[13]/label[1]
    Click Element    //body/div[1]/div[13]/label[1]
    Sleep    ${TIMEOUT}
    Click Element    //a[contains(text(),'Log out')]
    Sleep    ${TIMEOUT}
    Click Button    confirmLogout

Verify Invalid Login
    Wait Until Element Is Visible    ${POPUP_FAILED}
    Page Should Contain    ${MESSAGE_FAILED_LOGIN}
    Click Element    //span[@id='modal-close']

Verify Success Login
    Wait Until Element Is Visible      name
    Page Should Contain    Daniel
