## Parte complexa de mais – Itens
•	Remédios, porção de força
•	Não faz sentido ter uma tabela para uma única tupla

## Personagem – Complexidade razoável
•	Pobreza de atributos

## Item / Armadura
•	Possuem atributos razoáveis

## Quadrado
•	Generalizado de mais
•	Adicionar (Descrição: “Trilha, Floresta”)

## Moeda
•	Desnecessário criar tabela moeda, poderia ser um atributo
•	Nome da moeda (Ouro)

## Tarefa
•	Objetivo e nome somente, falta mais
•	Nome, objetivos, falta relacionamento

## Falta de atributos decepcionante

## Inimigo só tem nome completo
•	Falta descrição, tamanho, raça
•	Inimigo interagir com civil

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
•	Criar as instâncias dos inimigos (Com atributos, dano, vida)]
•	Herói, mercado, inventário (Usaria instâncias do item)

## Civil só interage 1x com lutador

## Cardinalidade de forma simples sem informar mínimo e máximo

## Todo quadrado tem que ter um item ou então (0 ou 1) itens





