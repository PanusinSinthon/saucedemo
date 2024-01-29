*** Variables ***
#CHO  checkout
${CHO_title_txt}    xpath=//div[@class="header_secondary_container"]/span[@class="title"]

#CHOO  checkout your information page
${CHOO_first_name_inp}      id=first-name
${CHOO_last_name_inp}       id=last-name
${CHOO_postal_code_inp}     id=postal-code
${CHOO_cancel_btn}          xpath=//div[@class="checkout_buttons"]//button[@id="cancel"]
${CHOO_continue_btn}        xpath=//div[@class="checkout_buttons"]//input[@id="continue"]

#CHOO  checkout overview page
${CHOO_item_quantity_txt}     xpath=(//div[@class="cart_item"])[<item_number>]/div[@class="cart_quantity"]
${CHOO_item_name_txt}         xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_name"]
${CHOO_item_description_txt}  xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_desc"]
${CHOO_item_price_txt}        xpath=(//div[@class="cart_item"])[<item_number>]//div[@class="inventory_item_price"]

${CHOO_payment_info_txt}    xpath=(//div[@class="summary_info"]/div)[2]
${CHOO_shipping_info_txt}     xpath=(//div[@class="summary_info"]/div)[4]
${CHOO_item_total_txt}     xpath=//div[@class="summary_subtotal_label"]
${CHOO_tax_txt}          xpath=//div[@class="summary_tax_label"]
${CHOO_total_txt}        xpath=//div[@class="summary_info_label summary_total_label"]

${CHOO_cancel_btn}        id=cancel
${CHOO_finish_btn}        id=finish

#CHOC checkout complete
${CHOC_header_txt}    xpath=//div[@id="checkout_complete_container"]//h2[@class="complete-header"]
${CHOC_text_txt}      xpath=//div[@id="checkout_complete_container"]//div[@class="complete-text"]