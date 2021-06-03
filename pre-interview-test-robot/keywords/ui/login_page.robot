*** Keywords ***

# =============================== Template ===============================
Template Validate Login Page Success
    [Documentation]     Template Validate Login Page Success
    [Arguments]    ${input_username}    ${input_password}    ${expected_logged}    ${expected_logged_out}
    [Teardown]    Close All Browsers

    #Step 1 : Open web browser and check current url
    ${url}=                 Set Variable    ${c_host_url}/login
    ${browser}=             Set Variable    ff
    ${page_name}=           Set Variable    login.png
    ${expected_url}=        Set Variable    ${url}
    Open Web Browser    ${url}    ${browser}    ${page_name}
    Check Current Url    ${expected_url}

    #Step 2 : Input username and password and click login button for login
    ${locator_username}=    Set Variable    ${c_txt_username}
    ${locator_password}=    Set Variable    ${c_txt_password}
    Input Web Text    ${locator_username}    ${input_username}    ${c_timeout}
    Input Web Text    ${locator_password}    ${input_password}    ${c_timeout}
    Click Web Element    ${c_btn_login}

    #Step 3 : Check current url & message appear and click logout button for logout
    ${url}=                 Set Variable    ${c_host_url}/secure
    ${expected_url}=        Set Variable    ${url}
    ${locator}=             Set Variable    ${c_txt_logged}
    ${text}=                Set Variable    ${expected_logged}
    Go To    ${url}
    Check Current Url    ${expected_url}
    Verify Text    ${locator}    ${text}
    Click Web Element    ${c_btn_logout}

    #Step 4 : Check message appear
    ${locator}=             Set Variable    ${c_txt_logged}
    ${text}=                Set Variable    ${expected_logged_out}
    Verify Text    ${locator}    ${text}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Template Validate Login Page Unsuccess
    [Documentation]     Template Validate Login Page Unsuccess
    [Arguments]    ${input_username}    ${input_password}    ${text_expected}
    [Teardown]    Close All Browsers

    #Step 1 : Open web browser and check current url
    ${url}=                 Set Variable    ${c_host_url}/login
    ${browser}=             Set Variable    ff
    ${page_name}=           Set Variable    login.png
    ${expected_url}=        Set Variable    ${url}
    Open Web Browser    ${url}    ${browser}    ${page_name}
    Check Current Url    ${expected_url}

    #Step 2 : Input username and password and click login button for login
    ${locator_username}=    Set Variable    ${c_txt_username}
    ${locator_password}=    Set Variable    ${c_txt_password}
    Input Web Text    ${locator_username}    ${input_username}    ${c_timeout}
    Input Web Text    ${locator_password}    ${input_password}    ${c_timeout}
    Click Web Element    ${c_btn_login}

    #Step 3 : Check error message appear
    ${locator}=             Set Variable    ${c_txt_logged}
    Verify Text    ${locator}    ${text_expected}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Open Web Browser
    [Documentation]    Open Web Browser
    [Arguments]    ${url}    ${browser}    ${page_name}
    
    Run Keyword If    '${browser}' == 'ff'    SeleniumLibrary.Open Browser    ${url}    ${browser}
    ...    ELSE IF    '${browser}' == 'ie'    SeleniumLibrary.Open Browser    ${url}    ${browser}
    ...    ELSE IF    '${browser}' == 'gc'    SeleniumLibrary.Open Browser    ${url}    ${browser}

    ${set_window_size}    BuiltIn.Get Variable Value    ${set_window_size}    FALSE
    ${set_window_size}    Convert To Uppercase    ${set_window_size}

    BuiltIn.Run Keyword If    '${set_window_size}' == 'TRUE'    SeleniumLibrary.Set Window Size    ${window_width}    ${window_height}
    ...    ELSE    SeleniumLibrary.Maximize Browser Window
    
    SeleniumLibrary.Capture Page Screenshot    ${page_name}     #verify_otp_ui.png

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Check Current Url
    [Documentation]    Check Current Url On Browser
    [Arguments]    ${expected_url}

    ${url}=    Get Location
    Location Should Contain    ${expected_url}
    Should Be Equal    ${url}    ${expected_url}
    
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Input Web Text
    [Documentation]    Input text into text field identified by locator
    [Arguments]    ${locator}    ${text}    ${timeout}

    ${result}=    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Wait Web Until Page Contains Element    ${locator}    ${timeout}
    Wait Until Keyword Succeeds    5x    1s    SeleniumLibrary.Input Text    ${locator}    ${text}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Click Web Element
    [Documentation]    Click element identified by locator
    [Arguments]    ${locator}

    ${result}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Click Element    ${locator}
    BuiltIn.Run Keyword If    ${result}==${false}    SeleniumLibrary.Click Element    ${locator}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Verify Text
    [Arguments]    ${locator}    ${text}
    [Documentation]    Keyword will Get Text if text not found keyword will try to get value compare with expect

    Web Element Should Be Visible    ${locator}    ${c_timeout}
    ${text_actual}    Wait Until Keyword Succeeds    5    1    SeleniumLibrary.Get Text    ${locator}
    ${temp}    Remove String    ${text_actual}    ${space}
    ${temp}    Get Length    ${temp}
    ${text_actual}    Run Keyword If    '${temp}' == '0'    SeleniumLibrary.Get Value    ${locator}
    ...    ELSE    Set Variable    ${text_actual}
    ${text_actual}    Remove String    ${text_actual}    \n    ×    #use for remove \n and x
    Should Be Equal    ${text_actual}    ${text}
    log    ${text_actual} == ${text}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Web Element Should Be Visible
    [Documentation]    Verify that the element is visible
    [Arguments]    ${locator}    ${c_timeout}

    Element Should Be Visible    ${locator}    ${c_timeout}
    ${result}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${c_timeout}
    BuiltIn.Run Keyword If    ${result}==${False}    SeleniumLibrary.Execute Javascript    scrollBy(0,-500);
    SeleniumLibrary.Element Should Be Visible    ${locator}