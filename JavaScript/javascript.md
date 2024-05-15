# JavaScript

### Sumário

- [Operadores](#operadores)
    + [`new`](#operadores-new)
    + [`typeof`](#operadores-typeof)
- [Objetos](#objetos)
    + [`Object`](#objetos-object)
        - [`.toString()`](#objetos-object-tostring)
    + [`Date`](#objetos-date)
- [Métodos](#metodos)
    + [Array](#metodos-array)
        - [array.every()](#metodos-array-every)
- [Função de Flecha](#funcao-flecha)
- [Closures](#closures)
- [Imports/Exports](#importsexports)
- [Bibliotecas](#bibliotecas)
    + [`cluster`](#bibliotecas-cluster)
    + [`moment`](#bibliotecas-moment)
    + [`express`](#bibliotecas-express)
        - [app.listen()](#bibliotecas-express-app-listen)
    + [`sequelize`](#bibliotecas-sequelize)
        - [Tipos de Coluna](#bibliotecas-sequelize-tipos-coluna)
            + [`TINYINT(1)`](#bibliotecas-sequelize-tipos-coluna-tinyint)
        - [`queryInterface.addColumn()`](#bibliotecas-sequelize-queryInterface-addcolumn)
        - [`queryInterface.removeColumn()`](#bibliotecas-sequelize-queryInterface-removecolumn)
        - [`Model.create()`](#bibliotecas-sequelize-model-create)
        - [`Model.findOne()`](#bibliotecas-sequelize-model-findOne)
    + [`umzug`](#bibliotecas-umzug)
- [Época Unix](#epoca-unix)

# <a id="operadores"></a>Operadores

Os operadores em JavaScript são símbolos ou palavras-chave que realizam operações em operandos. Alguns exemplos de operadores em JavaScript incluem operadores aritméticos (+, -, *, /), operadores de comparação (===, !==, >, <), operadores lógicos (&&, ||, !), entre outros.

### Sumário

- [`new`](#operadores-new)
- [`typeof`](#operadores-typeof)

## <a id="operadores-new"></a>`new`

Em JavaScript, `new` é um operador usado para criar instâncias de objetos. Ele é usado com funções construtoras para criar novos objetos com base no protótipo da função construtora.

Quando você usa `new` com uma função, isso cria um novo objeto vazio e, em seguida, chama a função como um construtor, com o `this` definido como o novo objeto criado. Isso permite que a função construtora inicialize o objeto com propriedades e métodos específicos.

Aqui está um exemplo simples de como `new` é usado:

```JavaScript
function Pessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

// Usando `new` para criar uma nova instância de Pessoa.
const pessoa1 =  new Pessoa("João", 30);

console.log(pessoa1); // Output: Pessoa { nome: 'João', idade: 30 }.
```

Neste exemplo, a função `Pessoa()` atua como um construtor. Quando chamamos `new Pessoa()`, um novo objeto é criado e passado como `this` para a função `Pessoa()`. Dentro da função `Pessoa()`, as propriedades `nome` e `idade` são definidas no objeto `this`, que se torna o valor retornado por `new Pessoa()`. Assim, `pessoa1` é uma instância da função `Pessoa()`.

É importante notar que, quando você usa `new` com uma função construtora, o JavaScript faz algumas coisas nos bastidores:

1. Cria um novo objeto vazio
2. Define `this` como o novo objeto criado  
3. Anexa o protótipo do construtor à instância (o novo objeto criado)
4. Retorna o novo objeto

Portanto, ao usar `new`, você pode criar e inicializar objetos de maneira conveniente, seguinte o padrão de construtor JavaScript.

**Observações Interessantes**

Vamos modificar o exemplo acima:

```JavaScript
function Pessoa(nome, idade) {
    console.log("this:", this);                   // Output: Pessoa {}. Objeto vazio.
    console.log("nome:", nome);                   // Output: nome: João.
    console.log("this.nome:", this.nome);         // Output: this.nome: undefined. A propriedade `nome`, do objeto `this`, não foi definida.
    nomeDaPessoa = nome;
    console.log("nomeDaPessoa:", nomeDaPessoa);  // Output: nomeDaPessoa: João.
    idade = idade;
}

// Usando `new` para criar uma nova instância de Pessoa.
const pessoa1 =  new Pessoa("João", 30);

console.log(pessoa1);              // Output: Pessoa {}.
console.log(pessoa1.nomeDaPessoa); // Output: undefined.
```

Sem o uso do `this`, os argumentos são visíveis no escopo da função `Pessoa()`, como você pode ver pelas impressões, mas as propriedades do objeto `this`, não são definidas. É atribuído a `pessoa1`, o valor de `this`, um objeto vazio, sem propriedades.

## <a id="operadores-typeof"></a>`typeof`

`typeof` é um operador em JavaScript, ele é usado para determinar o tipo de dado de um valor, variável ou expressão. O operador `typeof` é uma palavra-chave da linguagem JavaScript e retorna uma string representando o tipo do operando.

**Exemplos**

```JavaScript
console.log(typeof 42);              // "number"
console.log(typeof "hello");         // "string"
console.log(typeof true);            // "boolean"
console.log(typeof { name: "John"}); // "object"
console.log(typeof [1, 2, 3]);       // "object"
console.log(typeof function() {});   // "function"
console.log(typeof undefined);       // "undefined"
console.log(typeof null);            // "object" (um erro conhecido em JavaScript, o tipo real de null é "object").
```

# <a id="objetos"></a>Objetos

### Sumário

- [`Object`](#objetos-object)
- [`Date`](#objetos-date)

## <a id="objetos-object"></a>`Object`

### Sumário

- [`.toString()`](#objetos-object-tostring)

### <a id="objetos-object-tostring"></a>`.toString()`

O método `.toString()` em JavaScript é usado para converter um objeto em uma string representando o objeto. Ele é herdado do protótipo `Object` e está disponível em todos os objetos JavaScript.

Quando você chama `.toString()` em um objeto, ele retorna uma representação de string do objeto. O comportamento específico de `.toString()` depende do tipo de objeto:

1. **Para objetos primitivos:** quando você chama `.toString()` em um objeto primitivo, como uma string, número, booleano, `null` ou `undefined`, o método retorna a representação de string do valor primitivo. Exemplos

```JavaScript
const str = "Olá mundo";
console.log(str.toString());        // Output: "Olá mundo".

const num = 42;
console.log(num.toString());        // Output: "42".

const bool = true;
console.log(bool.toString());       // Output: "true".

const nulo = null;
console.log(nulo.toString());       // Output: "null".

let indefinido;
console.log(indefinido.toString()); // Output: "undefined".
```

2. **Para objetos personalizados:** por padrão, o método `.toString()` retorna `[object Object]` para objetos personalizados, que é uma representação genérica de um objeto JavaScript. No entanto, você pode substituir o método `.toString()` em objetos personalizados para fornecer uma representação personalizada. Exemplo

```JavaScript
function Pessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

Pessoa.prototype.toString = function() {
    return `${this.nome}, ${this.idade} anos`;
};

const pessoa = new Pessoa("João", 30);
console.log(pessoa.toString()); // Output: "João, 30 anos".
```

Neste exemplo, substituímos o método `.toString()` no protótipo da função `Pessoa` para fornecer uma representação personalizada da instância `Pessoa`.

Em resumo, o método `.toString()` é uma maneira conveniente de obter uma representação de string de um objeto em JavaScript e é frequentemente usado para depuração, registro ou formatação de saída.

## <a id="objetos-date"></a>`Date`

Em JavaScript, o objeto `Date` é usado para trabalhar com datas e horas. Ele fornece métodos para criar objetos de data, acessar e manipular componentes de data e hora, e formatar datas para exibição.

Aqui estão algumas maneiras comuns de usar o objeto `Date` em JavaScript:

1. **Criar um objeto de data:** você pode criar um objeto de data usando o construtor `Date()` sem argumentos para representar a data e hora atuais ou passando argumentos para representar uma data específica. Por exemplo:

```JavaScript
// Data e hora atuais.
const agora = new Date();

// Data específica (ano, mês, dia, hora, minuto, segundo, milissegundo).
cont dataEspecifica = new Date(2024, 4, 8, 15, 30, 0);
```

2. **Acessar componentes de data e hora:** você pode acessar os componentes de data e hora de um objeto de data, como ano, mês, dia, hora, minuto, segundo e milissegundo, usando os métodos "`get`" correspondentes. Por exemplo

```JavaScript
const data = new Date();
const ano = data.getFullYear();
const mes = data.getMonth(); // Janeiro é 0, fevereiro 1, e assim por diante.
const dia = data.getDate();
const hora = data.getHours();
const minuto = data.getMinutes();
const segundo = data.getSeconds();
const milissegundo = data.getMilliseconds();
```

3. **Manipular datas:** você pode manipular datas adicionando ou subtraindo valores usando os métodos "`set`" correspondentes. Por exemplo

```JavaScript
const data = new Date();
data.setFullYear(2025);
data.setMonth(6); // Julho.
data.setDate(15);
data.setHours(12);
data.setMinutes(0);
data.setSeconds(0);
```

4. **Formatar datas para exibição:** você pode formatar datas para exibição usando métodos como `.toDateString()`, `.toLocaleDateString()`, `.toISOString()`, etc. Ou você pode usar bibliotecas externas como `moment.js` para formatação mais avançada.

```JavaScript
const data = new Date();
console.log(data.toDateString());   // Exemplo: "Sat May 08 2024".
console.log(data.toLocaleString()); // Dependente do idioma e região.
console.log(data.toISOString());    // Formato ISO 8601: "2024-05-08T12:00:00.000Z".
```

O objeto `Date` em JavaScript pode ser bastatente flexível e poderoso para lidar com manipulação de datas e horas, mas também pode ser complicado de usar em alguns casos. Por isso, é sempre útil consultar a documentação oficial da Mozilla Developer Network (MDN) ou outras fontes confiáveis para obter mais informações sobre o objeto `Date` e suas funcionalidades.

# <a id="metodos"></a>Métodos

### Sumário

- [Array](#metodos-array)

# <a id="array"></a>Array

### Sumário

- [array.every()](#metodos-array-every)

## <a id="metodos-array-every"></a>`array.every()`

O método `.every()` é um método de array em JavaScript que testa se todos os elementos em um array passam por um teste especificado por um função.

**Sintaxe Básica**

```JavaScript
array.every(function(element, index, array) {
    // Retorna true ou false.
}, thisArg);
```

- **Parâmetros:**
    + `function(element, index, array)`**:** uma função de teste que é chamada para cada elemento do array. Ela recebe três argumentos
        - `element`**:** o elemento atual sendo processado no array
        - `index` **(opcional):** o índice do elemento atual sendo processado no array
        - `array` **(opcional):** o array que `.every()` foi chamado
    + `thisArg` **(opcional):** um valor a ser usado como `this` quando a função de teste é executada
- **Valor de Retorno:** retorna `true` se a função de teste retornar um valor truthy para cada elementos do array; caso contrário, retorna `false`
- **Como Funciona:**
    + `.every()` executa a função fornecida uma vez para cada elemento do array, até que encontre um onde a função retorna um valor falsy (como `false`, `null`, `0`, `""`, `undefined` ou `NaN`)
    + Se a função retorna `true` para todos os elementos do array, `.every()` também retorna `true`
    + Se a função retorna `false` para pelo menos um dos elementos, `.every()` retorna `false` e o restante dos elementos no array não será mais testado
    + O método não modifica o array original

**Exemplos**

```JavaScript
const ages = [32, 33, 16, 40];

function checkAdult(age) {
    return age >= 18;
}

const allAdults = ages.every(checkAdult);

console.log(allAdults); // Saída: false, porque 16 não é maior ou igual a 18.
```

Neste exemplo, `ages.every(checkAdult)` verifica se todos os elementos no array `ages` são maiores ou iguais a 18. A função `checkAdult` é chamada para cada elemento do array. Uma vez que um dos elementos, 16, não passa no teste (não é maior ou igual a 18), `.every()` retorna `false`.

`.every()` é uma ferramenta poderosa para validações onde todos os itens de uma coleção devem atender a uma condição específica.

# <a id="funcao-flecha"></a>Função de Flecha

- **Funções de flecha de uma linha retornam implicitamente o resultado da expressão após a seta. Funções de seta de mais de uma linha (quando o seu corpo está envolvido por chaves, quando seu escopo está especificado) retornam** `undefined` **implicitamente, quando você não define o retorno explicitamente**

**Exemplos Interessantes**

- **Primeiro trecho de código**

```JavaScript
if (!requiredFields.every((key) => request.body[key] !== undefined)) {
    return send_error(request, response, "Invalid input format", request.body);
}
```

Neste trecho, você está usando uma função de flecha de uma linha. A função de flecha de uma linha retorna implicitamente o resultado da expressão após a seta (`=>`). Portanto, esta função de flecha verifica se cada `key` em `requireFields` não é `undefined` no objeto `request.body`. Se todos os campos obrigatórios estiverem presentes e não forem `undefined`, o método `.every()` retornará `true`. A negação (`!`) antes disso inverte o resultado, então o `if` será verdadeiro se houver pelo menos um campo obritatório faltando ou sendo `undefined`

- **Segundo trecho de código**

```JavaScript
if (!requiredFields.every((key) => {request.body[key] !== undefined})) {
    return send_error(request, response, "Invalid input format", request.body);
}
```

Neste trecho, você está usando uma função de flecha de várias linhas, que está envolvida por chave `{}`. Essa forma de função de flecha permite que você execute múltiplas instruções dentro dela. No entanto, como você não está explicitamente retornando um valor nesta função, ela retorna `undefined` implicitamente. Isso faz com que o método `.every()` sempre retorne `false`, independente dos valores dos campos em `requiredFields`. Portanto, o `if` será sempre verdadeiro, o que provavelmente não é a lógica desejada

# <a id="closures"></a>Closures

**Exemplos Interessantes**

```JavaScript
function contador() {
    let count = 0; // Variável capturada.

    return function() {
      count++; // A função de fechamento acessa a variável `count`.
      return count;
    }
}

/* Quando você atribui a `increment` o valor retornado pela chamada a `contador()`, increment agora é: 
`
function() {
    count++;
    return count;
}
`
pois `contador()` retorna uma função. Como podemos ver, essa função continua conseguindo acessar a variável `count`.*/
const increment = contador();

console.log(increment()); // Saída: 1
console.log(increment()); // Saída: 2
console.log(increment()); // Saída: 3
```

# <a id="importsexports"></a>Imports/Exports

<!--
TODO

Criar um exemplo de exportação/importação com o código abaixo:

```JavaScript
const nome1 = "Maria";
export default nome1;

export const nome2 = "João";
```
-->

# <a id="bibliotecas"></a>Bibliotecas

### Sumário

- [`cluster`](#bibliotecas-cluster)
- [`moment`](#bibliotecas-moment)
- [`express`](#bibliotecas-express)
- [`sequelize`](#bibliotecas-sequelize)
- [`umzug`](#bibliotecas-umzug)

# <a id="bibliotecas-cluster"></a>`cluster`

Ao usar o módulo `cluster` do Node.js você cria processos filhos (workers) que compartilham a mesma porta para lidar com a carga de trabalho de forma eficiente.

Caso você encerre um processo filho, apenas esse processo específico será encerrado, os outros processos continuarão em execução normalmente. No entanto, observe que, quando um dos processos filhos morre (por qualquer motivo), o evento `'exit'` é acionado no processo mestre (master).

# <a id="bibliotecas-moment"></a>`moment`

O `moment` considera a data "0000-00-00 00:00:00" inválida, porque não é uma data reconhecida pelo sistema de calendário gregoriano. O marco zero do calendário gregoriano é primeiro de janeiro de 0001, portanto, não há um ano, mês ou dia zero, então a data "0000-00-00 00:00:00" é inválida.

# <a id="bibliotecas-express"></a>`express`

### Sumário

- [app.listen()](#bibliotecas-express-app-listen)

## <a id="bibliotecas-express-app-listen"></a>`app.listen()`

O método `.listen()` do Express é usado para iniciar um servidor HTTP e começar a escutar por conexões em uma determinada porta.

**Sintaxe Básica**

```JavaScript
const express = require("express");

const app = express();
const port = 3000;            // Porta em que o servidor vai escutar.
const hostname = "localhost"; // Nome do host.

app.listen(port, hostname, () => {
    console.log(`Servidor Express está escutando na porta ${port}`);
});
```

- **Parâmetros:**
    + `port`**:** o número da porta em que o servidor vai escutar por conexões HTTP
    + `hostname` **(opcional):** você pode passar um endereço IP ou nome do host. Isso é útil se você quiser especificar um endereço IP específico ou um nome de host para o servidor escutar, em vez de escutar todas as interfaces de rede
    + `callback` **(opcional):** uma função opcional que será executada assim que o servidor for iniciado e começar a escutar por conexões. Este callback geralmente é usado para registrar uma mensagem de log indicando que o servidor está escutando e em qual porta

Ao chamar `.listen()`, o Express cria um servidor HTTP e começa a ouvir por conexões nesse servidor na porta especificada. Quando uma solicitação HTTP é recebida, o Express encaminha essa solicitação para a função de middleware apropriada com base no caminho da URL e no método HTTP da solicitação.

Neste exemplo, o servidor Express estará escutando apenas em conexões feitas para `localhost` na porta especificada. Isso significa que ele não estará acessível a partir de outros hosts na rede.

Se você omitir o segundo argumento, o Express irá escutar em todas as interfaces de rede disponíveis no sistema. Isso é equivalente a passar `null` ou não passar o segundo argumento.

É importante notar que o método `.listen()` é assíncrono e retorna uma instância de servidor HTTP, mas na maioria dos casos você não precisa armazenar essa instância em uma variável, já que o Express cuida disso internamente.

Se você quiser começar a escutar em uma porta específica, basta chamar `.listen()` passando o número da porta como primeiro argumento. Depois de chamar `.listen()`, seu servidor Express estará pronto para receber solicitações HTTP na porta especificada.

**Observações Interessantes**

No JavaScript, a função `app.listen()` do Express é capaz de identificar os argumentos que você passou com base em sua quantidade e tipo, graças a sobrecargas de função internamente. Basicamente, a implementação verifica os argumentos fornecidos e ajusta o comportamento com base nisso.

Esta abordagem permite que o Express flexibilize a maneira como os desenvolvedores podem configurar o servidor, tornando a API mais amigável e adaptável às necessidades do projeto.

# <a id="bibliotecas-sequelize"></a>`sequelize`

Sequelize é um ORM (Object-Relational Mapper) para Node.js, que permite manipular bancos de dados SQL de maneira programática e idiomática, utilizando JavaScript.

- Se você não definir a coluna na definição do modelo da tabela do banco, o Sequelize não irá conseguir trabalhar com a ela. Por exemplo, se ela não estiver definida no modelo e você tentar criar um registro querendo especificar um valor para ela, você não conseguirá e o valor default será utilizado
- O Sequelize não possui uma opção nativa para definir o comentário da coluna diretamente durante a criação da coluna

### Sumário

- [Tipos de Coluna](#bibliotecas-sequelize-tipos-coluna)
- [`queryInterface.addColumn()`](#bibliotecas-sequelize-queryInterface-addcolumn)
- [`queryInterface.removeColumn()`](#bibliotecas-sequelize-queryInterface-removecolumn)
- [`Model.create()`](#bibliotecas-sequelize-model-create)
- [`Model.findOne()`](#bibliotecas-sequelize-model-findOne)

## <a id="bibliotecas-sequelize-tipos-coluna"></a>Tipos de Coluna

### Sumário

- [`TINYINT(1)`](#bibliotecas-sequelize-tipos-coluna-tinyint)

### <a id="bibliotecas-sequelize-tipos-coluna-tinyint"></a>`TINYINT(1)`

O tipo `TINYINT(1)` é frequentemente usado para armazenar valores booleanos em bancos de dados que não têm um tipo booleano nativo, como o MySQL. Em muitos ORMs e na interface do Sequelize, `TINYINT(1)` é tratado como booleano, onde 0 representa `false` e 1 representa `true`.

**Exemplos**

```JavaScript
const User = sequelize.define("user", {
    isActive: Sequelize.BOOLEAN, // Internamente mapeado para `TINYINT(1)` em alguns DBs.
});
```

## <a id="bibliotecas-sequelize-queryInterface-addcolumn"></a>`queryInterface.addColumn()`

Para adicionar uma coluna a uma tabela existente usando o Sequelize, você pode usar o método `.addColumn()` da interface de consulta (`queryInterface`).

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

## <a id="bibliotecas-sequelize-queryInterface-removecolumn"></a>`queryInterface.removeColumn()`

Para remover uma coluna de uma tabela existente usando o Sequelize, você pode usar o método `.removeColumn()` da interface de consulta (`queryInterface`).

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
        await queryInterface.addColumn("Usuarios", "iadde", {
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

## <a id="bibliotecas-sequelize-model-create"></a>`Model.create()`

A função `create()` é um dos métodos mais usados para inserir novos registros em uma tabela representada por um modelo.

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

- É importante lembrar que, ao usa `.create()`, você deve garantir que o objeto `data` contenha valores para todos os campos que são obrigatórios no modelo, a menos que eles tenham valores padrão definidos ou sejam automaticamente gerados pelo banco de dados (como IDs)
- As operações de banco de dados podem falhar por várias razões, como violações de restrições de integridade, então é sempre uma boa prática envolver chamadas de banco de dados em bloco `try/catch` ou usar cadeias de promessas com `.catch()` para lidar com erros
- A função `.create()` retorna uma promessa que, ao ser resolvida, fornece uma instância do modelo representando o registro recém-criado

## <a id="bibliotecas-sequelize-model-findOne"></a>`Model.findOne()`

O método `.findOne()` é usado para encontrar o primeiro registro que corresponda a um conjunto de critérios de busca.

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

# <a id="bibliotecas-umzug"></a>`umzug`

Quando você utiliza a `umzug` com a `sequelize`, a `umzug` cria uma tabela no seu banco de dados chamada `SequelizeMeta` que irá conter o nome de todas as migrações aplicadas ao seu banco.

# <a id="epoca-unix"></a>Época Unix

É um padrão comum para muitas linguagens de programação que as suas bibliotecas representem o tempo como um número em milissegundos decorridos desde um ponto de referência específico, como a Época Unix, para a biblioteca `moment` do JavaScript.

A Época Unix é o marco zero do sistema de tempo Unix, também é conhecida como "marco zero do calendário Unix", e é definida como primeiro de janeiro de 1970, 00:00:00 UTC. O `moment` realiza a conversão da data para milissegundos a partir da Época Unix.