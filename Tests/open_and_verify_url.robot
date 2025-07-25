*** Settings ***
Resource    ../Keywords/common.robot

*** Test Cases ***
Test Case 1: Open Website And Verify URL
    [Documentation]    Open a website, verify the URL, and close the browser.
    [Arguments]    ${browser}=chrome    ${url_arg}
    Create Browser    ${browser}    ${url_arg}
    Location Should Be    ${url_arg}
    Close Browser

