*** Settings ***
Library           Collections
Library           RequestsLibrary

*** Keywords ***
Validate ${ip} IP
    Create Session    ipfy    http://api.ipify.org
    ${resp}=    Get Request    ipfy    /
    Should Be Equal    ${resp.text}    ${ip}
