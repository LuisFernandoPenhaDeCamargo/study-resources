<F

# `DECLARE`

O comando `DECLARE` em SQL (usado em sistemas como MySQL/MariaDB) é utilizado para declarar variáveis, cursores e manipuladores de exceção dentro de blocos de código armazenado, como procedures ou função.

### 1. Declarando variáveis

Você pode declarar variáveis para armazenar dados temporários ao longo da execução de uma procedure ou função.

```SQL
DECLARE variable_name variable_type [DEFAULT default_value];
```

- `variable_name`**:** nome da variável a ser usada
- `variable_type`**:** o tipo de dado da variável (como `INT`, `VARCHAR`, etc.)
- `default_value`**:** valor padrão que a variável vai assumir caso não seja atribuída explicitamente

### 2. Declarando cursores

Cursores são usados para iterar sobre um conjunto de resultados linha a linha.

```SQL
DECLARE cursor_name CURSOR FOR sql_query;
```

- `cursor_name`**:** nome dado ao cursor
- `sql_query`**:** a query SQL que retorna os dados que o cursor vai percorrer

### 3. Manipuladores de exceção

Manipuladores de exceção (ou handlers) lidam com erros ou condições específicas durante a execução de uma procedure.

```SQL
DECLARE handler_type HANDLER FOR condition action;
```

- `handler_type`**:** pode ser `CONTINUE` (para continuar a execução após a exceção) ou `EXIT` (para sair do bloco)
- `condition`**:** define o time de erro ou exceção (por exemplo, `SQLEXCEPTION`, `NOT FOUND` ou um código de erro específico)
- `action`**:** ação a ser executada quando a exceção ocorrer

## Regras e Restrições

- As declarações `DECLARE` devem ser feitas no início do bloco de código, antes de instruções como `SELECT` ou `UPDATE`
- As variáves declaradas com `DECLARE` são locais ao bloco de código onde foram declaradas e não estão disponíveis fora dele
- Não é possível declarar variáveis ou cursores com o mesmo nome

## Exemplos

### 1. Declarando variáveis

```SQL
DECLARE count INT DEFAULT 0;
DECLARE customer_name VARCHAR(255) DEFAULT 'Unknow';
```

### 2. Declarando cursores

```SQL
DECLARE customer_cursor CURSOR FOR
    SELECT customer_name
    FROM customers
    WHERE customer_status = 'active';
```

### 3. Manipuladores de exceção

```SQL
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
SET error_occurred = 1;
```