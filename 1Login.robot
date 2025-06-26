*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Abrir o sistema SauceDemo
    Dado que o usuário acessa o sistema SauceDemo

Realizar login com credenciais validas
    Dado que o usuário acessa o sistema SauceDemo
    Quando ele informa usuário "standard_user" e senha "secret_sauce"
    E clica em login
    Então o login deve ser realizado com sucesso

Validar comportamento com usuario e senha incorretos
    Dado que o usuário acessa o sistema SauceDemo
    Quando ele informa usuário "standard_user" e senha "senhamuitoErrada"
    E clica em login
    Então deve ser exibida uma mensagem de erro

Realizar logout apos login bem-sucedido
    Dado que o usuário acessa o sistema SauceDemo
    Quando ele informa usuário "standard_user" e senha "secret_sauce"
    E clica em login
    E acessa o menu lateral
    E clica em logout
    Então o usuário deve ser deslogado do sistema

*** Keywords ***
Dado que o usuário acessa o sistema SauceDemo
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window

Quando ele informa usuário "${usuario}" e senha "${senha}"
    Input Text    //input[contains(@type,'text')]    ${usuario}
    Input Text    //input[contains(@type,'password')]    ${senha}

E clica em login
    Click Element    //input[contains(@type,'submit')]
    Sleep    3s

Então o login deve ser realizado com sucesso
    Page Should Contain Element    //div[contains(@class,'inventory_list')]

Então deve ser exibida uma mensagem de erro
    Page Should Contain    Epic sadface: Username and password do not match

E acessa o menu lateral
    Click Element    //button[contains(.,'Open Menu')]

E clica em logout
    Click Element    //a[contains(.,'Logout')]

Então o usuário deve ser deslogado do sistema
    Page Should Contain Element    //input[contains(@type,'submit')]