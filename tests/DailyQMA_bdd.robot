*** Settings ***
Library    SeleniumLibrary
#Library    AutoRecorder
Resource    ../resources/keywords/login_resources.robot
Resource    ../resources/keywords/mytracker_resources.robot

*** Variables ***
# Account
${USERNAME_ACCOUNT}    daniel
${PASSWORD_ACCOUNT}    daniel202103003

# Daily
${CHECK_IN_DATE}    01/01/2021
${YESTERDAY_TASK}
...    - Demo NexSam${\n} 
...    - Management Ticket${\n} 
...    	- Create Backlog Nexmile dari Task dan CR 129775 dan 129769${\n} 
...    - Demo Direct Loan dengan Bank Fairbanc${\n} 
${TODAY_TASK}
...    - Membuat Backlog Demo Nexsam, Demo Direct Loan dengan Fairbanc, Farmindo${\n} 
...    - Nexmile${\n} 
...    	- Manual #140345 - Testing Penambahan validasi query ketika insert data customersubtype dan customertype - Done${\n} 
...    	- Manual #140346 - Testing Perbaikan validasi insert user NexMile - Done${\n} 
...    	- Manual #140386 - Testing Adjustment wording register - done${\n} 
...    - Nexlog${\n} 
...    	- Manual #140318 - Testing Validation Response Get User - Done${\n} 
...    	- Manual #140321 - Testing Validation Response Get Driver - Done${\n} 
...    	- Manual #140323 - Testing Validation Reponse Get Push Parameter - Done
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
    Input Username    ${USERNAME_ACCOUNT}
    login_resources.Input Password    ${PASSWORD_ACCOUNT}

click the login button
    Click Login Button
    Verify Success Login

I should see my profile
    Verify Success Login
    Click Sidebar Toggle
    Verify my Profile

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