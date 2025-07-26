*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify User Needs To Input All Field Value To Place An Order
    [Documentation]    Verify that user needs to input all field values to place an order
    [Tags]    TC-119
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Click Button    id=place-order
    Page Should Contain    Please fill all required fields

Test Case 2: Verify User Can Place An Order Successfully
    [Documentation]    Verify that user can place an order successfully
    [Tags]    TC-118    TC-120
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Input Text    id=shipping-address    123 Test St
    Input Text    id=billing-address    123 Test St
    Click Button    id=place-order
    Page Should Contain    Order placed successfully
    Valiudate Order Details

Test Case 3: Verify New User Can Purchase Without Existing Credentials
    [Documentation]    Verify that a new user can purchase without existing credentials
    [Tags]    TC-121
    Navigate To Products Page
    Add Product To Cart
    Navigate To Checkout Page
    Input Text    id=shipping-address    123 Test St
    Input Text    id=billing-address    123 Test St
    Click Button    id=place-order
    Page Should Contain    Order placed successfully without login
