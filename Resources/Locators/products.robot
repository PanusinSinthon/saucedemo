*** Variables ***
#PRD  products page
${PRD_title_txt}       xpath=//div[@class="header_secondary_container"]//span[@class="title"]
      #ex. xpath=(//div[@class="inventory_item"])[1]///div[@class="inventory_item_img"] = first item on web, No index = 0
${PRD_item_ele}              xpath=(//div[@class="inventory_item"])[<item_number>]
${PRD_item_image_img}        xpath=(//div[@class="inventory_item"])[<item_number>]//div[@class="inventory_item_img"]
${PRD_item_name_txt}         xpath=(//div[@class="inventory_item"])[<item_number>]//div[@class="inventory_item_name "]
${PRD_item_description_txt}  xpath=(//div[@class="inventory_item"])[<item_number>]//div[@class="inventory_item_desc"]
${PRD_item_price_txt}        xpath=(//div[@class="inventory_item"])[<item_number>]//div[@class="inventory_item_price"]
${PRD_item_add_to_cart_btn}  xpath=(//div[@class="inventory_item"])[<item_number>]//button[contains(@id,"add-to-cart")]
${PRD_item_remove_btn}       xpath=(//div[@class="inventory_item"])[<item_number>]//button[contains(@id,"remove")]

#PITD  products then item detail page
${PITD_back_to_products_btn}     id=back-to-products
${PITD_item_name_txt}            xpath=//div[@class="inventory_details_name large_size"]
${PITD_item_description_txt}     xpath=//div[@class="inventory_details_desc large_size"]
${PITD_item_price_txt}           xpath=//div[@class="inventory_details_price"]
${PITD_item_add_to_cart_btn}     xpath=//div[@class="inventory_details_desc_container"]//button[contains(@id,"add-to-cart")]
${PITD_item_remove_btn}          xpath=//div[@class="inventory_details_desc_container"]//button[contains(@id,"remove")]