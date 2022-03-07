# Análise das relações do MR 5.0 (Normalização)

|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN   | Atomicidade, monovaloração (não há relações aninhadas)   | 
| 2a. FN     | 1a. FN e ausência de dependências parciais   | 
| 3a. FN   | 2a.FN e ausência de dependências transitivas |
| Boyce Codd  | A esquerda de toda df é chave candidata |
| 4a. FN    | A esquerda de toda dm é chave candidata |

## Nova relação:

* **InstanciaDeItem = {<u>idInstancia </u> (primária), idItem}**

  * 1a. FN : Ok
  * 2a. FN : Ok
  * 3a. FN : Ok
  * FNBC : Ok 
  * 4a. FN : Ok
  <a href="Revisado"></a>
<p></p>