*** Settings ***
Test Teardown
Library           Selenium2Library
Resource          resource.robot

*** Variables ***
&{UserInfo}       FirstName=Sterling    LastName=Archer    Phone=123456789    Email=archer@isis.com    Password=IsisRules!

*** Test Cases ***
01_Create a new user
    [Documentation]    In this example we create an user with the values from the variables
    Starts Browser
    Go to ${URL.Register}
    Input Text    name=firstname    ${UserInfo.FirstName}
    Input Text    name=lastname    ${UserInfo.LastName}
    Input Text    name=phone    ${UserInfo.Phone}
    Input Text    name=email    ${UserInfo.Email}
    Input Text    name=password    ${UserInfo.Password}
    Input Text    name=confirmpassword    ${UserInfo.Password}
    Comment    Click Button    xpath=/html/body/section[@id='hero']/div[@class='container']/div[@class='row']/div[@class='col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3']/div[@class='panel panel-default']/div[@class='panel-body']/div[@id='login']/form[@id='headersignupform']/div[@class='form-group'][7]/button[@class='signupbtn btn_full btn btn-action btn-block btn-lg']
    Click Button    //*[@id="headersignupform"]/div[9]/button

02_Create a wrong user
