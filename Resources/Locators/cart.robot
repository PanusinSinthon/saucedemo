*** Variables ***
#CAR = cart page
${CAR_shipping_cart_icon}         xpath=//div[@id="shopping_cart_container"]//a[@class="shopping_cart_link"]
${CAR_shipping_cart_badge_txt}    xpath=//div[@id="shopping_cart_container"]//span[@class="shopping_cart_badge"]

${CAR_title_txt}    xpath=//div[@class="header_secondary_container"]/span[@class="title"]

#CARD  cart and description of selected item(s)
${CARD_item_ele}        xpath=(//div[@class="cart_item"])[<item_number>]
${CARD_item_quantity_txt}    xpath=(//div[@class="cart_item"])[<item_number>]/div[@class="cart_quantity"]
${CARD_item_name_txt}        xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_name"]
${CARD_item_description_txt}        xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_desc"]
${CARD_item_price_txt}        xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_price"]
${CARD_item_remove_btn}       xpath=(//div[@class="cart_item"])[<item_number>]//button[contains(@id,"remove")]

${CARD_continue_shopping_btn}    xpath=//div[@class="cart_footer"]//button[@id="continue-shopping"]
${CARD_checkout_btn}             xpath=//div[@class="cart_footer"]//button[@id="checkout"]