*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary

*** Comments ***
taasdkansldknalskn

*** Variables ***
${path}    ${CURDIR}${/}..\\test_data\\data.xlsx
${sheet}    Sheet1

*** Test Cases ***
pake Excel
    ${exceldata}    Read Excel    ${path}    ${sheet}    1    2
    Log To Console    ${exceldata}
    # Read Excel kedua    ${path}    ${sheet}

*** Keywords ***
Read Excel
    [Arguments]    ${filepath}    ${sheetname}    ${colnum}    ${rownum}
    Open Excel Document    ${filepath}    1
    Get Sheet    ${sheetname}
    ${data}    Read Excel Cell    ${rownum}    ${colnum}
    [Return]    ${data}
    Close Current Excel Document

# Read Excel kedua
#     [Arguments]    ${filepath}    ${sheetname}
#     Open Excel Document    ${filepath}    1
#     Get Sheet    ${sheetname}
#     ${data}    Read Excel Row    2
#     read 
#     [Return]    ${data}
#     Close Current Excel Document


#      ${row_count}=    Set Variable    0
#     FOR    ${row_index}    IN RANGE    1    1000    # Menggunakan rentang yang cukup besar untuk pencarian
#     ${cell_value}=    Read Excel Cell    ${row_index}    1  # Menggunakan kolom pertama sebagai contoh
#             Run Keyword If    '${cell_value}' == ''    Exit For Loop
#     ${row_count}=    Set Variable    ${row_index}
        