*** Settings ***
Documentation    Testing Login QMA Site
Library    SeleniumLibrary
#Library    AutoRecorder    mode=suite
Library    DataDriver    file=../test_data/Login.csv    sheet_name=Login
Resource    ../resources/keywords/login_resources.robot
Suite Setup    Open My Browser
Suite Teardown    login_resources.Close Browser
Test Template    Login

*** Test Cases ***
${TESTCASE}    ${username}    ${password}

*** Keywords ***
Login
    [Arguments]    ${UserNAMEs}    ${Psswrd}
    Input Username    ${UserNAMEs}
    login_resources.Input Password    ${Psswrd}
    Click Login Button
    ${LoggedIn}    Run Keyword And Return Status    Verify Success Login    #jika false pasti akan menghasilkan screenshoot
    Run Keyword If    ${LoggedIn} == True    
    ...        Verify Success Login
    ...    ELSE IF    ${LoggedIn} == False
    ...        Verify Invalid Login
    Run Keyword If    ${LoggedIn} == True    Click Logout Button

