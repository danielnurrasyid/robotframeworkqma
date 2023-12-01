*** Settings ***
Library    SeleniumLibrary
#Library    AutoRecorder
Resource    ../resources/login_resources.robot
Resource    ../resources/mytracker_resources.robot

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
    Input Username    daniel
    login_resources.Input Password    daniel202103003

click the login button
    Click Login Button
    Verify Success Login

I should see my profile
    Verify Success Login

I open menu my daily tracker
    Open Menu Daily
    
insert my daily task
    Insert Daily

I should see a success message
    Verify Success Submit Daily

I log out
    Click Logout Button
    login_resources.Close Browser