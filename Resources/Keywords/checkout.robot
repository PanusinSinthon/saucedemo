*** Settings ***
Resource    ../Locators/checkout.robot
Variables   ../Localizes/checkout.yaml
Resource    common.robot

*** Keywords ***
#checkput: your information
Verify is on checkout: your information page
    [Arguments]      ${expected}=${checkout_page.your_information.title}      ${locator}=${CHO_title_txt}     
    Web Wait Until Element Text Equal       ${locator}          ${expected}

Input first name at checkout: your information page
    [Arguments]    ${input}    ${locator}=${CHOO_first_name_inp} 
    Web Input Text        ${locator}        ${input}

Input last name at checkout: your information page
    [Arguments]    ${input}    ${locator}=${CHOO_last_name_inp}
    Web Input Text        ${locator}        ${input}

Input postal code at checkout: your information page
    [Arguments]    ${input}    ${locator}=${CHOO_postal_code_inp}
    Web Input Text        ${locator}        ${input}

Click "Continue" button at checkout: your information page
    [Arguments]    ${locator}=${CHOO_continue_btn}  
    Web Click Element       ${locator}

#checkput: overview
Verify is on checkout: overview page
    [Arguments]      ${expected}=${checkout_page.overview.title}      ${locator}=${CHO_title_txt}
    Web Wait Until Element Text Equal       ${locator}          ${expected}

_Is item locator of given number equal
    [Tags]        robot:private
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}
    Web Wait Until Element Text Equal After Replace Text In Locator      ${temp_locator}     <item_number>     ${at_item_number}     ${expected}

Verify item name of given number should equal at checkout: overview page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_name_txt}
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item quantity of given number should equal at checkout: overview page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_quantity_txt}
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item description of given number should equal at checkout: overview page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_description_txt}
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify item price of given number should equal at checkout: overview page
    [Arguments]        ${at_item_number}      ${expected}      ${temp_locator}=${CARD_item_price_txt}
    _Is item locator of given number equal        ${at_item_number}      ${expected}      ${temp_locator}

Verify an item info of given list at checkout: overview page
    [Arguments]         ${at_item_number}        ${expected_list}
    Verify item name of given number should equal at checkout: overview page           ${at_item_number}       ${expected_list}[0]
    Verify item description of given number should equal at checkout: overview page    ${at_item_number}       ${expected_list}[1]
    Verify item price of given number should equal at checkout: overview page          ${at_item_number}       ${expected_list}[2]
    Verify item quantity of given number should equal at checkout: overview page       ${at_item_number}       ${expected_list}[3]

Verify user payment information at checkout: overview page
    [Arguments]    ${expected}    ${location}=${CHOO_payment_info_txt}
    Web Wait Until Element Text Equal      ${location}        ${expected}
    
Verify user shipping information at checkout: overview page
    [Arguments]    ${expected}    ${location}=${CHOO_shipping_info_txt}
    Web Wait Until Element Text Equal      ${location}        ${expected}  
    
Verify checkout item total at checkout: overview page
    [Arguments]    ${expected}    ${location}=${CHOO_item_total_txt}
    Web Wait Until Element Text Equal      ${location}        ${checkout_page.overview.summary.sub_total}${expected}
    
Verify checkout tax value at checkout: overview page
    [Arguments]    ${expected}    ${location}=${CHOO_tax_txt}
    Web Wait Until Element Text Equal      ${location}        ${checkout_page.overview.summary.tax}${expected}
    
Verify total price that included tax at checkout: overview page
    [Arguments]    ${expected}    ${location}=${CHOO_total_txt}
    Web Wait Until Element Text Equal      ${location}        ${checkout_page.overview.summary.total}${expected}

Click "finish" button at checkout: overview page
    [Arguments]        ${location}=${CHOO_finish_btn} 
    Web Click Element      ${location}

#checkput: complete
Verify is on checkout: complete page
    [Arguments]      ${expected}=${checkout_page.complete.title}      ${locator}=${CHO_title_txt}
    Web Wait Until Element Text Equal       ${locator}          ${expected}

Verify header at checkout: complete page
    [Arguments]      ${expected}=${checkout_page.complete.header}      ${locator}=${CHOC_header_txt}
    Web Wait Until Element Text Equal       ${locator}          ${expected}

Verify text at checkout: complete page
    [Arguments]      ${expected}=${checkout_page.complete.text}      ${locator}=${CHOC_text_txt}
    Web Wait Until Element Text Equal       ${locator}          ${expected}