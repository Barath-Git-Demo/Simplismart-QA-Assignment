*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}              https://api.github.com
${TOKEN}                 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
# ${head}                  DemoPullMerge 
# ${base}                  main
*** Variables ***
${username}    Barath-Git-Demo
${password}    xygdyj-subQy6-buvmir

*** Keywords ***

# Create Repository via API
Create Repository API
    [Arguments]    ${repo_name}    ${is_private}=False
    Create Session    github    ${BASE_URL}    headers={"Authorization": "token ${TOKEN}"}
    ${payload}=    Create Dictionary    name=${repo_name}    private=${is_private}
    ${response}=    Post Request    github    /user/repos    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    ${response.json()}

# Fetch Repository Details via API
Fetch Repository Details API
    [Arguments]    ${repo_name}
    Create Session    github    ${BASE_URL}    headers={"Authorization": "token ${TOKEN}"}
    ${response}=    Get Request    github    /repos/Barath-Git-Demo/${repo_name}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}

# Create Issue via API
Create Issue API
    [Arguments]    ${repo_name}    ${title}    ${body}=${EMPTY}
    Create Session    github    ${BASE_URL}    headers={"Authorization": "token ${TOKEN}"}
    ${payload}=    Create Dictionary    title=${title}    body=${body}
    ${response}=    Post Request    github    /repos/Barath-Git-Demo/${repo_name}/issues    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    ${response.json()}

# Create Pull Request via API

Create New Pull Request API
    [Arguments]    ${repo_name}    ${title}    ${head}    ${base}
    Create Session    github    ${BASE_URL}    headers={"Authorization": "token ${TOKEN}"}
    ${payload}=    Create Dictionary    title=${title}    head=${username}:${head}    base=${base}
    ${response}=    Post Request    github    /repos/${username}/${repo_name}/pulls    json=${payload}
    
    Log    ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    201


Create Pull Requests API
    [Arguments]    ${repo_name}
    [Documentation]    Fetch pull requests for a repository and verify the response.
    Create Session    github    ${BASE_URL}    headers={"Authorization": "token ${TOKEN}"}
    ${response}=    Get Request    github    /repos/${username}/${repo_name}/pulls
    Log    ${response.status_code}
    Log    ${response.json()}

    # Validate the response
    Should Be Equal As Numbers    ${response.status_code}    200
    
