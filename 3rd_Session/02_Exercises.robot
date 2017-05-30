*** Settings ***
Test Setup        Starts Browser

*** Test Cases ***
01_Login_user
    [Documentation]    In this exercise we want to log in the web site using the user we have created for this demo. So first you have to *create a new one*.

02_Modify_the_email
    [Documentation]    In this exercise we want to modify the email of the user we have created before. As we will reuse the part of login from exercise 1, a good practise should be to encapsulate all the login process in a keyword and call it from the test case.

03_Make_a_book
    [Documentation]    The last exercise is focused in doing a E2E action like booking a travel. We should make a reservation and then Validate in the control panel we have an entry.
    ...
    ...    HOME-> Rendezvous Hotel Singapore --> Junior suites --> 2 child and 2 adults --> book now --> in Notes add: "No menu" -->Flower Bouquet in Room yes --> Confirm This Booking --> Pay on Arrival --> Ok on pop up --> Validate it says Reserved
