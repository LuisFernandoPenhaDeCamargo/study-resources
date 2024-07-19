# README (SQL)

Por enquanto, eu não sei como irei estruturar este diretório.

Abaixo temos uma lista de tópicos que eu irei estudar.

- Operadores
    + Verificar se este realmente é o termo para se referir a `=`, por exemplo
    + Operador de igualdade
    + `!=`
    + `>=`
    + `<=`
- O retorno da função `SUBSTRING_INDEX` remove os espaços em branco no começo ou/e ao final da substring?
- `LIKE`

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