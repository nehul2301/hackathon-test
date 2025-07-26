*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify All Navigation Links Are Available
    [Documentation]    Verify that all navigation links are present on the page
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Verify All Navigation Links

Test Case 2: Verify Footer Elements
    [Documentation]    Verify that footer contains required elements
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Verify Footer Elements

Test Case 3: Verify Header Elements
    [Documentation]    Verify that header contains required elements
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Verify Header Elements

Test Case 4: Verify Application Logo
    [Documentation]    Verify that the application logo is visible
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Verify Logo

Test Case 5: Verify Home Page Navigation
    [Documentation]    Verify navigation to home page works correctly
    [Tags]    TC-101
    Navigate To Home Page

Test Case 6: Verify Products Page Navigation
    [Documentation]    Verify navigation to products page works correctly
    [Tags]    TC-101
    Navigate To Products Page

Test Case 7: Verify Page Title
    [Documentation]    Verify that page title is correct
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Verify Page Title    Welcome to Our Application

Test Case 8: Verify Login Page Title
    [Documentation]    Verify that login page title is correct
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/login
    Verify Page Title    Login - Our Application

Test Case 9: Verify Products Page Title
    [Documentation]    Verify that products page title is correct
    [Tags]    TC-101
    Navigate To Products Page
    Verify Page Title    Products - Our Application

Test Case 10: Verify Login Button Clickability
    [Documentation]    Verify that login button is clickable
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/login
    Verify Element Is Clickable    id=login-button

Test Case 11: Verify Cart Icon Visibility
    [Documentation]    Verify that cart icon is visible
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=cart-icon

Test Case 12: Verify Images Are Loading Correctly
    [Documentation]    Verify that product images are loading correctly
    [Tags]    TC-101
    Navigate To Products Page
    Page Should Contain Element    class=product-image
    Element Should Be Visible    class=product-image

Test Case 13: Verify Images Are Not Loading For Failing User
    [Documentation]    Verify that product images are loading correctly
    [Tags]    TC-101
    Navigate To Products Page
    Page Should Contain Element    class=product-image
    Element Should Be Visible    class=product-image

Test Case 14: Verify Elements Are Not Overlapping On The Page
    [Documentation]    Verify that elements are not overlapping on the page
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Element Should Not Overlap    id=header    id=footer
    Element Should Not Overlap    class=main-content    class=sidebar

Test Case 15: Verify Home Page Icon Button Is Same On All Pages
    [Documentation]    Verify that home page icon button is consistent across all pages
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=home-icon
    Click Element    id=home-icon
    Page Should Contain    Welcome to Home

Test Case 16 : Verify Home Page Icon Button Is Present On Sign In Page
    [Documentation]    Verify that home page icon button is present on sign in page
    [Tags]    TC-101
    Navigate To Page    ${BASE_URL}/login
    Page Should Contain Element    id=home-icon
    Click Element    id=home-icon
    Page Should Contain    Welcome to Home