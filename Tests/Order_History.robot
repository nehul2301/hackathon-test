*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify Complete Order History View, Details Accuracy and Status Display
    [Documentation]    Merged test case covering order history view, order details accuracy, and status display
    [Tags]    TC-113    TC-114    TC-115
    Create Browser    chrome    ${BASE_URL}
    Login With Valid Credentials
    Navigate To Order History Page
    Verify Complete Order History Display
    View Order Details    ORD-001
    Verify Order Details Accuracy    ORD-001    Test Product    1    $29.99
    Navigate To Order History Page
    Verify Order Status Display    ORD-001    Delivered
    Verify Order Status Display    ORD-002    Processing
    Close Browser

Test Case 2: Verify Order History Sorting Functionality
    [Documentation]    Verify that order history can be sorted by different criteria
    [Tags]    TC-116
    Create Browser    chrome    ${BASE_URL}
    Login With Valid Credentials
    Navigate To Order History Page
    Sort Order History By    Date
    Verify Order History Sorting    Date
    Sort Order History By    Status
    Verify Order History Sorting    Status
    Sort Order History By    Total
    Verify Order History Sorting    Total
    Close Browser

Test Case 3: Verify Empty Order History Display
    [Documentation]    Verify proper display when user has no order history
    [Tags]    TC-117
    Create Browser    chrome    ${BASE_URL}
    # Login with user who has no orders (using invalid username as placeholder for new user)
    Navigate To Page    ${BASE_URL}/login
    Input Text    id=username    newuser@example.com
    Input Text    id=password    ${VALID_PASSWORD}
    Click Button    id=login-button
    Navigate To Order History Page
    Verify Empty Order History Display
    Close Browser
