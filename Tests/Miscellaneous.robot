*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify Empty Form Validation
    [Documentation]    Verify validation for empty contact form
    [Tags]    TC-101
    Navigate To Contact Page
    Click Button    id=submit
    Page Should Contain    Please fill all required fields

Test Case 2: Verify Invalid Email Format
    [Documentation]    Verify validation for invalid email format
    [Tags]    TC-101
    Navigate To Contact Page
    Input Text    id=email    invalid-email
    Click Button    id=submit
    Page Should Contain    Please enter valid email

Test Case 3: Verify Password Strength Validation
    [Documentation]    Verify password strength validation during registration
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/register
    Input Text    id=reg-password    weak
    Page Should Contain    Password must be at least 8 characters

Test Case 4: Verify Error Page Handling
    [Documentation]    Verify that 404 error page is handled correctly
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/nonexistent-page
    Page Should Contain    404
    Page Should Contain    This page could not be found.

Test Case 5: Verify Sorting By Apple Works
    [Documentation]    Verify that sorting products by brands works
    [Tags]    TC-101
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 6: Verify Sorting By Oneplus Works
    [Documentation]    Verify that sorting products by brands works
    [Tags]    TC-101
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 7: Verify Sorting By Samsung Works
    [Documentation]    Verify that sorting products by brands works
    [Tags]    TC-101
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 8: Verify Sorting By Google Works
    [Documentation]    Verify that sorting products by brands works
    [Tags]    TC-101
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 9: Verify Checking For Offers Throws A Browser Alert Asking Location Access
    [Documentation]    Verify that checking for offers throws a browser alert asking for location access
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/offers
    Click Button    id=check-offers
    Wait Until Page Contains Element    class=alert
    Page Should Contain    Allow location access to check offers

Test Case 10: Verify Checking For Offers Throws A Browser Alert And User Denies Location Access Shows Error
    [Documentation]    Verify that checking for offers throws a browser alert and user denies location access shows error
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/offers
    Click Button    id=check-offers
    Wait Until Page Contains Element    class=alert
    Page Should Contain    Please enable Geolocation in your browser.
