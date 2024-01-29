*** Settings ***
Resource    ../Locators/cart.robot
Variables   ../Localizes/cart.yaml
Resource    common.robot

*** Keywords ***

Verify cart badge's number is shown 
    [Arguments]        ${expected}        ${locator}=${CAR_shipping_cart_badge_txt}
    Web Wait Until Element Text Equal       ${locator}         ${expected}

Verify cart badge is not shown
    [Arguments]         ${locator}=${CAR_shipping_cart_badge_txt}
    Web wait until element is not visible        ${CAR_shipping_cart_badge_txt}

Click at "cart" icon to go to cart page
    [Arguments]    ${locator}=${CAR_shipping_cart_icon} 
    Web Click Element       ${locator}

#cart page
Verify is on cart page
    [Arguments]        ${cart_title}=${cart_page.title}     ${locator}=${CAR_title_txt} 
    Web Wait Until Element Text Equal        ${locator}       expected=${cart_title}

Verify cart is empty at cart page
    [Arguments]        ${temp_locator}=${CARD_item_ele}
    ${locator}    Replace String     ${temp_locator}     <item_number>      1    
    Web wait until element is not visible           ${locator}
    
_Is item locator of given number equal
    [Tags]        robot:private
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator} 
    Web Wait Until Element Text Equal After Replace Text In Locator      ${temp_locator}     <item_number>     ${at_item_number}     ${expected}  

Verify item name of given number should equal at cart page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_name_txt}       
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item quantity of given number should equal at cart page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_quantity_txt}       
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item description of given number should equal at cart page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_description_txt}      
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item price of given number should equal at cart page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_price_txt}       
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}
                      
Verify an item info of given list at cart page
    [Arguments]         ${at_item_number}        ${expected_list}
    Verify item name of given number should equal at cart page           ${at_item_number}       ${expected_list}[0]
    Verify item description of given number should equal at cart page    ${at_item_number}       ${expected_list}[1]
    Verify item price of given number should equal at cart page          ${at_item_number}       ${expected_list}[2]
    Verify item quantity of given number should equal at cart page       ${at_item_number}       ${expected_list}[3]

Click "remove" button of selecting item on cart page
    [Arguments]        ${at_item_number}        ${temp_locator}=${CARD_item_remove_btn}
    Web click element after replace text in locator      ${temp_locator}       <item_number>       ${at_item_number}

Click "Checkout" button to go to shipping information
    [Arguments]     ${locator}=${CARD_checkout_btn}
    Web Click Element          ${locator}