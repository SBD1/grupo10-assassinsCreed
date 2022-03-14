## Parte complexa de mais – Itens
•	Remédios, porção de força

•	Não faz sentido ter uma tabela para uma única tupla

![image](https://user-images.githubusercontent.com/51385738/158236409-19a875a1-358f-40ba-ab45-49264a2d7d41.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158236570-4fd0663a-74f2-4366-b9c5-9ac5d9c66d4c.png)


## Personagem – Complexidade razoável
•	Pobreza de atributos

![image](https://user-images.githubusercontent.com/51385738/158236631-b301d257-c304-42c6-a443-234efdaef210.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158236675-e439a110-ec5d-4592-a2f4-a3a6350f309d.png)

## Item / Armadura
•	Possuem atributos razoáveis
![image](https://user-images.githubusercontent.com/51385738/158236733-adafa229-87e1-44d5-bde7-1eeb6c9265c2.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158236770-a4016a69-4c3f-4f74-a451-e5ac06f99c9f.png)


## Quadrado
•	Generalizado de mais

•	Adicionar (Descrição: “Trilha, Floresta”)

![image](https://user-images.githubusercontent.com/51385738/158236809-359e3b42-40d3-4b6a-b579-0252d12ced71.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158236853-53791904-1ed1-41d8-a40b-cf405843aa5f.png)

## Moeda
•	Desnecessário criar tabela moeda, poderia ser um atributo

•	Nome da moeda (Ouro)

![image](https://user-images.githubusercontent.com/51385738/158236969-77a68f4a-7b06-4d5a-a9fd-f451b06db2e7.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158237061-b0083633-eecd-422a-8772-496be5dac6d2.png)


## Tarefa
•	Objetivo e nome somente, falta mais

•	Nome, objetivos, falta relacionamento

![image](https://user-images.githubusercontent.com/51385738/158237304-4a1da815-ef16-4cb0-903b-c8a2c5ebcb3a.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158237344-c1309fbf-3fe4-451e-b323-494dc1b80c4d.png)


## Falta de atributos decepcionante

## Inimigo só tem nome completo
•	Falta descrição, tamanho, raça

•	Inimigo interagir com civil

![image](https://user-images.githubusercontent.com/51385738/158237552-894115b0-6ccb-48e5-86c6-cc0a43b3c5fc.png)
### Alterações:
![image](https://user-images.githubusercontent.com/51385738/158237598-4a90b792-8afa-4a60-82fb-8103efec09a4.png)


## Falta de mecanismo de evolução de personagem

## Relacionamento 1 para 1 (inventário – Herói)
•	Cara de entidade fraca

## Mercado, personagem, item
•	Atributo x, y precisa ser um relacionamento com quadrado

•	Atributo x, y para o personagem, não é no MER que inclui isso

•	Deve ter um relacionamento com um quadrado

•	Não precisa fazer um ternário para ligar também ao item

•	Item independe do mercado, por exemplo quando o item está no chão

## Itens e inimigos
•	Herói usa vários itens, mas o item só pode ser utilizado por um herói (impede q outros possam usar o mesmo item). Seria necessário criar várias tuplas do mesmo item.

•	Cria o item uma vez e cria as instâncias

•	Criar as instâncias dos inimigos (Com atributos, dano, vida)

•	Herói, mercado, inventário (Usaria instâncias do item)

## Civil só interage 1x com lutador

## Cardinalidade de forma simples sem informar mínimo e máximo

## Todo quadrado tem que ter um item ou então (0 ou 1) itens







