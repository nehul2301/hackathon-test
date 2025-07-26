*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/bagpage.py
Variables   ../Locators/homepage.py
Variables   ../Locators/loginpage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Add One Product To Cart
    [Documentation]    Verify that products can be added to cart
    [Tags]    TC-106
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_cart_button_locator}    timeout=10s
    Click Element    ${home_add_to_cart_button_locator}
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s
    Element Text Should Be    ${bag_quantity_locator}    1

Test Case 2: Verify Remove Product From Cart
    [Documentation]    Verify that products can be removed from cart
    [Tags]    TC-105
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
    ${delete_locator}=    Replace String    ${bag_delete_product_locator}    PRODUCT_NAME    Test Product
    Click Element    ${delete_locator}
    Wait Until Page Does Not Contain Element    ${bag_quantity_locator}    timeout=10s

Test Case 3: Verify Adding To Favorite Works
    [Documentation]    Verify that adding a product to favorites works
    [Tags]    TC-154    TC-155    TC-156
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_favorite_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_favorites_locator}    timeout=10s
    Click Element    ${home_add_to_favorites_locator}
    Wait Until Element Is Visible    ${home_add_to_favorites_locator}    timeout=10s

Test Case 4: Verify Removing From Favorite Works
    [Documentation]    Verify that removing a product from favorites works
    [Tags]    TC-157    TC-158
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_favorite_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    Wait Until Page Contains Element    ${home_add_to_favorites_locator}    timeout=10s
    Click Element    ${home_add_to_favorites_locator}
    Sleep    2s
    Click Element    ${home_add_to_favorites_locator}
    Wait Until Element Is Visible    ${home_add_to_favorites_locator}    timeout=10s

Test Case 5: Verify Adding Multiple Products To Cart
    [Documentation]    Verify that multiple products can be added to cart
    [Tags]    TC-107
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    @{product_buttons}=    Get WebElements    ${home_add_to_cart_button_locator}
    FOR    ${i}    IN RANGE    3
        Click Element    ${product_buttons}[${i}]
        Sleep    1s
    END
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s

Test Case 6: Verify Increase Cart Item Quantity
    [Documentation]    Verify that the quantity of a cart item can be increased
    [Tags]    TC-108
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
    ${plus_locator}=    Replace String    ${bag_product_plus_locator}    PRODUCT_NAME    Test Product
    Click Element    ${plus_locator}
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s

Test Case 7: Verify Decrease Cart Item Quantity
    [Documentation]    Verify that the quantity of a cart item can be decreased
    [Tags]    TC-110
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
    ${plus_locator}=    Replace String    ${bag_product_plus_locator}    PRODUCT_NAME    Test Product
    Click Element    ${plus_locator}
    Sleep    1s
    ${minus_locator}=    Replace String    ${bag_product_minus_locator}    PRODUCT_NAME    Test Product
    Click Element    ${minus_locator}
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s

Test Case 8: Verify Clear Entire Cart
    [Documentation]    Verify that the entire cart can be cleared
    [Tags]    TC-111
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    @{product_buttons}=    Get WebElements    ${home_add_to_cart_button_locator}
    FOR    ${i}    IN RANGE    3
        Click Element    ${product_buttons}[${i}]
        Sleep    1s
    END
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Click Element    ${clear_cart_button_locator}
    Wait Until Page Does Not Contain Element    ${bag_quantity_locator}    timeout=10s

Test Case 9: Verify Cart Persistence After Logging In
    [Documentation]    Verify that cart items persist after logging in
    [Tags]    TC-109
    Click Element    ${home_products_link_locator}
    @{product_buttons}=    Get WebElements    ${home_add_to_cart_button_locator}
    FOR    ${i}    IN RANGE    3
        Click Element    ${product_buttons}[${i}]
        Sleep    1s
    END
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s

Test Case 10: Verify Remove Single Item From Cart
    [Documentation]    Verify that a single item can be removed from the cart
    [Tags]    TC-112
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${home_products_link_locator}
    @{product_buttons}=    Get WebElements    ${home_add_to_cart_button_locator}
    FOR    ${i}    IN RANGE    3
        Click Element    ${product_buttons}[${i}]
        Sleep    1s
    END
    Wait Until Page Contains Element    ${home_cart_icon_locator}    timeout=10s
    Click Element    ${home_cart_icon_locator}
    ${delete_locator}=    Replace String    ${bag_delete_product_locator}    PRODUCT_NAME    Test Product
    Click Element    ${delete_locator}
    Wait Until Page Contains Element    ${bag_quantity_locator}    timeout=10s
