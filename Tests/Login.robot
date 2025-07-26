*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify Valid User Login
    [Documentation]    Verify that a valid user can log into the application
    [Tags]    TC-99
    Login With Valid Credentials
    Verify Login Success

Test Case 2: Verify Invalid User Login
    [Documentation]    Verify that an invalid user cannot log into the application
    [Tags]    TC-104
    Login With Invalid Credentials
    Verify Login Failure

Test Case 3: Verify Invalid User Registration In Login Page
    [Documentation]    Verify that new user can register successfully
    [Tags]    TC-152
    Navigate To Page    ${BASE_URL}/register
    Fill Registration Form
    Page Should Contain    Registration successful

Test Case 4: Verify Logout Functionality
    [Documentation]    Verify that user can logout successfully
    [Tags]    TC-153
    Login With Valid Credentials
    Click Element    id=logout-button
    Page Should Contain    Login

Test Case 5: Verify Case Sensitivity In Password
    [Documentation]    Verify that login is case sensitive
    [Tags]    TC-100
    Login With Valid Credentials
    Click Element    id=logout-button
    Login With Invalid Credentials Case Sensitive
    Page Should Contain    Invalid username or password

Test Case 6: Verify Login with trailing spaces in email/username
    [Documentation]    Verify that login with trailing spaces in email/username fails
    [Tags]    TC-101
    Login With Trailing Spaces Credentials
    Page Should Contain    Invalid username or password

Test Case 7: Verify Redirect to intended page after successful login
    [Documentation]    Verify that user is redirected to intended page after login
    [Tags]    TC-102
    Navigate To Page    ${BASE_URL}/login?redirect=/dashboard
    Login With Valid Credentials
    Page Should Contain    Welcome to your dashboard

Test Case 8 : Verify Login With Incorrect Password
    [Documentation]    Verify that login fails with incorrect password
    [Tags]    TC-103
    Login With Incorrect Password
    Page Should Contain    Invalid username or password

Test Case 9 : Verify Login With Empty Credentials
    [Documentation]    Verify that login fails with empty credentials
    [Tags]    TC-105
    Login With Empty Credentials
    Page Should Contain    Please enter your username and password