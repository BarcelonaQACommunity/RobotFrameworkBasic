*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         http://www.phptravels.net
${BROWSER}        chrome
${DELAY}          0
&{URL}            Register=register    Login=login    HomePage=

*** Keywords ***
Starts Browser
    Selenium2Library.Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go to ${subpage}
    Go To    ${SERVER}/${subpage}
