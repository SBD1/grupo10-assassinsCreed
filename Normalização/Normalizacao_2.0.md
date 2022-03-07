# Análise das relações do MR 4.0 (Normalização)

|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN   | Atomicidade, monovaloração (não há relações aninhadas)   | 
| 2a. FN     | 1a. FN e ausência de dependências parciais   | 
| 3a. FN   | 2a.FN e ausência de dependências transitivas |
| Boyce Codd  | A esquerda de toda df é chave candidata |
| 4a. FN    | A esquerda de toda dm é chave candidata |

## Relações :


* **TipoDePersonagem = {<u>idPersonagem </u> (primária), tipoPersonagem}**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **Civil = {<u>ID</u> (primária), <u>nome completo</u> (secundária), posicao X, posicao Y, Área}** 
  
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **Inimigo = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, ataque, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **Aliado = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, ataque, idHeroi, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **Heroi = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, XP, moedas, idArmadura, idArma, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
  
<p></p>

* **Tarefa = {<u>ID</u>(primária), objetivo, idHeroi }**

  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Missão = {<u>Nome</u>(primária), Dificuldade, <u>idTarefa</u>(secundária),  <u>idHeroi </u>(secundária)}**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok 
  * FNBC : Ok 
  * 4a. FN : Ok 
  <a href="Revisado"></a>
<p></p> 

* **Recompensas = {<u>Missão</u>(primária), <u> Recompensa</u>(primária)}**
  
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Área = {<u>nome</u> (primária), tamanho X, tamanho Y, descrição}**
  
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Quadrado = {<u>coordenada X</u> (primária), <u> coordenada Y</u> (primária), <u>Área</u> (primária)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **ItemSeLocalizaEmQuadrado = {<u>idItem</u> (primária), coordenada X, coordenada Y, Área}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **InimigoPossuiUtilitario = {<u>idUtilitario</u>(primária), <u>idInimigo</u> (primária)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok 
  <a href="Revisado"></a>
<p></p> 

* **Consumível = {<u>id</u> (primária), descrição, valor, efeito, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Bombas = {<u>id</u> (primária), descrição, valor, dano, alcance, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : O atributo comum "alcance" liga-se ao atributo "dano", que depende funcionalmente da superchave mínima "id". Portanto, "alcance" depende transitivamente de tal superchave.
    <p></p> 
    id -> alcance
    <p></p> 
    <p></p> 
  
     |   <u>id</u>   |  descrição |    valor  |  dano | local(sigla)|
     | :---: | :---: | :---: | :---: | :---: |  
     | -  | -  |  -  |  -  | - |
    <p></p> 
    <p></p> 
  
    |   <u>dano</u>   |  alcance  |  
    |     :---:      | :---: |  
    | -  | -  |  -  |  -  |

  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente. "></a>
<p></p> 

* **Arco = {<u>id</u> (primária), descrição, valor, dano, qtdflechas, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Armas Brancas = {<u>id</u> (primária), descrição, valor, dano, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Armadura = {<u>id</u> (primária), descrição, valor, defesa, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Vantagens = {<u>Armadura</u> (primária), <u>vantagem</u> (primária)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Inventario = {<u>ID</u> (primária), tamanho}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **InventarioArmazenaItem = {<u>idItem</u> (primária), <u>idInventario</u> (primária)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Mercado = {<u>ID</u> (primária), coordenada X, coordenada Y, Área}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **MercadoPossuiItem = {<u>idMercado</u> (primária), <u>idItem</u> (primária)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **tipoDeItem = {<u>idItem</u> (primária), tipoItem}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 
