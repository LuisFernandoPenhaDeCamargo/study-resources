# MySQL



# Sumário

- Operadores\
    + % (Operador de Módulo)
- Funções
    + `rand()`
    + `UNIX_TIMESTAMP()`
- Criação de Funções

# Operadores

## `%` (Operador de Módulo)

No MySQL, o operador `%` é o operador de módulo. Ele retorna o resto da divisão do primeiro número pelo segundo. Este operador é usado principalmente em operações aritméticas e pode ser aplicado a valores inteiros e de ponto flutuante.

```sql
SELECT 10 % 3; -- Saída: 1 . Pois 10 dividido por 3 é 3 com resto 1.

SELECT 10.5 % 3.2; -- Saída: 0.9 . Pois 10,5 dividido por 3,2 é 3 com resto 0.9.
```

**Observação**

Esta operação sobre números de ponto flutuante provavelmente irão gerar um resto de ponto flutuante.

```sql
SELECT 5.5 % 2; -- Saída: 1.5
```

Ao dividir um número por outro e pegar o resto, você está restringindo a faixa de valores de 0 (caso não haja resto) a até um pouco antes do valor (estamos considerando números de ponto flutuante). Por exemplo, ao fazer `número_de_ponto_flutuante % 10`, você pode obter 0, caso o `número_de_ponto_flutuante` seja 0, ou não haja resto, a até `9,casas_decimais`.

# Funções

## `rand()`

A função `rand()` no MySQL é uma função que gera um número decimal pseudoaleatório entre 0 (inclusive) e 1 (exclusivo). Ela não aceita argumentos e retorna um número de ponto flutuante.

```sql
SELECT rand();
```

## `UNIX_TIMESTAMP()`

A função `UNIX_TIMESTAMP()` no MySQL retorna o valor do timestamp atual, ou da data fornecida como argumento, como um número inteiro. Este timestamp é o número de segundos desde a "época", que é 1 de janeiro de 1970 00:00:00 UTC.

```sql
SELECT UNIX_TIMESTAMP();

SELECT UNIX_TIMESTAMP('2024-02-07 11:48:00'); -- Saída: 1707317280
```

# Criação de Funções

Ao criar funções, você deve especificar as opções necessárias de segurança em sua declaração. No MySQL, para garantir a consistência e a segurança dos dados, as funções devem ser declaradas com uma das seguintes opções:

- `DETERMINISTIC`**:** a função sempre retorna o mesmo resultado para o mesmo conjunto de parâmetros. Isso é importante para garantir a consistência dos dados em um banco de dados
- `NO SQL`**:** a função não acessa ou modifica dados do banco de dados. É uma função que realiza apenas cálculos e não tem dependência de dados do banco de dados
- `READS SQL DATA`**:** a função pode acessar dados do banco de dados, mas não os modifica

Se a função não tiver uma dessas opções especificadas em sua declaração, o MySQL não permitirá sua criação quando o registro binário estiver habilitado.