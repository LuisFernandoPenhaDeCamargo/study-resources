# Sequelize

# Observações Importantes

Quando você utiliza o Sequelize junto com o Umzug para realizar uma migração no banco de dados, o usuário que está logado no banco (ou seja, o usuário utilizado na conexão configurada no Sequelize) é o que será vinculado como o `DEFINER` das procedures, functions ou triggers criadas durante essa migração.

O Sequelize se conecta ao banco de dados usando as credenciais fornecidas, e quando o Umzug executa as migrações, ele utiliza essa conexão do Sequelize para criar ou modificar estruturas no banco de dados, como procedures, funções, tabelas, etc. Se durante a migração forem criadas procedures ou funções armazenadas, o `DEFINER` associado a essas estruturas será o usuário utilizado para estabelecer a conexão com o banco de dados.

## Exemplo

Digamos que você utilize um arquivo de configuração para fornecer as credenciais utilizadas para se conectar ao banco:

```JSON
{
    "development": {
        "username": "mig_user",
        "password": "mig_password",
        "database": "database_name",
        "host":     "localhost",
        "dialect":  "mysql"
    }
}
```

Então, se você criar uma procedure durante a migração, o `DEFINER` dela será `´mig_user´@´localhost´`.

Se você tem diferentes usuários para diferentes ambientes (desenvolvimento, teste, produção), o `DEFINER` pode variar dependendo de onde a migração é executada.

O usuário utilizado para a conexão deve ter os privilégios adequados para criar ou modificar as estruturas do banco de dados, incluindo a criação de procedures.

## Resumo

O usuário que abre a conexão com o banco de dados durante a migração com Sequelize e Umzug é o que fica vinculado como `DEFINER` das procedures e outras estruturas criadas ou alteradas.