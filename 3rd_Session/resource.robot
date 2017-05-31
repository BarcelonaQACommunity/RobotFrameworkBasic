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
    Comment    Selenium2Library.Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Selenium2Library.Set Selenium Speed    ${DELAY}

Go to ${subpage}
    Go To    ${SERVER}/${subpage}

Log in the website
    [Arguments]    ${email}    ${password}

Validate user logged OK
    [Arguments]    ${FirstName}    ${LastName}
    Selenium2Library.Wait Until Page Contains    Hi, ${FirstName} ${LastName}
    Selenium2Library.Title Should Be    My Account

Logout
