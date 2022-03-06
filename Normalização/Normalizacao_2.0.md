# Análise das relações do MR 4.0 (Normalização)

|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN   | Atomicidade, monovaloração (não há relações aninhadas)   | 
| 2a. FN     | 1a. FN e ausência de dependências parciais   | 
| 3a. FN   | 2a.FN e ausência de dependências transitivas |
| Boyce Codd  | A esquerda de toda df é chave candidata |
| 4a. FN    | A esquerda de toda dm é chave candidata |

## Relações :


* **TipoDePersonagem = {<u>idPersonagem,</u> tipoPersonagem}**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **Civil = {<u>ID</u> (primária), <u>nome completo</u> (secundária), posicao X, posicao Y, Área}** 
  
  * 1a. FN : Ok
  * 2a. FN : Ok (Rever se os atributos dependem parcialmente )
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
<p></p>

* **Inimigo = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, ataque, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok (Rever se os atributos dependem parcialmente )
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
<p></p>

* **Aliado = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, ataque, idHeroi, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok (Rever se os atributos dependem parcialmente )
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
<p></p>

* **Heroi = {<u>ID</u> (primária), <u>nome completo</u> (secundária), velocidade, vida, XP, moedas, idArmadura, idArma, posicao X, posicao Y, Área}**

  * 1a. FN : Ok
  * 2a. FN : Ok (Rever se os atributos dependem parcialmente )
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  
<p></p>

* **Tarefa = {<u>ID</u>, objetivo, idHeroi }**

  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Missão = {<u>Nome</u>(primária), Dificuldade, <u>idTarefa</u>(secundária),  <u>idHeroi </u>(secundária)}**

  * 1a. FN : Ok
  * 2a. FN : O atributo comum "Dificuldade" depende parcialmente da chave candidata "Nome".
  <p></p> 
  
     |   <u>Nome</u>   |  <u>idTarefa</u>  |    <u>idHeroi </u>  |  
     |     :---:      | :---: |  :---: | 
     | -  | -  |  -  |  -  |
  <p></p> 
  <p></p> 
  
  |   <u>Nome</u>   |  Dificuldade  |  
  |     :---:      | :---: |  
  | -  | -  |  -  |  -  |
 
  * 3a. FN : Ok (para as duas relações)
  * FNBC : Ok (para as duas relações)
  * 4a. FN : Ok (para as duas relações, caso o campo de idHeroi não possa ser preenchido com valores sequenciais)
  <a href="Rever 2a FN, chave de idheroi e oque este atributo representa"></a>
<p></p> 

* **Recompensas = {<u>Missão</u>, <u> Recompensa</u>}**
  
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Área = {<u>nome</u>, tamanho X, tamanho Y, descrição}**
  
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente (confirmar se os tamanhos X e Y têm relação com a descrição)"></a>
<p></p> 

* **Quadrado = {<u>coordenada X</u>,           <u> coordenada Y</u>, <u>Área</u>}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **ItemSeLocalizaEmQuadrado = {<u>idItem</u>, coordenada X, coordenada Y, Área}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **InimigoPossuiUtilitario = {<u>idUtilitario</u>, <u>idInimigo</u>}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok (Analisar a possibilidade de uma dependência multivalorada idUtilitario -> idInimigo)
  <a href="Revisado parcialmente"></a>
<p></p> 

* **Consumível = {<u>id</u>, descrição, valor, efeito, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente. Confirmar se valor faz parte da descrição"></a>
<p></p> 

* **Bombas = {<u>id</u>, descrição, valor, dano, alcance, local (sigla)}**
 
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
  <a href="Revisado parcialmente. Confirmar se valor faz parte da descrição"></a>
<p></p> 

* **Arco = {<u>id</u>, descrição, valor, dano, qtdflechas, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente. Confirmar se valor faz parte da descrição"></a>
<p></p> 

* **Armas Brancas = {<u>id</u>, descrição, valor, dano, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente. Confirmar se valor faz parte da descrição"></a>
<p></p> 

* **Armadura = {<u>id</u>, descrição, valor, defesa, local (sigla)}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado parcialmente. Confirmar se valor faz parte da descrição"></a>
<p></p> 

* **Vantagens = {<u>Armadura</u>, <u>vantagem</u>}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Inventario = {<u>ID</u>, tamanho}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **InventarioArmazenaItem = {<u>idItem</u>, <u>idInventario</u>}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **Mercado = {<u>ID</u>, coordenada X, coordenada Y, Área}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **MercadoPossuiItem = {<u>idMercado</u>, <u>idItem</u>}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 

* **tipoDeItem = {<u>idItem</u>, tipoItem}**
 
  * 1a. FN : Ok
  * 2a. FN : Ok 
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p> 
