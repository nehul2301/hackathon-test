*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Create Browser
    [Arguments]    ${browser}=chrome    ${url}=about:blank
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}

Send Keys To Element
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Scroll Element Into View
    [Arguments]    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView(true);    ${locator}

Login To Application
    [Arguments]    ${username}    ${password}    ${login_header}
    Wait Until Page Contains    ${login_header}
    Send Keys To Element    id=username    ${username}
    Send Keys To Element    id=password    ${password}
    Click Element    id=login-button