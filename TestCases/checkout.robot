*** Settings ***
Resource    ../Resources/Keywords/common.robot
Resource    ../Resources/Keywords/login.robot
Resource    ../Resources/Keywords/products.robot
Resource    ../Resources/Keywords/cart.robot
Resource    ../Resources/Keywords/checkout.robot

Variables   ../Resources/TestData/user_data.yaml
Variables   ../Resources/TestData/test_config.yaml

*** Variables ***
${item_total}            $0.00

*** Test Cases ***
TC_201 User complete order multiple items successfully
    [Tags]        regression      testdodo
    [Setup]    Setup keyword for checkout
    Verify Is On Checkout: Your Information Page    
    Input First Name At Checkout: Your Information Page     ${TEST_USER.personal_info.first_name}
    Input Last Name At Checkout: Your Information Page      ${TEST_USER.personal_info.last_name} 
    Input Postal Code At Checkout: Your Information Page    ${TEST_USER.personal_info.postal_code.correct}
    Click "Continue" Button At Checkout: Your Information Page

    Verify is on checkout: overview page
    Verify an item info of given list at checkout: overview page        1        ${item1}
    Verify an item info of given list at checkout: overview page        2        ${item2}
    Verify an item info of given list at checkout: overview page        3        ${item3}
    
    Verify User Payment Information At Checkout: Overview Page        ${TEST_USER.payment.sauce_card}    
    Verify User Shipping Information At Checkout: Overview Page       ${test_config.shipping_option.pony_express.name}
    Verify Checkout Item Total At Checkout: Overview Page             ${item_total}    
    Verify Checkout Tax Value At Checkout: Overview Page              ${tax_value} 
    Verify Total Price That Included Tax At Checkout: Overview Page        ${total_price}
    Click "finish" Button At Checkout: Overview Page

    Verify is on checkout: complete page
    Verify Header At Checkout: Complete Page
    Verify Text At Checkout: Complete Page

    [Teardown]    Teardown Common Keyword

*** Keywords ***
Setup keyword for checkout 
    [Arguments]       ${user}=${user_data.standard}
    Web Set Test User For Test Case      ${user} 
    Web Open Browser
    Input Username At Login Page        ${TEST_USER.username}
    Input Password At Login Page        ${TEST_USER.password}
    Click "login" Button At Login Page
    Verify Is On Products Page

    Add multiple items to cart
    
		Sum item price to item_total     ${item1}[2]
    Sum item price to item_total     ${item2}[2]
    Sum item price to item_total     ${item3}[2]
    
    Calculate Tax Percentage and Total that include tax

    Click At "cart" Icon To Go To Cart Page    
    Click "Checkout" Button To Go To Shipping Information    


Add multiple items to cart
    ${item1}    Get Item Info Of A Selecting Item On Products Page       1
    Click "add to cart" button of selecting item on products page        1
    Set Test Variable        ${item1}

    ${item2}    Get Item Info Of A Selecting Item On Products Page       2
    Click "add to cart" button of selecting item on products page        2
    Set Test Variable        ${item2}

    ${item3}    Get Item Info Of A Selecting Item On Products Page       3
    Click "add to cart" button of selecting item on products page        3
    Set Test Variable        ${item3}
        
Sum item price to item_total
    [Documentation]        given price will be inform of $xx.xx, so we need to split the '$' then
    ...     compute the summation
    [Arguments]           ${item_price}
    ${item_total}       Evaluate      ${item_total[1:]}+${item_price[1:]}
    Set Test Variable      ${item_total}       $${item_total}

Calculate Tax Percentage and Total that include tax
    ${numeric_total_price}    Set Variable    ${item_total[1:]}
    ${tax_value}       Evaluate    round(float(${numeric_total_price}) * ${test_config.tax_percentage}, 2)
    Set Test Variable      ${tax_value}       $${tax_value}
    ${total}        Evaluate            ${item_total[1:]}+${tax_value[1:]}
    Set Test Variable        ${total_price}         $${total} 