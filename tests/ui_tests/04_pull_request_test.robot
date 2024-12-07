*** Settings ***
Resource         ../../resources/locators.robot
Resource         ../../resources/common_keywords.robot
Test Teardown    Take Screenshot On Failure    ${TEST NAME}

*** Test Cases ***

# Test Creating a Pull Request
Create New Pull Request
    Open Browser To URL    ${LOGIN_PAGE}
    Login To GitHub        ${username}    ${password}
    Navigate To Pull Tab        Barath-Git-Demo/DemoPullMerge
    Click Element          ${PULL_REQUESTS_TAB}
    Click Element           ${NEW_PULL_REQUEST_BUTTON}
    Wait Until Page Contains    Comparing changes
    Click Element    id:head-ref-selector
    Click Element    xpath://span[text()='Barath-Git-Demo-patch-16']
    Click Button           ${CREATE_PR_BUTTON}
    Click Element            ${FINAL_PR_BUTTON}
    Log To Console    Pull request successfully created
    Close The Browser

# Test Merging a Pull Request
Merge Pull Request
    Open Browser To URL    ${LOGIN_PAGE}
    Login To GitHub        ${username}    ${password}
    Navigate To Pull Tab        Barath-Git-Demo/DemoPullMerge
    Click Element          ${PULL_REQUESTS_TAB}
    Click Element          ${NEW_PULL_REQUEST_BUTTON}
    Wait Until Page Contains    Comparing changes
    Click Element    id:head-ref-selector
    Click Element    xpath://span[text()='Barath-Git-Demo-patch-17']
    Click Button           ${CREATE_PR_BUTTON}
    Click Element          ${FINAL_PR_BUTTON}
    Wait Until Page Contains Element    ${MERGE_PR_BUTTON}
    Sleep    5
    Click Button           ${MERGE_PR_BUTTON}
    Sleep    5
    Click Button           ${CONFIRM_MERGE_BUTTON}
    Log To Console    Pull request successfully merged and Closed
    Close The Browser
