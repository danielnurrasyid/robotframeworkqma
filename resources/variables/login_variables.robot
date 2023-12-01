*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${QMA_URL}    https://testingqa-office.nexcloud.id/testingqa/automation/webui/login
${BROWSER}    chrome
${TIMEOUT}    1

# Elements
${VERIFY_NEX}    Nex
${VERIFY_MY_NAME}    Daniel
${LABEL_NAME}    name
${TEXTFIELD_USERNAME}    username
${TEXTFIELD_PASSWORD}     password
${BUTTON_LOGIN}    Log in
${POPUP_FAILED}    failed
${MESSAGE_FAILED_LOGIN}    Oops! Login failed. Try Again.
${BUTTON_TOGGLE}    //div[@id='toggle-btn']
${SIDE_PREFERENCES}    //body/div[@id='sidebar']/div[14]/label[1]
${BUTTON_LOGOUT}    //li[@id='logoutBtn']
${BUTTON_CONFIRM_LOGOUT}    confirmLogout
${BUTTON_CLOSE_POPUP_FAILED}    //span[@id='modal-close']