*** Settings ***
Resource    ../Resources/KeywordsFile.robot

*** Test Cases ***
Test Case 1: Verify Add One Product To Cart
    [Documentation]    Verify that products can be added to cart
    [Tags]    TC-106
    Navigate To Products Page
    Add Product To Cart
    Verify Cart Item Count    1

Test Case 2: Verify Remove Product From Cart
    [Documentation]    Verify that products can be removed from cart
    [Tags]    TC-
    Navigate To Products Page
    Add Product To Cart
    Remove Product From Cart
    Verify Cart Item Count    0

Test Case 3: Verify Adding To Favorite Works
    [Documentation]    Verify that adding a product to favorites works
    [Tags]    TC-154    TC-155    TC-156
    Navigate To Products Page
    Add Product To Favorites
    Verify Favorites Count    1

Test Case 4: Verify Removing From Favorite Works
    [Documentation]    Verify that removing a product from favorites works
    [Tags]    TC-157    TC-158
    Navigate To Products Page
    Add Product To Favorites
    Remove Product From Favorites
    Verify Favorites Count    0

Test Case 5: Verify Adding Multiple Products To Cart
    [Documentation]    Verify that multiple products can be added to cart
    [Tags]    TC-107
    Navigate To Products Page
    Add Multiple Products To Cart
    Verify Cart Item Count    3

Test Case 6: Verify Increase Cart Item Quantity
    [Documentation]    Verify that the quantity of a cart item can be increased
    [Tags]    TC-108
    Navigate To Products Page
    Add Product To Cart
    Increase Cart Item Quantity
    Verify Cart Item Count    2

Test Case 8 : Verify Decrease Cart Item Quantity
    [Documentation]    Verify that the quantity of a cart item can be decreased
    [Tags]    TC-110
    Navigate To Products Page
    Add Product To Cart
    Increase Cart Item Quantity
    Decrease Cart Item Quantity
    Verify Cart Item Count    1

Test Case 9 : Verify Clear Entire Cart
    [Documentation]    Verify that the entire cart can be cleared
    [Tags]    TC-111
    Navigate To Products Page
    Add Multiple Products To Cart
    Clear Entire Cart
    Verify Cart Item Count    0

Test Case 10: Verify Cart Persistence After Logging In
    [Documentation]    Verify that cart items persist after logging in
    [Tags]    TC-109
    Navigate To Products Page
    Add Multiple Products To Cart
    Login With Valid Credentials
    Verify Cart Item Count    3

Test Case 11: Verify Remove Single Item From Cart
    [Documentation]    Verify that a single item can be removed from the cart
    [Tags]    TC-110
    Navigate To Products Page
    Add Multiple Products To Cart
    Remove Single Item From Cart
    Verify Cart Item Count    2

Test Case 12: Verify Quantity Update In Cart To Zero
    [Documentation]    Verify that updating the quantity of an item to zero removes it from the cart
    [Tags]    TC-112
    Navigate To Products Page
    Add Product To Cart
    Update Cart Item Quantity To Zero
    Verify Cart Item Count    0
