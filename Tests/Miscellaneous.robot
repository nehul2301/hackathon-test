*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/homepage.py
Variables   ../Locators/loginpage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Empty Form Validation
    [Documentation]    Verify validation for empty contact form
    [Tags]    TC-101
    Click Element    ${contact_page_link_locator}
    Wait Until Page Contains Element    ${contact_form_locator}    timeout=10s
    Click Element    ${contact_submit_button_locator}
    Page Should Contain    Please fill all required fields

Test Case 2: Verify Invalid Email Format
    [Documentation]    Verify validation for invalid email format
    [Tags]    TC-101
    Click Element    ${contact_page_link_locator}
    Wait Until Page Contains Element    ${contact_form_locator}    timeout=10s
    Input Text    ${contact_email_input_locator}    invalid-email
    Click Element    ${contact_submit_button_locator}
    Page Should Contain    Please enter valid email

Test Case 3: Verify Password Strength Validation
    [Documentation]    Verify password strength validation during registration
    [Tags]    TC-101
    Click Element    ${register_page_link_locator}
    Wait Until Page Contains Element    ${register_form_locator}    timeout=10s
    Input Text    ${register_password_input_locator}    weak
    Page Should Contain    Password must be at least 8 characters

Test Case 4: Verify Error Page Handling
    [Documentation]    Verify that 404 error page is handled correctly
    [Tags]    TC-101
    [Setup]    Open Browser    https://testathon.live/nonexistent-page    chrome
    Wait Until Page Contains    404    timeout=10s
    Page Should Contain    This page could not be found.

Test Case 5: Verify Sorting By Apple Works
    [Documentation]    Verify that sorting products by Apple brand works
    [Tags]    TC-101
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_sort_dropdown_locator}    timeout=10s
    Click Element    ${home_sort_dropdown_locator}
    Click Element    ${home_filter_apple_locator}
    Wait Until Page Contains    Apple    timeout=10s
    Page Should Contain Element    ${home_product_card_locator}

Test Case 6: Verify Sorting By OnePlus Works
    [Documentation]    Verify that sorting products by OnePlus brand works
    [Tags]    TC-101
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_sort_dropdown_locator}    timeout=10s
    Click Element    ${home_sort_dropdown_locator}
    Click Element    ${home_filter_oneplus_locator}
    Wait Until Page Contains    OnePlus    timeout=10s
    Page Should Contain Element    ${home_product_card_locator}

Test Case 7: Verify Sorting By Samsung Works
    [Documentation]    Verify that sorting products by Samsung brand works
    [Tags]    TC-101
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_sort_dropdown_locator}    timeout=10s
    Click Element    ${home_sort_dropdown_locator}
    Click Element    ${home_filter_samsung_locator}
    Wait Until Page Contains    Samsung    timeout=10s
    Page Should Contain Element    ${home_product_card_locator}

Test Case 8: Verify Product Search Functionality
    [Documentation]    Verify that product search works correctly
    [Tags]    TC-102
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_search_box_locator}    timeout=10s
    Input Text    ${home_search_box_locator}    iPhone
    Click Element    ${home_search_button_locator}
    Wait Until Page Contains    iPhone    timeout=10s
    Page Should Contain Element    ${home_product_card_locator}

Test Case 9: Verify Product Price Display
    [Documentation]    Verify that product prices are displayed correctly
    [Tags]    TC-103
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_product_price_locator}    timeout=10s
    ${price_text}=    Get Text    ${home_product_price_locator}
    Should Match Regexp    ${price_text}    \\$[0-9]+(\\.\\d{2})?

Test Case 10: Verify Product Title Display
    [Documentation]    Verify that product titles are displayed correctly
    [Tags]    TC-104
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_product_title_locator}    timeout=10s
    ${title_text}=    Get Text    ${home_product_title_locator}
    Should Not Be Empty    ${title_text}
