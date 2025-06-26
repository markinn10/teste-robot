*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Validar a exibição da lista de produtos após login
    Dado que o usuário acessa o sistema SauceDemo
    Quando ele informa usuário "standard_user" e senha "secret_sauce"
    E clica em login
    Então a lista de produtos deve ser exibida

Visualizar detalhes de um produto
    Dado que o usuário está logado no sistema
    Quando ele clica em um produto da lista
    Então os detalhes do produto devem ser exibidos

Ordenar produtos por nome
    Dado que o usuário está logado no sistema
    Quando ele seleciona a ordenação por "Name (Z to A)"
    Então os produtos devem ser exibidos em ordem alfabética

Ordenar produtos por preço
    Dado que o usuário está logado no sistema
    Quando ele seleciona a ordenação por "Price (low to high)"
    Então os produtos devem ser exibidos do menor para o maior preço

*** Keywords ***
Dado que o usuário acessa o sistema SauceDemo
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window

Quando ele informa usuário "${usuario}" e senha "${senha}"
    Input Text    //input[contains(@type,'text')]    ${usuario}
    Input Text    //input[contains(@type,'password')]    ${senha}

E clica em login
    Click Element    //input[contains(@type,'submit')]
    Sleep    2s

Então a lista de produtos deve ser exibida
    Page Should Contain Element    //div[contains(@class,'inventory_list')]

Dado que o usuário está logado no sistema
    Dado que o usuário acessa o sistema SauceDemo
    Quando ele informa usuário "standard_user" e senha "secret_sauce"
    E clica em login

Quando ele clica em um produto da lista
    Click Element    (//div[@class='inventory_item_name'])[1]

Então os detalhes do produto devem ser exibidos
    Page Should Contain Element    //div[@class='inventory_details_desc_container']

Quando ele seleciona a ordenação por "${criterio}"
    Select From List By Label    //select[@class='product_sort_container']    ${criterio}
    Sleep    1s

Então os produtos devem ser exibidos em ordem alfabética
    Element Text Should Be    (//div[@class='inventory_item_name'])[1]    Sauce Labs Backpack

Então os produtos devem ser exibidos do menor para o maior preço
    Element Text Should Be    (//div[@class='inventory_item_price'])[1]    $7.99