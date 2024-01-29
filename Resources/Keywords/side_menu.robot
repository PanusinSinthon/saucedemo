*** Settings ***
Resource    ../Locators/side_menu.robot
Resource    common.robot
*** Keywords ***
Click at burger icon to expand side menu
    Web Click Element          ${SMN_burger_ele}

Click "logout" button at side menu
    Web Click Element        ${SMN_logout_ele}
