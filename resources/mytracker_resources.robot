*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_resources.robot

*** Variables ***
${BUTTON_INSIGHT}    //body[1]/div[1]/div[6]/label[1]
${BUTTON_MY_TRACKER}    //a[@id='myTrackerItem']
${BUTTON_ADD_DAILY}    //button[@id='buttonAdd']
${TEXTFIELD_DATE}    //input[@id='checkinDate']
${DROPDOWN_MOOD}    //select[@id='moodID']
${DROPDOWN_STATUS}    //select[@id='statusID']
${DROPDOWN_PROJECT}    //select[@id='projectID']
${DROPDOWN_FORM}    //select[@id='contextID']
${BUTTON_SUBMIT}    //button[@id='buttonSubmit']
${TEXTFIELD_YESTERDAY_TASK}    //div[@id="answersContainer"]/div[3]
${TEXTFIELD_TODAY_TASK}    //div[@id="answersContainer"]/div[5]
${TEXTFIELD_BLOCKER_TASK}    //div[@id="answersContainer"]/div[7]
${POPUP_SUCCESS}    modalCheckinSuccess
${MESSAGE_SUCCESS}    Hooray! Sent successfully!

${VALUE_MOOD_AWESOME}    1
${VALUE_STATUS_WFO}    1
${VALUE_PROJECT_NEXMILE}    22
${VALUE_FORM_DAILY}    1

${VALUE_CHECKIN_DATE}    16/01/2022
${VALUE_YESTERDAY_TASK}    
...    Insert Daily ${\n}
...    Click Button ${\n}
...    asdasdasd
${VALUE_TODAY_TASK}    Nexmile
${VALUE_BLOCKER_TASK}    Tidak ada

*** Keywords ***
Open Menu Daily
    Click Element    ${BUTTON_INSIGHT}
    Click Element    ${BUTTON_MY_TRACKER}
    Select Frame    //iframe[contains(@src,/testingqa/automation/webui/home/insights/checkins)]
    Page Should Contain Element    ${BUTTON_ADD_DAILY}
    
Insert CheckIn Date
    Input Text    ${TEXTFIELD_DATE}    ${VALUE_CHECKIN_DATE}
    Sleep    ${TIMEOUT}

Select Mood
    Click Element    ${DROPDOWN_MOOD}
    Select From List By Value    ${DROPDOWN_MOOD}    ${VALUE_MOOD_AWESOME}
    Sleep    ${TIMEOUT}

Select Status
    Click Element    ${DROPDOWN_STATUS}
    Select From List By Value    ${DROPDOWN_STATUS}    ${VALUE_STATUS_WFO}
    Sleep    ${TIMEOUT}

Select Project
    Click Element    ${DROPDOWN_PROJECT}
    Select From List By Value    ${DROPDOWN_PROJECT}    ${VALUE_PROJECT_NEXMILE}
    Sleep    ${TIMEOUT}

Select Form
    Click Element    ${DROPDOWN_FORM}
    Select From List By Value    ${DROPDOWN_FORM}    ${VALUE_FORM_DAILY}
    Sleep    ${TIMEOUT}

Insert Yesterday Task
    Input Text    ${TEXTFIELD_YESTERDAY_TASK}    ${VALUE_YESTERDAY_TASK}
    Sleep    ${TIMEOUT}

Insert Today Task
    Input Text    ${TEXTFIELD_TODAY_TASK}    ${VALUE_TODAY_TASK}
    Sleep    ${TIMEOUT}
    
Insert Blocker Task
    Scroll Element Into View    ${TEXTFIELD_BLOCKER_TASK}
    Input Text    ${TEXTFIELD_BLOCKER_TASK}    ${VALUE_BLOCKER_TASK}
    Sleep    ${TIMEOUT}

Click Submit Daily
    Scroll Element Into View    ${BUTTON_SUBMIT}
    Click Button    ${BUTTON_SUBMIT}

Verify Success Submit Daily
    Wait Until Element Is Visible    ${POPUP_SUCCESS}
    Page Should Contain    ${MESSAGE_SUCCESS}
    Sleep    ${TIMEOUT}

Insert Daily
    Click Button    ${BUTTON_ADD_DAILY}
    Insert CheckIn Date
    Select Mood
    Select Status
    Select Project
    Select Form
    Insert Yesterday Task
    Insert Today Task
    Insert Blocker Task
    Click Submit Daily
    Verify Success Submit Daily
    Click Logout Button
    login_resources.Close Browser