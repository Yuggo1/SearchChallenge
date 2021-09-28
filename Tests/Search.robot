*** Settings ***
Documentation     Github Search Challenge
Library           Selenium2Library
Resource       ../Resources/Github.robot
Resource       ../Resources/Resource_UI.robot

*** Test Cases ***
Valid Login
    Given Open the Web Site http://github.com
    When I Search for "react"
    And I advance search
    "JavaScript" as written language
    With this many stars >45
    With this many FOLLOWERS >50
    With this License bsl-1.0
    And I Click on Search
    Then Only the repositorie mvoloskov/decider is returned
    [Teardown]    Close Browser