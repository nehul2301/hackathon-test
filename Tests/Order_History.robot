*** Settings ***
Resource    ../Resources/KeywordsFile.robot
Variables   ../Locators/loginpage.py
Variables   ../Locators/homepage.py
Variables   ../Locators/confirmationpage.py
Test Setup    Open Browser    https://testathon.live    chrome
Test Teardown    Close Browser

*** Test Cases ***
Test Case 1: Verify Complete Order History View, Details Accuracy and Status Display
    [Documentation]    Merged test case covering order history view, order details accuracy, and status display
    [Tags]    TC-113    TC-114    TC-115
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_existing_orders_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${order_history_link_locator}
    Wait Until Page Contains Element    ${order_details_link_locator}    timeout=10s
    Page Should Contain Element    ${order_status_locator}
    Click Element    ${order_details_link_locator}
    Wait Until Page Contains Element    ${confirmation_product_name_locator}    timeout=10s
    Page Should Contain Element    ${confirmation_product_price_locator}
    Page Should Contain Element    ${confirmation_order_number_locator}

Test Case 2: Verify Order History Sorting Functionality
    [Documentation]    Verify that order history can be sorted by different criteria
    [Tags]    TC-116
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_existing_orders_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${order_history_link_locator}
    Wait Until Page Contains Element    ${order_sort_by_date_locator}    timeout=10s
    Click Element    ${order_sort_by_date_locator}
    Sleep    2s
    Click Element    ${order_sort_by_status_locator}
    Sleep    2s
    Click Element    ${order_sort_by_total_locator}
    Sleep    2s
    Page Should Contain Element    ${order_status_locator}

Test Case 3: Verify Empty Order History Display
    [Documentation]    Verify proper display when user has no order history
    [Tags]    TC-117
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_demo_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${order_history_link_locator}
    Wait Until Page Contains    You have no orders yet    timeout=10s
    Page Should Not Contain Element    ${order_details_link_locator}

Test Case 4: Verify Order Status Updates
    [Documentation]    Verify that order status updates are reflected correctly
    [Tags]    TC-118
    Click Element    ${login_username_dropdown_locator}
    Click Element    ${login_existing_orders_user_locator}
    Click Element    ${login_password_dropdown_locator}
    Click Element    ${login_password_locator}
    Click Element    ${login_locator}
    Wait Until Page Contains Element    ${home_products_link_locator}    timeout=10s
    Click Element    ${order_history_link_locator}
    Wait Until Page Contains Element    ${order_status_locator}    timeout=10s
    @{status_elements}=    Get WebElements    ${order_status_locator}
    FOR    ${status}    IN    @{status_elements}
        ${status_text}=    Get Text    ${status}
        Should Match Regexp    ${status_text}    (Delivered|Processing|Shipped|Pending)
    END
