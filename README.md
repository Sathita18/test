How to run robot

#to run robot one test case

For Example
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot -T --loglevel TRACE -t "xxx" testcases/xxx.robot

----------------------------------------------------------------------------------------------------------------------------------------
User Interface (UI)
----------------------------------------------------------------------------------------------------------------------------------------

Success case
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot/20210604 -T --loglevel TRACE -t "S_001_Login_With_Valid_Username_And_Password" testcases/ui/login.robot

Unsuccess case
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot/20210604 -T --loglevel TRACE -t "U_001_Login_With_Invalid_Data_Should_Fail" testcases/ui/login.robot

----------------------------------------------------------------------------------------------------------------------------------------
Rest API (API)
----------------------------------------------------------------------------------------------------------------------------------------

Success case
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot/20210604 -T --loglevel TRACE -t "S_001_Verify_User_Profile" testcases/api/user_profile.robot

Unsuccess case
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot/20210604 -T --loglevel TRACE -t "U_001_Verify_User_Profile_Not_Found" testcases/api/user_profile.robot

#to run all test case

For Example
- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot -T --loglevel TRACE testcases/xxx/xxx.robot

----------------------------------------------------------------------------------------------------------------------------------------
User Interface (UI)
----------------------------------------------------------------------------------------------------------------------------------------

- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot -T --loglevel TRACE testcases/ui/login.robot

----------------------------------------------------------------------------------------------------------------------------------------
Rest API (API)
----------------------------------------------------------------------------------------------------------------------------------------

- robot -V resources/configs/configs.yaml -V resources/testdata/test_data.yaml -d /LogOutput/pre_interview_test_robot -T --loglevel TRACE testcases/api/user_profile.robot

# Options
 -d --outputdir dir       Where to create output files.
 -t --test name           Select test cases to run by name or long name.
 -V --variablefile path	  Python or YAML file file to read variables from.
 -T --timestampoutputs    Add timestamp to all generated output files Eg. output-20210604-154410.xml
