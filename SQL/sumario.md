# Sumário

### Iniciante:

1. [Introdução ao Banco de Dados:](iniciante.md#introducao-ao-banco-de-dados)
    - O que é um Banco de Dados
    - Tipos de Bancos de Dados (Relacional, NoSQL, etc.)
    - RDBMS (Sistema de Gerenciamento de Banco de Dados Relacional)

2. [Introdução ao SQL:](iniciante.md#introducao-ao-sql)
    - O que é SQL
    - Diferença entre SQL e MySQL, SQL Server, PostgreSQL, etc.

3. [Comandos Básicos:](iniciante.md#comandos-basicos)
    - SELECT, FROM, WHERE
    - ORDER BY, GROUP BY
    - DISTINCT, LIMIT
    - Operadores Lógicos (AND, OR, NOT)

4. [Filtragem de Dados:](iniciante.md#filtragem-de-dados)
    - WHERE com Múltiplas Condições
    - IN, BETWEEN, LIKE
    - NULL e IS NULL

### Intermediário:

5. [Joins:](intermediario.md#joins)
    - INNER JOIN, LEFT JOIN, RIGHT JOIN
    - JOINs Múltiplos
    - Self JOIN

6. [Funções Agregadas:](intermediario.md#funcoes-agregadas)
    - COUNT, SUM, AVG, MIN, MAX
    - GROUP BY, HAVING

7. [Subconsultas:](intermediario.md#subconsultas)
    - Subconsultas Escalares
    - Subconsultas Correlacionadas\
        - `EXISTS()`
    - Subconsultas na Cláusula FROM

8. [Filtros Avançados com `%` e LIKE:](intermediario.md#filtros-avancados-com--e-like)
    - O que é `%` e `LIKE`
    - Como Utilizar `%` e `LIKE`
    - Exemplo Prático
    - Considerações e Boas Práticas

9. [Funções de Data e Hora:](intermediario.md#funcoes-de-data-e-hora)
    - `FROM_UNIXTIME()`
    - `DATE_SUB()`

10. [ENUM no SQL:](intermediario.md#enum-no-sql)
    - O que é ENUM
    - Como Definir e Usar ENUM
    - Considerações e Boas práticas

11. [Índices e Otimização:](intermediario.md#indices-e-otimizacao)
    - O que São Índices
    - Como Criar Índices
    - Otimização de Consultas

### Avançado:

12. [Transações e Controle de Concorrência:](avancado.md#ransacoes-e-controle-de-concorrencia)
    - O que é uma Transação
    - COMMIT, ROLLBACK, SAVEPOINT
    - Controle de Concorrência

13. [Stored Procedures e Funções:](avancado.md#stored-procedures-e-funcoes)
    - Criar e Executar Stored Procedures
    - Parâmetros de Entrada e Saída
    - Criar e Executar Funções

14. [Triggers:](avancado.md#triggers)
    - O que são Triggers
    - Quando Usar Triggers
    - Exemplos Práticos

15. [Segurança:](avancado.md#seguranca)
    - GRANT e REVOKE
    - Níveis de Permissão
    - Melhores Práticas de Segurança em SQL

16. [Backup e Recuperação:](avancado.md#backup-e-recuperacao)
    - Estratégias de Backup
    - RESTORE e RECOVERY

17. [Noções de Modelagem de Dados:](avancado.md#nocoes-de-modelagem-de-dados)
    - Normalização
    - Relacionamentos entre Tabelas

### Prática:

18. [Projetos Práticos:](pratica.md#projetos-praticos)
    - Criar um Banco de Dados Realista
    - Implementar Consultas Complexas
    - Otimizar Consultas e Índices

19. [Ferramentas e Ambientes:](pratica.md#ferramentas-e-ambientes)
    - Uso de Ferramentas como MySQL Workbench, pgAdmin, etc.
    - Ambientes de Desenvolvimento e Produção

20. [Integração com Linguagens de Programação:](pratica.md#integracao-com-linguagens-de-programacao)
    - Como usar SQL em Conjunto com Linguagens como Python, Java, etc.
    - Acesso a Bancos de Dados por meio de APIs