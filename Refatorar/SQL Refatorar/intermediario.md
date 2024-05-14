# Intermediário

### Sumário

6. [Joins:](#joins)
    - INNER JOIN, LEFT JOIN, RIGHT JOIN
    - JOINs Múltiplos
    - Self JOIN

7. [Funções Agregadas:](#funcoes-agregadas)
    - COUNT, SUM, AVG, MIN, MAX
    - GROUP BY, HAVING

8. [Ordem de Execução da Consulta SQL:](#ordem-de-execucao-da-consulta-sql)
    - Ordem Típica de Processamento
    - Impacto das Junções e Condições WHERE
    - Otimização de Consultas

9. [Subconsultas:](#subconsultas)
    - Subconsultas Escalares
    - Subconsultas Correlacionadas\
        - `EXISTS`
    - Subconsultas na Cláusula FROM

10. [Filtros Avançados com `%` e `LIKE`:](#filtros-avancados-com--e-like)
    - O que é `%` e `LIKE`
    - Como Utilizar `%` e `LIKE`
    - Exemplo Prático
    - Considerações e Boas Práticas

11. [Funções de Data e Hora:](#funcoes-de-data-e-hora)\
    - `FROM_UNIXTIME()`
    - `DATE_SUB()`

12. [ENUM no SQL:](#enum-no-sql)
    - O que é ENUM
    - Como Definir e Usar ENUM
    - Considerações e Boas práticas
 
13. [Índices e Otimização:](#indices-e-otimizacao)
    - O que São Índices
    - Como Criar Índices
    - Otimização de Consultas

14. [Definição de Tabelas no MySQL (Cláusula `CREATE` e `TABLE`):](#definicao-de-tabelas-no-mysql-clausula-create-e-table)
    - Criando Tabelas
    - Como Criar Índices
    - Tipos de Dados
    - Restrições
    - Chave Primária
    - `CONSTRAINT`
    - `ENGINE` (Motor de Armazenamento), `CHARSET` (Conjunto de Caracteres) e `COLLATE` (Ordenação e Comparação de Caracteres)

15. [Notação e Referências a Objetos no SQL:](#notacao-e-referencias-a-objetos-no-sql)

16. [Cláusula `ALTER`:](#clausula-alter)

17. [Cláusula `DELETE` no SQL: Exclusão de Registros e Tabelas](#clausula-delete-no-sql-exclusao-de-registros-e-tabelas)
    - Exclusão de Registros
    - Remoção de Tabelas
    - Considerações e Boas Práticas

18. [Cláusula `SHOW`:](#clausula-show)
    - `WARNINGS`
    - Avisos

19. [Explorando a Tabela `INFORMATION_SCHEMA`](#explorando-a-tabela-information_schema)

20. [Explorando o Banco de Dados `mysql`:](#explorando-o-banco-de-dados-mysql)

21. [Mensagens de Erro no MySQL:](#mensagens-de-erro-no-mysql)

# <a name = "joins"></a>Joins

### INNER JOIN, LEFT JOIN, RIGHT JOIN

A cláusula `LEFT JOIN` (também conhecida como `LEFT OUTER JOIN`) é utilizada em SQL para combinar linhas de duas ou mais tabelas com base em uma condição de junção e retorna todas as linhas da tabela à esquerda, mesmo que não haja correspondência na tabela à direita. Se não houver correspondência, as colunas da tabela à direita serão preenchidas com valores nulos.\
A sintaxe básica é a seguinte:

```sql
SELECT *
FROM tabela_esquerda
LEFT JOIN tabela_direita ON tabela_esquerda.coluna = tabela_direita.coluna;
```

Aqui estão algumas características-chave do `LEFT JOIN`:

- `tabela_esquerda`**:** a tabela da qual você deseja obter todas as linhas, independentemente da correspondência;
- `tabela_direita`**:** a tabela com a qual você deseja combinar as linhas;
- `coluna`**:** a condição de junção que determina como as linhas devem ser combinadas.

Vamos considerar ainda alguns pontos sobre a palavra **correspondência**, ela trata sobre a condição especificada no `ON`. Considerando o código SQL acima, a saída desta seleção irá incluir todos os valores da coluna `tabela_esquerda.coluna`, por se tratar de um `LEFT JOIN`, mesmo que não tenha um valor **correspondete, igual**, na `tabela_direita`.\
Quando você trata da junção das tabelas (dos registros que possuem correspondência), está considerando todas as aparições, todos os valores da coluna especificada na condição `ON`.
Exemplo prático:\
Suponha que você tenha duas tabelas, `clientes` e `pedidos`, e deseja obter todos os clientes, mesmo aqueles que não fizeram nenhum pedido ainda:

```sql
SELECT clientes.*, pedidos.*
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
```

Neste exemplo, a cláusula `LEFT JOIN` retorna todas as linhas da tabela `clientes` e combina com as linhas correspondentes da tabela `pedidos`. Se um cliente não tiver pedido, as colunas relacionadas a `pedidos` serão preenchidas com valores nulos.\
É importante escolher a condição de junção apropriada, geralmente usando as chaves primárias e estrangeiras, para garantir que as linhas sejam combinadas corretamente\
Em resumo, o `LEFT JOIN` é uma operação de junção que mantém todos os registros da tabela à esquerda, independente da existência de correspondências na tabela à direita, tornando-o uma ferramenta valiosa em consultas SQL para combinar e analisar dados de várias fontes.

A cláusula `INNER JOIN` em SQL é usada para combinar linhas de duas ou mais tabelas com base em uma condição de junção e retorna apenas as linas que têm correspondência nas tabelas à esquerda e à direita. Se não houver correspondência, essas linhas não serão incluídas no resultado.\
Quando você especifica apenas `JOIN` sem especificar um tipo específico de `JOIN` (`INNER`, `LEFT`, `RIGHT`, `FULL`, etc.), o tipo de `JOIN` padrão é um `INNER JOIN`.\
A sintaxe básica é semelhante à do `LEFT JOIN`:

```sql
SELECT *
FROM tabela1
INNER JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
```

Aqui estão alguns pontos-chave sobre o `INNER JOIN`:

- `tabela1` **e** `tabela2`**:** as tabelas que você deseja combinar;
- `coluna`**:** a condição de junção que determina como as linhas devem ser combinadas.

Exemplo prático:

Suponha que você tenha duas tabelas, `clientes` e `pedidos`, e deseja obter apenas os clientes que fizeram pedidos:

```sql
SELECT clientes.*, pedidos.*
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
```

Neste exemplo, apenas os clientes que têm correspondência com os pedidos serão inckuídos no resultado.\
O `INNER JOIN` é frequentemente usado quando você está interessado apenas nas linhas que têm correspondência em ambas as tabelas. Diferentemente do `LEFT JOIN`, ele não incluirá linhas da tabela à esquerda que não têm correspondência na tabela à direita.

### `JOIN`s Múltiplos

Qunado você realiza múltiplos `JOIN`s em uma consulta SQL, essas junções são aplicadas em sequência e de forma linear. Cada junção é aplicada ao conjunto de resultados obtido pela junção anterior.\
A ordem em que você especifica as junções é importante, pois ela determina como as tabelas estão relacionadas umas com as outras. A tabela resultante de uma junção é usada como base para a próxima junção.\
Considere o exemplo abaixo:

```sql
SELECT clientes.*, pedidos.*, itens_pedido.*
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
LEFT JOIN itens_pedido ON pedidos.id = itens_pedido.pedido_id;
```

Neste exemplo:

- O primeiro `LEFT JOIN` é entre `clientes` e `pedidos`;
- O resultado dessa junção (`clientes` + `pedidos`) é então usado como base para o segundo `LEFT JOIN` com `itens_pedido`.

Se você trocar a ordem das junções, a consulta pode fornecer resultados diferentes, pois a relação entre as tabelas mudará:

```sql
SELECT clientes.*, pedidos.*, itens_pedido.*
FROM pedidos
LEFT JOIN clientes ON pedidos.cliente_id = clientes.id
LEFT JOIN itens_pedido ON pedidos.id = itens_pedido.pedido_id;
```

A ordem das tabelas nas junções influencia como as relações são estabelecidas, e você deve escolher a ordem que faz sentido para a lógica da sua consulta e a estrutura do seu banco de dados.

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

O erro `ER_WRONG_FIELD_WITH_GROUP` ocorre em bancos de dados MySQL/MariaDB quando há uma inconsistência na utilização da cláusula `GROUP BY`. O MySQL/MariaDB tem uma configuração chamada `ONLY_FULL_GROUP_BY`, que está habilitada por padrão. Quando essa configuração está ativada, o servidor de banco de dados exige que todas as colunas no `SELECT` que não estão sendo usadas em funções de agregação (`SUM`, `COUNT`, `MAX`, `MIN`, etc.) estejam presentes na cláusula `GROUP BY`.\
Essa configuração visa garantir que as consultas sejam semanticamente corretas e que os resultados sejam determinísticos. Em outras palavras, se você está agrupando por uma coluna, o sistema espera que todas as outras colunas no SELECT sejam derivadas ou agregadas de alguma forma. Isso ajuda a evitar resultados ambíguos.\
A solução é ajustar a cláusula `GROUP BY` para incluir todas as colunas no SELECT ou reescrever a consulta de maneira que as colunas não agregadas sejam tratadas de uma maneira que seja aceitável para a configuração `ONLY_FULL_GROUP_BY`.\
Abaixo, segue um exemplo que mostra como é importante incluir todas as colunas do `SELECT` que não estão sendo usadas em funções de agregação no `GROUP BY`. O porque isso é importante para garantir que os resultados sejam determinísticos.

```sql
SELECT sg.*, g.shortname, g.type, g.compilation_path, g.make_file, g.graphic_project, gsi.sku 
FROM stand_games sg
LEFT JOIN games g ON g.id = sg.id
LEFT JOIN game_sku_identifier gsi ON gsi.game_id = sg.id
WHERE enabled = 1
GROUP BY sg.u_id
```

A query acima gera um conjunto de resultados como o

| u_id | id | name | data_key | path | created | enabled | board | lang_es | lang_en | lang_pt | lang_global | shortname | type | compilation_path | make_file | graphic_project | sku |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 26 | 439 | Super Lion s000 | 06ad9b32c1b602b2e28b98ebe2f9dad0 | LIOPER-1SQ | 2021-03-30 10:34:04.000 | 1 | 1 | 1 | 0 | 1 | 0 | super-lion | standalone | gaminator | lion-super | orion | ES-STPA/SUPION-1SQ |

e foi percebido que por não respeitar a "regra" do "`ONLY_FULL_GROUP_BY`" (o DBeaver permite que a query acima seja executada), um registro acabou não sendo incluido:

| u_id | id | name | data_key | path | created | enabled | board | lang_es | lang_en | lang_pt | lang_global | shortname | type | compilation_path | make_file | graphic_project | sku |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 26 | 439 | Super Lion s000 | 06ad9b32c1b602b2e28b98ebe2f9dad0 | LIOPER-1SQ | 2021-03-30 10:34:04.000 | 1 | 1 | 1 | 0 | 1 | 0 | super-lion | standalone | gaminator | lion-super | orion | PT-STPA/SUPION-1SQ |

(a única coluna que tem o valor diferente é a `sku`). Tudo isso por conta de como o `GROUP BY` foi estruturado (quando a regra é respeitada, o registro acima é incluído nos resultados). Com isso verificamos o porque da existência da regra, a sua importância e aplicação.

# <a name = "ordem-de-execucao-da-consulta-sql"></a>Ordem de Execução da Consulta SQL

### Ordem Típica de Processamento

A ordem típica de processamento em uma consulta SQL é a seguinte:

- `FROM`**:** as tabelas especificadas no `FROM` são combinadas usando as condições de junção, resultando no conjunto de dados combinado;
- `JOIN`**:** se existirem cláusulas `JOIN` adicionais, elas são aplicadas ao conjunto de dados combinado;
- `WHERE`**:** as condições especificadas na cláusula `WHERE` são aplicadas ao conjunto de dados resultante das junções. Isso filtra as linhas com base em condições específicas;
- `GROUP BY`**:** se houver uma cláusula `GROUP BY`, o conjunto de dados é agrupado de acordo com as colunas especificadas;
- `HAVING`**:** se houver uma cláusula `HAVING`, ela é aplicada às linhas agrupadas para filtrar o resultado;
- `SELECT`**:** a seleção das colunas é feita para determinar quais colunas serão incluídas no resultado final;
- `ORDER BY`**:** se houver uma cláusula `ORDER BY`, o resultado final é ordenado de acordo com as especificações.

Isso representa a ordem lógica geral de processamento de uma consulta SQL. Vale ressaltar que, embora seja a ordem lógica, os otimizadores de banco de dados podem ajustar a ordem física de execução para otimizar o desempenho da consulta.\
Portanto, ao escrever consultas complexas, é útil ter uma compreensão clara da ordem de processamento para garantir que as condições sejam aplicadas de acordo com as expectativas.

### Impacto das Junções e Condições WHERE

### Otimização de Consultas

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

# <a name = "indices-e-otimizacao"></a>Índices e Otimização

Considerando o código baixo:

```sql
CREATE TABLE `stand_games_set` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `game_id` int(11) NOT NULL,
    `game_set` varchar(50) DEFAULT NULL,
    `created` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `fk_stand_game_id` (`game_id`),
    CONSTRAINT `fk_stand_game_id` FOREIGN KEY (`game_id`) REFERENCES `oriongames_testnew`.`stand_games` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

Neste contexto, a palavra chave `KEY` é usada para criar um índice chamado "`fk_stand_game_id`" na coluna "`game_id`" da tabela "`stand_games_set`". Ese índice não é uma chave primária, mas sim um índice que melhora o desempenho das consultas que envolvem a coluna "`game_id`". Considere a parte relevante do código:

`KEY \`fk_stand_game_id\` (\`game_id\`),`

Isso cria um índice chamado "`fk_stand_game_id`" na coluna "`game_id`" da tabela "`stand_games_set`". Esse índice pode ser usado para acelerar as operações de busca e junção que envolvem a coluna "`game_id`". No entanto, é importante observar que esse índice não impõe restrições de chave estrangeira, como um índice primário ou exclusivo faria.

### O que São Índices

### Como Criar Índices

### Otimização de Consultas

# <a name = "definicao-de-tabelas-no-mysql-clausula-create-e-table"></a>Definição de Tabelas no MySQL (Cláusula `CREATE` e `TABLE`)

- `CREATE`**:**
    - A cláusula `CREATE` é usada para criar objetos em um banco de dados, como tabelas, índices, ou mesmo o próprio banco de dados;
    - Po deser seguida por outras cláusulas, como `TABLE`, `INDEX`, `DATABASE`, etc., dependendo do que você está tentando criar.
- `TABLE`**:** a cláusula `TABLE` é usada com `CREATE` para especificar que você está criando uma tabela no banco de dados.

### Criando Tabelas

Sintaxe:

`CREATE TABLE nome_da_tabela1 (coluna1 tipo1, coluna2 tipo2, ...);`

### Como Criar Índices

### Tipos de Dados

### Restrições

As restrições em SQL são regras ou condições aplicadas a colunas, tabelas ou relações entre tabelas para garantir a integridade dos dados e a consistência das operações no banco de dados. Elas são usadas para impor regras de negócios, garantir que os dados atendam a certos critérios e manter a integridade referencial entre tabelas. Vamos explorar alguns tipos comuns de restrições em SQL:

1. **Chave primária (**`PRIMARY KY`**):**
    - A restrição de chave primária é usada para identificar exclusivamente cada registro em uma tabela. Uma tabela pode ter apenas uma chave primária, e geralmente é usada na coluna que contém identificadores únicos para cada linha;
    - Exemplo:

```sql
CREATE TABLE exemplo (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

ou

```sql
CREATE TABLE exemplo (
    id INT,
    name VARCHAR(50),
    PRIMARY KEY(id)
);
```

2. **Chave estrangeira (**`FOREIGN KEY`**):**
    - A restrição de chave estrangeira estabelece uma relação entre duas tabelas, garantindo que os valores em uma coluna correspondam aos valores em outra coluna em uma tabela relacionada. Com isso podemos deduzir que os tipos de ambas as colunas devem ser compatíveis,
    - Exemplo:

```sql
CREATE TABLE pedido (
    id INT PRIMARY KEY,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES cliente(id)
)
```

3. **Restrição** `UNIQUE`**:**
    - A restrição `UNIQUE` garante que todos os valores em uma coluna (ou em um conjunto de colunas) sejam únicos em uma tabela;
    - Exemplo:

```sql
CREATE TABLE usuario (
    id INT PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    senha VARCHAR(20)
);
```

4. **Restrição** `CHECK`**:**
    - A restrição `CHECK` define uma condição que os valores em uma coluna devem atender. Isso é útil para impor regras de negócios específicas;
    - Exemplo:

```sql
CREATE TABLE (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10,2) CHECK (preco >= 0)
);
```

5. **Restrição** `NOT NULL`**:**
    - A restrição `NOT NULL` garante que uma coluna não pode ter valores nulos;
    - Exemplo:

```sql
CREATE TABLE pessoa (
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT
);
```

### Chave Primária

A chave primária é uma restrição de integridade referencial que impõe duas condições principais:

- **Unicidade:** cada valor na coluna ou conjunto de colunas designadas como chave primária deve ser único em toda a tabela. Isso garante que não haja registros duplicados com base nos valores da chave primária;
- **Não nulidade:** os valores na chave primária não podem ser nulos. Isso significa que cada registro na tabela deve ter um valor não nulo na coluna ou conjunto de colunas que compõem a chave primária.

Quando falamos "conjunto de colunas" é porque você pode ter uma chave primária composta, que consiste em mais de uma coluna. Nesse caso, a combinação dessas colunas deve ser única em toda a tabela. Aqui está um exemplo de criação de uma chave primária composta:

```sql
CREATE TABLE exemplo (
    coluna1 INT,
    coluna2 INT,
    PRIMARY KEY (coluna1, coluna2)
);
```

Neste exemplo, `(coluna1, coluna2)` forma uma chave primária composta, o que significa que a combinação de valores nessas duas colunas deve ser única para cada registro na tabela.\
Ao definir uma chave primária em uma tabela, você está aplicando restrições para garantir a integridade e consistência dos dados armazenados.

### `CONSTRAINT`

`CONSTRAINT` é uma palavra chave (não uma cláusula) utilizada para impor diversas restrições sobre as colunas de uma tabela. Essa palavra chave permite especificar diferentes tipos de restrições, como chaves primárias, chaves estrangeiras, restrições `CHECK`, e assim por diante.\
Com ela, você pode nomear a restrição.

```sql
CREATE TABLE exemplo (
    id INT,
    name VARCHAR(50),
    CONSTRAINT pk_exemplo PRIMARY KEY (id),
    CONSTRAINT chck_name_length CHECK (LENGTH(name) <= 50)
);
```

Caso você não forneça um nome para a restrição, o sistema de gerenciamento de banco de dados geralmente criará um nome automaticamente.

### `ENGINE` (Motor de Armazenamento), `CHARSET` (Conjunto de Caracteres) e `COLLATE` (Ordenação e Comparação de Caracteres)

O trecho "`ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci`" é uma parte da declaração `CREATE TABLE` que especifica o motor de armazenamento e o conjunto de caracteres padrão para uma tabela no **MySQL** (ou em alguns outros sistemas de gerenciamento de banco de dados compatíveis com MySQL).

1. `ENGINE` **(Motor de Armazenamento):**\
    - `ENGINE=InnoDB`**:** o `InnoDB` é um dos motores de armazenamento disponíveis no MySQL. Ele oferece suporte a transações ACID (Atomicidade, Consistência, Isolamento e Durabilidade), o que é crucial para integridade e a confiabilidade dos dados em sistemas de banco de dados.

2. `CHARSET` **(Conjunto de Caracteres):**\
    - `DEFAULT CHARSET=latin1`**:** define o conjunto de caracteres padrão para a tabela. Neste caso, é o conjunto de caracteres "`latin1`". Isso determina como os dados de texto são amarzenados e interpretados;
    - `DEFAULT CHARSET=utf8mb4`**:** o conjunto de caracteres `utf8mb4` é uma extensão do conjunto de caracteres `utf8` que suporta caracteres fora do Plano Multilíngue Básico (BMP), ele é frequentemente recomendado para lidar com uma ampla gama de caracteres.

3. `COLLATE` **(Ordenação e Comparação de Caracteres):**\
    - `COLLATE=latin1_swedish_ci`**:** o `COLLATE` define a ordenação e comparação de caracteres para operações como ordenação e comparação de strings. Neste exemplo, `latin1_swedish_ci` especifica uma ordenação (collation) que é case-insensitive (ci) e segue as regras de ordenação do alfabeto sueco (swedish). Isso significa que as comparações de strings serão insensíveis a maiúsculas e minúnculas, e a ordenação seguirá as regras do alfabeto sueco;
    - `COLLATE=utf8mb4_general_ci`**:** neste caso, o conjunto de caracteres é `utf8mb4`, que suporta uma ampla variedade de caracteres, incluindo emojis e caracteres especiais; `ci`, indica que a comparação de caracteres é insensível a maiúsculas e minúsculas (case-insensitive).

Essas configurações são importantes porque afetam como os dados são armazenados e manipulados no nível do banco de dados. A escolha do motor de armazenamento pode influenciar o desempenho e as capacidades transacionais, enquanto o conjunto de caracteres e a ordenação afetam diretamente a manipulação de dados de texto.\
Certifique-se de escolher o conjunto de caracteres e a ordenação apropriados para os requisitos do seu aplicativo e de entender as características do motor de armazenamento escolhido em termos de transações, bloqueios e outros recursos relacionados ao gerenciamento de dados.\
Outra configuração é a `AUTO_INCREMENT`, especificada também após os parênteses no momento de criação da tabela. Vamos exemplificar esta configuração para facilitar a sua compreensão:

`AUTO_INCREMENT = 110`

Isto indica que a coluna auto incrementada começará a contar a partir do valor 110. Quer dizer então que essa configuração é usada em colunas do tipo `AUTO_INCREMENT` em MySQL e significa que o valor dessa coluna será automaticamente incrementado para cada novo registro inserido na tabela.\
Isso significa que quando você inserir um novo registro na tabela e não fornecer um valor específico para a coluna auto incrementada, o MySQL irá automaticamente atribuir um valor incremental começando em 110 e, em seguida, aumentando para 111, 112 e assim por diante para cada nova inserção.\
Essa funcionalidade é frequentemente utilizada para criar chaves primárias únicas e incrementadas automaticamente em tabelas, facilitando a identificação única de cada registro na tabela.
É importante notar que em um campo auto incremental, caso você não especifique um valor, o maior valor é considerado como o anterior; além de que, considerando o caso acima, você pode especificar um valor menor que 110, mas caso você não o especifique, o MySQL contará a partir dele. Ou seja, não é uma restrição, mas uma especificação que o MySQL deve seguir, você não.

### Propriedades do MySQL

No MySQL, cada tabela pode ter apenas uma coluna auto incremental, normalmente ela é uma chave primária.

# <a name = "notacao-e-referencias-a-objetos-no-sql"></a>Notação e Referências a Objetos no SQL

Para entender melhor o funcionamento deste tópico, considere o código abaixo:

```sql
CREATE TABLE `stand_games_set` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `game_id` int(11) NOT NULL,
    `game_set` varchar(50) DEFAULT NULL,
    `created` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `fk_stand_game_id` (`game_id`),
    CONSTRAINT `fk_stand_game_id` FOREIGN KEY (`game_id`) REFERENCES `oriongames_testnew`.`stand_games` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

Em `\`CONSTRAINT \`fk_stand_game_id\` FOREIGN KEY (\`game_id\`) REFERENCES \`oriongames_testnew\`.\`stand_games\` (\`u_id\`)`, você consegue identificar que `oriongames_testnew` é outro banco de dados por causa da notação de ponto.\
No contexto do SQL, a notação com ponto (`.`) é geralmente usada para separar o nome do banco de dados, o nome da tabela e o nome da coluna. Portanto, em uma notação típica:

`banco_de_dados.tabela.coluna`

Ou seja, considerando o recorte de código acima:

- `oriongames_testnew`**:** é o nome do banco de dados;
- `stand_games`**:** é o nome da tabela dentro desse banco de dados;
- `u_id`**:** é nome da coluna na tabela `stand_games` (observe que no código em questão esta coluna está entre parênteses, fugindo da notação típica).

Tenha em mente que a capacidade de referenciar objetos (tabelas, colunas) em diferentes bancos de dados pode depender das configurações específicas do SGBD e das permissões concedidas ao usuário que executa as consultas. Certifique-se de que seu SGBD suporta essa funcionalidade e de que você têm as permissões adequadas para criar chaves estrangeiras entre bancos de dados.\
Um exemplo, no Amazon RDS (Relational Database Service), que é um serviço gerenciado de banco de dados na AWS, o acesso e a intereção entre bancos de dados em instâncias RDS podem ser restritos devido à natureza do serviço e às melhores práticas de segurança.\
Em um ambiente tradicional do MySQL, você pode ter mais flexibilidade em termos de referenciar objetos (tabelas, colunas) em diferentes bancos de dados. No entanto, ao usar o Amazon RDS, geralmente é recomendado manter bancos de dados separados para diferentes aplicativos ou finalidades, e a comunicação direta entre bancos de dados pode ser limitada por razões de segurança.\
Portanto, a capacidade de referenciar objetos entre bancos de dados em instâncias RDS pode ser restrita. Se precisar realizar operações que envolvam dados em diferentes bancos de dados, pode ser necessário considerar outras abordagens, como replicação de dados ou a realização das operações em seu aplicativo antes de persistir os dados.\

É interessante pontuar que mesmo que você tenha mais de uma instância de banco de dados que compartilham o mesmo host ou endpoint, cada instância de banco de dados no Amazon RDS é isolada e executada em seu próprio ambiente virtualizado.\
Dentro do Amazon RDS, as instâncias de banco de dados são projetadas para sempre independentes e isoladas para garantir a integridade e o desempenho de cada instância. Portanto, elas não compartilham recursos ou dados automaticamente, cada instância tem seu próprio espaço de banco de dados, credenciais e configurações.

# <a name = "clausula-alter"></a>Cláusula `ALTER`

A cláusula `ALTER` pode ser considerada uma cláusula de modificação em SQL. Por exemplo, para modificar as propriedades de uma coluna em uma tabela no SQL, você pode usar a cláusula `ALTER` e `TABLE`.\
A seguir, estão alguns exemplos comuns de modificações que você pode fazer em uma coluna:

1. **Modificar o tipo de dados da coluna:**

```sql
ALTER TABLE sua_tabela
MODIFY COLUMN nome_da_coluna NOVO_TIPO_DE_DADOS;
```

2. **Adicionar uma restrição** `NOT NULL` **à coluna:**

```sql
ALTER TABLE sua_tabela
MODIFY COLUMN nome_da_coluna NOVO_TIPO_DE_DADOS NOT NULL;

```

3. **Remover a restrição** `NOT NULL` **À COLUNA:**

```sql
ALTER TABLE sua_tabela
MODIFY COLUMN nome_da_coluna NOVO_TIPO_DE_DADOS NULL;
```

4. **Renomear uma coluna:**

```sql
ALTER TABLE sua_tabela
CHANGE nome_da_coluna novo_nome_da_coluna NOVO_TIPO_DE_DADOS;
```

5. **Adicionar uma restrição** `CHECK` **à coluna:**

```sql
ALTER TABLE sua_tabela
ADD CONSTRAINT chk_nome_da_coluna CHECK (sua_condicao);
```

6. **Adicionar uma chave estrangeira à coluna:**

```sql
ALTER TABLE sua_tabela
ADD CONSTRAINT fk_nome_da_coluna FOREIGN KEY (nome_da_coluna) REFERENCES outra_tabela(outra_coluna);
```

Uma propriedade importante que deve ser pontuada é que, em geral, ao modificar uma coluna em uma tabela, as configurações existentes, como permissão para valores nulos, valores padrão, restrições CHECK, e assim por diante, serão mantidas, a menos que você especifique explicitamente uma mudança.\
O SGBD normalmente manterá as configurações existentes, como permissão para valores nulos ou valores padrão, a menos que você especifique explicitamente uma mudança nessas configurações.\
Se, por algum motivo, você deseja alterar essas configurações durante a modificação da coluna, você precisa incluir essas alterações na instrução `ALTER TABLE`.\
Portanto, a regra geral é que o SGBD tentará manter as configurações existentes, mas você pode especificar alterações se necessário. Certifique-se sempre de entender completamente o impacto de suas alterações antes de aplicá-las, especialmente em um ambiente de produção.

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

# <a name = "clausula-show"></a>Cláusula `SHOW`

A cláusula `SHOW` é utilizada para exibir informações sobre diversos elementos no sistema de gerenciamento de banco de dados. Ela permite que você obtenha informações sobre bancos de dados, tabelas, colunas, índices, usuários, variáveis de sistema, e outros aspectos do ambiente do banco de dados.\
A sintaxe básica para usar a cláusula `SHOW` é:

`SHOW [OPCOES] o_que_mostrar;`

Aqui estão alguns exemplos de uso do `SHOW` em MySQL:

1. **Mostrar databases:**

`SHOW DATABASES;`

2. **Mostrar tabelas em um banco de dados:**

`SHOW TABLES FROM nome_do_banco;`

3. **Mostrar colunas de uma tabela:**

`SHOW COLUMNS FROM nome_da_tabela;`

4. **Mostrar variáveis de sistema:**

`SHOW VARIABLES LIKE 'nome_da_variavel';`

5. **Mostrar status do servidor:**

`SHOW STATUS;`

Essa cláusula é útil para consultas informativas e para obter insights sobre a estrutura e os estado do banco de dados. O que você especifica após o `SHOW` dependerá do tipo de informação que você está interessado em visualizar.\
Duas observações importantes é que, considerando o contexto do `SHOW DATABASES`, se o banco não aparece para o usuário que utilizou o comando, é porque ele não tem permissão para visualizá-la. E sobre `SHOW CREATE TABLE nome_da_tabela;`, este comando mostra a query utilizada na criação da tabela, ele fornece a definição completa da tabela.

### `WARNINGS`

O termo `WARNINGS` não é uma cláusula SQL padrão, ele pode ser considerado mais como uma parte da sintaxe específica de alguns SGBDs para lidar com avisos ("warnings") durante a execução de instruções SQL. No contexto do MySQL, por exemplo, você pode ver "`SHOW WARNINGS`" sendo usado para exibir avisos após a execução de uma instrução.\
Portanto, para o MySQL e alguns outros SGBDs, "WARNINGS" pode ser interpretado como uma parte da sintaxe específica para visualizar os avisos gerados durante a execução de uma instrução. Isso não se enquadra exatamente na categoria de cláusulas SQL tradicionais, mas sim em uma funcionalidade específica do sistema para relatar avisos.\
A definição precisa pode variar entre os SGBDs, então é sempre bom consultar a documentação específica do SGBD que você está usando para entender como ele trata e expões os avisos durante a execução das instruções SQL.

### Avisos

Avisos geralmente ocorrem em condições que não impedem a execução da instrução, mas são gerados para alertar sobre situações potencialmente problemáticas.

`Integer display width is deprecated and will be removed in future release`

Indica que o uso de especificações de largura de exibição para tipos de dados inteiros, como `INT(2)`, está obsoleto e será removido em versões futuras do MySQL. Essa especificação não afeta o armazenamento ou a funcionalidade do tipo de dado; portanto, pode ser omitida. Um exemplo mais específico:

```sql
ALTER TABLE nome_da_tabela
MODIFY COLUMN nome_da_coluna SMALLINT(2);
```

Se você especificar o tipo de dados `SMALLINT` sem especificar a largura de exibição, você evitará o aviso sobre a largura de exibição obsolet., 

# <a name = ""></a>Explorando a Tabela `INFORMATION_SCHEMA`

A tabela `INFORMATION_SCHEMA` é uma parte padrão do SQL que é usada para armazenar metadados sobre um banco de dados. Essa tabela fornece informações detalhadas sobre a estrutura e os objetos dentro do banco de dados. O objetivo principal da `INFORMATION_SCHEMA` é oferecer uma visão consistente e padronizada das informações do banco de dados, independente do SGBD específico, tanto que você pode ver o uso do termo "Dicionário de Dados" para se referir a ela.\
Alguns dos tipos de informações que você pode obter da tabela `INFORMATION_SCHEMA` incluem:

1. **Informações sobre tabelas:**
    - Nomes de tabelas;
    - Tipos de tabelas (por exemplo, tabelas temporárias, tabelas do sistema);
    - Colunas em cada tabela.

2. **Informações sobre colunas:**
    - Nomes de colunas;
    - Tipos de dados de colunas;
    - Restrições de chave primária e estrangeira.

3. **Informações sobre índices:**
    - Nomes de índices;
    - Colunas incluídas em índices.

4. **Informações sobre restrições:**
    - Restrições de chave primária;
    - Restrições de chave estrangeira;
    - Restrições únicas.

5. **Informações sobre procedimentos armazenados e funções:**
    - Nomes de procedimentos armazenados e funções;
    - Parâmetros de procedimentos armazenados e funções.

6. **Informações sobre privilégios de usuário:**
    - Privilégios concedidos a usuários e funções.

A consulta à tabela `INFORMATION_SCHEMA` é geralmente feita com instruções SQL padrão, e os resultados fornecem insights sobre a estrutura do banco de dados. Aqui está um exemplo:

```sql
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_NAME = 'nome_da_tabela';
```

Esta consulta retorna informações sobre todas as chaves de colunas associadas à tabela especificada.\
Lembre-se de que a estrutura exata e os detalhes disponíveis na `INFORMATION_SCHEMA` podem variar um pouco entre os SGBDs específicos, então é sempre recomendável consultar a documentação do seu SGBD para obter informações precisas sobre como usar a `INFORMATION_SCHEMA` naquele sistema específico.

# <a name = ""></a>Explorando o Banco de Dados `mysql`

Em MySQL, a tabela `user` faz parte do banco de dados `mysql` e armazena informações sobre os usuários do sistema, incluindo detalhes como nome do usuário, host permitido para conexão, senha criptografada e informações relacionadas à autenticação de privilégios. Considere o exemplo abaixo:

`SELECT user, host, plugin FROM mysql.user;`

- `user`**:** representa o nome do usuário;
- `host`**:** representa o host a partir do qual o usuário pode se conectar. Pode ser um endereço IP ou um nome de host;
- `plugin`**:** representa o método de autenticação usado pelo usuário.

Essa consulta retorna informações sobre os usuários registrados no sistema MySQL, incluindo o método de autenticação (como autenticação baseada em senha ou autenticação baseada em plugin) e os hosts permitidos para conexão.\
É importante observar que apenas usuários com privilégios adequados, como o superusuário (geralmente chamado de "root"), têm permissóes para consulta `mysql.user` e visualizar essas informações sensíveis. O acesso à `mysql.user` é geralmente restrito para garantir a segurança do sistema.\
Você pode estar conectado a outro banco de dados e ainda assim realizar operações sobre `mysql.user`.

# <a name = "mensagens-de-erro-no-mysql"></a>Mensagens de Erro no MySQL

Em muitos logs de erro de sistemas, incluindo o MySQL, os códigos são frequentemente usados para identificar e categorizar problemas ou condições específicas que ocorreram no sistema. A sintaxe específica pode variar entre os sistemas, mas geralmente segue uma convenção em que um código númerico é associado a uma descrição mais detalhada do erro.\
Por exemplo: em mensagens de erro no MySQL, você pode encontrar algo como:

`ERROR 1062 (23000): Duplicate entre 'valor' for key 'nome_da_chave'`

Neste caso, `1062` é o código de erro, e `(23000)` é uma indicação adicional sobre a categoria do erro. O código de erro específico pode ser consultado na documentação do MySQL para obter detalhes sobre o que cada código significa.\
É importante observar que a forma exata de como os erros são registrados e apresentados nos logs pode variar entre os sistemas e aplicativos. Consultar a documentação específica do sistema ou aplicativo que você está usando é a melhor maneira de entender os códigos de erro específicos e suas significações.

### `ERROR 3780 (HY000): Referencing column 'place_id' and referenced column 'id' in foreign key constraint 'place' are incompatible.`

1. `ERROR 3780 (HY000)`**:** isso indica que ocorreu um erro durante a execução do comando SQL;

2. `Referencing column 'place_id'`**:** refere-se à coluna `place_id` que está sendo referenciada por uma chave estrangeira;

3. `referenced column 'id'`**:** refere-se à coluna `id` que está referenciando;

4. `in foreign key constraint 'place'`**:** refere-se a uma restrição de chave estrangeira que atende pelo nome de `place`;

5. `are incompatible`**:** indica que há alguma incompatibilidade entre a coluna `place_id` e a coluna `id` no contexto dessa chave estrangeira.

A incompatibilidade pode ser devido a diferentes tipos de dados, tamanhos ou configurações das colunas. Para resolver isso, precisamos garantir que as colunas correspondam exatamente em termos de tipo de dado, tamanho e outras configurações relevantes.

### `ERROR 1824 (HY000): Failed to open the referenced table 'stand_games'`

Indica que houve uma tentativa de criar ou modificar uma tabela com uma restrição de chave estrangeira (`FOREIGN KEY`) que faz referência a uma tabela que não pôde ser aberta.