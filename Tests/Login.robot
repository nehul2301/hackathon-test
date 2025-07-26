*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/loginpage.py
Variables   ../Locators/homepage.py
Variables   ../Locators/orders_page.py
Test Setup    Create Browser
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Valid User Login
    [Documentation]    Verify that a valid user can log into the application
    [Tags]    TC-99
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_demo_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Url Contains    signin=true    timeout=10s

Test Case 2: Verify Invalid User Login
    [Documentation]    Verify that an invalid user cannot log into the application
    [Tags]    TC-104
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_locked_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Page Contains    Your account has been locked.    timeout=10s

Test Case 3: Verify Image Not Loading User Login
    [Documentation]    Verify that image not loading user can log into the application
    [Tags]    TC-152
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_image_not_load_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Keyword Succeeds    2x    2s    Wait Until Page Contains Element    ${login_image_not_loading_username_locator}    timeout=10s


Test Case 4: Verify Existing Orders User Login
    [Documentation]    Verify that existing orders user can log into the application
    [Tags]    TC-153
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_existing_orders_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Keyword Succeeds    2x    2s    Wait Until Page Contains Element    ${existing_order_username_locator}    timeout=10s

Test Case 5: Verify Favorite User Login
    [Documentation]    Verify that favorite user can log into the application
    [Tags]    TC-100
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_favorite_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Keyword Succeeds    2x    2s    Wait Until Page Contains Element    ${favorite_username_locator}    timeout=10s

Test Case 6: Verify Locked User Cannot Login
    [Documentation]    Verify that locked user cannot log into the application
    [Tags]    TC-101
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_locked_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Page Contains    Your account has been locked.    timeout=10s

Test Case 7: Verify Demo User Login and Product Access
    [Documentation]    Verify that demo user can login and access products
    [Tags]    TC-102
    Wait And Click Element    ${homepage_signin_locator}
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_existing_orders_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait And Click Element     ${homepage_orders_section_locator}    timeout=10s
    Wait Until Url Contains    orders
    Wait Until Page Contains Element    ${order_container_locator}
