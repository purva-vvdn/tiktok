*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_USER_DATA}    /path/to/unique/directory

*** Test Cases ***
Open Browser With Unique User Data
    Open Browser    https://www.example.com    chrome    --user-data-dir=${CHROME_USER_DATA}
    # Add your other steps here
