*** Settings ***
Documentation     A test suite with 10 test cases (5 passing, 5 failing)
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com
${SEARCH_TERM}    Robot Framework
${INVALID_URL}    https://invalid-url.example.com
${VALID_XPATH}    //input[@name="q"]
${INVALID_XPATH}  //div[@id="nonexistent"]

*** Test Cases ***

# ? PASSED TEST CASES
Passing Test 1
    [Tags]    low
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Page Should Contain    Google
    Close Browser

Passing Test 2
    [Tags]    medium
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Input Text    name=q    ${SEARCH_TERM}
    Press Keys    name=q    ENTER
    Wait Until Element Is Visible    ${VALID_XPATH}    timeout=5
    Close Browser

Passing Test 3
    [Tags]    low
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Title Should Be    Google
    Close Browser

Passing Test 4
    [Tags]    low
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Go To    ${URL}
    Location Should Be    ${URL}
    Close Browser

Passing Test 5
    [Tags]    high
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Wait Until Page Contains    Google    timeout=5
    Close Browser

# ? FAILING TEST CASES
Failing Test 1
    [Tags]    low
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Page Should Contain    NonExistentText
    Close Browser

Failing Test 2
    [Tags]    medium
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Click Element    ${INVALID_XPATH}  # Element does not exist
    Close Browser

Failing Test 3
    [Tags]    high
    Open Browser    ${INVALID_URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")      options=add_argument("--user-data-dir=/tmp/chrome-profile")  # Invalid URL
    Close Browser

Failing Test 4
    [Tags]    high
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Input Text    name=q    ${SEARCH_TERM}
    Press Keys    name=q    ENTER
    Title Should Be    Incorrect Title  # This will fail
    Close Browser

Failing Test 5
    [Tags]    low
    Open Browser    ${URL}    ${BROWSER}      options=add_argument("--user-data-dir=/tmp/chrome-profile")
    Wait Until Element Is Visible    ${INVALID_XPATH}    timeout=5  # Will fail
    Close Browser
