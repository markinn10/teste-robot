*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Iniciar processo de checkout
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto ao carrinho
    E acessa o carrinho
    E inicia o checkout
    Então a tela de informações do cliente deve ser exibida

Preencher dados obrigatórios
    Dado que o usuário está na tela de informações do cliente
    Quando ele preenche o nome
    E preenche o sobrenome
    E preenche o cep
    E continua o checkout
    Então o resumo da compra deve ser exibido

Validar resumo da compra
    Dado que o usuário está na tela de resumo da compra  

Finalizar compra e validar mensagem de sucesso
    Dado que o usuário está na tela de resumo da compra
    Quando ele finaliza a compra

*** Keywords ***
Dado que o usuário está logado no sistema
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window
    Input Text    //input[contains(@type,'text')]    standard_user
    Input Text    //input[contains(@type,'password')]    secret_sauce
    Click Element    //input[contains(@type,'submit')]
    Sleep    2s

Quando ele adiciona o produto ao carrinho
    Click Element    (//button[@class='btn_primary btn_inventory'][contains(.,'ADD TO CART')])[1]

E acessa o carrinho
    Click Element    //a[contains(@class,'shopping_cart_link')]

E inicia o checkout
    Click Element    //a[contains(@class,'checkout_button') and text()='CHECKOUT']

Então a tela de informações do cliente deve ser exibida
    Page Should Contain Element    //input[@data-test='firstName']

Dado que o usuário está na tela de informações do cliente
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto ao carrinho
    E acessa o carrinho
    E inicia o checkout

Quando ele preenche o nome
    Input Text    //input[@data-test='firstName']    Fulano

E preenche o sobrenome
    Input Text    //input[@data-test='lastName']    Silva

E preenche o cep
    Input Text    //input[@data-test='postalCode']    12345-678

E continua o checkout
    Click Element    //input[@class='btn_primary cart_button' and @type='submit' and @value='CONTINUE']

Então o resumo da compra deve ser exibido
    Page Should Contain Element    //div[@class='summary_info']

Dado que o usuário está na tela de resumo da compra
    Dado que o usuário está na tela de informações do cliente
    Quando ele preenche o nome
    E preenche o sobrenome
    E preenche o cep
    E continua o checkout

Então deve exibir o produto no resumo    ${xpath}
    Page Should Contain Element    ${xpath}

Quando ele finaliza a compra
    Click Element    //a[contains(@class,'cart_button') and text()='FINISH']
