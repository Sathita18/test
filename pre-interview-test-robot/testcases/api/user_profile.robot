*** Settings ***
Resource          ../../resources/imports.robot

*** Test Cases ***

# ================================================================================================================================================================================================================================================
#  SUCCESS
# ================================================================================================================================================================================================================================================ 

S_001_Verify_User_Profile
    [Documentation]    Verify http status and response body after send request
    [Tags]    success

    #Step 1 : Call API User Profile
    ${response}    ${http_response}=    Call API User Profile    ${c_uri_user_profile}

    #Step 2 : Prepare data
    ${id}=                      Set Variable    ${response['data']['id']}
    ${email}=                   Set Variable    ${response['data']['email']}
    ${first_name}=              Set Variable    ${response['data']['first_name']}
    ${last_name}=               Set Variable    ${response['data']['last_name']}
    ${avatar}=                  Set Variable    ${response['data']['avatar']}
    ${expected_status_code}=    Set Variable    200
    ${expected_id}=             Set Variable    ${c_id}
    ${expected_email}=          Set Variable    ${c_email}
    ${expected_first_name}=     Set Variable    ${c_first_name}
    ${expected_last_name}=      Set Variable    ${c_last_name}
    ${expected_avatar}=         Set Variable    ${c_avatar}

    #Step 3 : Verify HTTP Status and Body Response
    Verify Response Data User Profile Success    ${response}    ${http_response}    ${expected_status_code}    ${expected_id}    ${expected_email}    ${expected_first_name}    ${expected_last_name}    ${expected_avatar}

# ================================================================================================================================================================================================================================================
#  UNSUCCESS
# ================================================================================================================================================================================================================================================ 

U_001_Verify_User_Profile_Not_Found
    [Documentation]    Verify http status and response body not found
    [Tags]    unsuccess

    #Step 1 : Call API User Profile
    ${response}    ${http_response}=    Call API User Profile    ${c_uri_user_profile_not_found}

    #Step 2 : Prepare data
    ${expected_status_code}=    Set Variable    404

    #Step 3 : Verify HTTP Status and Body Response
    Verify Response Data Not Found    ${http_response}    ${response}    ${expected_status_code}