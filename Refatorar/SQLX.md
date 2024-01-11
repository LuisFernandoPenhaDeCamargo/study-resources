# SQL.

- O nome do host local é `localhost`;
- A porta padrão do MySQL é 3306;
- No MySQL você não pode recuperar a senha de um usuário, pois senhas são armazenadas com criptografia e não podem ser recuperadas em texto simples. O que pode ser feito é redefinir a senha de um usuário;
- **Comentários de linha única:** você pode criar comentários de linha única com `--` (dois hifens) ou `#` (símbolo do jogo da velha). Qualquer texto após esses caracteres será tratado como um comentário e não terá efeito na execução do código;
- **Comentário de várias linhas:** você pode criar comentários de várias linhas usando `/*` para iniciar o comentário e `*/` para encerrá-lo. Qualquer texto entre esses delimitadores será tratado como um comentário.

# Sumário.

- [Mecanismos de autenticação (ou plugin de autenticação)](#mecanismosautenticacao);
- [Cláusulas](#clausulas);
- [Tipos de dados](#tiposdados);
- [Lista de comandos](#listadecomandos);
- [Funções](#funcoes);
- [Alias](#alias);
- [Querys utilizando múltiplas tabelas](#querysmultiplastabelas);
- [Procedure](#procedure);
- [Erros](#erros).

## <a id = "mecanismosautenticacao"></a>Mecanismos de autenticação (ou plugin de autenticação).

**As opções de autenticação incluem:**
    - `mysql_native_password`**:** autenticação baseada em senha (padrão);
    - `caching_sha2_password`**:** autenticação baseada em chave (por exemplo, autenticação SSH);
    - `ed25519`**:** autenticação baseada em chave (mais segura).

[Alterando o mecanismo.](#alteruser)

# <a id = "clausulas"></a>Cláusulas.

No contexto de consultas SQL, as cláusulas são equivalentes a palavras chave que têm um significado específico e desempenham um papel crucial na estrutura e no funcionamento das consultas. Cada cláusulas tem uma função específica e ajuda a definir como os resultados da consulta serão recuperados, filtrados, classificados, agrupados e limitados. Algumas das cláusulas SQL comuns incluem:

- `SELECT`**:** usada para selecionar colunas de uma tabela ou calcular valores com base em colunas;
- `FROM`**:** especifica a tabela da qual os dados são recuperados;
- `WHERE`**:** define condições de filtro para restringir os registros recuperados;
- `ORDER BY`**:** classifica os resultados em ordem crescente ou decrescente;
- `HAVING`**:** define condições de filtro para grupos resultantes após a cláusula `GROUP BY`;
- [`JOIN`](#join)**:** combina dados de duas ou mais tabelas com base em uma relação específica;
- `LIMIT`**:** limita o número de linhas retornadas nos resultados. Ela permite que você especifique quantos registros deseja recuperar;
- `DISTINCT`**:** retorna valores únicos em uma coluna;
- `DESC`**: Descending order** é usada para especificar que você deseja classificar os resultados em ordem decrescente. Por padrão, as consultas SQL classificam em ordem crescente (do menor para o maior valor). Usando `DESC`, você inverte a ordem e classifica em ordem decrescente (do maior para o menor valor);

```MySQL
CASE
    WHEN condicao1 THEN resultado1
    WHEN condicao2 THEN resultado2
    ELSE resultado_padrao
END AS nome_da_coluna_resultante
```

- `CASE` **e** `END`**:** são claúsulas condicionais que podem ser usadas em uma consulta SQL para criar lógica condicional. **Cada expressão condicional pode retornar somente um valor**.
    - `CASE`**:** é uma cláusula usada para criar expressões condicionais em SQL. Ela permite que você avalie diferentes condições e retorne um valor com base na primeira condição que seja verdadeira. Pode ser usado em várias partes de uma consulta, como instruções `SELECT`, `WHERE` e outras;
        - `WHEN`**:** palavra chave específica da `CASE` e é usado para definir uma condição a ser avaliada;
        - `THEN`**:** palavra chave específica da `CASE` e é usada para especificar o que fazer se a condição definida em `WHEN`for verdadeira;
        - `ELSE` **(opcional):** palavra chave específica da `CASE` e é usada para definir um resultado padrão se nenhuma das condições em `WHEN` for verdadeira. Caso não seja especificada e nenhuma condição for atendida, a cláusula `CASE` retornará `NULL`.
    - `END`**:** é usado para encerrar a cláusula `CASE` e marcar o fim da expressão condicional;
    - `AS`**:** é usado para atribuir um alias (nome alternativo) à coluna resultante da expressão condicional. **Considere o cenário em que a expressão condicional calcula um novo valor, para conseguirmos nos referenciar a ele, usamos o alias**.

## Operadores matemáticos.

SQL pode utilizar operadores matemáticos em expressões para realizar cálculos matemáticos. Os operadores matemáticos padrão incluem adição (`+`), subtração (`-`), multiplicação (`*`), divisão (`/`) e também a porcentagem (`%`).

## Operadores lógicos.

Enquanto cláusulas são partes principais de uma consulta SQL que definem o que você deseja realizar, operadores lógicos são usados dentro da cláusula `WHERE` para combinar condições e criar expressões lógicas que determinam quais registros devem ser incluídos ou não da consulta.\
Os operadores lógicos são: `AND`, `OR`, `NOT`.

## Operadores de comparação.

`IS NULL` e `IS NOT NULL` são geralmente classificados como operadores de comparação em SQL, uma vez que são usados para comparar valores em colunas com o valor nulo. Sendo que `NULL` **é um valor especial**

## <a id = "join"></a>Operações de junção.

### `STRAIGHT_JOIN`

A expressão `STRAIGHT_JOIN` não é uma cláusula SQL padrão, mas pode ser específica de um **sistema de gerenciamento de banco de dados** (**SGBD**) em particular ou uma extensão não padronizada de SQL. Ela não é amplamente suportada em todos os SGBDs.\
A expressão `STRAIGHT_JOIN` é usada para forçar o otimizador de consultas a usar a ordem de junção especificada, em vez de determinar a ordem de junção mais eficiente com base nas estatísticas e índices disponíveis. Isso pode ser útil em casos específicos em que você deseja controlar a ordem de junção parar melhorar o desempenho da consulta. A sintaxe geral da expressão `STRAIGHT_JOIN` pode ser algo como:

```MySQL
SELECT colunas
FROM tabela1
STRAIGHT JOIN tabela2
ON condicao_de_juncao;
```

Neste caso, a consulta forçaria uma junção direta entre `tabela1` e `tabela2`, seguindo as condições de junção especificadas. Por exemplo:\
Tabela1.

```
| coluna1 | coluna2 | coluna3 |
|---|---|---|
| 1 | 2 | A |
| 3 | 4 | B |
```

Tabela2.

```
| coluna1 | coluna2 | coluna4 |
|---|---|---|
| 1 | 2 | C |
| 3 | 5 | D |
```

```MySQL
SELECT Tabela1.coluna1, Tabela1.coluna2, Tabela1.coluna3, Tabela2.coluna4
FROM tabela1
STRAIGHT JOIN tabela2
ON Tabela1.coluna1 = Tabela2.coluna1 AND Tabela1.coluna2 = Tabela2.coluna2;
```

```
| coluna1 | coluna2 | coluna3 | coluna4 |
|---|---|---|---|
| 1 | 2 | A | C |
```

O uso de `STRAIGHT_JOIN` pode ser mais eficiente quando você tem muitos registros que não atendem à condição de junção e deseja evitá-los desde o início.

## Comandos SQL distintos com propósitos específicos.

### `REPLACE`

Estrutura geral.

`REPLACE INTO tabela (colunas) VALUES (valores);`

O comportamento do comando `REPLACE` é semelhante ao `INSERT`, mas ele verifica se há uma chave primária ou única duplicada na tabela. Se uma chave duplicada for encontrada, ele exclui o registro existente e insere um novo registro com os valores fornecidos. Se não houver uma chave duplicada, ele simplesmente insere um novo registro.

## `ON DUPLICATE KEY UPDATE`

Essa construção é uma **extensão do comando** `INSERT` e é usada para controlar o comportamento de inserções em relação a registros duplicados.

# <a id = "tiposdados"></a>Tipos de dados.

### `INTERVAL`

O `INTERVAL` é um tipo de dados especial em sistemas de gerenciamento de banco de dados, como o MySQL, usado para representar um intervalo de tempo ou duração. Ele é uma unidade de medida temporal que indica uma quantidade de tempo em relação a um ponto de referência. O `INTERVAL` é composto por dois componentes:

- **Valor numérico:** este é um número que representa a quantidade de tempo. Pode ser qualquer número inteiro ou decimal, como 1, 0.5, 10, etc;
- **Unidade de medida de tempo:** isso especifica a unidade pela qual o tempo é medido. As unidades comuns incluer `YEAR` (**ano**), `MONTH` (**mês**), `DAY` (**dia**), `HOUR` (**hora**), `MINUTE` (**minuto**), `SECOND` (**segundo**), `MICROSECOND` (**microssegundo**), `WEEK` (**semana**) e outras.

Portanto, o `INTERVAL` é usado para representar uma quantidade específica de tempo em termos da unidade de medida de tempo escolhida. É frequentemente usado em consultas SQL para realizar cálculos relacionados ao tempo, como adicionar ou subtrair intervalos de datas e horas. Um [exemplo](#deletenow) interessante com `INTERVAL`.

# <a id = "listadecomandos"></a>Lista de comandos.

- `SELECT user, host, plugin FROM mysql.user;`**:** verifica os usuários disponíveis no MySQL localmente. [Explicação detalhada](#selectuser);
- `GRANT USAGE ON *.* TO 'usuario'@'host';`**:** [Explicação detalhada](#grantusage);
- `GRANT ALL PRIVILEGES ON banco.* TO 'usuario'@'host';`**:** garante todos os privilégios para o banco `banco`;
- `SHOW GRANTS for 'usuario'@'host';`**:** exibe as permissões concedidas ao usuário `usuario` em um host específico no MySQL;
- `CREATE DATABASE banco;`**:** cria um novo banco `banco`;
- `DROP DATABASE banco;`**:** deleta um banco de dados;
- `DESCRIBE tabela;` ou `DESC tabela;` ou `SHOW COLUMNS FROM tabela;`**:** descreve a tabela `tabela`;
- `ALTER TABLE tabela ADD coluna tipo_da_coluna;`**:** altera a tabela `tabela` adicionando uma coluna `coluna` a ela, de tipo `tipo_da_coluna`. [Explicação detalhada](#altertable); <-- Uma descrição melhor dos campos do comando.
- `SELECT coluna FROM tabela;`**:** seleciona os valores da coluna `coluna` da tabela `tabela`;
- `UPDATE tabela SET coluna = valor;`**:** atualiza os valores da coluna `coluna` para `valor` na tabela `tabela`;
- `DELETE FROM tabela WHERE condicao`**:** deleta os registros que atendem determinada `condicao`. [Exemplo interessante](#deletenow).

# Comandos.

## <a id = "grantusage"></a>`GRANT USAGE`

O comando `GRANT USAGE ON *.* TO 'usuario'@'host'` concede ao usuário apenas o privilégio `USAGE` em todos os objetos do banco de dados (`*.*`), o que basicamente permite que o usuário faça uma conexão com o servido MySQL, mas não fornece acesso a **nenhum banco de dados ou tabela específios**.

## <a id = "showdatabases"></a>`SHOW DATABASES`

Quando você usa o comando `SHOW DATABASES` no MySQL e o usuário não vê um banco de dados na lista, isso significa que o usuário não tem permissões para ver ou acessar esse banco de dados específico.

# <a id = "funcoes"></a>Funções.

### `IF()`

A função `IF()` em MySQL é uma função condicional em SQL que permite avaliar uma expressão lógica e retornar um valor com base nessa avaliação. A sintaxe geral da função `IF()` é a seguinte:

`IF(expressao_logica, valor_se_verdadeiro, valor_se_falso)`

- `expressao_logica`**:** é a condição que você deseja avaliar. Se esta condição for verdadeira, a função retornará `valor_se_verdadeiro`; caso contrário, retornará `valor_se_falso`;
- `valor_se_verdadeiro`**:** é o valor retornado se a `expressao_logica` for verdadeira;
- `valor_se_falso`**:** é o valor retornado se a `expressao_logica` for falsa.

Por exemplo, você pode usar a função `IF()` para definir um valor padrão quando uma coluna for nula:

```MySQL
SELECT nome, IF(idade IS NULL, 'Idade desconhecida', idade) AS idade
FROM clientes;
```

Neste exemplo, se a coluna `idade` for nula, a função `IF()` retorna a string `'Idade desconhecida'`; caso contrário, retorna o valor da coluna `idade`. A função `IF()` é útil para lidar com situações condicionais em consultas SQL.

### `NOW()`

`NOW()` é uma função do MySQL que retorna a data e hora atuais no formato "YYYY-MM-DD HH:MM:SS". É frequentemente usada para obter o carimbo de data e hora atual em consultas SQL. É frequentemente usada para obter o carimbo de data e hora atual em consultas SQL. O valor retornado por `NOW()` **depende da data e hora do servidor MySQL onde a consulta é executada**.\
Você pode usar o `NOW()` em várias partes de uma consulta SQL, como inserções, atualizações, exclusões e seleções, para registrar ou realizar operações com base na data e hora atual. Por exemplo, para registrar o horário exato em que um registro foi inserido em uma tabela, você pode usar `NOW()` na consulta de inserção.\
Lembre-se de que o valor retornado por `NOW()` é fixo durante a execução de uma consulta, ou seja, o valor da data e hora atual é o mesmo em toda a consulta. Se você desejar uma data e hora que seja atualizada continuadamente durante uma consulta, pode usar `SYSDATE()` em vez de `NOW()`. Exemplo do uso de <a id = "deletenow"></a>`NOW()`:

`DELETE FROM tabela WHERE created_at < NOW() - INTERVAL 1 WEEK`

- `NOW()`**:** isso é uma função que retorna a data e hora atual;
- `INTERVAL 1 WEEK`**:** isso cria um intervalo de tempo de uma semana (sete dias).

A consulta acima está excluindo todos os registros na tabela `tabela` que foram criados há mais de uma semana a partir do momento atual. Isso é útil para limpar registros antigos que não são mais relevantes ou necessários em um banco de dados.

### `CONVERT_TZ()`

A função `CONVERT_TZ()` em MySQL é usada para converter um valor de data e hora de um fuso horário para outro fuso horário,

`CONVERT_TZ(valor, fusoHorarioOrigem, fusoHorarioDestino)`

- `valor`**:** a data e hora que você deseja converter;
- `fusoHorarioOrigem`**:** o fuso horário atual do valor (coloque o valor entre aspas simples, `'fusoHorarioOrigem'`);
- `fusoHorarioDestino`**:** o fuso horário para qual você deseja converter o valor (coloque o valor entre aspas simples, `'fusoHorarioDestino'`).

### `DATE()`

A função `DATE()` em MySQL é usada para extrair a parte da data de um valor de data ou carimbo de data/hora. Elas retorna a data (ano, mês e dia) do valor de data ou carimbo de data/hora fornecido como argumento. Por exemplo, se você tiver um valor de data/hora como "2023-10-26 15:30:00", a função `DATE()` aplicada a esse valor retornará a data "2023-10-26".

`SELECT HOUR('2023-10-26 15:30:00') AS Data;`

```MySQL
| Data |
|---|
| 2023-10-26 |
```

### `HOUR()`

A função `HOUR()` em MySQL é usada para extrair a parte da hora de um valor de data ou carimbo de data/hora. Ela retorna um número inteiro que representa a hora do dia, variando de 0 a 23, com base no valor de data ou carimbo de data/hora fornecido como argumento. Por exemplo, se você tiver um valor de data/hora como "2023-10-26 15:30:00", a função `HOUR()` aplicada a esse valor retornará o número 15, que representa a hora.

`SELECT HOUR('2023-10-26 15:30:00') AS Hora;`

```MySQL
| Hora |
|---|
| 15 |
```

### `SUM()`

A função `SUM()` em MySQL é uma função de agregação que é usada para calcular a soma dos valores em uma coluna numérica de um conjunto de registros. Ela é frequentemente usada em conjunto com a cláusula `GROUP BY` para calcular somas em grupos de registros com base em uma ou mais colunas.

`SUM(nome_da_coluna)`

`nome_da_coluna`**:** o nome da coluna numérica da qual você deseja calcular a soma.

A função `SUM()` adiciona todos os valores na coluna especificada e retorna o resultado como um único valor. Aqui está um exemplo simples de como usar a função `SUM()` para calcular a soma dos valores em uma coluna:\
Suponha que você tenha a seguinte `TabelaDeVendas`:

```MySQL
| ID | Valor |
|---|---|
| 1 | 100 |
| 2 | 150 |
| 3 | 200 |
```

Você pode usar a função `SUM()` para calcular a soma dos valores na coluna `Valor` da seguinte forma:

```MySQL
SELECT SUM(Valor) AS SomaTotal
FROM TabelaDeVendas;
```

```MySQL
| SomaTotal |
|---|
| 450 |
```

Neste exemplo, a função `SUM()` calcula a soma dos valores na coluna `Valor`, resultando em uma soma total de `450`. A função `SUM()` é útil para calcular valores agregados, como a soma total, em conjuntos de dados.

# <a id = "alias"></a>Alias.

Os aliases são usados principalmente para tornar o código mais legível e compreensível para os desenvolvedores e não tem impacto direto nos resultados dos cálculos ou na inserção de dados. Ele são úteis para dar nomes descritivos às colunas resultantes ou para simplificar expressões complexas.\
A ordem dos valores em uma query é o que realmente importa em SQL, é atráves desta ordem que ele associa uma coluna a um valor, independente se uma das colunas tem o mesmo nome que um alias.

# <a id = "querysmultiplastabelas"></a>Querys utilizando múltiplas tabelas.

Quando você tem uma consulta SQL com várias tabelas envolvidas e você faz referência a uma coluna sem especificar de qual tabela ela pertence, o sistema geralmente usa uma heurística para determinar de qual tabela a coluna deve ser recuperada. A heurística normalmente procura na ordem em que as tabelas estão listadas na consulta. Ela selecionará a primeira tabela na qual encontrar a coluna.\
Para torna a consulta mais clara e evitar ambiguidades, é uma boa prática especificar a tabela da qual a coluna deve ser recuperada, mesmo que a coluna tenha o mesmo nome em várias tabelas.

# <a id = "procedure"></a>Procedure.

Uma **procedure** (**procedimento armazenado**) é um objeto de banco de dados que contém um ou mais comandos SQL predefinidos e é armazenado no sistema de gerenciamento de banco de dados (SGBD) para ser executado quando necessário. As procedures são usadas para executar tarefas específicas ou operações no banco de dados.

Algumas características e conceitos-chave relacionados a procedures:

- **Bloco de código SQL:** uma procedure consiste em um **bloco de código SQL** que pode incluir instruções de consulta (como `SELECT`), instruções de modificação de dados (como `INSERT`, `UPDATE`, `DELETE`) e **estrutras de controle** (como `IF`-`THEN`-`ELSE`, loops);
- **Parâmetros:** as procedures **podem receber parâmetros** como entrada, que são usados para personalizar a execução da procedure. Os parâmetros podem ser valores simples ou até mesmo tabelas temporárias;
- **Reutilização de código:** uma das principais vantagens das procedures é a reutilização de código. Em vez de escrever o mesmo conjunto de comandos SQL várias vezes em diferentes partes do aplicativo, você pode criar uma procedure e chamá-la sempre que precisar realizar uma tarefa específica;
- **Segurança:** as procedures podem ser usadas para impor restrições de segurança e controle de acesso a dados. Você pode conceder permissões de execução apenas para determinados usuários ou funções, garantindo que somente pessoas autorizadas possam executar a lógica da procedure;
- **Performance:** em muitos casos, as procedures podem melhorar o desempenho das consultas e operações no banco de dados. Elas podem ser compiladas e otimizadas pelo SGBD, reduzindo a sobrecarga de rede e melhorando o desempenho geral;
- **Manutenção:** quando você precisa fazer alterações na lógica de uma operação no banco de dados, pode atualizar a procedure em vez de modificar o código em várias partes do aplicativo;
- **Transações:** as procedures podem ser usadas em transações, permitindo que você execute várias operações em uma única unidade de trabalho. Isso é útil para garantir a consistência dos dados.

Exemplo de procedure:

```MySQL
CREATE OR REPLACE PROCEDURE \`zoeslots\`.\`update_deviation\`(IN _machine_id INT(11), _deviation_amount BIGINT(20))
/*A linha acima cria ou substitui uma procedure chamada update_deviation no esquema do banco de dados zoeslots. A procedure aceita dois parâmetros: _machine_id como INT e _deviation_amount como BIGINT.
Pode haver erros de sintaxe envolvendo a barra invertida e a crase grave.*/
      
    main: BEGIN
    #Na linha acima começa o bloco principal da procedure, rotulado como main.

        DECLARE x INT;
        DECLARE deviation INT;
        DECLARE deviation_amount INT;
        DECLARE machine_online INT;
        # DECLARE é utilizada para declaração de variáveis.

        SET x = 1;
        #SET é utilizada para inicializar o valor da variável.
      
        if _deviation_amount < -5000 || _deviation_amount > 5000 THEN
            LEAVE main;
        END IF;
      
        SELECT online INTO machine_online FROM machines WHERE id = _machine_id;
        /*Na operação de consulta acima, você está selecionando o valor da coluna online onde o valor de id é igual ao valor de machine_id. O resultado é armazenado na variável machine_online.*/

        IF machine_online = 0 THEN
            LEAVE main;
        END IF; 
      
        loop_label: LOOP
        #Na linha acima há o início de um loop rotulado como loop_label.              
            sleep_label: LOOP
            #Na linha acima há o início de um loop rotulado como sleep_label.

                SELECT modify_deviation, deviation_amount  INTO deviation, deviation_amount FROM machines where id = _machine_id;

                IF deviation != 0 || deviation_amount != 0 THEN
                    DO SLEEP(1); #Pausa a execução do bloco em 1 segundo.
                ELSE
                    LEAVE sleep_label;
                END IF;

            END LOOP;
              
            IF x > 10 THEN 
                LEAVE loop_label;
            END IF;
              
            UPDATE machines SET modify_deviation = x, deviation_amount = _deviation_amount WHERE id = _machine_id;

            SET  x = x + 1;
          
        END LOOP;
    END
```

# <a id = "erros"></a>Erros.

### Access denied for user 'nome_de_usuario'@'enderecoIP' (using password: YES)

Este erro indica que **houve uma tentativa de conexão a um banco de dados, mas o usuário não possui permissão para acessar o banco de dados** a partir do endereço de IP ou **as credenciais (nome de usuário e senha) fornecidas estão incorretas**. Algumas etapas para resolver este problema:

- **Verifique a autenticação (isso no MySQL):** verifique se o MySQL está configurado para autenticar corretamente os usuários. **O MySQL pode usar diferentes métodos de autenticação**, como autenticação por senha ou autenticação baseada em chave. Certifique-se de que a autenticação por senha esteja habilitada; 
- **Verifique as credenciais:** certifique-se de que o nome de usuário e a senha fornecidos estejam corretos. Verifique se não há espaços em branco ou caracteres extras na senha;
- **Verifique as permissões:** confirme se o usuário tem permissão para acessar o banco de dados a partir do endereço IP. Você pode verificar e ajustar as permissões no servidor do banco de dados;
- **Verifique o host:** verifique se o servidor está configurado para permitir conexões do endereço IP. Isso pode ser verificado nas configurações do servidor, geralmente no arquivo **my.cnf** ou **my.ini**, dependendo do sistema operacional;
- **Firewall e segurança de rede:** certifique-se de que não há um firewall ou regra de segurança de rede que esteja bloqueando a conexão do endereço IP para o servidor;
- **Tentativa de conexão:** tente se conectar ao banco de dados novamente, garantindo que você esteja usando as credenciais corretas e que o endeço IP esteja acessível.