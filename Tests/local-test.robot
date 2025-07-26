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

Test Case 9: Verify Services Page Navigation
    [Documentation]    Verify navigation to services page works correctly
    Navigate To Services Page

Test Case 10: Verify About Page Navigation
    [Documentation]    Verify navigation to about page works correctly
    Navigate To About Page

Test Case 11: Verify Contact Page Navigation
    [Documentation]    Verify navigation to contact page works correctly
    Navigate To Contact Page

Test Case 12: Verify Contact Form Submission
    [Documentation]    Verify that contact form can be submitted successfully
    Navigate To Contact Page
    Fill Contact Form
    Verify Form Submission

Test Case 13: Verify User Registration
    [Documentation]    Verify that new user can register successfully
    Navigate To Page    ${BASE_URL}/register
    Fill Registration Form
    Page Should Contain    Registration successful

Test Case 14: Verify Search Functionality
    [Documentation]    Verify that search functionality works correctly
    Navigate To Page    ${BASE_URL}
    Perform Search    test product
    Verify Search Results    test product

Test Case 15: Verify Add Product To Cart
    [Documentation]    Verify that products can be added to cart
    Navigate To Products Page
    Add Product To Cart
    Verify Cart Item Count    1

Test Case 16: Verify Remove Product From Cart
    [Documentation]    Verify that products can be removed from cart
    Navigate To Products Page
    Add Product To Cart
    Remove Product From Cart
    Verify Cart Item Count    0

Test Case 17: Verify User Profile Access
    [Documentation]    Verify that user can access their profile
    Login With Valid Credentials
    Access User Profile

Test Case 18: Verify Profile Information Update
    [Documentation]    Verify that user can update profile information
    Login With Valid Credentials
    Access User Profile
    Update Profile Information
    Page Should Contain    Profile updated successfully

Test Case 19: Verify Password Change
    [Documentation]    Verify that user can change their password
    Login With Valid Credentials
    Access User Profile
    Change Password
    Page Should Contain    Password changed successfully

Test Case 20: Verify Page Title
    [Documentation]    Verify that page title is correct
    Navigate To Page    ${BASE_URL}
    Verify Page Title    Welcome to Our Application

Test Case 21: Verify Login Page Title
    [Documentation]    Verify that login page title is correct
    Navigate To Page    ${BASE_URL}/login
    Verify Page Title    Login - Our Application

Test Case 22: Verify Products Page Title
    [Documentation]    Verify that products page title is correct
    Navigate To Products Page
    Verify Page Title    Products - Our Application

Test Case 23: Verify Services Page Title
    [Documentation]    Verify that services page title is correct
    Navigate To Services Page
    Verify Page Title    Services - Our Application

Test Case 24: Verify About Page Title
    [Documentation]    Verify that about page title is correct
    Navigate To About Page
    Verify Page Title    About Us - Our Application

Test Case 25: Verify Contact Page Title
    [Documentation]    Verify that contact page title is correct
    Navigate To Contact Page
    Verify Page Title    Contact - Our Application

Test Case 26: Verify Search Box Visibility
    [Documentation]    Verify that search box is visible on the page
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=search-box

Test Case 27: Verify Login Button Clickability
    [Documentation]    Verify that login button is clickable
    Navigate To Page    ${BASE_URL}/login
    Verify Element Is Clickable    id=login-button

Test Case 28: Verify Registration Button Clickability
    [Documentation]    Verify that registration button is clickable
    Navigate To Page    ${BASE_URL}/register
    Verify Element Is Clickable    id=register

Test Case 29: Verify Cart Icon Visibility
    [Documentation]    Verify that cart icon is visible
    Navigate To Page    ${BASE_URL}
    Page Should Contain Element    id=cart-icon

Test Case 30: Verify User Menu Dropdown
    [Documentation]    Verify that user menu dropdown works
    Login With Valid Credentials
    Click Element    id=user-menu
    Page Should Contain Element    id=dropdown-menu

Test Case 31: Verify Logout Functionality
    [Documentation]    Verify that user can logout successfully
    Login With Valid Credentials
    Click Element    id=logout-button
    Page Should Contain    Login

Test Case 32: Verify Empty Form Validation
    [Documentation]    Verify validation for empty contact form
    Navigate To Contact Page
    Click Button    id=submit
    Page Should Contain    Please fill all required fields

Test Case 33: Verify Invalid Email Format
    [Documentation]    Verify validation for invalid email format
    Navigate To Contact Page
    Input Text    id=email    invalid-email
    Click Button    id=submit
    Page Should Contain    Please enter valid email

Test Case 34: Verify Password Strength Validation
    [Documentation]    Verify password strength validation during registration
    Navigate To Page    ${BASE_URL}/register
    Input Text    id=reg-password    weak
    Page Should Contain    Password must be at least 8 characters

Test Case 35: Verify Category Filter
    [Documentation]    Verify that product category filter works
    Navigate To Products Page
    Click Element    id=category-electronics
    Page Should Contain    Electronics

Test Case 36: Verify Sort Functionality
    [Documentation]    Verify that product sorting works
    Navigate To Products Page
    Select From List By Label    id=sort-dropdown    Price: Low to High
    Page Should Contain Element    class=sorted-products

Test Case 37: Verify Breadcrumb Navigation
    [Documentation]    Verify that breadcrumb navigation is working
    Navigate To Products Page
    Page Should Contain Element    class=breadcrumb
    Page Should Contain    Home > Products

Test Case 38: Verify Mobile Responsive Design
    [Documentation]    Verify that page is responsive for mobile view
    Navigate To Page    ${BASE_URL}
    Set Window Size    375    667
    Page Should Contain Element    class=mobile-menu

Test Case 39: Verify Social Media Links
    [Documentation]    Verify that social media links are present in footer
    Navigate To Page    ${BASE_URL}
    Scroll To Element    class=footer
    Page Should Contain Element    class=social-facebook
    Page Should Contain Element    class=social-twitter

Test Case 40: Verify Error Page Handling
    [Documentation]    Verify that 404 error page is handled correctly
    Navigate To Page    ${BASE_URL}/nonexistent-page
    Page Should Contain    404
    Page Should Contain    Page Not Found
