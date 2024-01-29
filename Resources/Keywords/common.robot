*** Settings ***
Resource     ../Configuration/import.robot
Variables    ../Configuration/environment.yaml

*** Keywords ***
Capture screen
    [Arguments]       ${file_name}=temp
    [Documentation]    Allow Automate to manually take screenshot
    ${test_name}=    String.Split String    ${TEST_NAME}
    Capture Page Screenshot    ${ar_ENVIRONMENT}-${test_name}[0]-${file_name}.png

Teardown common keyword
    Close all Browsers
    
Setup common keyword
    [Arguments]        ${user}
    Web set test user for test case        ${user}

Web set test user for test case
    [Arguments]         ${user}
    Set Test Variable        ${TEST_USER}        ${user}

Web open browser
    [Arguments]      ${url}=${ENVIRONMENT.${ar_ENVIRONMENT}.URL}
    Create Webdriver    Chrome
    Goto    ${url}
    Maximize Browser Window
Web Close Browsers
    Close All Browsers

Web wait until element is visible
    [Arguments]     ${locator}         ${timeout}=${ENVIRONMENT.${ar_ENVIRONMENT}.ACCEPTANCE_TIMEOUT}
    Wait Until Element Is Visible        ${locator}        ${timeout}

Web wait until element is not visible
    [Arguments]     ${locator}         ${timeout}=${ENVIRONMENT.${ar_ENVIRONMENT}.ACCEPTANCE_TIMEOUT}
    Wait Until Element Is Not Visible       ${locator}        ${timeout}

Web input text
    [Arguments]     ${locator}      ${input_value}      ${is_clear}=${TRUE}
    Web Wait Until Element Is Visible     ${locator}
    Input Text      ${locator}      ${input_value}      ${is_clear}

Web click element
    [Arguments]    ${locator}
    Web wait until element is visible    ${locator}
    Click Element    ${locator}

Web click element after replace text in locator
    [Documentation]    allow modify text replacement of given locator before execute clicking
    [Arguments]    ${temp_locator}       ${search_for}    ${replace_with}
    ${locator}    Replace String     ${temp_locator}     ${search_for}      ${replace_with}
    Web click element        ${locator}
      
Web get text
    [Arguments]    ${locator}    
    Web wait until element is visible    ${locator}    
    ${text}=    Get Text    ${locator}
    RETURN    ${text}

Web get text after replace text in locator
    [Arguments]    ${temp_locator}     ${search_for}    ${replace_with}
    ${locator}    Replace String     ${temp_locator}     ${search_for}      ${replace_with}
    ${text}     Web get text    ${locator}
    RETURN    ${text}
        
Web wait until element text equal
    [Arguments]    ${locator}    ${expected}
    ${text}    Web get text    ${locator}
    Should Be Equal    ${text}    ${expected}    msg=Expect '${expected}' but get '${text}'
   
Web wait until element text equal after replace text in locator
    [Arguments]    ${temp_locator}   ${search_for}    ${replace_with}   ${expected}
    ${locator}    Replace String     ${temp_locator}     ${search_for}      ${replace_with}
    Web wait until element text equal       ${locator}     ${expected}