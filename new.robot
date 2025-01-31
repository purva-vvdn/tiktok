*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser With Arguments
    Open Browser    https://www.google.com    chrome    options=--no-sandbox --disable-dev-shm-usage
