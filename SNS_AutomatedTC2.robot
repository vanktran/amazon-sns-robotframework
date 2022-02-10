*** Settings ***
Documentation    Suite description

Library     Selenium2Library
Library     OperatingSystem

*** Variables ***
${Browser}      Chrome
${LOGIN URL}    https://www.amazon.com/
${orig timeout}=     Set Selenium Timeout   30 seconds
${asin}         B07LFQ9CXC

*** Test Cases ***
Test Case 2. Set Up SNS with Select Quantity
    Open Browser    ${LOGIN URL}   ${Browser}
    Maximize Browser Window
    Input Text      id:twotabsearchtextbox    diapers swaddlers
    Submit Form     id:nav-search-bar-form

    Scroll Element Into View    //div[@data-asin='${asin}']
    Wait Until Element is visible    //div[@data-asin='${asin}']     timeout=5s
    Click Element   //div[@data-asin='${asin}']//h2//a

    Click Element   //div[@id='snsAccordionRowMiddle']
    Sleep    0.2s
    ${attr}=        Get Element Attribute   //div[@id='snsAccordionRowMiddle']//i    class
    Should Contain    ${attr}    a-icon-radio-active

    #Click Element   //div[@id='selectQuantity']//i
    Sleep   2s
    Click Element    //div[@id='selectQuantity']//span[@class='a-button a-button-dropdown a-button-small']
    Sleep   2s
    Click Element    //div[@class='a-popover a-dropdown a-dropdown-common a-declarative']//li[3]/a

    Click Element   id:rcx-subscribe-submit-button-announce
    Page Should Contain    Added to Cart
