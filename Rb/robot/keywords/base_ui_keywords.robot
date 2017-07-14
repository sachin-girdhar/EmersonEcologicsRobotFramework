*** Settings ***
Documentation       Page Objects Ancestor file. Contains extensions for Robot Framework and Common Keywords for Page Objects.
Resource            ../resources/dependencies.robot


*** Variables ***
###### Locators Variables ######
${success_icon}                         css=i.success-icon

*** Keywords ***
######    Page Objects Functionality Extensions   #####


######    Framework Functionality Extensions   #####
Open Browser Session
    [Arguments]     ${url}    ${browser}
    Open Browser                                    ${url}    ${browser}
    Set Browser Implicit Wait                       ${implicit_wait_sec}
    Maximize Browser Window

Close Browser Session
   Close Browser

Verify section exists
    [Documentation]     Verifies section exists via checking labels.
    [Arguments]     @{list}
    ${length}       Get Length                          ${list}
    :FOR    ${i}    IN RANGE   0    ${length}
    \    ${element}    Set Variable    ${list[${i}]}
    \    Run Keyword If    "${element}"!=''     Page Should Contain     ${element}

Verify element highlighted
    [Arguments]     ${element_selector}     ${element_text}
    Element Should Be Visible                           ${element_selector}
    Page Should Contain                                 ${element_text}

Scroll Page
    [Documentation]    Scrolling current page [UP] or [DOWN]
    [Arguments]    ${direction}
    Run Keyword If    '${direction}'=='DOWN'    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Run Keyword If    '${direction}'=='UP'    Execute JavaScript    window.scrollTo(0, 0);

Scroll to element
    [Documentation]    Scrolling to the correct element
    [Arguments]    ${element_locator}
    ${y_pcoordinate}=       Get Vertical Position       ${element_locator}
    ${y_pcoordinate}=       Evaluate                    ${y_pcoordinate} - 150.0
    Execute JavaScript      window.scrollTo(0, ${y_pcoordinate})

Verify elements are present on the page
    [Documentation]     Verifies items are present on page.
    [Arguments]     @{locators_list}
    ${length}           Get Length                      ${locators_list}
    :FOR    ${i}    IN RANGE   0    ${length}
    \    ${element}    Set Variable    ${locators_list[${i}]}
    \    Element Should Be Visible     ${element}

Scroll To Element With CSS Locator
    [Documentation]    Scrolling to the element, even it is inside other element. Locators should not contain double quotes "
    [Arguments]    ${element_locator}
    ${locator}=    Fetch From Right    ${element_locator}    css=
    Execute Async Javascript    var elementToScroll = document.querySelector("${locator}");
    ...                         var stickyHeaderHeight = 160;
    ...                         elementToScroll.scrollIntoView();
    ...                         var position = elementToScroll.getBoundingClientRect();
    ...                         if (position.top < stickyHeaderHeight) {
    ...                             var scrollOn = 0 - stickyHeaderHeight - position.top;
    ...                             window.scrollBy(0, scrollOn);
    ...                         }
    ...                         var callback = arguments[arguments.length - 1];
    ...                         window.setTimeout(callback, 1000);

Scroll To Element With XPATH Locator
    [Documentation]    Scrolling to the element, even it is inside other element. Locators should not contain double quotes "
    [Arguments]    ${element_locator}
    Wait until Page Contains Element                      ${element_locator}
    ${locator}=    Fetch From Right    ${element_locator}    xpath=
    Execute Async Javascript    var elementToScroll = document.evaluate("${locator}" ,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null ).singleNodeValue;
    ...                         var stickyHeaderHeight = 160;
    ...                         elementToScroll.scrollIntoView();
    ...                         var position = elementToScroll.getBoundingClientRect();
    ...                         if (position.top < stickyHeaderHeight) {
    ...                             var scrollOn = 0 - stickyHeaderHeight - position.top;
    ...                             window.scrollBy(0, scrollOn);
    ...                         }
    ...                         var callback = arguments[arguments.length - 1];
    ...                         window.setTimeout(callback, 1000);

Assert Message Equals
    [Documentation]     Compare two strings and return error in case they are different
    [Arguments]    ${actual_message}    ${expected_message}
    Should Be Equal    ${actual_message}    ${expected_message}
    ...    Message Should Be: "${expected_message}"; \nBut was:\t \ \ "${actual_message}"    values=False

Replace Placeholder In Locator
    [Documentation]     Replace some part in predefined locator with new required value.
    [Arguments]    ${locator_with_placeholder}    ${placehoder}    ${replace_on_string}
    ${updated_locator}=    Replace String    ${locator_with_placeholder}    ${placehoder}    ${replace_on_string}
    [Return]    ${updated_locator}

Press TAB Key On Element
    [Documentation]     Emulating TAB key press on some element.
    [Arguments]    ${element_to_press_tab_on}
    Press Key      ${element_to_press_tab_on}    \\9

Scroll Up
    [Documentation]    Scrolling to the correct element
    Execute JavaScript    window.scrollTo(0, 0)

Check if [Success] window appear
    Wait Until Element Is Visible           ${success_icon}

Check if [Success] window disappear
    Wait Until Element Is Not Visible       ${success_icon}         ${explicit_wait_5_sec}
