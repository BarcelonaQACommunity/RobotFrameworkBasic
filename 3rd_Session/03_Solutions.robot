*** Settings ***
Test Setup        Starts Browser
Resource          solution.robot

*** Test Cases ***
01_Login_user
    Go to ${URL.Login}
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${UserInfo.Email}
    Input Text    name=password    ${UserInfo.Password}
    Click Button    //*[@id="loginfrm"]/div[4]/button
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}

02_Modify_the_email
    Log in the website    ${UserInfo.Email}    ${UserInfo.Password}
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}
    Comment    Selenium2Library
    Selenium2Library.Wait Until Element Is Visible    //html/body/div[3]/div[3]/div/div[1]/ul/li[2]/a
    Selenium2Library.Click Element    //html/body/div[3]/div[3]/div/div[1]/ul/li[2]/a
    Selenium2Library.Mouse Down    //*[@id="profilefrm"]/div/div[2]/div[2]/div[1]/div[2]/input
    Press Key    //html/body/div[3]/div[3]/div/div[1]/ul/li[2]/a    \t\t\t\t\t\t
    Input Text    //*[@id="profilefrm"]/div/div[2]/div[2]/div[1]/div[2]/input    custom@mail.com
    Input Password    name=password    ${UserInfo.Password}
    Input Password    name=confirmpassword    ${UserInfo.Password}
    Click Button    //*[@id="profilefrm"]/div/div[3]/div[3]/button
    Selenium2Library.Wait Until Page Contains    Profile Updated Successfully.
    Logout
    Log in the website    custom@mail.com    ${UserInfo.Password}
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}

03_Make_a_book
    [Documentation]    The last exercise is focused in doing a E2E action like booking a travel. We should make a reservation and then Validate in the control panel we have an entry.
    ...
    ...    HOME-> Rendezvous Hotel Singapore --> Junior suites --> 2 child and 2 adults --> book now --> in Notes add: "No menu" -->Flower Bouquet in Room yes --> Confirm This Booking --> Pay on Arrival --> Ok on pop up --> Validate it says Reserved
    Log in the website    ${UserInfo.Email}    ${UserInfo.Password}
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}
    Click Element    //html/body/nav[1]/div/div/div/ul/li[3]/a
    Click Element    //html/body/div[5]/div[3]/div/table/tbody/tr[1]/td/div/div[2]/div/div[1]/a/button
    Selenium2Library.Select From List By Value    //*[@id="child"]    2
    Click Button    //*[@id="ROOMS"]/form[1]/div/div[2]/div[1]/button
    Comment    Selenium2Library.
    Input Text    name=additionalnotes    No menu
    Click Element    //*[@id="bookingdetails"]/div[2]/table/tbody/tr[1]/td[4]/label/span/span[2]
    Click Button    //html/body/div[3]/div/div/div[1]/div/div[2]/div[5]/button
    Wait Until Element Is Visible    //html/body/div[3]/div/div[1]/div/center/b
    Click Button     xpath=//*[@class="btn btn-default arrivalpay"]
    Confirm Action
    Wait Until Page Contains    You must confirm your booking otherwise it will be cancelled, please contact us for further information.
    Element Should Contain    //html/body/div[3]/div/div[1]/div/center/b    Reserved
