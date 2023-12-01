*** Settings ***
Library    SeleniumLibrary
#Library    AutoRecorder
Resource    ../resources/keywords/login_resources.robot
Resource    ../resources/keywords/mytracker_resources.robot

*** Variables ***
${USERNAME}    daniel
${PASSWORD}    daniel202103003
${CHECK_IN_DATE}    22/01/2022
${YESTERDAY_TASK}    
...    - Farmindo ${\n}
...    - Nexmile ${\n}
...    - Done Testing
${TODAY_TASK}    Nexmile
${BLOCKER_TASK}    Tidak ada

*** Test Cases ***
Scenario Insert Daily QMA
    Given I am on login page
    When I insert my username and password
    And click the login button
    Then I should see my profile
    When I open menu my daily tracker
    And insert my daily task
    Then I should see a success message
    And I log out

*** Keywords ***
I am on login page
    Open My Browser

I insert my username and password
    Input Username    ${USERNAME}
    login_resources.Input Password    ${PASSWORD}

click the login button
    Click Login Button
    Verify Success Login

I should see my profile
    Verify Success Login

I open menu my daily tracker
    Open Menu Daily
    
insert my daily task
    Click Button    ${BUTTON_ADD_DAILY}
    Insert CheckIn Date    ${CHECK_IN_DATE}
    Select Mood    ${AWESOME}
    Select Status    ${WORKING_FROM_OFFICE}
    Select Project    ${NEXMILE}
    Select Form    ${DAILY_CHECK_IN}
    Insert Yesterday Task    ${YESTERDAY_TASK}
    Insert Today Task    ${TODAY_TASK}
    Insert Blocker Task    ${BLOCKER_TASK}
    Click Submit Daily

I should see a success message
    Verify Success Submit Daily

I log out
    Click Logout Button
    login_resources.Close Browser