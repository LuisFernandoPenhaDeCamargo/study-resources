# MySQL

### Sumário

- [Procedure x Function](#procedure-x-function)

# <a id="procedure-x-function"></a>Procedure x Function

As procedures e as functions são objetos de programação no MySQL (e em muitos outros sistemas de gerenciamento de banco de dados) que permitem realizar operações específicas dentro do banco de dados. Embora sejam semelhantes em alguns aspectos, existem algumas diferenças importantes entre elas:

1. **Procedure:**
    - Uma procedure é um conjuntos de instruções SQL que pode aceitar parâmetros de entrada e produzir resultados ou efeitos colaterais, como alterar dados no banco de dados
    - As procedures podem conter instruções SQL para executar operações complexas ou tarefas que envolvam várias consultas ou operações de controle de fluxo
    - As procedures não necessariamente retornam um valor. Elas podem executar ações no banco de dados, mas não retornam um resultado diretamente para quem as chama
    - Podem conter comandos DML (Data Manipulation Language), como INSERT, UPDATE, DELETE, bem como comandos DDL (Data Definition Language), como CREATE, ALTER, DROP
2. **Function:**
    - Uma function é um objeto que aceita parâmetros de entrada, executa um conjunto de instruções SQL e retorna um valor como resultado da operação
    - As functions são frequentemente utilizadas para realizar cálculos ou transformações de dados e retornar um valor resultante
    - As functions sempre retornam um valor e não podem executar comandos DML que alterem o estado do banco de dados. Elas são geralmente usadas para computação e retornam valores calculados
    - Não podem conter comandos DDL

Em resumo, a principal diferença entre procedures e functions é que as procedures são usadas para realizar operações e manipulação de dados no banco de dados, enquanto as functions são usadas para calcular valores e retornar resultados. As functions sempre retornam um valor, enquanto as procedures podem ou não retornar valores, mas podem executar ações no banco de dados.