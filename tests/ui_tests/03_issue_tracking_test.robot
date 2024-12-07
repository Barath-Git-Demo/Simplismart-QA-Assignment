*** Settings ***
Resource         ../../resources/locators.robot
Resource         ../../resources/common_keywords.robot
# Resource         ../../issuekeywords/keywordsissue.robot
Test Teardown    Take Screenshot On Failure    ${TEST NAME}

*** Test Cases ***

Create New Issue
    Open Browser To URL    ${LOGIN_PAGE}
    Login To GitHub        ${username}    ${password}
    Navigate To Tab        Barath-Git-Demo/MyPublicRepo
    Click Element    ${ISSUES_TAB}
    Click Element    ${NEW_ISSUE_BUTTON}
    Input Text             ${ISSUE_TITLE_INPUT}    Test Issue Title
    Input Text             ${ISSUE_DESCRIPTION_INPUT}    This is a test issue description.
    Click Button           ${SUBMIT_ISSUE_BUTTON}
    Wait Until Page Contains    Test Issue Title
    Log To Console    Issues clicked and created
    Close The Browser