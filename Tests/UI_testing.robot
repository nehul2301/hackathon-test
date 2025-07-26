*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/homepage.py
Variables   ../Locators/loginpage.py
Variables   ../Locators/offerspage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify All Navigation Links Are Available
    [Documentation]    Verify that all navigation links are present on the page
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_navigation_menu_locator}    timeout=10s
    Page Should Contain Element    ${home_products_link_locator}
    Page Should Contain Element    ${home_login_link_locator}
    Page Should Contain Element    ${home_cart_icon_locator}
    Page Should Contain Element    ${contact_page_link_locator}

Test Case 2: Verify Footer Elements
    [Documentation]    Verify that footer contains required elements
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_footer_locator}    timeout=10s
    Page Should Contain Element    ${home_footer_locator}

Test Case 3: Verify Header Elements
    [Documentation]    Verify that header contains required elements
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_header_locator}    timeout=10s
    Page Should Contain Element    ${home_header_locator}
    Page Should Contain Element    ${home_logo_locator}
    Page Should Contain Element    ${home_navigation_menu_locator}

Test Case 4: Verify Application Logo
    [Documentation]    Verify that the application logo is visible
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_logo_locator}    timeout=10s
    Element Should Be Visible    ${home_logo_locator}

Test Case 5: Verify Home Page Navigation
    [Documentation]    Verify navigation to home page works correctly
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_logo_locator}    timeout=10s
    Click Element    ${home_logo_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s

Test Case 6: Verify Products Page Navigation
    [Documentation]    Verify navigation to products page works correctly
    [Tags]    TC-101
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_product_card_locator}    timeout=10s
    Page Should Contain Element    ${home_add_to_cart_button_locator}

Test Case 7: Verify Page Title
    [Documentation]    Verify that page title is correct
    [Tags]    TC-101
    Title Should Contain    Testathon

Test Case 8: Verify Login Page Title
    [Documentation]    Verify that login page title is correct
    [Tags]    TC-101
    Click Element    ${home_login_link_locator}
    Wait Until Page Contains Element    ${login_username_dropdown_locator}    timeout=10s
    Title Should Contain    Testathon

Test Case 9: Verify Products Page Title
    [Documentation]    Verify that products page title is correct
    [Tags]    TC-101
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_product_card_locator}    timeout=10s
    Title Should Contain    Testathon

Test Case 10: Verify Cart Icon Functionality
    [Documentation]    Verify that cart icon is functional
    [Tags]    TC-102
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Element Should Be Visible    ${home_cart_icon_locator}
    Click Element    ${home_cart_icon_locator}
    Wait Until Page Contains    Your shopping bag is empty    timeout=10s

Test Case 11: Verify Offers Page Elements
    [Documentation]    Verify that offers page displays promotional content
    [Tags]    TC-103
    # Navigate to offers if there's a link, otherwise check if offers appear on homepage
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${offers_header_locator}    timeout=5s
    Run Keyword And Continue On Failure    Page Should Contain Element    ${offers_iphone_locator}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${offers_oneplus_locator}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${offers_free_shipping_locator}

Test Case 12: Verify Search Functionality
    [Documentation]    Verify that search functionality works correctly
    [Tags]    TC-104
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_search_box_locator}    timeout=10s
    Input Text    ${home_search_box_locator}    iPhone
    Click Element    ${home_search_button_locator}
    Wait Until Page Contains    iPhone    timeout=10s
