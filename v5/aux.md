<F

O id é a chave primária, vai incrementando.
Me parece que o server_id está ficando em 0, então não deve usar pra nada.
O game é o ID do jogo.
O machine_id é o ID da máquina (101, 102, etc.).
O board_id é o ID da placa.
O money_in e o money_out se referem ao valor que entrou ou saiu naquela operação. Não é o valor total da máquina.
O operation é o tipo da operação, IN entrada e OUT saída. Não sei o que é REV.
O payment_type é um desses tipos, mas acredito que a grande maioria será CASH. As outras opções acho que estão disponíveis para seleção no Caixa.
O transaction_owner acho que tem a ideia de falar se a transação foi feita pela máquina ou pelo Caixa. Não sei se isso está funcionando.
O validation é um código de validação da transação, não tenho certeza onde é usado.
O created é a data de criação.
O visitor não sei se é usado também, também acho que fica sempre em 0.
O card_id e o player_name acho que são de umas opções que já existiram ou pensaram em adicionar no Caixa, mas a gente não usa.
O exported_local não sei o que é, também me parece que fica sempre em 0.
O status_code está em 200 em todos os registros do servidor 3157. Não sei se acontece de ficar com valor diferente.
O exported_at deve ser a data de exportação, geralmente um pouco depois do created.

cashier.status_code: status da resposta da requisição que realizou a exportação dos registros

# ---

PERA

QUAL A DIFERENÇA DE 

query:          (sql) => sequelize.query(sql),

PRA 

query:          sequelize.query,

AFINAL O MÉTODO QUERY NÃO ESTÁ VINCULADO AO sequelize?

Você está certo ao questionar isso, porque a diferença está em como o JavaScript trata o contexto de execução (o valor de `this`) quando métodos de objetos são passados como referência.

### Diferença entre as duas abordagens:

1. **`query: (sql) => sequelize.query(sql)`**:
   - Aqui você está criando uma função anônima (arrow function) que chama o método `query` do objeto `sequelize`. Essa abordagem garante que o contexto de `this` dentro do método `query` seja corretamente vinculado ao objeto `sequelize`. Isso ocorre porque as arrow functions não têm seu próprio `this`; elas herdam o `this` do escopo onde foram definidas.
   - Isso evita problemas de perda de contexto caso `query` seja chamado em outro lugar onde o `this` pode mudar.

2. **`query: sequelize.query`**:
   - Aqui você está passando uma referência direta ao método `query` do objeto `sequelize`. Isso pode ser problemático porque, ao passar o método dessa forma, ele pode ser chamado sem o seu `this` corretamente vinculado ao objeto `sequelize`.
   - Como o método `query` depende do `this` para acessar outras propriedades internas do `sequelize` (como configurações de conexão e opções), se o `this` não estiver corretamente vinculado, você obterá erros como "Cannot read properties of undefined (reading 'options')".

### Por que a primeira abordagem é mais segura?

No JavaScript, quando você passa um método de objeto diretamente (como `sequelize.query`), ele perde seu contexto original (`this`). Isso é um comportamento comum quando métodos de objetos são passados como argumentos ou propriedades. 

Usar a arrow function (`(sql) => sequelize.query(sql)`) mantém o contexto correto e garante que `sequelize.query` funcione como esperado, com o `this` sempre apontando para o objeto `sequelize`.

### Resumo:

- **`query: sequelize.query`** pode perder o contexto de `this` e falhar, porque a função `query` depende de `this` para acessar propriedades internas.
- **`query: (sql) => sequelize.query(sql)`** mantém o contexto de `this` correto, garantindo que o método funcione como esperado, mesmo quando passado como referência.

Então, a primeira abordagem é a mais segura para garantir que o método `query` funcione corretamente no seu código.

# ---

mas o Sequelize é resistente só por conta do nome da coluna? <F modelo antigo

 Field                  | Type                         | Null | Key | Default             | Extra |
+------------------------+------------------------------+------+-----+---------------------+-------+
| id                     | int(11)                      | YES  |     | NULL                |       |

porque id não é uma chave primária

Sim, a resistência do Sequelize em permitir a atualização da coluna `id` pode estar relacionada ao nome da coluna e à sua associação comum com uma chave primária. No entanto, mesmo que `id` não esteja definido como uma chave primária na sua tabela, pode haver outras considerações:

1. **Comportamento do Sequelize**: O Sequelize trata colunas nomeadas como `id` com uma certa lógica pré-definida, presumindo que, por convenção, essa coluna seja a chave primária. Quando você tenta fazer uma operação de atualização que envolve essa coluna, o Sequelize pode aplicar validações específicas.

2. **Implementação do Banco de Dados**: Alguns bancos de dados, mesmo que a coluna `id` não seja explicitamente definida como chave primária, podem ter regras internas ou comportamentos padrão que proíbem a alteração de valores que são considerados identificadores. Isso varia de acordo com o tipo de banco de dados que você está utilizando (MySQL, PostgreSQL, etc.).

3. **Integridade Referencial**: Alterar uma coluna que geralmente serve como identificador de um registro pode levar a problemas de integridade referencial se houver outras tabelas relacionadas a ela. Embora isso não seja uma restrição imposta pelo Sequelize em si, é uma prática comum em bancos de dados relacionais.

4. **Erros Comuns**: Se o `id` não está definido como chave primária, mas o banco de dados ainda está retornando um erro, pode ser devido a triggers ou restrições que você não está ciente. A configuração de tabelas pode incluir regras que proíbem a atualização dessa coluna.

### Conclusão
Para evitar problemas, é aconselhável não tentar atualizar a coluna `id`, independentemente de como ela está configurada. Se você precisa de uma lógica que mude o identificador de um registro, considere criar um novo registro e remover o antigo, como mencionado anteriormente.

Para mais detalhes sobre o comportamento do Sequelize em relação a operações de atualização, consulte a [documentação oficial do Sequelize](https://sequelize.org/docs/v6/core-concepts/model-basics/#update).

# ---

type timestamp x type datetime <F modelo antigo

A diferença entre os tipos `TIMESTAMP` e `DATETIME` no contexto de bancos de dados, como MySQL, se resume principalmente ao comportamento em relação à fusão de horários e à forma como os dados são armazenados e manipulados. Aqui estão os pontos principais:

### `TIMESTAMP`
- **Intervalo**: `1970-01-01 00:00:01` UTC até `2038-01-19 03:14:07` UTC.
- **Armazenamento**: Armazena a data e a hora como um valor inteiro representando o número de segundos desde o "epoch" (1 de janeiro de 1970). Isso o torna sensível ao fuso horário.
- **Comportamento de Fuso Horário**: O valor é armazenado em UTC, mas ao recuperar, é ajustado para o fuso horário do cliente ou do sistema.
- **Uso Comum**: É ideal para armazenar informações temporais onde o fuso horário é uma preocupação, como timestamps de eventos.

### `DATETIME`
- **Intervalo**: `1000-01-01 00:00:00` até `9999-12-31 23:59:59`.
- **Armazenamento**: Armazena a data e a hora como um formato de string, não sendo convertido para UTC, portanto, não é afetado pelo fuso horário.
- **Comportamento de Fuso Horário**: Não faz conversão de fuso horário, portanto, o valor é retornado exatamente como foi inserido.
- **Uso Comum**: É mais apropriado para dados que não precisam de ajustes de fuso horário ou onde a data precisa ser registrada literalmente.

### Resumo
- Use **`TIMESTAMP`** quando você precisa de um valor que seja sensível ao fuso horário e representativo do tempo real (especialmente útil em aplicações globais).
- Use **`DATETIME`** quando você precisa de uma representação mais ampla de datas que não requer a preocupação com fusos horários.

Para mais informações, você pode consultar a documentação oficial do MySQL sobre [TIMESTAMP](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-type-overview.html#date-and-time-types-timestamp) e [DATETIME](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-type-overview.html#date-and-time-types-datetime).

# ---

/* Migração que adiciona a coluna utilizada no controle dos pacotes utilizados no ambiente HOMOLOG, e as colunas utilizadas na verificação se o prêmio foi forçado 
ou não.*/

"use strict";

module.exports = {
    up: async (queryInterface, Sequelize) => {
        await queryInterface.addColumn("settings", "homolog_version", { // Coluna utilizada no controle dos pacotes utilizados no ambiente HOMOLOG.
            /* Gostaria que o tipo da coluna abaixo fosse JSON, mas como atualmente usamos a versão 10.1.40 do MariaDB, isso não é possível (o suporte para o tipo 
            de dados JSON foi introduzido na versão 12.2.7).*/
            type: Sequelize.TEXT("long"),
            allowNull: true,
        });
        await queryInterface.addColumn("big_winners", "prize_name", {   // Coluna utilizada na verificação se o prêmio foi forçado ou não.
            type: Sequelize.ENUM("ACCUMULATED", "JACKPOT"),
            allowNull: true,
        });
        await queryInterface.addColumn("big_winners", "is_forced", {    // Coluna utilizada na verificação se o prêmio foi forçado ou não.
            type: Sequelize.BOOLEAN, // Internamente mapeado para `TINYINT(1)`.
            allowNull: true,
        });
    },

    down: async (queryInterface) => {
        await queryInterface.removeColumn("settings", "homolog_version");
        await queryInterface.removeColumn("big_winners", "prize_name");
        await queryInterface.removeColumn("big_winners", "is_forced");
    }
};

# ---