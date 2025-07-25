*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${remote_url}=    http://localhost:4444/wd/hub

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

Validate Element Is Present
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Page Contains Element    tag:body

Verify Element Size
    [Arguments]    ${locator}    ${expected_width}    ${expected_height}
    ${width}    ${height}=    Get Element Size    ${locator}
    Should Be Equal As Numbers    ${width}    ${expected_width}
    Should Be Equal As Numbers    ${height}    ${expected_height}

Verify Element Text
    [Arguments]    ${locator}    ${expected_text}
    Element Text Should Be    ${locator}    ${expected_text}

Verify Element Contains Text
    [Arguments]    ${locator}    ${expected_text}
    Element Should Contain    ${locator}    ${expected_text}

Verify Element Position
    [Arguments]    ${locator}    ${expected_x}    ${expected_y}
    ${location}=    Get Element Location    ${locator}
    Should Be Equal As Numbers    ${location['x']}    ${expected_x}
    Should Be Equal As Numbers    ${location['y']}    ${expected_y}

Verify Element Color
    [Arguments]    ${locator}    ${css_property}    ${expected_color}
    ${actual_color}=    Get Element Attribute    ${locator}    ${css_property}
    Should Be Equal    ${actual_color}    ${expected_color}

Wait For Element And Click
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Clickable    ${locator}    ${timeout}
    Click Element    ${locator}

Clear And Send Keys
    [Arguments]    ${locator}    ${text}
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${text}

Select From Dropdown By Value
    [Arguments]    ${locator}    ${value}
    Select From List By Value    ${locator}    ${value}

Select From Dropdown By Text
    [Arguments]    ${locator}    ${text}
    Select From List By Label    ${locator}    ${text}

Switch To Frame
    [Arguments]    ${frame_locator}
    Select Frame    ${frame_locator}

Switch To Default Content
    Unselect Frame

Take Screenshot With Name
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    ${screenshot_name}.png

Verify Page Title
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

Verify URL Contains
    [Arguments]    ${expected_url_part}
    Location Should Contain    ${expected_url_part}

Wait For Page To Load
    [Arguments]    ${timeout}=30s
    Wait Until Page Contains Element    tag:body    ${timeout}

Hover Over Element
    [Arguments]    ${locator}
    Mouse Over    ${locator}

Double Click Element
    [Arguments]    ${locator}
    Double Click Element    ${locator}

Right Click Element
    [Arguments]    ${locator}
    Open Context Menu    ${locator}

Verify Element Is Enabled
    [Arguments]    ${locator}
    Element Should Be Enabled    ${locator}

Verify Element Is Disabled
    [Arguments]    ${locator}
    Element Should Be Disabled    ${locator}

Verify Element Is Enabled
    [Arguments]    ${locator}
        Element Should Be Enabled    ${locator}

Get Element Attribute Value
    [Arguments]    ${locator}    ${attribute}
        ${value}=    Get Element Attribute    ${locator}    ${attribute}
        RETURN    ${value}

Scroll To Top Of Page
    Execute JavaScript    window.scrollTo(0, 0);

Scroll To Bottom Of Page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

Refresh Page
    Reload Page

Close Current Tab
    Close Window

Switch To New Tab
    Switch Window    NEW
