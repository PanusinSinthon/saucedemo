*** Settings ***
Resource    ../Locators/products.robot
Variables    ../localizes/products.yaml
Resource    common.robot
*** Keywords ***
## products
Verify is on products page
    Web Wait Until Element Text Equal       ${PRD_title_txt}     ${products_page.title}

Verify products title is not shown 
    Web Wait Until Element Is Not Visible        ${PRD_title_txt}

Get item name of selecting item on products page
    [Arguments]        ${at_item_number}        ${temp_locator}
    ${text}    Web Get Text After Replace Text In Locator        ${temp_locator}     <item_number>     ${at_item_number}  
    RETURN        ${text}
    
Get item info of a selecting item on products page
    [Arguments]        ${at_item_number}          ${sample_quantity}=1
    ${name}     Get item name of selecting item on products page         ${at_item_number}         ${PRD_item_name_txt}
    ${desc}     Get item name of selecting item on products page         ${at_item_number}         ${PRD_item_description_txt}
    ${price}    Get item name of selecting item on products page         ${at_item_number}         ${PRD_item_price_txt}
    ${item_list}     Create List     ${name}    ${desc}   ${price}    ${sample_quantity}
    RETURN        ${item_list}

Click at item's name to go to item detail page
    [Documentation]    specific selected items by 'at_item_number',  number 1 mean the first item and so on ...
    [Arguments]        ${at_item_number}        ${temp_locator}=${PRD_item_name_txt}
    Web click element after replace text in locator      ${temp_locator}       <item_number>       ${at_item_number}

Click at item's image to go to item detail page
    [Documentation]    specific selected items by 'at_item_number',  number 1 mean the first item and so on ...
    [Arguments]        ${at_item_number}        ${temp_locator}=${PRD_item_image_img}
    Web click element after replace text in locator      ${temp_locator}       <item_number>       ${at_item_number}

Click "add to cart" button of selecting item on products page
    [Arguments]        ${at_item_number}        ${temp_locator}=${PRD_item_add_to_cart_btn}
    Web click element after replace text in locator      ${temp_locator}       <item_number>       ${at_item_number}

Click "remove" button of selecting item on products page
    [Arguments]        ${at_item_number}        ${temp_locator}=${PRD_item_remove_btn} 
    Web click element after replace text in locator      ${temp_locator}       <item_number>       ${at_item_number}

#item detail
Get item name of selecting item on item detail page
    [Arguments]           ${locator}
    ${text}    Web Get Text          ${locator}     
    RETURN        ${text}
    
Get item info of a selecting item on item detail page
    [Arguments]            ${sample_quantity}=1
    ${name}     Get item name of selecting item on item detail page        ${PITD_item_name_txt}
    ${desc}     Get item name of selecting item on item detail page        ${PITD_item_description_txt}
    ${price}    Get item name of selecting item on item detail page        ${PITD_item_price_txt}
    ${item_list}     Create List     ${name}    ${desc}   ${price}   ${sample_quantity}
    RETURN        ${item_list}

Click "back to products" button on item detail page
    [Arguments]         ${locator}=${PITD_back_to_products_btn} 
    Web Click Element          ${locator}
      
Click "add to cart" button on item detail page
    [Arguments]         ${locator}=${PITD_item_add_to_cart_btn}
    Web Click Element          ${locator}
    
Click "remove" button on item detail page   
    [Arguments]         ${locator}=${PITD_item_remove_btn}
    Web Click Element          ${locator} 