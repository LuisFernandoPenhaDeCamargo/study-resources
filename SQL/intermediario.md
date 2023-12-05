# Intermediário

### Sumário

5. [Joins:](#joins)
    - INNER JOIN, LEFT JOIN, RIGHT JOIN
    - JOINs Múltiplos
    - Self JOIN

6. [Funções Agregadas:](#funcoes-agregadas)
    - COUNT, SUM, AVG, MIN, MAX
    - GROUP BY, HAVING

7. [Subconsultas:](#subconsultas)
    - Subconsultas Escalares
    - Subconsultas Correlacionadas\
        - `EXISTS`
    - Subconsultas na Cláusula FROM

8. [Filtros Avançados com `%` e `LIKE`:](#filtros-avancados-com--e-like)
    - O que é `%` e `LIKE`
    - Como Utilizar `%` e `LIKE`
    - Exemplo Prático
    - Considerações e Boas Práticas

9. [Funções de Data e Hora:](#funcoes-de-data-e-hora)\
    - `FROM_UNIXTIME()`
    - `DATE_SUB()`

10. [ENUM no SQL:](#enum-no-sql)
    - O que é ENUM
    - Como Definir e Usar ENUM
    - Considerações e Boas práticas

11. [Cláusula `DELETE` no SQL: Exclusão de Registros e Tabelas](#clausula-delete-no-sql-exclusao-de-registros-e-tabelas)
    - Exclusão de Registros
    - Remoção de Tabelas
    - Considerações e Boas Práticas
 
12. [Índices e Otimização:](#indices-e-otimizacao)
    - O que São Índices
    - Como Criar Índices
    - Otimização de Consultas

# <a name = "joins"></a>Joins

### INNER JOIN, LEFT JOIN, RIGHT JOIN

### JOINs Múltiplos

### Self JOIN

# <a name = "funcoes-agregadas"></a>Funções Agregadas

Funções que operam em um conjunto de resultados para fornecer um único valor de resumo.

### COUNT, SUM, AVG, MIN, MAX

`COUNT()` é uma função em SQL, ela é utilizada para contar o número de linhas em um conjunto de resultados que atendem a uma condição específica.

`COUNT(expression)`

`expression`**:** a expressão que será contada. Pode ser opcional, dependendo da versão do SQL. Se não for fornecida, a função conta todas as linhas na tabela.

Retonar o número de linhas que atendem à condição especificada.

```sql
SELECT COUNT(*) AS total_rows
FROM users
WHERE age > 18;
```

Este exemplo conta o número de usuários na tabela `users` que tê mais de 18 anos.\
É importante notar que você pode usar `COUNT()` de várias maneiras, dependendo dos requisitos específicos da consulta. Pode ser usado com `DISTINCT`, em conjunto com outras funções de agregação, ou para contar linhas específicas em uma tabela.

### GROUP BY, HAVING

A cláusula `GROUP BY` é usada em consultas SQL para agrupar linhas com base nos valores em uma ou mais colunas. Ela é frequentemente usada em conjunto com funções de agregação, como `COUNT`, `SUM`, `AVG`, `MAX` OU `MIN`, para realizar cálculos sobre cada grupo de linhas.\
A principal finalidade da cláusula GROUP BY é permitir que você resuma dados agrupando-os com base em certos critérios. Isso é útil quando você deseja analisar dados agregados em vez de linhas individuais. Por exemplo, ao contar o número de vendas por categoria de produto ou calcular a média de pontuações por aluno.\
Considerando que o `GROUP BY` trata de todas as combinações possíves dos valores das colunas utilizadas por ele.\
Por exemplo, suponha que você tenha uma tabela chamada "vendas" com as colunas "produto", "quantidade" e "preço". Se você quiser saber a quantidade total vendida de cada produto, você pode usar a cláusula `GROUP BY` da seguinte maneira:

```sql
SELECT produto, SUM(quantidade) as total_vendido
FROM vendas
GROUP BY produto;
```

Neste exemplo, estamos agrupando as vendas por produto e calculando a soma da quantidade vendida para cada produto.

O erro `ER_WRONG_FIELD_WITH_GROUP` ocorre em bancos de dados MySQL/MariaDB quando há uma inconsistência na utilização da cláusula `GROUP BY`. O MySQL/MariaDB tem uma configuração chamada `ONLY_FULL_GROUP_BY`, que está habilitada por padrão. Quando essa configuração está ativada, o servidor de banco de dados exige que todas as colunas no SELECT que não estão sendo usadas em funções de agregação (`SUM`, `COUNT`, `MAX`, `MIN`, etc.) estejam presentes na cláusula `GROUP BY`.\
Essa configuração visa garantir que as consultas sejam semanticamente corretas e que os resultados sejam determinísticos. Em outras palavras, se você está agrupando por uma coluna, o sistema espera que todas as outras colunas no SELECT sejam derivadas ou agregadas de alguma forma. Isso ajuda a evitar resultados ambíguos.\
A solução é ajustar a cláusula `GROUP BY` para incluir todas as colunas no SELECT ou reescrever a consulta de maneira que as colunas não agregadas sejam tratadas de uma maneira que seja aceitável para a configuração `ONLY_FULL_GROUP_BY`.

# <a name = "subconsultas"></a>Subconsultas

### Subconsultas Escalares

`EXISTS()` é frequentemente usado em subconsultas escalares, onde a subconsulta retorna um conjunto de resultados que é usado para verificar a existência de registros na consulta principal.

### Subconsultas Correlacionadas

`EXISTS()` é usado em subconsultas correlacionadas para verificar a existência de registros com base em uma condição específica relacionada à consulta externa.

### `EXISTS()`

O operador `EXISTS` testa se a subconsulta associada a ele retorna algum resultado. Se a subconsulta retornar pelo menos uma linha, o operador `EXISTS` avalia como verdadeiro (`1`), caso contrário, avalia como falso (`0`).

`EXISTS(subconsulta)`

```MySQL
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customers_id = c.customers_id
);
```

### Subconsultas na Cláusula FROM

# <a name = "filtros-avancados-com--e-like"></a>Filtros Avançados com `%` e `LIKE`

O tópico "Filtros Avançados com `%` e LIKE" aborda o uso do operador `%` em conjunto com a cláusula `LIKE` no SQL para realizar filtragens mais flexíveis em consultas. Aqui estão os principais pontos desse tópico:

### O que é `%` e `LIKE`

- **Operador** `%`**:** o símbolo `%` é um curinga utilizado em conjunto com a cláusula `LIKE` para representar zero, um ou vários caracteres em uma string;
- **Cláusula** `LIKE` **:** a cláusula `LIKE` é utilizada para comparar um valor em uma coluna com um padrão de caracteres, onde `%` pode ser usado para representar qualquer sequência de caracteres.

### Como Utilizar `%` e `LIKE`

- **Correspondência exata:** se você usar `LIKE` sem o operador `%`, ele realizará uma correspondência exata. Por exemplo:

`SELECT nome FROM clientes WHERE nome LIKE 'João';`

- **Correspondência Parcial:** o uso de `%` permite realizar correspondências parciais. Por exemplo, para encontrar todos os clientes cujo nome começa com "Jo":

`SELECT nome FROM clientes WHERE nome LIKE 'Jo%';`

- **Correspondência em qualquer posição:** `%` pode ser utilizado no ínicio, no final, ou em ambos para representar caracteres antes, depois ou em ambos os lados do padrão. Por exemplo:

`SELECT nome FROM clientes WHERE nome LIKE '%ão%';`

- **Filtragem de dados flexível:** o uso de `%` e `LIKE` torna a filtragem de dados mais flexível, permitindo realizar consultas que se adequam a uma varidade de padrões.

### Exemplo Prático

Suponha que você tenha uma tabela de produtos e deseje encontrar todos os produtos que contenham a palavra "notebook" em seu nome, independentemente do que está antes ou depois. A consulta seria algo assim:

`SELECT nome_produto FROM produtos WHERE nome_produto LIKE '%notebook%';`

Essa consulta retornaria todos os registros onde o nome do produto contém a palavra "notebook" em qualquer posição.

### Considerações e Boas Práticas

- **Desempenho:** o uso indiscriminado de `%` no início de uma string pode impactar o desempenho da consulta, já que pode exigir uma varredura mais extensiva da tabela;
- **Cuidado com o Overmatching:** o uso excessivo de `%` pode levar a correspondências indesejadas, então é importante ajustar o padrão de acordo com o resultado desejado;
- **Case-sensitivity:** dependendo do banco de dados, a cláusula `LIKE` pode ser ou não case-sensitive. Certifique-se de entender o comportamento do bancos de dados que está utilizando.

Em resumo, o tópico "Filtros Avançados com `%` e `LIKE`" destaca uma técnica poderosa para realizar filtragens flexíveis e adaptáveis em consultas SQL, proporcionando versatilidade na busca por padrões em dados de texto.

# <a name = "funcoes-de-data-e-hora"></a>Funções de Data e Hora

### `FROM_UNIXTIME()`

`FROM_UNIXTIME()` converte um valor de timestamp UNIX para um valor de data e hora no formato "YYYY-MM-DD HH:MI:SS". O timestamp UNIX é um valor inteiro que representa o número de segundos desde 1970-01-01 00:00:00 UTC.

`FROM_UNIXTIME(timestamp [, format])`

- `timestamp`**:** o valor do timestamp UNIX a ser convertido;
- `format` **(opcional):** a formatação desejada da saída. Se omitido, o formato padrão "YYYY-MM-DD HH:MI:SS" será usado.

Retona uma string representando a data e hora formatada.

```sql
SELECT FROM_UNIXTIME(1609459200) AS data_fora_formatada;
```

Neste exemplo, `1609459200` é um timestamp UNIX correspondente a "2021-01-01 00:00:00". A função `FROM_UNIXTIME()` converte esse timestamp para o formato de data e hora padrão, e o resultaso será algo como "2021-01-01 00:00:00".\
Lembre-se de que o formato de saída padrão é "YYYY-MM-DD HH:MI:SS", mas você pode personalizar o formato utilizando o segundo parâmetro opcional `format`. Por exemplo:

```sql
SELECT FROM_UNIXTIME(1609459200, '%Y-%m-%d') AS data_fora_formatada;
```

Neste caso, o resultado será "2021-01-01".

### `DATE_SUB()`

`DATE_SUB()` é uma função no MySQL utilizada para subtrair um intervalo específico de uma data, ele é frequentemente utilizado para calcular uma nova data subtraindo dias, horas, minutos, etc., da data original.

`DATA_SUB(date, INTERVAL expr unit)`

- `date`**:** a data qual você deseja subtrair o intervalo. Pode ser uma expressão de data ou uma coluna de data;
- `expr`**:** a quantidade de tempo a ser subtraída. Pode ser um número inteiro ou uma expressão que resulta em um número;
- `unit`**:** a unidade do intervalo (por exemplo, DAY, MONTH, HOUR, MINUTE, etc.).

Retorna a data resultante após a subtração do intervalo.

```sql
SELECT DATE_SUB('2023-01-01', INTERVAL 7 DAY) AS nova_data;
```

Este exemplo subtrai `7` dias da data `'2023-01-01'`, resultando em `2022-12-25`.\
É importante notar que o MySQL oferece outras funções relacionadas para adicionar ou subtrair intervalos de datas, como `DATE_ADD()` para adição, e essas funções são bastante úteis em consultas SQL para manipulação de datas.

# <a name = "enum-no-sql"></a>ENUM no SQL

### O que é ENUM

### Como Definir e Usar ENUM

### Considerações e Boas práticas

Você pode usar inteiros para se referenciar à posição em um tipo `ENUM`, isso é uma prática válida e funcional no MySQL. Por exemplo, se a coluna `validate_status` é definida como um tipo `ENUM` com os valores "ativo", "inativo" e "pendente", e você atribui 1, 2 ou 3 a essa coluna, o MySQL interpretará esses valores como referências às posições correspondentes no `ENUM`.

```sql
CREATE TABLE access_token (
    validate_status ENUM('ativo', 'inativo', 'pendente')
);
```

Você pode usar a seguinte consulta para inserir dados:

`INSERT INTO access_token (validate_status) VALUES (1);`

Isso funcionará e o MySQL interpretará o valor `1` como referente à primeira posição no  `ENUM` ("`ativo`").\
No entanto, ao fazer isso, é importante garantir que os valores associados aos inteiros estejam alinhados com a ordem do `ENUM`. Se a ordem mudar no futuro, os valores dos inteiros ainda estarão associados às posições antigas.\
Se você encontrar algum comportamento inesperado, verifique se a definição do `ENUM` está correta e se os valores dos inteiros estão correspondendo à ordem desehada no `ENUM`. Se possível, use os valores literais associados diretamente para maior clareza e menos propensão  a erros.

# <a name = "clausula-delete-no-sql-exclusao-de-registros-e-tabelas"></a>Cláusula `DELETE` no SQL: Exclusão de Registros e Tabelas

### Exclusão de Registros

Para deletar registros de uma tabela em um banco de dados SQL, você pode usar a instrução SQL `DELETE`. Aqui está um exemplo básico de como você pode fazer isso:

```sql
DELETE FROM nome_da_tabela
WHERE condicao;
```

- `nome_da_tabela`**:** substitua isso pelo nome real da tabela da qual você deseja excluir registros;
- `condição`**:** especifique uma condição que determine quais registros devem ser excluídos. Se você não fornecer uma condição (`WHERE`), todos os registros da tabela serão execluídos.

Exemplo sem condição (excluir todos os registros da tabela):

`DELETE FROM minha_tabela;`

Exemplo com condição (excluir registros com base em uma condição específica):

```sql
DELETE FROM minha_tabela
WHERE id = 5;
```

Neste exemplo, os registros da tabela `minha_tabela` onde o valor da coluna `id` é igual a `5` serão excluídos.

Cuidado:

- Ao usar a instrução `DELETE`, os registros serão removidos permanentemente da tabela;
- Certifique-se de ter uma condição bem definida ou um backup dos dados antes de realizar operações de exclusão em larga escala.

### Remoção de Tabelas

Para deletar (ou dropar) uma tabela em SQL, você usa a instrução `DROP TABLE`. Aqui está um exemplo:

`DROP TABLE nome_da_tablea;`

Substitua `nome_da_tabela` pelo nome real da tabela que você deseja deletar.\
Certifique-se de ter permissões adequadas para executar essa operação, pois excluir uma tabela remove permanentemente todos os dados e a estrutura da tabela.\
Lembre-se de que esta operação é irreversível, então use com cuidado e, se possível, faça backup dos dados antes de deletar uma tabela.

### Considerações e Boas Práticas

# <a name = "indices-e-otimizacao"></a>Índices e Otimização

### O que São Índices

### Como Criar Índices

### Otimização de Consultas