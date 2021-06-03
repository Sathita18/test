*** Settings ***
Library           RequestsLibrary
Library           SeleniumLibrary
Library           JSONLibrary
Library           Collections
Library           String
Resource          ../keywords/api/user_profile.robot
Resource          ../keywords/common/send_request.robot
Resource          ../keywords/common/verify_response.robot
Resource          ../keywords/ui/login_page.robot
Variables         ../resources/configs/configs.yaml
Variables         ../resources/testdata/test_data.yaml
Variables         ../resources/common_configs.yaml
Variables         ../resources/common_xpaths.yaml