# README (SQL)

- Eu não sei como irei estruturar este diretório
- Abaixo temos uma lista de tópicos que eu irei estudar
    + Operadores
        - Verificar se este realmente é o termo para se referir a `=`, por exemplo
        - Operador de igualdade
        - `!=`
        - `>=`
        - `<=`
    + O retorno da função `SUBSTRING_INDEX` remove os espaços em branco no começo ou/e ao final da substring?
    + `LIKE`

# `DEFINER`

`DEFINER` é uma claúsula usada em MySQL e MariaDB para identificar o usuário e o host que têm privilégios necessários para executar um objeto armazenado no banco de dados, como uma procedure, function, trigger, ou view. Ele define o contexto de segurança sob o qual o objeto será executado.

O `DEFINER` especifica o usuário e o host sob o qual o objeto foi armazenado foi criado e será executado. Esse usuário deve ter privilégios necessários para realizar as operações definidas no objeto.

### Sinta Básica

```SQL
DEFINER=`A< username >`@`A< host >`
```

## Principais Funções

- **Contexto de segurança:** quando um objeto armazenado (como uma procedure) é executado, ele pode realizar ações com base nos privilégios do `DEFINER`, mesmo que o usuário que invocou o objeto não tenha esses privilégios. Isso é útil para permitir que usuários com menos permissões executem operações que normalmente exigiriam privilégios elevados
- **Controle de acesso:** o `DEFINER` ajuda a controlar quem pode modificar ou executar o objeto. Se o usuário especificado no `DEFINIR` foi removido ou se perder os privilégios necessários, o objeto pode falhar ao ser executado, gerando erros como `ERROR 1449 (HY000): The user specified as a definer ('username'@'host') does not exist`

## Exemplos

```SQL
DEFINER=`admin`@`localhost`
```

**Isso indica que o objeto foi definido e deve ser executado como se fosse o usuário** `admin` **no host** `localhost`.

Imagine que você tenha a seguinte procedure:

```SQL
-- Não tenho certeza se a sintaxe está correta.
CREATE PROCEDURE example_procedure()
DEFINER=`admin`@`localhost`
BEGIN
    -- Código da procedure
END;
```

- **Execução:** quando essa procedure for executada por qualquer usuário, o MySQL/MariaDB irá verificar se o usuário `admin`@`localhost` tem os privilégios necessários para realizar as operações dentro da procedure
- **Segurança:** mesmo que um usuário com menos privilégios execute a procedure, ela será executada como se fosse o `admin`@`localhost`, permitindo a execução de operações que o usuário invocador normalmente não poderia realizar

## Resumo

O `DEFINER` é uma cláusula crucial para o gerenciamento de segurança e permissões em objetos armazenados no MySQL/MariaDB, garantindo que esses objetos sejam executados no contexto de um usuário específico, independentemente de quem os invocou.

## Dificuldades Encontradas

- [`ERROR 1449 (HY000): The user specified as a definer ('username'@'host') does not exist`](#definer-error)

### <a id="definer-error">`ERROR 1449 (HY000): The user specified as a definer ('username'@'host') does not exist`</a>

O erro `ERROR 1449 (HY000): The user specified as a definer ('username'@'host') does not exist` geralmente ocorre quando uma stored procedure, trigger, view ou event foi criada por um usuário que não existe mais no banco de dados, ou quando o usuário especificado no `DEFINER` está incorreto, incompleto, ou perdeu os privilégios necessários.

Se o usuário e o hostname não fizeram parte da função de erro (`''@''`), isso indica que os valores estão sendo tratados como nulos ou vazios. Ou seja, o MariaDB está tentando executar a operação como se o `DEFINER` fosse um usuário com nome vazio e host vazio, o que não é válido e resulta no erro acima.

Isso pode ocorrer ao definir a procedure, trigger, view ou event quando o `DEFINER` é especificado incorretamente ou omitido, resultando em valores nulos. Também pode acontecer durante a migração do banco de dados ou importação de um dump, se o `DEFINER` não for transferido corretamente, especialmente se o usuário ou host não existir no novo ambiente.

# `SUBSTRING_INDEX`

A função `SUBSTRING_INDEX` é utilizada para **extrair uma parte de uma string com base em um delimitador específico**. Ela **retorna a substring da string original** até um número especificado de ocorrências do delimitador.

### Sintaxe Básica

```SQL
SUBSTRING(string, delimiter, count);
```

- `string`**:** a string de entrada da qual a substring será extraída
- `delimiter`**:** o delimitador que define os limites da substring
- `count`**:** um número inteiro que específica quantas vezes o delimitar deve aparecer na string para definir a substring
    + Se o valor for positivo, a função retorna a substring até o count-ésimo delimitador a partir da esquerda
    + Se o valor for negativo, a função retorna a substring até o count-ésimo delimitador a partir da direita

## Exemplos

```SQL
-- - Extraindo a substring a partir da esquerda
SELECT SUBSTRING_INDEX('a,b,c,d', ',', 2);
-- Ouput: a,b
-- Isso retorna `a,b` porque pega a substring até a segunda ocorrência da vírgula a partir da esquerda.

-- - Extraindo a substring a partir da direita
SELECT SUBSTRING_INDEX('a,b,c,d', ',', -2);
-- Output: c,d
-- Isso retorna `c,d` porque pega a substring até a segunda ocorrência da vírgula a partir da direita.
```

## Exemplo Interessante

Considere o seguinte cenário, você tem a tabela `remote_queries` que possui a coluna `query` que é do tipo `text`. Dentre seus vários valores há "`UPDATE ´settings´ SET ´force_jackpot´ = '108', ´jackpot_games_left´ = '10';`", por exemplo, e você quer obter a palavra "`jackpot`" desta string.

```SQL
SELECT query FROM remote_queries;
-- Output: UPDATE `settings` SET `force_jackpot` = '108', `jackpot_games_left` = '10';. Um dos registros.

SELECT SUBSTRING_INDEX(query, 'force_' , -1) FROM remote_queries;
-- Output: jackpot` = '108', `jackpot_games_left` = '10';. Seria como ficaria o registro citado acima.

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(query, 'force_' , -1), '`', 1) FROM remote_queries;
-- Seria o mesmo que fazer:
-- SELECT SUBSTRING_INDEX('jackpot` = '108', `jackpot_games_left` = '10';', '`', 1) FROM remote_queries;
-- Output: jackpot. Seria como ficaria o registro citado acima.
```