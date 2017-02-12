*** Settings ***
Documentation     A test suite with a single test for a new customer.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
#New Customer
##    Open Browser To Login Page
##    Input Username      mngr66174
##    Input Password      vutAhud
##    Submit Credentials
##    Welcome Page Should Be Open
##    Reload Page
##    Selects Section     addcustomerpage.php
##   [Teardown]    Close Browser

Go to Forocoches
    Go to FC
    Enters Username      asboxi
    Enters Password      pswd
    Click Acceder
    Reload Page
    [Teardown]    Close Browser