*** Settings ***
Library     SeleniumLibrary  timeout=60s 
Library    String

Test Teardown    Run Keywords    Run Keyword If Test Failed    Capture Page Screenshot    AND    Close All Browsers


*** Variables ***
${BROWSER}          Chrome
${INSTANCE}         www.connexion.at
${PROTOCOL}         https
${WEBSITE_URL}      ${PROTOCOL}://${INSTANCE}


*** Test Cases ***
Test Startseite
    Open Browser  ${WEBSITE_URL}  ${BROWSER}  options=add_experimental_option('excludeSwitches', ['enable-logging'])
    GO TO  ${WEBSITE URL}
    Sleep  1s
    ${location}=  Get Location
    ${notpassed}=  Run Keyword And Return Status  Should Be Equal As Strings  ${location}  ${WEBSITE URL}
    Run Keyword If  ${notpassed}  Fatal Error
    Close Browser