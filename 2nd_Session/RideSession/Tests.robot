*** Settings ***
Resource          Keywords.robot
Library           RequestsLibrary
Library           Collections
Library           HttpBinCode.py
Library           HttpBinCookies.py

*** Test Cases ***
Example1
    [Documentation]    The purpose of this example is show how to make a connection with a webpage.
    Create Session    google    http://www.google.es
    ${resp}=    Get Request    google    /
    Should Be Equal    ${resp.status_code}    200

Exercise1
    [Documentation]    The purpose of this exercise is to make a connection to the webpage: http://httpbin.org and validate it.
    ...
    ...    Use the keyword Should Contains "container" "item"
    Create Session    httpbin    http://httpbin.org
    ${resp}=    Get Request    httpbin    /
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.text}    httpbin(1)

Example2
    [Documentation]    This example shows how to make an interaction with the API. We ask for the IP of the client.
    Create Session    httpbin    http://httpbin.org
    ${resp}=    Get Request    httpbin    /ip
    ${resp_json}=    Set Variable    ${resp.json()}
    Should Be Equal    ${resp_json["origin" ]}    83.60.137.146
    Validate ${resp_json["origin" ]} IP

Exercise2
    [Documentation]    We want to set a custom cookies and validate in the server we do it correctly.Cookies:
    ...
    ...    MeetupName=QA_Barcelona \ MeetupSession=1st
    ...
    ...    Help: https://httpbin.org/cookies/set?k1=v1&k2=v2 and https://httpbin.org/cookies
    Create Session    httpbin    http://httpbin.org
    Get Request    httpbin    /cookies/set?QAMeetup=QA_Barcelona&QASession=2nd
    ${resp}=    Get Request    httpbin    /cookies
    ${resp_json}=    Set Variable    ${resp.json()}
    Dictionary Should Contain Item    ${resp_json["cookies" ]}    QAMeetup    QA_Barcelona
    Dictionary Should Contain Item    ${resp_json["cookies" ]}    QASession    2nd

Exercise3
    [Documentation]    With this exercise we will see how to import custom classes from Python.
    ...
    ...    We want to use the class HttpBinCode and validate in Robotframework the answer of the code
    ...    Help:
    ...    --> https://httpbin.org/status/418 and --> http://www.restapitutorial.com/httpstatuscodes.html
    ${resp}=    HttpBinCode.Get Status    417
    Should Be Equal    ${resp.status_code}    ${417}

Exercise4
    [Documentation]    Similar to ex2 but doing all the calls at Python class HttpBinCookies and do the validation in Robotframework.
    ...
    ...    We want to set a custom cookies and validate in the server we do it correctly.Cookies:
    ...
    ...    MeetupName=QA_Barcelona \ MeetupSession=1st
    ...
    ...    Help: https://httpbin.org/cookies/set?k1=v1&k2=v2 and https://httpbin.org/cookies
    HttpBinCookies.Set Cookies Defined
    ${resp_cookies}=    HttpBinCookies.Get Cookies
    Dictionary Should Contain Item    ${resp_cookies}    QAMeetup    QA_Barcelona
    Dictionary Should Contain Item    ${resp_cookies}    QASession    2nd
