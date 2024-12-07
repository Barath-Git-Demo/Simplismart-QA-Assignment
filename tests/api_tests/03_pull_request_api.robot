*** Settings ***
Library         RequestsLibrary
Resource        ../../resources/api_keywords.robot

*** Test Cases ***

# Test Creating a Pull Request via API
Create New Pull Request API
    [Documentation]    Verifies that a pull request can be created using the GitHub API.
    
    Create New Pull Request API    DemoPullMerge    Test PR Title    Barath-Git-Demo-patch-11    main

# Test Fetching Pull Requests via API
Fetch Pull Requests API
    [Documentation]    Verifies that pull requests can be fetched for a repository using the GitHub API.
    
    Create Pull Requests API    DemoPullMerge
