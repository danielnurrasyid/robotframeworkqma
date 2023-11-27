*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_resources.robot
Resource    ../resources/mytracker_resources.robot

*** Test Cases ***
Insert Daily QMA
    Given I am on login page
    And I will insert my username and password
    And I click login button
    Then I open menu my daily tracker
    And I will insert my daily task

*** Keywords ***
I am on login page
    Open My Browser

I will insert my username and password
    Input Username    daniel
    login_resources.Input Password    daniel202103003

I click login button
    Click Login Button
    Verify Success Login

I open menu my daily tracker
    Open Menu Daily
    
I will insert my daily task
    Insert Daily