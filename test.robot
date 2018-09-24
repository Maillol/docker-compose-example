*** Settings ***
Documentation     Connect to Django admin
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8000
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${ADMIN_USER}
    Input Password    ${ADMIN_PWD}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Log in | Django site admin

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Log in

Welcome Page Should Be Open
    Title Should Be    Site administration | Django site admin
