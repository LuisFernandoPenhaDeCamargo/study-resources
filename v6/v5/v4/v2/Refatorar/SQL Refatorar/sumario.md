# Sumário

### Iniciante:

1. [Introdução ao Banco de Dados:](iniciante.md#introducao-ao-banco-de-dados)
    - O que é um Banco de Dados
    - Tipos de Bancos de Dados (Relacional, NoSQL, etc.)
    - RDBMS (Sistema de Gerenciamento de Banco de Dados Relacional)

2. [Introdução ao SQL:](iniciante.md#introducao-ao-sql)
    - O que é SQL
    - Diferença entre SQL e MySQL, SQL Server, PostgreSQL, etc.

3. [Palavras Reservadas](iniciante.md#palavras-reservadas)
    - `USER`
    - `IDENTIFIED BY`
    - Sintaxe de Criação e Alteração de Usuários

4. [Comandos Básicos:](iniciante.md#comandos-basicos)
    - SELECT, FROM, WHERE
    - ORDER BY, GROUP BY
    - DISTINCT, LIMIT
    - Operadores Lógicos (AND, OR, NOT)

5. [Filtragem de Dados:](iniciante.md#filtragem-de-dados)
    - WHERE com Múltiplas Condições
    - IN, BETWEEN, LIKE
    - NULL e IS NULL

### Intermediário:

6. [Joins:](intermediario.md#joins)
    - INNER JOIN, LEFT JOIN, RIGHT JOIN
    - JOINs Múltiplos
    - Self JOIN

7. [Funções Agregadas:](intermediario.md#funcoes-agregadas)
    - COUNT, SUM, AVG, MIN, MAX
    - GROUP BY, HAVING

8. [Ordem de Execução da Consulta SQL:](intermediario.md#ordem-de-execucao-da-consulta-sql)
    - Ordem Típica de Processamento
    - Impacto das Junções e Condições WHERE
    - Otimização de Consultas

9. [Subconsultas:](intermediario.md#subconsultas)
    - Subconsultas Escalares
    - Subconsultas Correlacionadas\
        - `EXISTS()`
    - Subconsultas na Cláusula FROM

10. [Filtros Avançados com `%` e LIKE:](intermediario.md#filtros-avancados-com--e-like)
    - O que é `%` e `LIKE`
    - Como Utilizar `%` e `LIKE`
    - Exemplo Prático
    - Considerações e Boas Práticas

11. [Funções de Data e Hora:](intermediario.md#funcoes-de-data-e-hora)
    - `FROM_UNIXTIME()`
    - `DATE_SUB()`

12. [ENUM no SQL:](intermediario.md#enum-no-sql)
    - O que é ENUM
    - Como Definir e Usar ENUM
    - Considerações e Boas práticas

13. [Índices e Otimização:](intermediario.md#indices-e-otimizacao)
    - O que São Índices
    - Como Criar Índices
    - Otimização de Consultas

14. [Definição de Tabelas no MySQL (Cláusula `CREATE` e `TABLE`):](intermediario.md#definicao-de-tabelas-no-mysql-clausula-create-e-table)
    - Criando Tabelas
    - Como Criar Índices
    - Tipos de Dados
    - Restrições
    - Chave Primária
    - `CONSTRAINT`
    - `ENGINE` (Motor de Armazenamento), `CHARSET` (Conjunto de Caracteres) e `COLLATE` (Ordenação e Comparação de Caracteres)

15. [Notação e Referências a Objetos no SQL:](intermediario.md#notacao-e-referencias-a-objetos-no-sql)

16. [Cláusula `ALTER`:](intermediario.md#clausula-alter)

17. [Cláusula `DELETE` no SQL: Exclusão de Registros e Tabelas](intermediario.md#clausula-delete-no-sql-exclusao-de-registros-e-tabelas)
    - Exclusão de Registros
    - Remoção de Tabelas
    - Considerações e Boas 
    
18. [Cláusula `SHOW`:](intermediario.md#clausula-show)\
    - `WARNINGS`
    - Avisos

19. [Explorando a Tabela `INFORMATION_SCHEMA`](intermediario.md#explorando-a-tabela-information_schema)

20. [Explorando o Banco de Dados `mysql`:](intermediario.md#explorando-o-banco-de-dados-mysql)

21. [Mensagens de Erro no MySQL:](intermediario.md#mensagens-de-erro-no-mysql)

### Avançado:

22. [Transações e Controle de Concorrência:](avancado.md#ransacoes-e-controle-de-concorrencia)
    - O que é uma Transação
    - COMMIT, ROLLBACK, SAVEPOINT
    - Controle de Concorrência

23. [Stored Procedures e Funções:](avancado.md#stored-procedures-e-funcoes)
    - Criar e Executar Stored Procedures
    - Parâmetros de Entrada e Saída
    - Criar e Executar Funções

24. [Triggers:](avancado.md#triggers)
    - O que são Triggers
    - Quando Usar Triggers
    - Exemplos Práticos

25. [Segurança:](avancado.md#seguranca)
    - GRANT e REVOKE
    - Níveis de Permissão
    - Melhores Práticas de Segurança em SQL

26. [Backup e Recuperação:](avancado.md#backup-e-recuperacao)
    - Estratégias de Backup
    - RESTORE e RECOVERY

27. [Noções de Modelagem de Dados:](avancado.md#nocoes-de-modelagem-de-dados)
    - Normalização
    - Relacionamentos entre Tabelas

### Prática:

28. [Projetos Práticos:](pratica.md#projetos-praticos)
    - Criar um Banco de Dados Realista
    - Implementar Consultas Complexas
    - Otimizar Consultas e Índices

29. [Ferramentas e Ambientes:](pratica.md#ferramentas-e-ambientes)
    - Uso de Ferramentas como MySQL Workbench, pgAdmin, etc.
    - Ambientes de Desenvolvimento e Produção

30. [Integração com Linguagens de Programação:](pratica.md#integracao-com-linguagens-de-programacao)
    - Como usar SQL em Conjunto com Linguagens como Python, Java, etc.
    - Acesso a Bancos de Dados por meio de APIs