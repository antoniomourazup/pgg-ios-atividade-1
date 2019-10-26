# pgg-ios-atividade-1

Atividade 1 da trilha de IOS do Programa Gerando Gênios

## About

Este script valida um json utilizando as propriedades de marcadores de arrays e objetos de uma estrutura json.

## Recursos

*  Linguagem Swift 5.1

*  Xcode 11.1

* Clean code!

## Metodologia

Nesta solução foi aplicado o conceito de pilha, a qual usa as seguintes opreções:

*  TOP: Acessa o elemento posicionado no topo da pilha

*  PUSH: Insere um novo elemento no topo da pilha

*  POP: Remove o elemento do topo da pilha

*  PULL: Altera o elemento posicionado no topo da pilha (Não aplicado)


## Funcionamento

Segue o algoritmo da solução, demonstrando o funcionamento passo a passo

1. Recebe a string

2. Remove as barras e espaços

3. Converte a string para um array

4. Lê cada caracter do array

5. Verifica se é um caracter válido. Se for válido, passo 6

6. Verifica se o caracter é do tipo open "[{" ou close "}]". Se for open, passo 7. Senão, passo 9

7. Verifica se a pilha está vazia. Se estiver vazia, passo 12. Senão, passo 8

8. Verifica se o caracter pertence à categoria do caracter do topo da pilha. Se pertencer, passo 14. Senão, passo 12

9. Verifica se a pilha está vazia. Se estiver vazia, passo 14. Senão, passo 10

10. Verifica se o caracter pertence à categoria do caracter do topo da pilha. Se pertencer, passo 11. Senão, passo 14

11. Verifica se o caracter é o inverso do caracter do topo da pilha. Se for, passo 13. Senão, passo 14

12. Adiciona caracter ao topo da pilha (PUSH)
 
13. Remove caracter do topo da pilha (POP)
 
14. Informa que o Json é inválido


## Como executar e testar

É necessário obter o projeto por meio do download direto, clone ou fork, e então abri-lo na ferramenta Playground do Xcode.

Para testar casos de jsons válidos e inválidos, descomente a string de nome stringJson conforme o teste que pretendes realizar

## Complexidade

A complexidade deste algoritmo é O (N), pois a quantidade de operações é diretamente proporcional ao tamanho do array processado.

