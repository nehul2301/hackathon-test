*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/shippingpage.py
Variables   ../Locators/bagpage.py
Variables   ../Locators/confirmationpage.py
Variables   ../Locators/homepage.py
Variables   ../Locators/loginpage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${bag_checkout_locaotor}
    Click Element    ${shipping_submit_locator}
    Page Should Contain    Please fill out this field

Test Case 2: Verify User Can Place An Order Successfully
    [Documentation]    Verify that user can place an order successfully
    [Tags]    TC-118    TC-120
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Input Text    ${shipping_first_name_locator}    John
    Input Text    ${shipping_last_name_locator}    Doe
    Input Text    ${shipping_address_line1_locator}    123 Test Street
    Input Text    ${shipping_province_locator}    Test Province
    Input Text    ${shipping_postal_code_locator}    12345
    Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=15s
    Page Should Contain Element    ${confirmation_order_number_locator}
    Page Should Contain Element    ${confirmation_product_name_locator}
    Page Should Contain Element    ${confirmation_product_price_locator}

Test Case 3: Verify New User Can Purchase Without Existing Credentials
    [Documentation]    Verify that a new user can purchase without existing credentials
    [Tags]    TC-121
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Input Text    ${shipping_first_name_locator}    Guest
    Input Text    ${shipping_last_name_locator}    User
    Input Text    ${shipping_address_line1_locator}    456 Guest Avenue
    Input Text    ${shipping_province_locator}    Guest Province
    Input Text    ${shipping_postal_code_locator}    67890
    Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=15s
    Page Should Contain Element    ${confirmation_order_number_locator}

Test Case 4: Verify Order Total Price Display During Checkout
    [Documentation]    Verify that order total price is displayed correctly during checkout
    [Tags]    TC-122
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    ${cart_total}=    Get Text    ${bag_subtotal_locator}
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_order_summary_total_price_locator}    timeout=10s
    ${checkout_total}=    Get Text    ${shipping_order_summary_total_price_locator}
    Should Be Equal    ${cart_total}    ${checkout_total}

Test Case 5: Verify Download Invoice After Order Completion
    [Documentation]    Verify that invoice can be downloaded after order completion
    [Tags]    TC-123
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Input Text    ${shipping_first_name_locator}    John
    Input Text    ${shipping_last_name_locator}    Doe
    Input Text    ${shipping_address_line1_locator}    123 Test Street
    Input Text    ${shipping_province_locator}    Test Province
    Input Text    ${shipping_postal_code_locator}    12345
    Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${confirmation_download_invoice_locator}    timeout=15s
    Element Should Be Enabled    ${confirmation_download_invoice_locator}

Test Case 6: Verify Continue Shopping After Order Completion
    [Documentation]    Verify that user can continue shopping after order completion
    [Tags]    TC-124
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Input Text    ${shipping_first_name_locator}    John
    Input Text    ${shipping_last_name_locator}    Doe
    Input Text    ${shipping_address_line1_locator}    123 Test Street
    Input Text    ${shipping_province_locator}    Test Province
    Input Text    ${shipping_postal_code_locator}    12345
    Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${confirmation_continue_shopping_locator}    timeout=15s
    Click Element    ${confirmation_continue_shopping_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
