*** Settings ***
Library                                 SeleniumLibrary
Test Setup                              Open Browser                ${base_url}         ${browser_setup}
Test Teardown                           Close Browser

*** Variables ***
${base_url}                             https://pub-eish-dev.keponet.com/frontend/login
${browser_setup}                        Chrome
${email_user}                           jenareishsatu@yopmail.com
${password_user}                        12345678
${password_invalid}                     123456
${email_invalid}                        jenar@yopmail.com
${EMPTY}

*** Test Cases ***
I Login with valid Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${password_user}
    Click Element                       //button[@type="submit"]
    Element Should Be Visible           //img[@id="menu-logo"]

I Login with valid Email and invalid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${password_invalid}
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

I Login with invalid Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_invalid}
    Input text                          //input[@id="password"]         ${password_user}
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

I Login with invalid Email and invalid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_invalid}
    Input text                          //input[@id="password"]         ${password_invalid}
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I Login with valid Email and blank Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${EMPTY}
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I Login with blank Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${EMPTY}
    Input text                          //input[@id="password"]         ${password_user}
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I login with valid Email and valid Password without click button
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${password_user}
    #Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I login with valid Email and valid Password with click "Lupa Kata Sandi"
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${password_user}
    Click Link                          //a[@href="https://pub-eish-dev.keponet.com/frontend/recover-password"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

I login with valid Email and valid Password with click "Daftar"
    Maximize Browser Window
    Input text                          //input[@id="email"]            ${email_user}
    Input text                          //input[@id="password"]         ${password_user}
    Click Link                          //a[@href="https://pub-eish-dev.keponet.com/frontend/register"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

