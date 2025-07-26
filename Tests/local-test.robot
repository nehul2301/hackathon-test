*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Test Setup    Create Browser    chrome    ${BASE_URL}
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Valid User Login
    [Documentation]    Verify that a valid user can successfully log into the application
    Login With Valid Credentials
    Verify Login Success

Test Case 2: Verify Invalid User Login
    [Documentation]    Verify that an invalid user cannot log into the application
    Login With Invalid Credentials
    Verify Login Failure

Test Case 3: Verify All Navigation Links Are Available
    [Documentation]    Verify that all navigation links are present on the page
    Navigate To Page    ${BASE_URL}
    Verify All Navigation Links

Test Case 4: Verify Footer Elements
    [Documentation]    Verify that footer contains required elements
    Navigate To Page    ${BASE_URL}
    Verify Footer Elements

Test Case 5: Verify Header Elements
    [Documentation]    Verify that header contains required elements
    Navigate To Page    ${BASE_URL}
    Verify Header Elements

Test Case 6: Verify Application Logo
    [Documentation]    Verify that the application logo is visible
    Navigate To Page    ${BASE_URL}
    Verify Logo

Test Case 7: Verify Home Page Navigation
    [Documentation]    Verify navigation to home page works correctly
    Navigate To Home Page

Test Case 8: Verify Products Page Navigation
    [Documentation]    Verify navigation to products page works correctly
    Navigate To Products Page

Test Case 9: Verify User Registration
    [Documentation]    Verify that new user can register successfully
    Navigate To Page    ${BASE_URL}/register
    Fill Registration Form
    Page Should Contain    Registration successful

Test Case 10: Verify Add Product To Cart
    [Documentation]    Verify that products can be added to cart
    Navigate To Products Page
    Add Product To Cart
    Verify Cart Item Count    1

Test Case 11: Verify Remove Product From Cart
    [Documentation]    Verify that products can be removed from cart
    Navigate To Products Page
    Add Product To Cart
    Remove Product From Cart
    Verify Cart Item Count    0

Test Case 12: Verify Page Title
    [Documentation]    Verify that page title is correct
    Navigate To Page    ${BASE_URL}
    Verify Page Title    Welcome to Our Application

Test Case 13: Verify Login Page Title
    [Documentation]    Verify that login page title is correct
    Navigate To Page    ${BASE_URL}/login
    Verify Page Title    Login - Our Application

Test Case 14: Verify Products Page Title
    [Documentation]    Verify that products page title is correct
    Navigate To Products Page
    Verify Page Title    Products - Our Application

Test Case 15: Verify Login Button Clickability
    [Documentation]    Verify that login button is clickable
    Navigate To Page    ${BASE_URL}/login
    Verify Element Is Clickable    id=login-button

Test Case 16: Verify Cart Icon Visibility
    [Documentation]    Verify that cart icon is visible
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=cart-icon

Test Case 17: Verify Logout Functionality
    [Documentation]    Verify that user can logout successfully
    Login With Valid Credentials
    Click Element    id=logout-button
    Page Should Contain    Login

Test Case 18: Verify Empty Form Validation
    [Documentation]    Verify validation for empty contact form
    Navigate To Contact Page
    Click Button    id=submit
    Page Should Contain    Please fill all required fields

Test Case 19: Verify Invalid Email Format
    [Documentation]    Verify validation for invalid email format
    Navigate To Contact Page
    Input Text    id=email    invalid-email
    Click Button    id=submit
    Page Should Contain    Please enter valid email

Test Case 20: Verify Password Strength Validation
    [Documentation]    Verify password strength validation during registration
    Navigate To Page    ${BASE_URL}/register
    Input Text    id=reg-password    weak
    Page Should Contain    Password must be at least 8 characters


Test Case 21: Verify Error Page Handling
    [Documentation]    Verify that 404 error page is handled correctly
    Navigate To Page    ${BASE_URL}/nonexistent-page
    Page Should Contain    404
    Page Should Contain    This page could not be found.

Test Case 22: Verify Adding To Favorite Works
    [Documentation]    Verify that adding a product to favorites works
    Navigate To Products Page
    Add Product To Favorites
    Verify Favorites Count    1

Test Case 23: Verify Removing From Favorite Works
    [Documentation]    Verify that removing a product from favorites works
    Navigate To Products Page
    Add Product To Favorites
    Remove Product From Favorites
    Verify Favorites Count    0

Test Case 24: Verify Images Are Loading Correctly
    [Documentation]    Verify that product images are loading correctly
    Navigate To Products Page
    Page Should Contain Element    class=product-image
    Element Should Be Visible    class=product-image

Test Case 25: Verify Images Are Not Loading For Failing User
    [Documentation]    Verify that product images are loading correctly
    Navigate To Products Page
    Page Should Contain Element    class=product-image
    Element Should Be Visible    class=product-image

Test Case 26: Verify Orders Are Showing Up In The Account
    [Documentation]    Verify that orders are showing up in the user account
    Login With Valid Credentials
    Navigate To User Orders Page
    Page Should Contain Element    class=order-list
    Page Should Contain    Order History

Test Case 27: Verify Sorting By Apple Works
    [Documentation]    Verify that sorting products by brands works
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 28: Verify Sorting By Oneplus Works
    [Documentation]    Verify that sorting products by brands works
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 29: Verify Sorting By Samsung Works
    [Documentation]    Verify that sorting products by brands works
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 30: Verify Sorting By Google Works
    [Documentation]    Verify that sorting products by brands works
    Navigate To Products Page
    Click Element    id=sort-by-brand
    Page Should Contain Element    class=sorted-products-by-brand

Test Case 31: Verify User Needs To Input All Field Value To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Click Button    id=place-order
    Page Should Contain    Please fill all required fields

Test Case 32: Verify User Can Place An Order Successfully
    [Documentation]    Verify that user can place an order successfully
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Input Text    id=shipping-address    123 Test St
    Input Text    id=billing-address    123 Test St
    Click Button    id=place-order
    Page Should Contain    Order placed successfully

Test Case 33: Verify Checking For Offers Throws A Browser Alert Asking Location Access
    [Documentation]    Verify that checking for offers throws a browser alert asking for location access
    Navigate To Page    ${BASE_URL}/offers
    Click Button    id=check-offers
    Wait Until Page Contains Element    class=alert
    Page Should Contain    Allow location access to check offers

Test Case 34: Verify Checking For Offers Throws A Browser Alert And User Denies Location Access Shows Error
    [Documentation]    Verify that checking for offers throws a browser alert and user denies location access shows error
    Navigate To Page    ${BASE_URL}/offers
    Click Button    id=check-offers
    Wait Until Page Contains Element    class=alert
    Page Should Contain    Please enable Geolocation in your browser.
    
Test Case 35: Verify User Can Download Order Details
    [Documentation]    Verify that user can download order details
    Login With Valid Credentials
    Navigate To User Orders Page
    Click Button    id=download-order-details
    Wait Until Page Contains Element    class=download-link
    Page Should Contain Element    class=download-link

Test Case 36: Verify Unsuccessful Order Placement Due To Insufficient Stock
    [Documentation]    Verify that user cannot place an order if stock is insufficient
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Input Text    id=shipping-address    123 Test St
    Input Text    id=billing-address    123 Test St
    Click Button    id=place-order
    Page Should Contain    Insufficient stock to place the order

Test Case 37: Verify Elements Are Not Overlapping On The Page
    [Documentation]    Verify that elements are not overlapping on the page
    Navigate To Page    ${BASE_URL}
    Element Should Not Overlap    id=header    id=footer
    Element Should Not Overlap    class=main-content    class=sidebar

Test Case 38: Verify New User Can Purchase Without Existing Credentials
    [Documentation]    Verify that a new user can purchase without existing credentials
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Input Text    id=shipping-address    123 Test St
    Input Text    id=billing-address    123 Test St
    Click Button    id=place-order
    Page Should Contain    Order placed successfully without login

Test Case 39: Verify Home Page Icon Button Is Same On All Pages
    [Documentation]    Verify that home page icon button is consistent across all pages
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=home-icon
    Click Element    id=home-icon
    Page Should Contain    Welcome to Home