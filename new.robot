*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser With Arguments
    Open Browser    https://www.google.com    chrome    options=--no-sandbox --disable-dev-shm-usage
*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser With Arguments
    # Create ChromeOptions instance
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    # Add arguments
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    # Open the browser with the options
    Open Browser    https://www.google.com    chrome    options=${options}
