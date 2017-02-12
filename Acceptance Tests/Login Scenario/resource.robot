*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         demo.guru99.com/V4/index.php
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     mngr66174
${VALID PASSWORD}  vutAhud
${LOGIN URL}      http://${SERVER}/index.php
${WELCOME URL}    http://${SERVER}/manager/Managerhomepage.php
${ERROR URL}      http://${SERVER}/index.php

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Guru99 Bank Home Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    name=uid    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name=password    ${password}

Submit Credentials
    Click Button    name=btnLogin

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Guru99 Bank Home Page

Selects Section
    [Arguments]     ${section}
    Click Link      ${section}

Go to FC
    Open Browser    https://www.forocoches.com/foro/misc.php?do=page&template=ident    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Enters Username
    [Arguments]    ${username}
    Input Text    name=vb_login_username    ${username}

Enters Password
    [Arguments]    ${password}
    Input Text    name=vb_login_password    ${password}

Click Acceder
    Click Button    xpath=/html/body/div[4]/div/div/table[1]/tbody/tr/td[2]/form/table/tbody/tr[2]/td[3]/input