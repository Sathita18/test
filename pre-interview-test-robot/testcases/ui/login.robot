*** Settings ***
Resource          ../../resources/imports.robot
            
*** Test Cases ***

# ================================================================================================================================================================================================================================================
#  SUCCESS
# ================================================================================================================================================================================================================================================ 

S_001_Login_With_Valid_Username_And_Password
    [Documentation]    Validate login page when user input valid username and password
    [Tags]    success
    [Template]    Template Validate Login Page Success

    # Username             Password             Expected Login Success              Expected After Logout
    ${d_username}       ${d_password}       You logged into a secure area!      You logged out of the secure area!

# ================================================================================================================================================================================================================================================
#  UNSUCCESS
# ================================================================================================================================================================================================================================================ 

U_001_Login_With_Invalid_Data_Should_Fail
    [Documentation]    Validate login page when user input invalid data should fail
    [Tags]    unsuccess
    [Template]    Template Validate Login Page Unsuccess

    # Username                             Password                  Expected Error
    # Input valid username and invalid password
    ${d_username}                   ${d_password_invalid}       Your password is invalid!

    # Input username not found
    ${d_username_not_found}         ${d_password_invalid}       Your username is invalid!