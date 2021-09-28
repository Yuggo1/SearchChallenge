*** Settings ***
Library         Selenium2Library      implicit_wait=10     timeout=10

*** Keywords ***
Focus and click element
    [Arguments]   ${LOCATOR}
    Wait Until Page Contains Element    ${LOCATOR}
    Set Focus To Element    ${LOCATOR}
    Sleep    0.5
    Click Element    ${LOCATOR}

Input text and press ENTER
    [Arguments]   ${LOCATOR}    ${TEXT}
    Wait Until Page Contains Element    ${LOCATOR}
    Input Text    ${LOCATOR}    ${TEXT}
    Sleep    1
    Press Keys    ${LOCATOR}    ENTER

Input text and press TAB
    [Arguments]   ${LOCATOR}    ${TEXT}
    Wait Until Page Contains Element    ${LOCATOR}
    Input Text    ${LOCATOR}    ${TEXT}
    Sleep    1
    Press Keys    ${LOCATOR}    TAB

Get Text from ${LOCATOR}
    ${TEXT}=    Get Text    ${LOCATOR}
    [Return]    ${TEXT}

Open the Web Site ${URL}
    Open Browser    ${URL}

the element ${LOCATOR} should contain the text ${TEXT}
    Element Should Contain    ${LOCATOR}    ${TEXT}

Try
    [Arguments]   ${KEYWORD}    @{arguments}
    Wait Until Keyword Succeeds    5    2000ms    ${KEYWORD}    @{arguments}

Must contains less than ${NUMBER} elements ${ELEMENT}
    ${ELEMENTS}=    Get Element Count    ${ELEMENT}
    Should be True  ${ELEMENTS}<${NUMBER}

