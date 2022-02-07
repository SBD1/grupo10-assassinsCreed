## Sugestões para novo versionamento: 

1. Uma situação de agregação podia ser criada através do relacionamento entre herói e uma nova entidade "tarefas". O herói cumpre uma tarefa, que, através da agregação, gera uma nova entidade "missão" que possui "nível" como atributo. Este recebe chave simples, por ser um atributo identificador.
2. Inimigo pode receber um atributo força, já que uma característica que pode ser nivelada.
3. As coordenadas, atributos de área e quadrado, podem ser atributos compostos, já que recebem os valores "x" e "y".
4. Talvez possamos repensar o relacionamento entre "herói" e "mercado". 
5. Talvez possamos fazer um auto-relacionamento com a entidade "personagem" através do relacionamento "interage", tendo em vista que diferentes personagens interagem entre si.
6. Não sei exatamente se os itens de um determinado mercado são infinitos. Se não forem, poderíamos acrescentar um atributo "estoque".
7. Existe algum item consumível além de remédio e poção ? Se sim, poderíamos mudar para uma restrição parcial exclusiva.
8. Em "bombas", entidade específica de "utilitários", o atributo "dano" poderia ser composto pelos atributos "alcance" e um derivado "coordenadas" (porque notei que não colocamos atributos derivados).
