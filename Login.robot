*** Settings ***
Library                                 SeleniumLibrary
Test Setup                              Open Browser                ${base_url}         ${browser_setup}
Test Teardown                           Close Browser

*** Variables ***
${base_url}                             https://pub-eish-dev.keponet.com/frontend/login
${browser_setup}                        Chrome
${EMPTY}


*** Test Cases ***
I Login with valid Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    #Element Should Contain             //input[@id="email"]            jenareishsatu@yopmail.com -< ini tidak bisa dipakai karna tidak ada balikan dr web nya
    Input text                          //input[@id="password"]         12345678
    #Element Should Contain             //input[@id="password"]         12345678 -< ini tidak bisa dipakai karna tidak ada balikan dr web nya
    Click Element                       //button[@type="submit"]
    Element Should Be Visible           (//a[@class="nav-link"])[1]

I Login with valid Email and invalid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    Input text                          //input[@id="password"]         123456789
    Click Element                       //button[@type="submit"]
    Element Should Be Visible           //div[@class="alert alert-danger text-danger"]

I Login with invalid Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenar@yopmail.com
    Input text                          //input[@id="password"]         12345678
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

I Login with invalid Email and invalid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenar@yopmail.com
    Input text                          //input[@id="password"]         123456789
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I Login with valid Email and blank Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    Input text                          //input[@id="password"]         \
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I Login with blank Email and valid Password
    Maximize Browser Window
    Input text                          //input[@id="email"]            \
    Input text                          //input[@id="password"]         12345678
    Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I login with valid Email and valid Password without click button
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    Input text                          //input[@id="password"]         12345678
    #Click Element                       //button[@type="submit"]
    Element Should Not Be Visible       //img[@id="menu-logo"]

I login with valid Email and valid Password with click "Lupa Kata Sandi"
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    Input text                          //input[@id="password"]         12345678
    Click Link                          //a[@href="https://pub-eish-dev.keponet.com/frontend/recover-password"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]

I login with valid Email and valid Password with click "Daftar"
    Maximize Browser Window
    Input text                          //input[@id="email"]            jenareishsatu@yopmail.com
    Input text                          //input[@id="password"]         12345678
    Click Link                          //a[@href="https://pub-eish-dev.keponet.com/frontend/register"]
    Element Should Not Be Visible       (//a[@class="nav-link"])[1]





