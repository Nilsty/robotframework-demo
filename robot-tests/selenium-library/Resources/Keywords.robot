*** Settings ***
Library  SeleniumLibrary
Resource  Variables.robot
Library   ../../custom_keywords.py

*** Keywords ***
Init
    Run keyword if  ${HEADLESS_BROWSER_ENABLED}
    ...  Start Headless Browser
    ...  ELSE
    ...  Open URL in Chrome Browser

Start Headless Browser
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${LOGIN URL}

Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Open URL in Chrome Browser
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   0.5 seconds
    Title Should Be     Filling Out Forms - Ultimate QA

User fills form 1
    Input User Name on Form     ${NAME_FIELD}     Some name for left form
    Input Message on Form  ${TEXT_FIELD}   Some text for left form
    Capture Page Screenshot

User submits forms 1
    Click Button  ${SUBMIT_BUTTON}

Form 1 was submitted successfully
    Wait Until Page Contains    Form filled out successfully
    Capture Page Screenshot

User fills form 2
    Input User Name on Form  ${NAME_FIELD2}    And some name for the right form
    Input Message on Form  ${TEXT_FIELD2}   Also some text for the right form
    Pass Captcha
    Capture Page Screenshot

User submits forms 2
    Click Button  ${SUBMIT_BUTTON2}

Form 2 was submitted successfully
    Wait Until Page Contains    Success
    Capture Page Screenshot
    ${RESULT}=  Make Some Calculation   10  15
    Log To Console  ${RESULT}
    ${RESULT}=  Give Me Some Output
    Log To Console  ${RESULT}

Input User Name on Form
    [Arguments]    ${NAME_FIELD}    ${NAME}
    Input Text  ${NAME_FIELD}   ${NAME}

Input Message on Form
    [Arguments]    ${TEXT_FIELD}    ${TEXT}
    Input Text  ${TEXT_FIELD}   ${TEXT}

Pass Captcha
    ${TEXT}=  Get Text    ${CAPTCHA}
    ${Result}=  Evaluate  ${TEXT}
    Input Text   ${CAPTCHA_FIELD}    ${Result}
