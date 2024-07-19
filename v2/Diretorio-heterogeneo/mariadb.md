# MariaDB

### Sumário

- [Categorias das Instruções SQL](#categorias-instrucoes-sql)
- [Instruções](#instrucoes)
    + [`DROP`](#instrucoes-drop)
    + [`DELETE`](#instrucoes-delete)
- [Palavras-chaves](#palavras-chaves)
    + [`IF`](#palavras-chaves-if)
    + [`CASE`](#palavras-chaves-case)
    + [`WHEN`](#palavras-chaves-when)
    + [`THEN`](#palavras-chaves-then)
    + [`ELSE`](#palavras-chaves-else)
    + [`EXISTS`](#palavras-chaves-exists)
    + [`AS`](#palavras-chaves-as)
    + [`COMMENT`](#palavras-chaves-comment) <!-- Este tópico já foi analisado -->
- [Funções](#funcoes)
- [Tipos de Coluna](#tipos-coluna) <!-- Este tópico já foi analisado -->
    + [`TINYINT`](#tinyint) <!-- Este tópico já foi analisado -->
- [Verificando o Código de Uma Procedure/Function](#verificando-codigo-procedurefunction)
- [Procedure x Function](#procedure-x-function)
- [Ajustando um Auto Incrementador](#ajustando-auto-incrementador) <!-- Este tópico já foi analisado -->

# <a id="categorias-instrucoes-sql"></a>Categorias das Instruções SQL

As instruções SQL podem ser divididas em várias categorias, como:

1. **DDL (Data Definition Language):** usada para definir a estrutura do banco de dados, como `CREATE`, `ALTER`, `DROP`, etc
2. **DML (Data Manipulation Language):** usada para manipular os dados dentro das tabelas do banco de dados, como `INSERT`, `UPDATE`, `MERGE`, `DELETE`
3. **DQL (Data Query Language):** usada para recuperar dados de uma ou mais tabelas, como `SELECT`
4. **DCL (Data Control Language):** usada para controlar o acesso aos dados dentro do banco de dados, como `GRANT` e `REVOKE`

# <a id="instrucoes"></a>Instruções

### Sumário

- [`DROP`](#instrucoes-drop)
- [`DELETE`](#instrucoes-delete)

## <a id="instrucoes-drop"></a>`DROP`

`DROP` é uma palavra-chave em SQL que pode ser usada para diferentes propósitos, dependendo do contexto em que é usada.

Aqui estão alguns usos comuns de `DROP` em SQL:

1. `DROP TABLE`**:** esta é a forma mais comum de uso de `DROP`. Quando você executa `DROP TABLE $< nome da tabela>`, você está excluindo permanentemente a tabela especificada do banco de dados, juntamente com todos os dados e estrutura associados a ela
2. `DROP DATABASE`**:** esta instrução é usada para excluir permanentemente um banco de dados inteiro e todos os seus objetos, como tabelas, índices, procedimentos armazenados, etc
3. `DROP INDEX`**:** usado para excluir um índice existente de uma tabela
4. `DROP VIEW`**:** usado para excluir um índice existente de uma tabela
5. `DROP PROCEDURE` **ou** `DROP FUNCTION`**:** usado para excluir uma procedure ou função armazenada, respectivamente
6. `DROP TRIGGER`**:** usado para excluir uma trigger existente em uma tabela

Essas são algumas das maneiras mais comuns de usar `DROP` em SQL. Cada uma dessas instruções é usada para excluir ou descartar um objeto específico do banco de dados, e é importante usá-las com cuidado, pois elas removem permanentemente os objetos e os dados associados a eles.

**Exemplos**

```sql
DROP $< PROCEDURE ou FUNCTION > IF EXISTS < nome da rotina >
```

## <a id="instrucoes-delete"></a>`DELETE`

`DELETE` é uma instrução SQL usada para remover registros de uma tabela em um banco de dados. Ela é parte do conjunto de instruções DML, que permite manipular dados dentro das tabelas do banco de dados.

A instrução DELETE opera especificamente na remoção de registros de uma tabela que correspondam a uma determinada condição. Ela não remove a estrutura da tabela em si, apenas os dados contidos nela.

Quando você executa uma instrução DELETE, o banco de dados verifica os registros na tabela que correspondem à condição especificada e os remove permanentemente. Esses registros não podem ser recuperados após a exclusão, a menos que você tenha um backup dos dados.

**Sintaxe Básica**

```sql
DELETE FROM $< nome da tabela > WHERE $< condição >
```

Em resumo, `DELETE` é uma operação de banco de dados que permite remover registros de uma tabela, proporcionando uma maneira de gerenciar e limpar os dados armazenados em um banco de dados.

# <a id="palavras-chaves"></a>Palavras-chaves

### Sumário

- [`IF`](#palavras-chaves-if)
- [`CASE`](#palavras-chaves-case)
- [`WHEN`](#palavras-chaves-when)
- [`THEN`](#palavras-chaves-then)
- [`ELSE`](#palavras-chaves-else)
- [`EXISTS`](#palavras-chaves-exists)
- [`AS`](#palavras-chaves-as)
- [`COMMENT`](#palavras-chaves-comment)

## <a id="palavras-chaves-if"></a>`IF`

A palavra-chave `IF` em SQL é usada em várias situações, dependendo do contexto em que é aplicada. Ela pode ser usada em instruções condicionais, procedimentos armazenados, gatilhos, entre outros. Aqui estão alguns dos contextos mais comuns em que a palavra-chave `IF` é usada:

1. `IF` **em instruções condicionais:** em instruções `SELECT`, `UPDATE`, `DELETE` e `INSERT`, o `IF` pode ser usado para realizar uma operação com base em uma condição específica. Por exemplo:

```sql
SELECT * FROM $< tabela > WHERE IF($< coluna > = '$< valor >', 1, 0) = 1;
```

- `IF($< coluna > = '$< valor >', 1, 0)`**:** esta parte usa a função `IF` para avaliar uma condição. Se o valor da coluna for igual a `'valor'`, ele retorna `1`, caso contrário, retorna `0`
- `= 1`**:** isso compara o resultado do `IF` com `1`, ou seja, seleciona os registros onde o valor da coluna é igual a `'valor'`

2. `IF` **em procedimentos armazenados:** em procedimentos armazenados, a palavra-chave `IF` é usada para controlar o fluxo do programa com base em condições. Por exemplo:

```sql
IF $< condição > THEN
    -- Código a ser executado se a condição for verdadeira.
ELSE
    -- Código a ser executado se a condição for falsa.
END IF;
```

3. `IF` **em funções:** em funções, a palavra-chave `IF` pode ser usada para realizar operações condicionais e retornar valores com base nessas condições. Por exemplo:

```sql
IF $< condição > THEN
    RETURN $< valor 1 >;
ELSE
    RETURN $< valor 2 >;
END IF;
```

4. `IF` **em gatilhos:** em gatilhos, o `IF` pode ser usado para determinar se uma ação específica deve ser executada com base em uma condição. Por exemplo:

```sql
IF NEW.$< coluna > = '$< valor >' THEN
    -- Código a ser executado se a condição for verdadeira.
END IF;
```

Esses são apenas alguns exemplos de como a palavra-chave `IF` pode ser usada em SQL. O seu comportamento específico pode variar dependendo do contexto em que é aplicado.

## <a id="palavras-chaves-case"></a>`CASE`

A palavra-chave `CASE` em SQL é uma expressão condicional que permite avaliar uma lista de condições e retornar um valor correspondente à primeira condição que é verdadeira. É uma forma de realizar uma lógica condicional em uma consulta SQL.

**Sintaxe Básica**

```sql
CASE
    WHEN $< condição 1 > THEN $< valor 1 >
    WHEN $< condição 2 > THEN $< valor 2 >
    $< ... >
    ELSE $< valor padrão >
END
```

## <a id="palavras-chaves-when"></a>`WHEN`

A palavra-chave `WHEN` é usada em conjunto com a expressão `CASE` em SQL para definir as condições sob as quais diferentes valores devem ser retornados. `CASE` é uma expressão condicional que permite avaliar uma lista de condições e retornar um valor correspondente à primeira condição que é verdadeira.

**Sintaxe Básica**

```sql
CASE
    WHEN $< condição 1 > THEN $< valor 1 >
    WHEN $< condição 2 > THEN $< valor 2 >
    $< ... >
    ELSE $< valor padrão >
END
```

Aqui está uma explicação do funcionamento do `CASE` com o `WHEN`:

- `CASE` é seguido por uma série `WHEN` seguidos por condições. Quando uma condição é verdadeira, o valor associado a essa condição é retornado
- Se nenhuma condição `WHEN` for verdadeira, o valor na cláusula `ELSE` é retornado. O `ELSE` é opcional e pode ser omitido se não houver um valor padrão a retornar
- Cada `WHEN` pode ser seguido por qualquer expressão que retorne um valor booleano, como uma comparação, função, etc

**Exemplos**

Suponha que temos uma tabela de produtos e queremos classificar os produtos com base em seu preço em diferentes categorias, como "Baixo", "Médio" e "Alto":

```sql
SELECT
    nome_produto,
    preco,
    CASE
        WHEN preco < 50 THEN 'Baixo'
        WHEN preco >= 50 AND preco < 100 THEN 'Médio'
        ELSE 'Alto'
    END AS categoria_preco
FROM produtos;
```

O exemplo retornará três colunas, `nome_produto`, `preco` e `categoria_preco`, onde `categoria_preco` conterá o valor retornado pela expressão `CASE`. Caso você não especifique um alias para o `CASE`, a expressão aparecerá como o nome da coluna.

## <a id="palavras-chaves-then"></a>`THEN`

A palavra-chave `THEN` é usada é usada em conjunto com estruturas condicionais em SQL para indicar a ação a ser executada quando uma condição específica é verdadeira.

## <a id="palavras-chaves-else"></a>`ELSE`

A palavra-chave `ELSE` em SQL é frequentemente usada em conjunto com a palavra-chave `IF`, `CASE`, `WHEN`, entre outras, para especificar uma alternativa a ser executada quando uma determinada condição não é atendida. Aqui estão algumas das maneiras mais comuns de usar `ELSE` em SQL:

1. `IF`**-**`ELSE` **em procedimentos armazenados:** em procedimentos armazenados, você pode usar `ELSE` para especificar um bloco de código que deve ser executado quando a condição `IF` não for atendida. Por exemplo:

```sql
IF $< condição > THEN
    -- Código a ser executado se a condição for verdadeira.
ELSE
    -- Código a ser executado se a condição não for verdadeira.
END IF;
```

2. `CASE`**-**`ELSE` **em expressões** `CASE`**:** a palavra-chave `ELSE` é usada em conjunto com a expressão `CASE` para especificar um valor padrão a ser retornado quando nenhuma das condições `WHEN` correspondentes é atendida. Por exemplo:

```sql
CASE
    WHEN $< condição 1 > THEN $< valor 1 >
    WHEN $< condição 2 > THEN $< valor 2 >
    ELSE $< valor padrão >
END;
```

3. `IFNULL`**-**`ELSE`**:** a função `IFNULL` é frequentemente usada para retornar um valor alternativo se a expressão especificada for `NULL`. Nesse caso, `ELSE` é implicitamente usado para especificar o valor alternativo. Por exemplo:

```sql
SELECT IFNULL($< coluna >, '$< valor alternativo >') FROM $< tabela >;
```

4. `COALESCE`**-**`ELSE`**:** a função `COALESCE` é usada para retornar o primeiro valor não nulo em uma lista de expressões. Quando nenhum valor não nulo é encontrado, `ELSE` é implicitamente usado para especificar um valor padrão a ser retornado. Por exemplo:

```sql
SELECT COALESCE($< coluna 1 >, $< coluna 2 >, '$< valor padrão >') FROM $ < tabela >;
```

Esses são alguns exemplos de como a palavra-chave `ELSE` é comumente usada em SQL, para fornecer uma alternativa em caso de não atendimento de uma condição específica.

## <a id="palavras-chaves-exists"></a>`EXISTS`

A palavra-chave `EXISTS` em SQL é usada em conjunto com uma subconsulta para verificar se a subconsulta retorna algum resultado. Ela retorna verdadeiro se a subconsulta retornar um ou mais registros e falso se não retornar nenhum registro.

**Sintaxe Básica**

```sql
SELECT $< colunas >
FROM $ < tabela principal >
WHERE EXISTS ($< subconsulta >);
```

- A `subconsulta` é uma consulta SQL separada que é avaliada para cada linha na `tabela principal`
- Se a subconsulta retornar algum resultado (um ou mais registros), o predicado `EXISTS` retorna verdadeiro para essa linha da tabela principal. Se a subconsulta não retornar nenhum resultado, o `EXISTS` retorna falso

**Exemplos**

Suponha que temos duas tabelas, `orders` e `customers`, e queremos selecionar todas as ordens dos clientes que têm pelo menos uma ordem na tabela `orders`:

```sql
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

## <a id="palavras-chaves-as"></a>`AS`

A palavra-chave `AS` em SQL é usada para renomear uma coluna ou uma tabela em uma consulta. Ela é opcional em muitos casos, mas é comumente usada para tornar o resultado da consulta mais legível ou para fornecer nomes mais descritivos para as colunas.

**Sintaxe Básica**

- Renomeando uma coluna

```sql
SELECT $< nome da coluna > AS $< novo nome >
FROM $< nome da tabela >;
```

- Renomeando uma tabela (em consultas `JOIN`, subconsultas, etc)

```sql
SELECT $< nome da coluna >
FROM $< nome da tabela > AS $< novo nome da tabela >;
```

**Exemplos**

- Renomeando colunas

```sql
SELECT nome AS nome_completo, idade AS idade_anos
FROM clientes;
```

- Renomeando tabelas em subconsultas

```sql
SELECT ordens.*
FROM (SELECT * FROM todas_ordens) AS ordens;
```

O uso do `AS` é opcional em muitos bancos de dados quando se trata de renomear colunas. No entanto, em alguns contextos, como na definição de alias de alias de tabelas em subconsultas ou em cláusulas `ORDER BY`, `GROUP BY` ou `HAVING`, o `AS` pode ser necessário para evitar erros de sintaxe.

Em resumo, o `AS` é usado para renomear colunas ou tabelas em consultas SQL, tornando o resultado da consulta mais legível e compreensível.

## <a id="palavras-chaves-comment"></a>`COMMENT`

O commando `COMMENT` no MySQL/MariaDB é usado para adicionar comentários a tabelas, colunas, índices e procedimentos armazenados. Os comentários podem ser úteis para documentar a estrutura e o propósito dos objetos do banco de dados, facilitando o entendimento para os desenvolvedores e administradores.

Aqui estão algumas formas de usar o comando `COMMENT`:

1. **Comentários de tabela:** você pode adicionar um comentário a uma tabela durante a criação da tabela ou posteriormente com a cláusula `COMMENT`. Exemplo durante a criação da tabela

```sql
CREATE TABLE minha_tabela (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
) COMMENT 'Esta é a tabela principal que armazena dados de clientes';
```

Exemplo para adicionar um comentário a uma tabela existente:

```sql
ALTER TABLE minha_tabela COMMENT 'Esta é a tabela principal que armazena dados de clientes';
```

2. **Comentários de coluna:** você pode adicionar comentários a colunas durante a criação da tabela ou posteriormente com a cláusula `COMMENT`. Exemplo durante a criação da tabela

```sql
CREATE TABLE (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do cliente',
    nome VARCHAR(50) COMMENT 'Nome do cliente'
);
```

Exemplo para adicionar um comentário a uma coluna existente:

```sql
ALTER TABLE minha_tabela MODIFY COLUMN id INT COMMENT 'ID único do cliente';
```

3. **Comentários de índice:** você pode adicionar comentários a índices durante a criação da tabela ou posteriormente com a cláusula `COMMENT`. Exemplo durante a criação da tabela

```sql
CREATE TABLE minha_tabela (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    INDEX idx_nome (nome) COMMENT 'Índice para busca rápida por nome'
);
```

Exemplo para adicionar um comentário a um índice existente:

```sql
ALTER TABLE minha_tabela
DROP INDEX idx_nome,
ADD INDEX idx_nome (nome) COMMENT 'Índice para busca rápida por nome';
```

4. **Comentários de Procedimento Armazenado:** você pode adicionar comentários a procedimentos armazenados durante a criação do procedimento ou posteriormente com a cláusula `COMMENT`. Exemplo durante a criação do procedimento

```sql
CREATE PROCEDURE meu_procedimento()
COMMENT 'Este procedimento realiza uma operação específica'
BEGIN
    -- Corpo do procedimento
END;
```

Exemplo para adicionar um comentário a um procedimento armazenado existente:

```sql
ALTER PROCEDURE meu_procedimento() COMMENT 'Este procedimento realiza uma operação específica';
```

Os comentários fornecem informações adicionais sobre os objetos do banco de dados e são úteis para documentação e entendimento do esquema do banco de dados.

# <a id="funcoes"></a>Funções

### Sumário

- IFNULL
- COALESCE
- ORDER BY
- GROUP BY
- HAVING
- Sobre o banco `information_schema`

# <a id="tipos-coluna"></a>Tipos de Coluna

No MariaDB/MySQL, existem vários tipos de colunas que você pode usar ao criar ou alterar uma tabela. Aqui estão alguns dos tipos de dados mais comuns suportados:

1. `INT` **ou** `INTEGER`**:** para armazenar números inteiros
2. `BIGINT`**:** para armazenar números inteiros grandes
3. `DECIMAL` **ou** `NUMERIC`**:** para armazenar números decimais precisos
4. `FLOAT`**:** para armazenar números de ponto fluntuante de precisão simples
5. `DOUBLE`**:** para armazenar números de ponto flutuante de precisão duplas
6. `DATE`**:** para armazenar datas
7. `TIME`**:** para armazenar horários
8. `DATETIME`**:** para armazenar datas e horários combinados
9. `TIMESTAMP`**:** para armazenar datas e horários, geralmente usado para rastrear a última vez que uma linha foi inserida ou atualizada
10. `YEAR`**:** para armazenar anos de quatro dígitos
11. `CHAR`**:** para armazenar uma string de caracteres de comprimento fixo
12. `VARCHAR`**:** para armazenar uma string de caracteres de comprimento variável
13. `TEXT`**:** para armazenar uma string de texto longa
14. `BLOB`**:** para armazenar dados binários longos, como imagens ou arquivos
15. `JSON`**:** para armazenar dados no formato JSON
    - Foi introduzido no MariaDB a partir da versão 10.2.7
16. `ENUM`**:** para armazenar um valor de uma lista predefinida de opções
17. `SET`**:** similar ao `ENUM`, mas pode armazenar múltiplos valores de uma lista predefinida

Esses são apenas alguns dos tipos de dados suportados pelo MariaDB/MySQL. Cada tipo de dado tem suas próprias características e é importante escolher o tipo correto dependendo do tipo de dado que você está armazenando e das operações que você pretende realizar com esses dados.

### Sumário

- [`TINYINT`](#tinyint)

## <a id="tinyint"></a>`TINYINT`

No MariaDB/MySQL, não existe um tipo de dados específico para booleanos como em alguns outros sistemas de gerenciamento de banco de dados. No entanto, você pode usar tipos de dados alternativos para representar valores booleanos, como o `TINYINT`.

O tipo de dados `TINYINT` é frequentemente usado para representar valores booleanos, onde `0` representa `FALSE` e `1` representa `TRUE`. Você pode usar o tamanho de `1 byte` para economizar espaço de armazenamento.

**Exemplo**

```sql
minha_coluna TINYINT(1)
```

O tipo de dados `BIT` também pode ser usado para armazenar valores booleanos, embora seja menos comum do que `TINYINT`.

# <a id="verificando-codigo-procedurefunction"></a>Verificando o Código de Uma Procedure/Function

Para verificar o código de uma procedure ou function em seu banco, você pode utilizar o `SELECT` da seguinte forma:

```sql
SELECT routine_definition FROM information_schema.routines WHERE routine_type = '$< FUNCTION ou PROCEDURE >' AND routine_name = '$< nome da rotina >';
```

ou seja, ela retorna o valor contido na coluna `routine_definition`, pertencente a tabela `routines` do banco `information_schema`. Sendo que `routine_type` armazena valores como "`PROCEDURE`" ou "`FUNCTION`", e `routine_name` armazena o nome da rotina.

# <a id="procedure-x-function"></a>Procedure x Function

As procedures e as functions são objetos de programação no MySQL (e em muitos outros sistemas de gerenciamento de banco de dados) que permitem realizar operações específicas dentro do banco de dados. Embora sejam semelhantes em alguns aspectos, existem algumas diferenças importantes entre elas:

1. **Procedure:**
    - Uma procedure é um conjuntos de instruções SQL que pode aceitar parâmetros de entrada e produzir resultados ou efeitos colaterais, como alterar dados no banco de dados
    - As procedures podem conter instruções SQL para executar operações complexas ou tarefas que envolvam várias consultas ou operações de controle de fluxo
    - As procedures não necessariamente retornam um valor. Elas podem executar ações no banco de dados, mas não retornam um resultado diretamente para quem as chama
    - Podem conter comandos DML, como `INSERT`, `UPDATE`, `DELETE`, bem como comandos DDL, como `CREATE`, `ALTER`, `DROP`
2. **Function:**
    - Uma function é um objeto que aceita parâmetros de entrada, executa um conjunto de instruções SQL e retorna um valor como resultado da operação
    - As functions são frequentemente utilizadas para realizar cálculos ou transformações de dados e retornar um valor resultante
    - As functions sempre retornam um valor e não podem executar comandos DML que alterem o estado do banco de dados. Elas são geralmente usadas para computação e retornam valores calculados
    - Não podem conter comandos DDL

Em resumo, a principal diferença entre procedures e functions é que as procedures são usadas para realizar operações e manipulação de dados no banco de dados, enquanto as functions são usadas para calcular valores e retornar resultados. As functions sempre retornam um valor, enquanto as procedures podem ou não retornar valores, mas podem executar ações no banco de dados.

# <a id="ajustando-auto-incrementador"></a>Ajustando um Auto Incrementador

No MySQL/MariaDB, você pode ajustar o incrementador (auto_increment) de uma coluna de ID após a exclusão de registros utilizando a instrução `ALTER TABLE`. Você pode fazer isso definindo o valor do auto_increment para o próximo valor esperado após a exclusão. Aqui está como você pode fazer isso:

Suponha que você deletou um registro da tabela `minha_tabela` e agora deseja ajustar o incrementador auto_increment:

1. Descubra o próximo valor esperado para o auto_increment. Isso geralmente é o valor máximo atual da coluna auto_increment + 1

```sql
SELECT MAX(id) + 1 FROM minha_tabela;
```

2. Use a instrução `ALTER TABLE` para definir o novo valor do auto_increment

```sql
ALTER TABLE minha_tabela AUTO_INCREMENT = $< novo valor >;
```

Substitua o "novo valor" pelo próximo valor esperado para auto_increment obtido no passo anterior.

O próximo valor para o ID, vai ser o "novo valor" definido, e os próximos valores após ele, serão incrementados a partir dele.

Observe que se você definir o valor do auto_increment para um valor que já existe na tabela, o comportamento depende do mecanismo de armazenamento utilizado e da configuração do servidor.

No MySQL/MariaDB, ao definir manualmente o valor do auto_increment para um valor que já existe na tabela, os resultados podem variar:

1. Se o valor definido for menor que o maior valor atual da coluna auto_increment, o próximo valor gerado pelo auto_increment será o maior valor atual + 1. Isso significa que o valor definido manualmente não será usado e o MySQL continuará gerando valores sequenciais a partir do maior valor atual

2. Se o valor definido for maior que o maior valor atual da coluna auto_increment, o próximo valor gerado pelo auto_increment será o valor definido manualmente + 1. Isso significa que o MySQL comecará a gerar valores sequenciais a partir do valor definido manualmente

Em resumo, se você definir manualmente o valor do auto_increment para um valor que já existe na tabela, o MySQL geralmente continuará gerando valores sequenciais a partir do maior valor atual ou a partir do valor definido manualmente, dependendo do cenário. No entanto, é importante evitar definir manualmente o auto_increment para valores já existentes, pois isso pode causar confusão e problemas de integridade de dados. Sempre é recomendável usar o auto_increment para garantir a geração automática de valores únicos e sequenciais.