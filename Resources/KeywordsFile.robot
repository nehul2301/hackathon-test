*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${remote_url}=    http://localhost:4444/wd/hub
${BASE_URL}=    https://testathon.live
${VALID_USERNAME}=    demouser
${VALID_PASSWORD}=    testingisfun99
${INVALID_USERNAME}=    locked_user
${INVALID_PASSWORD}=    wrongpassword

*** Keywords ***
Create Browser
    [Arguments]    ${browser}=chrome    ${url}=https://testathon.live
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Browser
    Close All Browsers

# Login Keywords
Login With Valid Credentials
    Navigate To Page    ${BASE_URL}/login
    Input Text    id=username    ${VALID_USERNAME}
    Input Text    id=password    ${VALID_PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains    Dashboard

Login With Invalid Credentials
    Navigate To Page    ${BASE_URL}/login
    Input Text    id=username    ${INVALID_USERNAME}
    Input Text    id=password    ${INVALID_PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains    Invalid credentials

Verify Login Success
    Page Should Contain    Welcome
    Page Should Contain Element    id=user-profile

Verify Login Failure
    Page Should Contain    Login failed
    Page Should Contain Element    class=error-message

# Navigation Keywords
Verify Navigation Link Exists
    [Arguments]    ${link_text}
    Page Should Contain Link    ${link_text}

Verify All Navigation Links
    Verify Navigation Link Exists    Home
    Verify Navigation Link Exists    Products
    Verify Navigation Link Exists    Services
    Verify Navigation Link Exists    About
    Verify Navigation Link Exists    Contact

Click Navigation Link
    [Arguments]    ${link_text}
    Click Link    ${link_text}
    Wait For Page To Load

Navigate To Home Page
    Click Navigation Link    Home
    Page Should Contain    Welcome to Home

Navigate To Products Page
    Click Navigation Link    Products
    Page Should Contain    Our Products

Navigate To Services Page
    Click Navigation Link    Services
    Page Should Contain    Our Services

Navigate To About Page
    Click Navigation Link    About
    Page Should Contain    About Us

Navigate To Contact Page
    Click Navigation Link    Contact
    Page Should Contain    Contact Information

# Header and Footer Keywords
Verify Header Elements
    Page Should Contain Element    class=header
    Page Should Contain Element    class=navigation-menu
    Page Should Contain Element    class=user-menu

Verify Footer Elements
    Page Should Contain Element    class=footer
    Page Should Contain    Copyright
    Page Should Contain    Privacy Policy
    Page Should Contain    Terms of Service

Verify Logo
    Page Should Contain Element    class=logo
    Element Should Be Visible    class=logo

# Form Keywords
Fill Contact Form
    Input Text    id=name    Test User
    Input Text    id=email    test@example.com
    Input Text    id=message    Test message
    Click Button    id=submit

Verify Form Submission
    Page Should Contain    Thank you for your message

Fill Registration Form
    Input Text    id=reg-username    newuser@example.com
    Input Text    id=reg-password    newpassword123
    Input Text    id=confirm-password    newpassword123
    Click Button    id=register

# Search Keywords
Perform Search
    [Arguments]    ${search_term}
    Input Text    id=search-box    ${search_term}
    Click Button    id=search-button

Verify Search Results
    [Arguments]    ${expected_results}
    Page Should Contain    Search Results
    Page Should Contain    ${expected_results}

# Product Keywords
Add Product To Cart
    Click Button    class=add-to-cart
    Page Should Contain    Added to cart

Verify Cart Item Count
    [Arguments]    ${expected_count}
    Element Text Should Be    id=cart-count    ${expected_count}

Remove Product From Cart
    Click Button    class=remove-from-cart
    Page Should Contain    Removed from cart

# Profile Keywords
Access User Profile
    Click Element    id=profile-link
    Page Should Contain    User Profile

Update Profile Information
    Input Text    id=profile-name    Updated Name
    Input Text    id=profile-email    updated@example.com
    Click Button    id=save-profile

Change Password
    Input Text    id=current-password    ${VALID_PASSWORD}
    Input Text    id=new-password    newpassword456
    Input Text    id=confirm-new-password    newpassword456
    Click Button    id=change-password

# Utility Keywords
Wait For Page To Load
    [Arguments]    ${timeout}=10s
    Wait Until Page Contains Element    tag:body    ${timeout}

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}
    Wait For Page To Load

Verify Page Title
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

Verify Element Text
    [Arguments]    ${locator}    ${expected_text}
    Element Text Should Be    ${locator}    ${expected_text}

Scroll To Element
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}

Take Screenshot On Failure
    Capture Page Screenshot

Verify Element Is Clickable
    [Arguments]    ${locator}
    Element Should Be Enabled    ${locator}
    Element Should Be Visible    ${locator}

Verify Dropdown Options
    [Arguments]    ${dropdown_locator}    @{expected_options}
    FOR    ${option}    IN    @{expected_options}
        List Selection Should Be    ${dropdown_locator}    ${option}
    END

Verify Checkbox State
    [Arguments]    ${checkbox_locator}    ${expected_state}
    Run Keyword If    '${expected_state}' == 'checked'
    ...    Checkbox Should Be Selected    ${checkbox_locator}
    ...    ELSE    Checkbox Should Not Be Selected    ${checkbox_locator}

Wait And Click Element
    [Arguments]    ${locator}    ${timeout}=2s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Enter Text And Submit
    [Arguments]    ${input_locator}    ${text}    ${submit_locator}
    Input Text    ${input_locator}    ${text}
    Click Element    ${submit_locator}

Wait Until Url Contains
    [Arguments]    ${substring}    ${timeout}=10s
        Wait For Page To Load    ${timeout}
        Wait Until Keyword Succeeds    3x    2s    Check Url    ${substring}
        
Check Url
    [Arguments]    ${expected_url}    ${timeout}=10s
        ${current_url}=    Get Location
        Should Contain    ${current_url}    ${expected_url}
# Product Name Handling Keywords
Get Product Locator
    [Arguments]    ${locator}    ${product_name}
    ${updated_locator}=    Replace String    ${locator}    PRODUCT_NAME    ${product_name}
    [Return]    ${updated_locator}

Wait And Input Element
    [Arguments]    ${locator}    ${text}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}