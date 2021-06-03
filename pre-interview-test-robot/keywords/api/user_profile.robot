*** Keywords ***

Call API User Profile
    [Documentation]    Call API User Profile
    [Arguments]    ${uri_user_profile}    ${return_response}=${False}

    ${response}=    Get Request API    alias=api-user-profile
    ...                                url=${c_host_url_1}
    ...                                uri=${uri_user_profile}
    ...                                headers=${none}
    ...                                params=${none}
    ...                                data=${none}
    
    ${http_response}=    Set Variable    ${response.status_code}
    ${json}    to json    ${response.content}
    ${response}=    Set Variable    ${json}

    [Return]    ${response}    ${http_response}