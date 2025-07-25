*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Open Website And Verify URL
    [Documentation]    Open a website, verify the URL, and close the browser.
        Create Browser    chrome    https://www.amazon.com
        Wait For Page To Load    6s
        Close Browser
