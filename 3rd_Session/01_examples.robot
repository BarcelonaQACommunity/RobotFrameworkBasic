*** Settings ***
Test Setup        Starts Browser
Test Teardown     Close Browser
Resource          resource.robot

*** Variables ***

*** Test Cases ***
01_Create a new user
    [Documentation]    In this example we create an user with the values from the variables
    Go to ${URL.Register}
    Input Text    name=firstname    ${UserInfo.FirstName}
    Input Text    name=lastname    ${UserInfo.LastName}
    Input Text    name=phone    ${UserInfo.Phone}
    Input Text    name=email    ${UserInfo.Email}
    Input Text    name=password    ${UserInfo.Password}
    Input Text    name=confirmpassword    ${UserInfo.Password}
    Click Button    //*[@id="headersignupform"]/div[9]/button
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}

02_Create a wrong user
    Go to ${URL.Register}
    Input Text    name=firstname    ${UserInfo.FirstName}
    Input Text    name=lastname    ${UserInfo.LastName}
    Input Text    name=phone    ${UserInfo.Phone}
    Input Text    name=email    invalid@mail
    Input Password    name=password    ${UserInfo.Password}
    Input Password    name=confirmpassword    ${UserInfo.Password}
    Click Button    //*[@id="headersignupform"]/div[9]/button
    Selenium2Library.Wait Until Element Is Visible    //*[@id="headersignupform"]/div[2]/div/p
    Selenium2Library.Element Should Contain    //*[@id="headersignupform"]/div[2]/div/p    The Email field must contain a valid email address.
