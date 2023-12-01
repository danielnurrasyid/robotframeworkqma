*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_resources.robot
Resource    ../resources/mytracker_variables.robot

*** Variables ***


*** Keywords ***
Open Menu Daily
    Click Element    ${BUTTON_INSIGHT}
    Click Element    ${BUTTON_MY_TRACKER}
    Select Frame    ${IFRAME_TRACKER}
    Page Should Contain Element    ${BUTTON_ADD_DAILY}
    
Insert CheckIn Date
    [Arguments]    ${date}
    Input Text    ${TEXTFIELD_DATE}    ${date}
    Sleep    ${TIMEOUT}

Select Mood
    [Arguments]    ${mood}
    Click Element    ${DROPDOWN_MOOD}
    Select From List By Value    ${DROPDOWN_MOOD}    ${mood}
    Sleep    ${TIMEOUT}

Select Status
    [Arguments]    ${status}
    Click Element    ${DROPDOWN_STATUS}
    Select From List By Value    ${DROPDOWN_STATUS}    ${status}
    Sleep    ${TIMEOUT}

Select Project
    [Arguments]    ${project}
    Click Element    ${DROPDOWN_PROJECT}
    Select From List By Value    ${DROPDOWN_PROJECT}    ${project}
    Sleep    ${TIMEOUT}

Select Form
    [Arguments]    ${form}
    Click Element    ${DROPDOWN_FORM}
    Select From List By Value    ${DROPDOWN_FORM}    ${form}
    Sleep    ${TIMEOUT}

Insert Yesterday Task
    [Arguments]    ${yesterdayTask}
    Input Text    ${TEXTFIELD_YESTERDAY_TASK}    ${yesterdayTask}
    Sleep    ${TIMEOUT}

Insert Today Task
    [Arguments]    ${todayTask}
    Input Text    ${TEXTFIELD_TODAY_TASK}    ${todayTask}
    Sleep    ${TIMEOUT}
    
Insert Blocker Task
    [Arguments]    ${blockerTask}
    Scroll Element Into View    ${TEXTFIELD_BLOCKER_TASK}
    Input Text    ${TEXTFIELD_BLOCKER_TASK}    ${blockerTask}
    Sleep    ${TIMEOUT}

Click Submit Daily
    Scroll Element Into View    ${BUTTON_SUBMIT}
    Click Button    ${BUTTON_SUBMIT}

Verify Success Submit Daily
    Wait Until Element Is Visible    ${POPUP_SUCCESS}
    Page Should Contain    ${MESSAGE_SUCCESS}
    Sleep    ${TIMEOUT}

# Insert Daily
#     Click Button    ${BUTTON_ADD_DAILY}
#     Insert CheckIn Date    22/01/2023
#     Select Mood    ${AWESOME}
#     Select Status    ${WORKING_FROM_OFFICE}
#     Select Project    ${NEXMILE}
#     Select Form    ${DAILY_CHECK_IN}
#     Insert Yesterday Task    asd
#     Insert Today Task    asd
#     Insert Blocker Task    asd
#     Click Submit Daily