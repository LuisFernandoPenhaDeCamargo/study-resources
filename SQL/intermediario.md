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

8. [Funções de Data e Hora:](#funcoes-de-data-e-hora)\
    - `FROM_UNIXTIME()`

9. [ENUM no SQL](#enum-no-sql)
    - O que é ENUM
    - Como Definir e Usar ENUM
    - Considerações e Boas práticas
 
10. [Índices e Otimização:](#indices-e-otimizacao)
    - O que São Índices
    - Como Criar Índices
    - Otimização de Consultas

# <a name = "joins"></a>Joins

### INNER JOIN, LEFT JOIN, RIGHT JOIN

### JOINs Múltiplos

### Self JOIN

# <a name = "funcoes-agregadas"></a>Funções Agregadas

### COUNT, SUM, AVG, MIN, MAX

### GROUP BY, HAVING

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

# <a name = "indices-e-otimizacao"></a>Índices e Otimização

### O que São Índices

### Como Criar Índices

### Otimização de Consultas