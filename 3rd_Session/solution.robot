*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           ChromeSettings.py

*** Variables ***
${SERVER}         http://www.phptravels.net
${BROWSER}        chrome
${DELAY}          0.0 seconds    # 0.5 seconds
&{URL}            Register=register    Login=login    HomePage=
&{UserInfo}       FirstName=Sterling    LastName=Archer    Phone=123456789    Email=archer@isis.com    Password=IsisRules!

*** Keywords ***
Starts Browser
    ${chrome_option}=    SET CHROME OPTION
    Create Webdriver    Chrome    chrome_options=${chrome_option}
    Maximize Browser Window
    Selenium2Library.Set Selenium Speed    ${DELAY}

Go to ${subpage}
    Go To    ${SERVER}/${subpage}

Log in the website
    [Arguments]    ${email}    ${password}
    Go to ${URL.Login}
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${email}
    Input Password    name=password    ${password}
    Click Button    //*[@id="loginfrm"]/div[4]/button
    Validate user logged OK    ${UserInfo.FirstName}    ${UserInfo.LastName}

Validate user logged OK
    [Arguments]    ${FirstName}    ${LastName}
    Selenium2Library.Wait Until Page Contains    Hi, ${FirstName} ${LastName}
    Selenium2Library.Title Should Be    My Account

Logout
    Click Element    //html/body/div[2]/div/div/div[2]/ul/li[2]/a
    Click Element    //html/body/div[2]/div/div/div[2]/ul/li[2]/ul/li[2]/a
