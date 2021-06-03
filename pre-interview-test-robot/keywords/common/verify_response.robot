*** Keywords ***

Verify Response Data User Profile Success
    [Documentation]   Verify Response Data User Profile Success
    [Arguments]    ${response_json}    ${http_response}    ${expected_status_code}    ${expected_id}    ${expected_email}    ${expected_first_name}    ${expected_last_name}    ${expected_avatar}

    Should Be Equal As Numbers    ${http_response}                           ${expected_status_code}
    Should Be Equal               ${response_json['data']['id']}             ${expected_id}
    Should Be Equal               ${response_json['data']['email']}          ${expected_email}
    Should Be Equal               ${response_json['data']['first_name']}     ${expected_first_name}
    Should Be Equal               ${response_json['data']['last_name']}      ${expected_last_name}
    Should Be Equal               ${response_json['data']['avatar']}         ${expected_avatar}

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Verify Response Data Not Found
    [Documentation]   Verify Response Data Not Found
    [Arguments]    ${http_response}    ${response}    ${expected_status_code}

    Should Be Equal As Numbers    ${http_response}                      ${expected_status_code}

    ${expected_body_response}=    Set Variable    {}
    ${convert_body_response_to_string}=    Convert To String    ${response}

    Should Be Equal               ${convert_body_response_to_string}    ${expected_body_response}