*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL}  http://localhost/crud-without-refresh-reload/

*** Test Cases ***
[Test_case_01] Verify search User successfully
    [documentation]  Test search User
    [tags]  Function

#   step1. Access to browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

#   step2. Enter value to search textbox
    Input Text  //*[@id="example_filter"]/label/input  Jack

#   step3. Verify search result
    Page Should Contain  Jack

    Close Browser

[Test_case_02] Verify that add User successfully
    [documentation]  Test add User
    [tags]  Function

#   step1. Access to browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

#   step2. Enter value
    Click Element  xpath:/html/body/div[1]/div/div/div[1]/div/a
    Sleep  3
    Input Text  xpath://*[@id="addUserField"]  Doraemon
    Input Text  xpath://*[@id="addEmailField"]  Doraemon@gmail.com
    Input Text  xpath://*[@id="addMobileField"]  0888888888
    Input Text  xpath://*[@id="addCityField"]  Ha Noi

#   step3. Click button
    Click Element  xpath://*[@id="addUser"]/div[5]/button[2]
    Sleep  2
#   step4. Verify new User
    Page Should Contain  Doraemon

    Close Browser

[Test_case_03] Verify that edit User by ID successfully
    [documentation]  Test edit User
    [tags]  Function

#   step1. Access to browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

#   step2. Choice Value edit with ID = 28
    Click Element  xpath://*[@id="28"]/td[6]/a[1]
    Sleep  3
    Input Text  xpath://*[@id="nameField"]  Edward
    Input Text  xpath://*[@id="emailField"]  Edward@gmail.com
    Input Text  xpath://*[@id="mobileField"]  0999999
    Input Text  xpath://*[@id="cityField"]  TPHCM

#   step3. Click button
    Click Element  xpath://*[@id="updateUser"]/div[5]/button[2]
    Sleep  2
#   step4. Verify edit User
    Page Should Contain  Edward

    Close Browser

[Test_case_04] Verify that delete User successfully
    [documentation]  Test delete User with ID
    [tags]  Function

#   step1. Access to browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

#   step2. Choice Value delete with ID = 21
    Click Element  xpath://*[@id="21"]/td[6]/a[2]

#   step3. Delete user
    sleep    3
    handle alert    accept
    sleep    2

#   step4. Verify not exist delete user
    Input Text  //*[@id="example_filter"]/label/input  Noah
    sleep    2
    Page Should Contain  No data available in table

    Close Browser

*** Keywords ***
