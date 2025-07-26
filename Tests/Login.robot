*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/loginpage.py
Variables   ../Locators/homepage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Valid User Login
    [Documentation]    Verify that a valid user can log into the application
    [Tags]    TC-99
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s

Test Case 2: Verify Invalid User Login
    [Documentation]    Verify that an invalid user cannot log into the application
    [Tags]    TC-104
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_locked_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains    Sorry, this user has been locked out    timeout=10s

Test Case 3: Verify Image Not Loading User Login
    [Documentation]    Verify that image not loading user can log into the application
    [Tags]    TC-152
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_image_not_load_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s

Test Case 4: Verify Existing Orders User Login
    [Documentation]    Verify that existing orders user can log into the application
    [Tags]    TC-153
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_existing_orders_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s

Test Case 5: Verify Favorite User Login
    [Documentation]    Verify that favorite user can log into the application
    [Tags]    TC-100
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_favorite_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s

Test Case 6: Verify Locked User Cannot Login
    [Documentation]    Verify that locked user cannot log into the application
    [Tags]    TC-101
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_locked_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains    Sorry, this user has been locked out    timeout=10s

Test Case 7: Verify Demo User Login and Product Access
    [Documentation]    Verify that demo user can login and access products
    [Tags]    TC-102
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_product_card_locator}    timeout=10s
