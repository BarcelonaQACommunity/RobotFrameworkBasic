*** Settings ***
Documentation     Script to test adding a new customer
Resource          resource.robot    #Test Teardown    Close Browser

*** Test Cases ***
Create New Customer
    Starts Browser
    Input Username    mngr66174
    Input Password    vutAhud
    Submit Credentials
    Go To    http://demo.guru99.com/V4/manager/addcustomerpage.php
    Input Text    name=name    Hamim
    Input Text    name=addr    BLABLABLABLA2
    Input Text    name=city    Barcelona
    Input Text    name=state    Status
    Input Text    name=dob    10022015
    Input Text    name=pinno    123477
    Input Text    name=telephoneno    213312321
    Input Text    name=emailid    hamim.adghirni@live2.com
    Input Text    name=password    1234
    Click Button    name=sub
    Title Should Be    Guru99 Bank Customer Registration Page
