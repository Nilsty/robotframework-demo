*** Settings ***
Library  SeleniumLibrary
Resource  Variables.robot

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
    Set Selenium Speed   1 seconds
    Title Should Be     Filling Out Forms - Ultimate QA

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
