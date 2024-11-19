# <a id="sequelize"></a>Sequelize

Sequelize é um ORM (Object-Relational Mapper) para Node.js, que permite manipular bancos de dados SQL de maneira programática e idiomática, utilizando JavaScript.

- Se você não definir a coluna na definição do modelo da tabela do banco, o Sequelize não irá conseguir trabalhar com a ela. Por exemplo, se ela não estiver definida no modelo e você tentar criar um registro querendo especificar um valor para ela, você não conseguirá e o valor default será utilizado
- O Sequelize não possui uma opção nativa para definir o comentário da coluna diretamente durante a criação da coluna

### Sumário

- [Tipos de Coluna](#tipos-coluna)
- [Métodos](#metodos)
    + [`queryInterface.addColumn()`](#metodos-queryinterface-addcolumn)
    + [`queryInterface.removeColumn()`](#metodos-queryinterface-removecolumn)
    + [`Model.create()`](#metodos-model-create)
    + [`Model.findOne()`](#metodos-model-findone)
    + [`Model.update()`](#metodos-model-update)

# <a id="tipos-coluna"></a>Tipos de Coluna

### Sumário

- [`TINYINT(1)`](#tipos-coluna-tinyint)

## <a id="tipos-coluna-tinyint"></a>`TINYINT(1)`

O tipo `TINYINT(1)` é frequentemente usado para armazenar valores booleanos em bancos de dados que não têm um tipo booleano nativo, como o MySQL. Em muitos ORMs e na interface do Sequelize, `TINYINT(1)` é tratado como booleano, onde 0 representa `false` e 1 representa `true`.

**Exemplos**

```JavaScript
const User = sequelize.define("user", {
    isActive: Sequelize.BOOLEAN, // Internamente mapeado para `TINYINT(1)` em alguns DBs.
});
```

# <a id="metodos"></a>Métodos

### Sumário

- [`queryInterface.addColumn()`](#metodos-queryinterface-addcolumn)
- [`queryInterface.removeColumn()`](#metodos-queryinterface-removecolumn)
- [`Model.create()`](#metodos-model-create)
- [`Model.findOne()`](#metodos-model-findone)
- [`Model.update()`](#metodos-model-update)

# <a id="metodos-queryinterface-addcolumn"></a>`queryInterface.addColumn()`

Para **adicionar uma coluna a uma tabela existente** usando o Sequelize, você pode usar o método `.addColumn()` da interface de consulta (`queryInterface`).

**Sintaxe Básica**

```JavaScript
queryInterface.addColumn(
    "$< nome da tabela >", // Nome da tabela à aqual você deseja adicionar a coluna.
    "$< nome da coluna >", // Nome da nova coluna.
    {
        type: Sequelize.$< tipo do dado > // Tipo de dado da nova coluna.
        allowNull: $< true ou false >     // Indica se a coluna pode conter valores nulos.
        defaultValue: $< valor padrão >   // Valor padrão para a nova coluna (opcional).
        // Outras opções podem ser adicionadas aqui, dependendo do tipo da coluna.
    }
);
```

**Exemplos**

```JavaScript
"use strict";

module.exports = {
    up: async (queryInterface, Sequelize) => {
        await queryInterface.addColumn("Usuarios", "idade", {
            type: Sequelize.INTEGER,
            allowNull: true,
            defaultValue: 18,
        });
    },

    down: async (queryInterface) => {
        await queryInterface.removeColumn("Usuarios", "idade");
    }
};
```

- `up` é a função que é executada quando você aplica a migração (para cima)
- `down` é a função que é executada quando você reverte a migração (para baixo)

Dentro da função `up`, `.addColumn()` é usado para adicionar uma coluna chamada `idade` à tabela `Usuarios`. A coluna é do tipo `INTEGER`, permitindo valores nulos e tem um valor padrão de `18`.

Dentro da função `down`, `.removeColumn()` é usado para remover a coluna `idade` caso a migração seja revertida.

Essas migrações são executadas pelo Umzug (ou outra ferramenta de migração que você esteja usando) quando você executa o comando para aplicar ou reverter migrações. Isso mantém o controle das alterações de esquema do banco de dados e permite que você as aplique ou reverta de forma consistente em diferentes ambientes.

# <a id="metodos-queryinterface-removecolumn"></a>`queryInterface.removeColumn()`

Para **remover uma coluna de uma tabela existente** usando o Sequelize, você pode usar o método `.removeColumn()` da interface de consulta (`queryInterface`).

**Sintaxe Básica**

```JavaScript
queryInterface.removeColumn(
    "$< nome da tabela >", // Nome da tabela da qual você deseja remover a coluna.
    "$< nome da coluna >"  // Nome da coluna que você deseja remover.
);
```

**Exemplos**

```JavaScript
"use strict";

module.exports = {
    up: async (queryInterface) => {
        await queryInterface.removeColumn("Usuarios", "idade");
    },

    down: async (queryInterface, Sequelize) => {
        await queryInterface.addColumn("Usuarios", "idade", {
            type: Sequelize.INTEGER,
            allowNull: true,
            defaultValue: 18,
        });
    }
};
```

- `up` é a função que é executada quando você aplica a migração (para cima)
- `down` é a função que é executada quando você reverte a migração (para baixo)

Dentro da função `up`, `.removeColumn()` é usado para remover a coluna `idade` da tabela `Usuarios`.

Dentro da função `down`, `.addColumn()` é usado para adicionar novamente a coluna `idade` na tabela `Usuarios` com o mesmo tipo de dado e configurações que ela tinha antes de ser removida. Esta é uma prática comum para reverter a migração para garantir que o banco de dados volte ao estado anterior.

Essas migrações são executadas pelo Umzug (ou outra ferramenta de migração que você esteja usando) quando você executa o comando para aplicar ou reverter migrações. Isso mantém o controle das alterações de esquema do banco de dados e permite que você as aplique ou reverta de forma consistente em diferentes ambientes.

# <a id="metodos-model-create"></a>`Model.create()`

A função `create()` é um dos métodos mais usados para **inserir novos registros em uma tabela** representada por um modelo.

**Sintaxe Básica**

```JavaScript
Model.create(data, [options])
```

- **Parâmetros:**
    + `data`**:** um objeto que representa o novo registro que você deseja criar. As chaves deste objeto devem corresponder aos nomes dos campos definidos no modelo
        - **Acho interessante pontuar que as chaves, se forem valores válidos em JavaScript, não precisam estar entre aspas**. O `sequelize` mapeia automaticamente os nomes dos campos do objeto `data` para os nomes dos campos definidos no modelo
        - Um exemplo de valor não válido, seria a chave "`first-name`", pois possui um caracter especial, logo não é um valor válido em JavaScript
    + `options` **(opcional):** um objeto contendo várias opções de configuração que influenciam o comportamento do método `.create()`

**Opções Comuns**

- `transaction`**:** permite que você especifique uma transação sob a qual a operação `.create()` deve ser executada
- `fields`**:** um array de strings que indica explicitamente quais campos devem ser salvos. Útil quando você deseja limitar quais dados serão inseridos
- `returning`**:** especialmente útil em bancos de dados como o PostgreSQL, onde você pode fazer com que o método `.create()` retorne os dados do objeto recém-criado
- `validate`**:** se definido como `false`, desativa a validação para a operação

**Exemplos**

```JavaScript
const User = sequelize.define("user", {
    username: Sequelize.STRING,
    birthday: Sequelize.DATE,
});

sequelize.sync()
    .then(() => User.create({
        "username": "johndoe",
        "birthday": new Date(1980, 6, 20),
    });)
    .then(john => {
        console.log(john.toJSON());
    })
    .catch(error => {
        console.error("Error:", error);
    });
```

Neste exemplo, definimos um modelo `User` com campos `username` e `birthday`. Usamos `User.create()` para inserir um novo usuário no banco de dados. A função `sequelize.sync()` sincroniza o modelo com o banco de dados, criando a tabela se ela não existir. Depois de criar o usuário, os dados do novo usuário são impressos no console.

**Considerações**

- É importante lembrar que, ao usar `.create()`, você deve garantir que o objeto `data` contenha valores para todos os campos que são obrigatórios no modelo, a menos que eles tenham valores padrão definidos ou sejam automaticamente gerados pelo banco de dados (como IDs)
- As operações de banco de dados podem falhar por várias razões, como violações de restrições de integridade, então é sempre uma boa prática envolver chamadas de banco de dados em bloco `try/catch` ou usar cadeias de promessas com `.catch()` para lidar com erros
- A função `.create()` retorna uma promessa que, ao ser resolvida, fornece uma instância do modelo representando o registro recém-criado

# <a id="metodos-model-findone"></a>`Model.findOne()`

É utilizado para **encontrar o primeiro registro que corresponda a um conjunto de critérios de busca**.

**Sintaxe Básica**

```JavaScript
Model.findOne(object);
```

- **Parâmetros:**
    + `object`**:** um objeto composto por opções que podem ser passadas para o `.findOne()`, como `attributes` para especificar quais atributos devem ser incluídos no resultado, `order` para ordenar os resultados, etc
- **Valor de Retorno:** retorna uma promessa que, quando resolvida, fornece o primeiro registro encontrado que corresponde aos critérios de busca especificados. Se nenhum registro for encontrado, retorna `null`

**Exemplos**

```JavaScript
const User = sequelize.define("user", {
    username: Sequelize.STRING,
    email: sequelize.STRING,
});

// Encontrar o primeiro usuário com o nome de usuário "john_doe".
User.findOne({
    where: {
        "username": "john_doe",
    }
})
.then(user => {
    if (user) {
        console.log(user.toJSON());
    } else {
        console.log("Nenhum usuário encontrado.");
    }
})
.catch(error => {
    console.error("Erro: ", error);
});
```

Neste exemplo, estamos tentando encontrar o primeiro usuário com o nome de usuário "`john_doe`". Se um usuário for encontrado, suas informações serão impressas no console. Se nenhum usuário for encontrado, uma mensagem indicando isso será impressa. Se ocorrer algum erro durante a operação, será capturado pelo `.catch()` e uma mensagem de erro será impressa no console.

O `.findOne()` é útil quando você precisa encontrar apenas um registro com base em certos critérios, como encontrar um usuário específico, uma entrada em uma tabela de configurações, etc.

# <a id="metodos-model-update"></a>`Model.update()`

É utilizado para **atualizar registros em uma tabela de banco de dados**. Quando você precisa atualizar múltiplos registros com base em uma condição, você pode usar a cláusula `where` para especificar quais registros devem ser atualizados. O operador `$in` é usado para verificar se um valor em uma coluna está presente em um array de valores.

- **Sintaxe Básica**

```JavaScript
Model.update(values, {
    where: {
        id: { $in: array }
    },
});
```

+ **Parâmetros**
    - `values`**:** um objeto contendo as colunas que você deseja atualizar e os novos valores para essas colunas
    - `options`**:** um objeto de opções que inclui a cláusula `where` e outras opções (como hooks, transações, etc.)