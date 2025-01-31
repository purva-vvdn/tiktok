*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Chrome with Unique User Data Dir
    ${temp_dir}=    Evaluate    __import__('tempfile').mkdtemp()
    Open Browser    https://www.google.com    browser=chrome    options=add_argument("--user-data-dir=${temp_dir}")
    Close Browser