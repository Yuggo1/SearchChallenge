*** Settings ***
Resource       Resource_UI.robot
Library        String
Variables      githubLocators.py

*** Keywords ***
I Search for "${TEXT}"
    Input text and press ENTER  ${SEARCH_BOX}  react

I Advance search
    Focus and click element  ${ADVANCED_SEARCH}

"${LANGUAGE}" as written language
    Select From List By Value   ${WRITTEN_LANGUAGE}     ${LANGUAGE}

With this many stars ${STARS}
    Input text and press TAB    ${SEARCH_STARS}     ${STARS}
    
With this many FOLLOWERS ${FOLLOWERS}
    Input text and press TAB    ${SEARCH_FOLLOWERS}     ${FOLLOWERS}

With this License ${LICENSE}
    Select From List By Value   ${SEARCH_LICENSE}       ${LICENSE}

I Click on Search
    Focus and click element  ${SEARCH_BUTTON}

Only the repositorie ${REPO} is returned
    ${ELEMENTS}=    Get Element Count    ${REPOSITORIE_ITEMS}
    Should be True  ${ELEMENTS}==1
    Element Text Should be  ${FIRST_REPO}   mvoloskov/decider
    Focus and click element  ${FIRST_REPO}
    ${Text}=    Get Text from ${README}
    ${Text}=    Get Substring   ${Text}     0       300
    Log to Console  ${Text}

