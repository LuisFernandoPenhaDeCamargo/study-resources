# SQL.

O nome do host local é `localhost`.

A porta padrão do MySQL é 3306.

# Lista de comandos.

`DESCRIBE nome_da_tabela;` ou `DESC nome_da_tabela;` ou `SHOW COLUMNS FROM nome_da_tabela;`**:** descreve a tabela `nome_da_tabela`.

# Erros.

### Access denied for user 'nome_de_usuario'@'enderecoIP' (using password: YES)

Este erro indica que **houve uma tentativa de conexão a um banco de dados, mas o usuário não possui permissão para acessar o banco de dados** a partir do endereço de IP ou **as credenciais (nome de usuário e senha) fornecidas estão incorretas**. Algumas etapas para resolver este problema:

- **Verifique as credenciais:** certifique-se de que o nome de usuário e a senha fornecidos estejam corretos. Verifique se não há espaços em branco ou caracteres extras na senha;
- **Verifique as permissões:** confirme se o usuário tem permissão para acessar o banco de dados a partir do endereço IP. Você pode verificar e ajustar as permissões no servidor do banco de dados;
- **Verifique o host:** verifique se o servidor está configurado para permitir conexões do endereço IP. Isso pode ser verificado nas configurações do servidor, geralmente no arquivo **my.cnf** ou **my.ini**, dependendo do sistema operacional;
- **Firewall e segurança de rede:** certifique-se de que não há um firewall ou regra de segurança de rede que esteja bloqueando a conexão do endereço IP para o servidor;
- **Tentativa de conexão:** tente se conectar ao banco de dados novamente, garantindo que você esteja usando as credenciais corretas e que o endeço IP esteja acessível.

---

# SQL.

mysql -u legacy-api -p

show databases;

select user, host, plugin from mysql.user;

show grants for 'legacy-api'@'localhost';

CREATE DATABASE nome_do_banco;

mysql -u seu_usuario -p nome_do_banco < dump.sql

- `SELECT db_version FROM settings`;
- `ALTER TABLE settings ADD COLUMN db_version BIGINT NOT NULL DEFAULT 0`;
- `UPDATE settings SET id = 0`.

# Procedure.

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
    //Na linha acima começa o bloco principal da procedure, rotulado como main.

        DECLARE x INT;
        DECLARE deviation INT;
        DECLARE deviation_amount INT;
        DECLARE machine_online INT;
        //DECLARE é utilizada para declaração de variáveis.

        SET x = 1;
        //SET é utilizada para inicializar o valor da variável.
      
        if _deviation_amount < -5000 || _deviation_amount > 5000 THEN
            LEAVE main;
        END IF;
      
        SELECT online INTO machine_online FROM machines WHERE id = _machine_id;
        /*/*Na operação de consulta acima, você está selecionando o valor da coluna online onde o valor de id é igual ao valor de machine_id. O resultado é armazenado na variável machine_online.*/

        IF machine_online = 0 THEN
            LEAVE main;
        END IF; 
      
        loop_label: 
        //Na linha acima há o início de um loop rotulado como loop_label.              
            sleep_label: LOOP
            //Na linha acima há o início de um loop rotulado como sleep_label.

                SELECT modify_deviation, deviation_amount  INTO deviation, deviation_amount FROM machines where id = _machine_id;

                IF deviation != 0 || deviation_amount != 0 THEN
                    DO SLEEP(1); //Pausa a execução do bloco em 1 segundo.
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