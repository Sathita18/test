*** Keywords ***

Get Request API
    [Documentation]    Get Request API
    [Arguments]    ${alias}    ${url}    ${uri}    ${headers}=${None}    ${params}=${None}    ${data}=${None}    ${json}=${None}    ${verify_ssl}=${False}
    
    ${headers}=         Run Keyword If      $headers is $None       Create Dictionary   # <-- Default Empty Dict
    ...                 ELSE                                        Set Variable        ${headers}
    
    # Create session
    create session      ${alias}    ${url}    headers=${headers}    verify=${verify_ssl}
   
    # Send get request
    ${response}    get request    alias=${alias}    uri=${uri}    params=${params}    data=${data}    json=${json}
    
    # Return response
    [Return]    ${response}