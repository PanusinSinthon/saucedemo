*** Settings ***
Resource    ../Resources/Keywords/common.robot
Resource    ../Resources/Keywords/login.robot
Resource    ../Resources/Keywords/side_menu.robot
Resource    ../Resources/Keywords/products.robot
Variables   ../Resources/TestData/user_data.yaml


*** Test Cases ***
TC_000 Open web success
    [Tags]    inactive
    Web Open Browser
    Capture screen           dodo

TC_001 User login then logout success
    [Tags]      regression
    [Setup]     Setup keyword for login
    Verify Is On Landing Login Page
    Input Username At Login Page        ${TEST_USER.username}
    Input Password At Login Page        ${TEST_USER.password}
    Click "login" Button At Login Page
    Verify Is On Products Page
    Click At Burger Icon To Expand Side Menu
    Click "logout" Button At Side Menu
    Verify Is On Landing Login Page
    [Teardown]    Teardown Common Keyword

TC_002 User login not success due to input incorrect password
    [Tags]      regression
    [Setup]     Setup keyword for login
    Verify Is On Landing Login Page
    Input Username At Login Page        ${TEST_USER.username}
    Input Password At Login Page        ${TEST_USER.incorrect_password}
    Click "login" Button At Login Page
    Verify login error when input incorrect_password
    Verify products title is not shown
    [Teardown]    Teardown Common Keyword

*** Keywords ***
Setup keyword for login
    [Arguments]       ${user}=${user_data.standard}
    Web Set Test User For Test Case      ${user} 
    Web Open Browser      
