*** Settings ***
Resource    ../Resources/Keywords/common.robot
Resource    ../Resources/Keywords/login.robot
Resource    ../Resources/Keywords/products.robot
Resource    ../Resources/Keywords/cart.robot
Variables   ../Resources/TestData/user_data.yaml

*** Test Cases ***
TC_101 User add multiple items to cart from products page and item detail page
    [Tags]     regression        testdodo
    [Setup]      Setup keyword cart 
    ${item1}    Get Item Info Of A Selecting Item On Products Page        1
    Click "add to cart" button of selecting item on products page        1
    Verify cart badge's number is shown         1
    
    Click At Item's Name To Go To Item Detail Page       3
    ${item2}    Get item info of a selecting item on item detail page
    Click "add To Cart" Button On Item Detail Page    
    Verify cart badge's number is shown         2

    Click "back To Products" Button On Item Detail Page

    Click At Item's Image To Go To Item Detail Page           4
    ${item3}    Get item info of a selecting item on item detail page
    Click "add To Cart" Button On Item Detail Page
    Verify cart badge's number is shown         3

    Click At "cart" Icon To Go To Cart Page

    Verify Is On Cart Page
    Verify An Item Info Of Given List At Cart Page        1         ${item1}
    Verify An Item Info Of Given List At Cart Page        2         ${item2}
    Verify An Item Info Of Given List At Cart Page        3         ${item3}
    [Teardown]    Teardown Common Keyword

TC_102 User add items and them remove from products page and item detail page and cart page
    [Tags]     regression        testdodo
    [Setup]      Setup keyword cart
    Click "add to cart" button of selecting item on products page        1
    Verify Cart Badge's Number Is Shown            1
    Click "remove" Button Of Selecting Item On Products Page       1
    Verify Cart Badge Is Not Shown
    
    Click At Item's Name To Go To Item Detail Page     2
    Click "add To Cart" Button On Item Detail Page  
    Verify Cart Badge's Number Is Shown            1
    Click "remove" Button On Item Detail Page    
    Verify cart badge is not shown
    
    Click "back To Products" Button On Item Detail Page 
       
    Click At Item's Name To Go To Item Detail Page     2
    Click "add To Cart" Button On Item Detail Page 
    Verify Cart Badge's Number Is Shown            1
    Click At "cart" Icon To Go To Cart Page    
    Click "remove" button of selecting item on cart page        1
    Verify Cart Is Empty At Cart Page
    Verify Cart Badge Is Not Shown
    [Teardown]    Teardown Common Keyword

*** Keywords ***
Setup keyword cart
    [Arguments]       ${user}=${user_data.standard}
    Web Set Test User For Test Case      ${user} 
    Web Open Browser
    Input Username At Login Page        ${TEST_USER.username}
    Input Password At Login Page        ${TEST_USER.password}
    Click "login" Button At Login Page
    Verify Is On Products Page


