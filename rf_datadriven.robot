*** Settings ***
Library           DataDriver    DataDriven.xlsx
Library           SeleniumLibrary


Suite Setup       Open my Browser
Suite Teardown    Close Browsers
Test Setup        Open Login Page
Test Template     Google login

*** Variables ***
${LOGIN URL}      https://www.google.com/ 
${BROWSER}        chrome

*** Test Cases ***
Google Search with data DataDriven '${text}'

*** Keywords ***
Google login
    [Arguments]    ${text}     #${password}
    [Tags]    FLAT
    Google Search    ${text}

Google Search
    [Arguments]    ${text}
    Input Text    xpath=/html/body/div[1]/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input    ${text}
    Sleep    3s

Open my Browser
    Open Browser    ${LOGIN URL}    browser=${BROWSER}
    Set Window Position    0    0
    Set Window Size    960    1000

Close Browsers
    Close All Browsers

Open Login Page
    Go To    ${LOGIN URL}
