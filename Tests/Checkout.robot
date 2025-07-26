*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/shippingpage.py
Variables   ../Locators/bagpage.py
Variables   ../Locators/confirmationpage.py
Variables   ../Locators/homepage.py
Variables   ../Locators/loginpage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    seleniumlibrary.Close Browser
Library    String

*** Test Cases ***
Test Case 1: Verify Demo User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-118
    Wait Until Page Contains Element    ${homepage_orders_section_locator}    timeout=10s
    ${homepage_add_to_cart_locator}=    Get Product Locator    ${homepage_add_to_cart_locator}    iPhone 12
    ${homepage_product_price_locator}=    Get Product Locator    ${homepage_product_price_locator}    iPhone 12
    ${homepage_product_price}=    Get Text    ${homepage_product_price_locator}
    Click Element    ${homepage_add_to_cart_locator}
    Wait Until Element Is Visible   ${bag_quantity_locator}    timeout=10s
    ${bag_product_price}=    Get Text    ${bag_product_price_locator}
    ${bag_product_name_locator}=    Get Product Locator    ${bag_product_name_locator}    iPhone 12
    Page Should Contain Element    ${bag_product_name_locator}
    Page Should Contain Element    ${bag_subtotal_locator}   
    Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_demo_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait And Input Element    ${shipping_first_name_locator}    John
    Wait And Input Element    ${shipping_last_name_locator}    Doe
    Wait And Input Element    ${shipping_address_line1_locator}    123 Test Street
    Wait And Input Element    ${shipping_province_locator}    Test Province
    Wait And Input Element    ${shipping_postal_code_locator}    12345
    Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${shipping_order_summary_total_price_locator}    timeout=10s
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=10s
    Page Should Contain Element    ${confirmation_order_number_locator}
    Page Should Contain Element    ${confirmation_product_name_locator}
    Page Should Contain Element    ${confirmation_product_price_locator}

Test Case 2: Verify locked_user User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Wait Until Page Contains Element    ${homepage_orders_section_locator}    timeout=10s
    ${homepage_add_to_cart_locator}=    Get Product Locator    ${homepage_add_to_cart_locator}    iPhone 12
    ${homepage_product_price_locator}=    Get Product Locator    ${homepage_product_price_locator}    iPhone 12
    ${homepage_product_price}=    Get Text    ${homepage_product_price_locator}
    Wait And Click Element   ${homepage_add_to_cart_locator}
    Wait Until Element Is Visible   ${bag_quantity_locator}    timeout=10s
    ${bag_product_price}=    Get Text    ${bag_product_price_locator}
    ${bag_product_name_locator}=    Get Product Locator    ${bag_product_name_locator}    iPhone 12
    Page Should Contain Element    ${bag_product_name_locator}
    Page Should Contain Element    ${bag_subtotal_locator}   
    Wait And Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_locked_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait Until Page Contains Element    ${login_locked_message_locator}    timeout=10s



Test Case 3: Verify fav_user User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Wait Until Page Contains Element    ${homepage_orders_section_locator}    timeout=10s
    ${homepage_add_to_cart_locator}=    Get Product Locator    ${homepage_add_to_cart_locator}    iPhone 12
    ${homepage_product_price_locator}=    Get Product Locator    ${homepage_product_price_locator}    iPhone 12
    ${homepage_product_price}=    Get Text    ${homepage_product_price_locator}
    Wait And Click Element   ${homepage_add_to_cart_locator}
    Wait Until Element Is Visible   ${bag_quantity_locator}    timeout=10s
    ${bag_product_price}=    Get Text    ${bag_product_price_locator}
    ${bag_product_name_locator}=    Get Product Locator    ${bag_product_name_locator}    iPhone 12
    Page Should Contain Element    ${bag_product_name_locator}
    Page Should Contain Element    ${bag_subtotal_locator}   
    Wait And Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_favorite_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait And Input Element    ${shipping_first_name_locator}    John
    Wait And Input Element    ${shipping_last_name_locator}    Doe
    Wait And Input Element    ${shipping_address_line1_locator}    123 Test Street
    Wait And Input Element    ${shipping_province_locator}    Test Province
    Wait And Input Element    ${shipping_postal_code_locator}    12345
    Wait And Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${shipping_order_summary_total_price_locator}    timeout=10s
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=10s
    Page Should Contain Element    ${confirmation_order_number_locator}
    Page Should Contain Element    ${confirmation_product_name_locator}
    Page Should Contain Element    ${confirmation_product_price_locator}

Test Case 4: Verify existing_order_user User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Wait Until Page Contains Element    ${homepage_orders_section_locator}    timeout=10s
    ${homepage_add_to_cart_locator}=    Get Product Locator    ${homepage_add_to_cart_locator}    iPhone 12
    ${homepage_product_price_locator}=    Get Product Locator    ${homepage_product_price_locator}    iPhone 12
    ${homepage_product_price}=    Get Text    ${homepage_product_price_locator}
    Wait And Click Element   ${homepage_add_to_cart_locator}
    Wait Until Element Is Visible   ${bag_quantity_locator}    timeout=10s
    ${bag_product_price}=    Get Text    ${bag_product_price_locator}
    ${bag_product_name_locator}=    Get Product Locator    ${bag_product_name_locator}    iPhone 12
    Page Should Contain Element    ${bag_product_name_locator}
    Page Should Contain Element    ${bag_subtotal_locator}   
    Wait And Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_existing_orders_user_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait And Input Element    ${shipping_first_name_locator}    John
    Wait And Input Element    ${shipping_last_name_locator}    Doe
    Wait And Input Element    ${shipping_address_line1_locator}    123 Test Street
    Wait And Input Element    ${shipping_province_locator}    Test Province
    Wait And Input Element    ${shipping_postal_code_locator}    12345
    Wait And Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${shipping_order_summary_total_price_locator}    timeout=10s
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=10s
    Page Should Contain Element    ${confirmation_order_number_locator}
    Page Should Contain Element    ${confirmation_product_name_locator}
    Page Should Contain Element    ${confirmation_product_price_locator}


Test Case 5: Verify image_not_loading_user User Needs To Input All Field Values To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Wait Until Page Contains Element    ${homepage_orders_section_locator}    timeout=10s
    ${homepage_add_to_cart_locator}=    Get Product Locator    ${homepage_add_to_cart_locator}    iPhone 12
    ${homepage_product_price_locator}=    Get Product Locator    ${homepage_product_price_locator}    iPhone 12
    ${homepage_product_price}=    Get Text    ${homepage_product_price_locator}
    Wait And Click Element   ${homepage_add_to_cart_locator}
    Wait Until Element Is Visible   ${bag_quantity_locator}    timeout=10s
    ${bag_product_price}=    Get Text    ${bag_product_price_locator}
    ${bag_product_name_locator}=    Get Product Locator    ${bag_product_name_locator}    iPhone 12
    Page Should Contain Element    ${bag_product_name_locator}
    Page Should Contain Element    ${bag_subtotal_locator}   
    Wait And Click Element    ${bag_checkout_locaotor}
    Wait Until Page Contains Element    ${shipping_first_name_locator}    timeout=10s
    Wait And Click Element    ${login_username_dropdown_locator}
    Wait And Click Element    ${login_image_not_load_locator}
    Wait And Click Element    ${login_password_dropdown_locator}
    Wait And Click Element    ${login_password_locator}
    Wait And Click Element    ${login_locator}
    Wait And Input Element    ${shipping_first_name_locator}    John
    Wait And Input Element    ${shipping_last_name_locator}    Doe
    Wait And Input Element    ${shipping_address_line1_locator}    123 Test Street
    Wait And Input Element    ${shipping_province_locator}    Test Province
    Wait And Input Element    ${shipping_postal_code_locator}    12345
    Wait And Click Element    ${shipping_submit_locator}
    Wait Until Page Contains Element    ${shipping_order_summary_total_price_locator}    timeout=10s
    Wait Until Page Contains Element    ${confirmation_message_locator}    timeout=10s
    Page Should Contain Element    ${confirmation_order_number_locator}
    Page Should Contain Element    ${confirmation_product_name_locator}
    Page Should Contain Element    ${confirmation_product_price_locator}

