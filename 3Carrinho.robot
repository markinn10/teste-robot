*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Adicionar produtos ao carrinho
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto ao carrinho    
    Então o carrinho deve conter o produto    

Remover produtos do carrinho
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto ao carrinho    
    Quando ele remove o produto do carrinho    
    Então o carrinho não deve conter o produto    

Validar itens adicionados estão corretos
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto ao carrinho    
    Quando ele adiciona o produto ao carrinho    
    Então o carrinho deve conter o produto    
    
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

Quando ele remove o produto do carrinho
    Click Element    //button[@class='btn_secondary btn_inventory'][contains(.,'REMOVE')]

Então o carrinho deve conter o produto    
    Click Element    //a[contains(@class,'shopping_cart_link')]
Então o carrinho não deve conter o produto 
    Click Element    //a[contains(@class,'shopping_cart_link')]

