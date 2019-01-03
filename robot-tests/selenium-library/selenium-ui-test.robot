*** Settings ***
Documentation  Example test suite using the SeleniumLibrary of the
...            Robotframework.
...            This test suite consists of two test cases filling out two
...            different form and solving a capture.

Library   SeleniumLibrary
Resource  Resources/Variables.robot
Resource  Resources/Keywords.robot

Test Setup      Init
Test Teardown   Close Browser

*** Test Cases ***
User Should Fill The Form 1 Successfully
    Input User Name on Form     ${NAME_FIELD}     Some name for left form
    Input Message on Form  ${TEXT_FIELD}   Some text for left form
    Capture Page Screenshot
    Click Button  ${SUBMIT_BUTTON}
    Wait Until Page Contains    Form filled out successfully
    Capture Page Screenshot


User Should Fill The Form 2 Successfully
    Input User Name on Form  ${NAME_FIELD2}    And some name for the right form
    Input Message on Form  ${TEXT_FIELD2}   Also some text for the right form
    Pass Captcha
    Capture Page Screenshot
    Click Button  ${SUBMIT_BUTTON2}
    Wait Until Page Contains    Success
    Capture Page Screenshot
