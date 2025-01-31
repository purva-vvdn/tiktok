*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# ${CHROME_USER_DATA}    /user/local/bin/chromedriver

*** Test Cases ***
Open Browser With Unique User Data
    Open Browser  https://www.google.com  browser=chrome  options=add_argument("--no-sandbox")  
    # Add your other steps here
