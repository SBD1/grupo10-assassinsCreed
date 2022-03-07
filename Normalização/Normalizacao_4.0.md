# Análise das relações do MR 6.0 (Normalização)

|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN   | Atomicidade, monovaloração (não há relações aninhadas)   | 
| 2a. FN     | 1a. FN e ausência de dependências parciais   | 
| 3a. FN   | 2a.FN e ausência de dependências transitivas |
| Boyce Codd  | A esquerda de toda df é chave candidata |
| 4a. FN    | A esquerda de toda dm é chave candidata |

## Novas relações:

* **InstanciaDeCivil = {<u>idInstanciaCivil </u> (primária), idCivil }**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **InstanciaDeAliado = {<u>idInstanciaAliado </u> (primária), idAliado, idHeroi }**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **InstanciaDeInimigo = {<u>idInstanciaInimigo </u> (primária), <u>idInimigo </u> (primária) }**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>

* **InimigoPossuiUtilitario = {<u>idUtilitario </u> (primária), <u>idInstanciaInimigo </u> (primária) }**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>
