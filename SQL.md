# SQL.

- O nome do host local é `localhost`;
- A porta padrão do MySQL é 3306;
- No MySQL você não pode recuperar a senha de um usuário, pois senhas são armazenadas com criptografia e não podem ser recuperadas em texto simples. O que pode ser feito é redefinir a senha de um usuário;
- **Comentários de linha única:** você pode criar comentários de linha única com `--` (dois hifens) ou `#` (símbolo do jogo da velha). Qualquer texto após esses caracteres será tratado como um comentário e não terá efeito na execução do código;
- **Comentário de várias linhas:** você pode criar comentários de várias linhas usando `/*` para iniciar o comentário e `*/` para encerrá-lo. Qualquer texto entre esses delimitadores será tratado como um comentário.

# Sumário.

- [Mecanismos de autenticação (ou plugin de autenticação)](#mecanismosautenticacao);
- [Tipos de dados](#tiposdados);
- [Lista de comandos](#listadecomandos);
- [Funções](#funcoes);
- [Procedure](#procedure);
- [Erros](#erros).

## <a id = "mecanismosautenticacao"></a>Mecanismos de autenticação (ou plugin de autenticação).

**As opções de autenticação incluem:**
    - `mysql_native_password`**:** autenticação baseada em senha (padrão);
    - `caching_sha2_password`**:** autenticação baseada em chave (por exemplo, autenticação SSH);
    - `ed25519`**:** autenticação baseada em chave (mais segura).

[Alterando o mecanismo.](#alteruser)

# <a id = "tiposdados"></a>Tipos de dados.

### `INTERVAL`

O `INTERVAL` é um tipo de dados especial em sistemas de gerenciamento de banco de dados, como o MySQL, usado para representar um intervalo de tempo ou duração. Ele é uma unidade de medida temporal que indica uma quantidade de tempo em relação a um ponto de referência. O `INTERVAL` é composto por dois componentes:

- **Valor numérico:** este é um número que representa a quantidade de tempo. Pode ser qualquer número inteiro ou decimal, como 1, 0.5, 10, etc;
- **Unidade de medida de tempo:** isso especifica a unidade pela qual o tempo é medido. As unidades comuns incluer `YEAR` (**ano**), `MONTH` (**mês**), `DAY` (**dia**), `HOUR` (**hora**), `MINUTE` (**minuto**), `SECOND` (**segundo**), `MICROSECOND` (**microssegundo**), `WEEK` (**semana**) e outras.

Portanto, o `INTERVAL` é usado para representar uma quantidade específica de tempo em termos da unidade de medida de tempo escolhida. É frequentemente usado em consultas SQL para realizar cálculos relacionados ao tempo, como adicionar ou subtrair intervalos de datas e horas. Um [exemplo](#deletenow) interessante com `INTERVAL`.

# <a id = "listadecomandos"></a>Lista de comandos.

- `CREATE USER 'novo_usuario'@'host' IDENTIFIED BY 'senha';`**:** cria um novo usuário, de nome `novo_usuario` para determinado `host`, o usuário é identificado pela `senha`;
- `SELECT user, host, plugin FROM mysql.user;`**:** verifica os usuários disponíveis no MySQL localmente. [Explicação detalhada](#selectuser);
- `ALTER USER 'usuario'@'host' IDENTIFIED BY 'nova_senha';`**:** altera a senha do `usuario` para `nova_senha`. [Explicação detalhada](#alteruser);
- `GRANT USAGE ON *.* TO 'usuario'@'host';`**:** [Explicação detalhada](#grantusage);
- `GRANT ALL PRIVILEGES ON banco.* TO 'usuario'@'host';`**:** garante todos os privilégios para o banco `banco`;
- `SHOW GRANTS for 'usuario'@'host';`**:** exibe as permissões concedidas ao usuário `usuario` em um host específico no MySQL;
- `CREATE DATABASE banco;`**:** cria um novo banco `banco`;
- `SHOW DATABASES;`**:** lista os bancos de dados. [Explicação detalhada](#showdatabases);
- `DROP DATABASE banco;`**:** deleta um banco de dados;
- `DESCRIBE tabela;` ou `DESC tabela;` ou `SHOW COLUMNS FROM tabela;`**:** descreve a tabela `tabela`;
- `ALTER TABLE tabela ADD coluna tipo_da_coluna;`**:** altera a tabela `tabela` adicionando uma coluna `coluna` a ela, de tipo `tipo_da_coluna`. [Explicação detalhada](#altertable);
- `SELECT coluna FROM tabela;`**:** seleciona os valores da coluna `coluna` da tabela `tabela`;
- `UPDATE tabela SET coluna = valor;`**:** atualiza os valores da coluna `coluna` para `valor` na tabela `tabela`;
- `DELETE FROM tabela WHERE condicao`**:** deleta os registros que atendem determinada `condicao`. [Exemplo interessante](#deletenow).

# Comandos.

## <a id = "selectuser"></a>`SELECT user`

Esta query está lidando com a tabela user do banco de dados mysql (mysql.user), ela contém além dos usuários registrados, informações como por qual host este usuário se conecta e o mecanismo de autenticação (plugin) associado a esse usuário.

## <a id = "alteruser"></a>`ALTER USER`

O comando `ALTER USER` também lhe permite alterar o mecanismo de autenticação do usuário:

`ALTER USER 'usuario'@'host' IDENTIFIED WITH 'mysql_native_password' BY 'senha';`

Tendo em vista que é necessário especificar por qual senha ele é identificado (`BY 'senha'`, mas não é necessário utilizar uma nova, você pode alterar o usuário para utilizar a mesma).

## <a id = "grantusage"></a>`GRANT USAGE`

O comando `GRANT USAGE ON *.* TO 'usuario'@'host'` concede ao usuário apenas o privilégio `USAGE` em todos os objetos do banco de dados (`*.*`), o que basicamente permite que o usuário faça uma conexão com o servido MySQL, mas não fornece acesso a **nenhum banco de dados ou tabela específios**.

## <a id = "showdatabases"></a>`SHOW DATABASES`

Quando você usa o comando `SHOW DATABASES` no MySQL e o usuário não vê um banco de dados na lista, isso significa que o usuário não tem permissões para ver ou acessar esse banco de dados específico.

## <a id = "altertable"></a>`ALTER TABLE`

`ALTER TABLE tabela ADD coluna tipo_da_coluna;`

- `tipo_da_coluna`**:** `BIGINT` define o tipo de dados da coluna como um tipo numérico que pode armazenar números inteiros grandes;
- `tipo_da_coluna NOT NULL DEFAULT valor`**:**
    - `NOT NULL`**:** indica que a coluna não pode conter valores nulos, ou seja, sempre deve ter um valor;
    - `DEFAULT valor`**:** define o valor padrão da coluna como `valor`. Isso significa que se nenhum valor for especificado durante uma inserção de dados, o valor padrão será `valor`.

# <a id = "funcoes"></a>Funções.

### `NOW()`

`NOW()` é uma função do MySQL que retorna a data e hora atuais no formato "YYYY-MM-DD HH:MM:SS". É frequentemente usada para obter o carimbo de data e hora atual em consultas SQL. É frequentemente usada para obter o carimbo de data e hora atual em consultas SQL. O valor retornado por `NOW()` **depende da data e hora do servidor MySQL onde a consulta é executada**.\
Você pode usar o `NOW()` em várias partes de uma consulta SQL, como inserções, atualizações, exclusões e seleções, para registrar ou realizar operações com base na data e hora atual. Por exemplo, para registrar o horário exato em que um registro foi inserido em uma tabela, você pode usar `NOW()` na consulta de inserção.\
Lembre-se de que o valor retornado por `NOW()` é fixo durante a execução de uma consulta, ou seja, o valor da data e hora atual é o mesmo em toda a consulta. Se você desejar uma data e hora que seja atualizada continuadamente durante uma consulta, pode usar `SYSDATE()` em vez de `NOW()`. Exemplo do uso de <a id = "deletenow"></a>`NOW()`:

`DELETE FROM tabela WHERE created_at < NOW() - INTERVAL 1 WEEK`

- `NOW()`**:** isso é uma função que retorna a data e hora atual;
- `INTERVAL 1 WEEK`**:** isso cria um intervalo de tempo de uma semana (sete dias).

A consulta acima está excluindo todos os registros na tabela `tabela` que foram criados há mais de uma semana a partir do momento atual. Isso é útil para limpar registros antigos que não são mais relevantes ou necessários em um banco de dados.

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