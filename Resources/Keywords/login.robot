*** Settings ***
Resource    ../Locators/login.robot
Variables   ../Localizes/error.yaml
Resource    common.robot

*** Keywords ***

Input username at login page
    [Arguments]     ${user}        ${locator}=${LAD_username_inp} 
    Web Input Text        ${locator}        ${user}

Input password at login page
    [Arguments]     ${user}         ${locator}=${LAD_password_inp}
    Web Input Text        ${locator}        ${user}

Click "login" button at login page
    [Arguments]    ${locator}=${LAD_login_btn}
    Web Click Element         ${locator}

Verify is on landing login page
    Web Wait Until Element Is Visible         ${LAD_login_btn}
    
_Is login error is displayed
    [Tags]        robot:private
    [Arguments]         ${error_msg}        ${locator}=${LAD_login_error_txt} 
    Web Wait Until Element Text Equal       ${locator}      ${error_msg}

Verify login error when input incorrect_password
    _Is login error is displayed        ${error.login.incorrect_password}

Verify login error when input empty_username
    _Is login error is displayed        ${error.login.empty_username}