*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Elements
${BUTTON_INSIGHT}    //body[1]/div[1]/div[6]/label[1]
${BUTTON_MY_TRACKER}    //a[@id='myTrackerItem']
${IFRAME_TRACKER}    //iframe[contains(@src,/testingqa/automation/webui/home/insights/checkins)]
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

# Mood Value Dropdown
${AWESOME}    1
${SAD}    2
${CRAZY}    3
${DIZZY}    4

# Status Value Dropdown
${WORKING_FROM_OFFICE}    1
${WORKING_FROM_HOME}    2
${MARRIAGE_LEAVE}    3
${MATERNITY_LEAVE}    4
${SICK_LEAVE}    5
${ANNUAL_LEAVE}    6
${GRIEF_LEAVE}    7

# Project Value Dropdown
${ADB}    1
${AUTHENTICATION}    2
${FARMINDO}    3
${GROCHAT}    4
${GROKIOS}    5
${GROLOG}    6
${GROMART}    7
${GROPASS}    8
${GROREX}    9
${GROSTAR}    10
${MITRADA}    11
${ND}    12
${NEXCARE}    13
${NEXCHIEF}    14
${NEXCLOUD}    15
${NEXCOMMON}    16
${NEXCONSENT}    17
${NEXCORE}    18
${NEXDRIVE}    19
${NEXHUB}    20
${NEXLOG}    21
${NEXMILE}    22
${NEXPOS}    23
${NEXSAM}    24
${APISERVER}    25
${SOCKETSERVER}    26
${VOIP}    27
${NEXSTAR}    28
${NEXSTOCK}    29
${NEXTOKEN}    30
${NEXTRAC}    31
${NEXWEB}    32
${GROTRACK}    33
${NEXCENTRUM}    34

# Form Value Dropdown 
${DAILY_CHECK_IN}    1
${RETROSPECTIVE}    2