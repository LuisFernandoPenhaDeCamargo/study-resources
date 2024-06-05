# JavaScript

### Sumário

- [Operadores](#operadores)
    + [`new`](#operadores-new)
    + [`typeof`](#operadores-typeof)
- [Objetos](#objetos)
    + [Definindo Métodos em Objetos](#objetos-definindo-metodos-objetos)
    + [`Object`](#objetos-object)
        - [`.hasOwnProperty()`](#objetos-object-hasownproperty)
        - [`.keys()`](#objetos-object-keys)
        - [`.toString()`](#objetos-object-tostring)
        - [`.prototype.toString.call()`](#objetos-object-prototype-tostring-call)
    + [`Array`](#objetos-array)
        - [`.isArray()`](#objetos-array-isarray)
        - [`.every()`](#objetos-array-every)
        - [`.forEach()`](#objetos-array-foreach)
        - [`.map()`](#objetos-array-map)
        - [`.push()`](#objetos-array-push)
        - [`.join()`](#objetos-array-join)
    + [`error`](#objetos-error)
    + [`Date`](#objetos-date)
- [Função de Flecha](#funcao-flecha)
- [Closures](#closures)
- [`async` e `await`](#async-await)
- [Importação e Exportação](#importacao-exportacao)
    + [CommonJS](#importacao-exportacao-commonjs)
    + [ES6](#importacao-exportacao-es6)
    + [CommonJS x ES6](#importacao-exportacao-commonjs-x-es6)
- [Época Unix](#epoca-unix)
- [ES6](#es6)
- [CommonJS x ES6](#commonjs-x-es6)

# <a id="operadores"></a>Operadores

Os operadores em JavaScript são símbolos ou palavras-chave que realizam operações em operandos. Alguns exemplos de operadores em JavaScript incluem operadores aritméticos (+, -, *, /), operadores de comparação (===, !==, >, <), operadores lógicos (&&, ||, !), entre outros.

### Sumário

- [`new`](#operadores-new)
- [`typeof`](#operadores-typeof)

## <a id="operadores-new"></a>`new`

`new` é um operador usado para criar instâncias de objetos. Ele é usado com funções construtoras para criar novos objetos com base no protótipo da função construtora.

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
    console.log("this:", this);                   // Output: this: Pessoa {}. Objeto vazio.
    console.log("nome:", nome);                   // Output: nome: João.
    console.log("this.nome:", this.nome);         // Output: this.nome: undefined. A propriedade `nome`, do objeto `this`, não foi definida.
    nomeDaPessoa = nome;
    console.log("nomeDaPessoa:", nomeDaPessoa);   // Output: nomeDaPessoa: João.
    idade = idade;
}

// Usando `new` para criar uma nova instância de Pessoa.
const pessoa1 =  new Pessoa("João", 30);

console.log(pessoa1);              // Output: Pessoa {}.
console.log(pessoa1.nomeDaPessoa); // Output: undefined.
```

Sem o uso do `this`, os argumentos são visíveis no escopo da função `Pessoa()`, como você pode ver pelas impressões, mas as propriedades do objeto `this`, não são definidas. **É atribuído a** `pessoa1`**, o valor de** `this`**, um objeto vazio, sem propriedades**.

## <a id="operadores-typeof"></a>`typeof`

`typeof` é usado para determinar o tipo de dado de um valor, variável ou expressão. O operador `typeof` é uma palavra-chave da linguagem JavaScript e retorna uma string representando o tipo do operando.

**Exemplos**

```JavaScript
console.log(typeof 42);              // Output: number
console.log(typeof "hello");         // Output: string
console.log(typeof true);            // Output: boolean
console.log(typeof { name: "John"}); // Output: object
console.log(typeof [1, 2, 3]);       // Output: object
console.log(typeof function() {});   // Output: function
console.log(typeof undefined);       // Output: undefined
console.log(typeof null);            // Output: object. (um erro conhecido em JavaScript, o tipo real de null é "object").
```

# <a id="objetos"></a>Objetos

### Sumário

- [Definindo Métodos em Objetos](#objetos-definindo-metodos-objetos)
- [`Object`](#objetos-object)
- [`Array`](#objetos-array)
- [`error`](#objetos-error)
- [`Date`](#objetos-date)

## <a id="objetos-definindo-metodos-objetos"></a>Definindo Métodos em Objetos

**Antes do ES6**

```JavaScript
const handler = {
    log: function() {
        console.log(element);
    }
};

handler.log(42); // Output: 42
```

`log` é a chave (ou nome do método) no objeto.

**Usando a Sintaxe de Métodos ES6**

A partir do ES6, você pode definir métodos em objetos de forma mais concisa.

```JavaScript
const handler = {
    log(element) {
        console.log(element);
    }
}
```

Embora ambas as sintaxes sejam válidas e você possa usar qualquer uma delas conforme sua preferência ou necessidade, a sintaxe abreviada introduzida no ES6 é a mais comum e preferia na comunidade JavaScript moderna devido à sua simplicidade e clareza. Se você está iniciando um novo projeto ou contribuindo para projetos existentes, é recomendável usar a sintaxe abreviada para manter a consistência com as práticas modernas.

## <a id="objetos-object"></a>`Object`

- Objeto base de todos os objetos JavaScript. Todos os objetos JavaScript herdam propriedades e métodos de `Object. prototype`

### Sumário

- [`.hasOwnProperty()`](#objetos-object-hasownproperty)
- [`.keys()`](#objetos-object-keys)
- [`.toString()`](#objetos-object-tostring)
- [`.prototype.toString.call()`](#objetos-object-prototype-tostring-call)

### <a id="objetos-object-hasownproperty"></a>`.hasOwnProperty()`

- É uma função nativa de JavaScript que verifica se um objeto possui uma propriedade específica como uma propriedade direta (não herdada) do objeto. Esse método é útil para distinguir propriedades do próprio objeto de propriedades herdadas do seu protótipo
- É utilizado para verficar **se um objeto possui uma propriedade específica, sem recorrer à cadeia de protótipos**

**Sintaxe Básica**

```JavaScript
obj.hasOwnProperty(prop);
```

- **Parâmetros:**
    + `obj`**:** o objeto no qual você quer verificar a existência da propriedade
    + `prop` **(String):** o nome da propriedade que você quer verificar
- **Valor de Retorno:** retorna `true` se o objeto possui a propriedade especificada como uma propriedade direta do objeto e retorna `false`, caso contrário

**Exemplos**

- **Verificando propriedades diretas:**

```JavaScript
const person = {
    name: "John",
    age: 30,
};

console.log(person.hasOwnProperty("name"));     // Output: true
console.log(person.hasOwnProperty("age"));      // Output: true
console.log(person.hasOwnProperty("toString")); // Output: false
```

- **Propriedades herdadas:**

```JavaScript
const person = {
    name: "John",
    age: 30,
};

console.log(person.hasOwnProperty("toString")); // Output: false (herdada do protótipo).
```

- **Usando** `.hasOwnProperty()` **em um objeto criado com** `Object.create()`**:**

```JavaScript
const baseObject =  { baseProp: "base"};
const newObject = Object.create(baseObject);

newObject.newProp = "new";

console.log(newObject.hasOwnProperty("newProp"));  // Output: true
console.log(newObject.hasOwnProperty("baseProp")); // Output: false (herdada).
```

- **Uso em laços** `for...in`

Ao iterar sobre as propriedades de um objeto com um laço `for...in`, é uma boa prática usar `.hasOwnProperty()` para garantir que você está lidando apenas com as propriedades do próprio objeto, e não com propriedades herdadas:

```JavaScript
const person = {
    name: "John",
    age: 30,
};

Object.prototype.gender = "male"; // Adicionando uma propriedade ao protótipo.

for (let key in person) {
    if (person.hasOwnProperty(key)) {
        console.log(key, person[key]); // Output: name John, age 30
    }
}
```

- **Comparação com** `in`

O operador `in` verifica tanto as propriedades próprias quanto as herdadas:

```JavaScript
const person = {
    name: "John",
    age: 30,
};

console.log("name" in person);   // Output: true
console.log("gender" in person); // Output: true (herdada do protótipo).
```

Enquanto `.hasOwnProperty()` é mais específico, verificando apenas as propriedades próprias do objeto:

```JavaScript
console.log(person.hasOwnProperty("name"));   // Output: true
console.log(person.hasOwnProperty("gender")); // Output: false
```

- **Verificação em um array**

**Arrays em JavaScript são objetos com propriedades inteiras não negativas como chaves, que correspondem aos índices do array**

```JavaScript
const array = ["apple", "banana", "cherry"];

console.log(array.hasOwnProperty("0")); // Output: true
console.log(array.hasOwnProperty("2")); // Output: true
console.log(array.hasOwnProperty("3")); // Output: false
```

- **Verificação em uma string**

+ Em JavaScript, strings são objetos similares a arrays. Cada caractere da string é acessível por um índice númerico, e esses índices são propriedades do objeto string
+ Embora strings em JavaScript sejam tipos primitivos, quando você acessa propriedades ou métodos em uma string, o JavaScript temporariamente a converte em um objeto String para que você possa trabalhar com ela
+ Cada caractere da string está em um índice específico, e esses índices são tratados como propriedades da string

```JavaScript
let string = "teste";

// Acessando caracteres como propriedades.
console.log(string[0]); // Output: t
console.log(string[1]); // Output: e

// Verificando propriedades com `.hasOwnProperty()`.
console.log(string.hasOwnProperty("0")); // Output: true
console.log(string.hasOwnProperty("1")); // Output: true
console.log(string.hasOwnProperty("5")); // Output: false (fora do comprimento da string).

// Strings também têm propriedades e métodos.
console.log(string.length);        // Output: 5
console.log(string.toUpperCase()); // Output: TESTE
```

**Conclusão**

O método `.hasOwnProperty()` é uma ferramenta essencial para trabalhar com objetos em JavaScript, especialmente quando se lida com herança prototípica. Ela permite que você verifique de forma confiável se uma propriedade pertence diretamente a um objeto, evitando possíveis problemas causados por propriedades herdadas.

### <a id="objetos-object-keys"></a>`.keys()`

Retorna um array de propriedades enumeráveis de um objeto, ou seja, ele lista as chaves (propriedades) do próprio objeto, sem incluir as propriedades herdadas pela cadeia de protótipos.

**Sintaxe Básica**

```JavaScript
Object.keys(obj);
```

- **Parâmetros:**
    + `obj`**:** o objeto do qual você deseja obter as propriedades enumeráveis

**Exemplos**

- **Objeto simples**

```JavaScript
const object = {
    name: "Alice",
    age: 30,
    profession: "Enginer",
};

const keys = Object.keys(object);

console.log(keys); // Output: [ 'name', 'age', 'profession' ]
```

- **Array**

Quando usado com arrays, retorna os índices do array como strings.

```JavaScript
const array = ["a", "b", "c"];
const keys = Object.keys(array);

console.log(keys); // Output: [ '0', '1', '2' ];
```

- **Objeto com propriedades não enumeráveis**

Propriedades não enumeráveis não são incluídas no resultado de `.keys()`.

```JavaScript
const object = {};

Object.defineProperty(object, "hidden", {
    value: "secret",
    enumerable: false
});

const keys = Object.keys(object);

console.log(keys); // Output: []
```

- **Objeto com propriedades herdadas**

Propriedades herdadas não são incluídas no resultado de `.keys()`.

```JavaScript
function Parent() {
    this.parentProp = "parant";
}

Parent.prototype.inheritedProp = "inherited";

const child = new Parent();

child.childProp = "child";

const keys = Object.keys(child);

console.log(keys); // Output: [ 'parentProp', 'childProp' ]
```

**Exemplos Interessantes**

- **Iteração sobre chaves**

Você pode usar `.keys()` com um loop `.forEach()` para iterar sobre as chaves de um objeto.

```JavaScript
const object = {
    name: "Alice",
    age: 30,
    profession: "Engineer",
};

Object.keys(object).forEach(key => {
    console.log(`${key}: ${object[key]}`);
});

/*
Output:
name: Alice
age: 30
profession: Enginner
*/
```

- **Mapeamento de propriedades**

Você pode usar `.keys()` com o método `.map()` para criar um novo array baseado nas chaves e valores de um objeto.

```JavaScript
const object = {
    name: "Alice",
    age: 30,
    profession: "Enginer",
};
const entries = Object.keys(object).map(key => [key, object[key]]);

console.log(entries); // Output: [ [ 'name': 'Alice' ], [ 'age': 30 ], [ 'profession': 'Enginner' ] ]
```

### <a id="objetos-object-tostring"></a>`.toString()`

É usado para **converter um objeto em uma string representando o objeto**. Ele é herdado do protótipo `Object` e está disponível em todos os objetos JavaScript.

Quando você chama `.toString()` em um objeto, ele retorna uma representação de string do objeto. O comportamento específico de `.toString()` depende do tipo de objeto:

1. **Para objetos primitivos:** quando você chama `.toString()` em um objeto primitivo, como uma string, número, booleano, `null` ou `undefined`, o método retorna a representação de string do valor primitivo. Exemplos

```JavaScript
const str = "Olá mundo";
console.log(str.toString());        // Output: Olá mundo.

const num = 42;
console.log(num.toString());        // Output: 42.

const bool = true;
console.log(bool.toString());       // Output: true.

const nulo = null;
console.log(nulo.toString());       // Output: null.

let indefinido;
console.log(indefinido.toString()); // Output: undefined.
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

console.log(pessoa.toString()); // Output: João, 30 anos
```

Neste exemplo, substituímos o método `.toString()` no protótipo da função `Pessoa` para fornecer uma representação personalizada da instância `Pessoa`.

Em resumo, o método `.toString()` é uma maneira conveniente de obter uma representação de string de um objeto em JavaScript e é frequentemente usado para depuração, registro ou formatação de saída.

### <a id="objetos-object-prototype-tostring-call"></a>`.prototype.toString.call()`

A técnica "`Object.prototype.toString.call()`" é poderosa para identificar de forma precisa o  tipo de um objeto. Isso é particularmente útil porque ele retorna uma string com o formato "`[object $< Type >]`", onde `Type` é o tipo do objeto. Este método é mais confiável do que o operador `typeof` para tipos complexos, como arrays, datas e null.

1. `.prototype`**:** é uma propriedade que existe em todas as funções JavaScript. Quando uma função é usada como um construtor (com o operador `new`), a nova instância herda as propriedades e métodos do protótipo da função
2. `Object.prototype`**:** é o protótipo do objeto base. Isso inclui métodos como `.toString()`, `valueOf()`, `hasOwnProperty()`, etc.
3. `.toString`**:** é um método de `Object.prototype`. Ele retorna uma string que representa o objeto. Para objetos padrão, o método `.toString()` retorna "`[object Object]`". No entanto, quando é usado diretamente em tipos específicos (como Array, Date, etc.), ele retorna uma string específica que indica o tipo do objeto
4. `.call()`**:** é um método de função que permite chamar uma função com um valor `this` específico e argumentos fornecidos individualmente. Isso é útil para invocar funções de objetos em contextos diferentes

**Juntando Tudo**

Quando usamos `Object.prototype.toString.call()`, estamos fazendo o seguinte:

- `Object.prototype.toString`**:** chamamos o método `.toString` que existe no protótipo de `Object`
- `call(value)`**:** usamos o método `.call()` para invocar `.toString` e passamos o valor que queremos verificar como o contexto `this`

Ao fazer isso, `.toString` retorna uma string que representa o tipo do objeto passado. Essa string é mais detalhada e específica do que o resultado de `typeof`.

**Exemplos**

```JavaScript
const obj = {};
const arr = [];
const date = new Date();
const num = 42;

console.log(Object.prototype.toString.call(obj));  // Output: [object Object]
console.log(Object.prototype.toString.call(arr));  // Output: [object Array]
console.log(Object.prototype.toString.call(date)); // Output: [object Date]
console.log(Object.prototype.toString.call(num));  // Output: [object Number]
console.log(typeof obj);                           // Output: object
console.log(typeof arr);                           // Output: object
```

**Explicação do Código**

1. `Object.prototype.toString.call(obj)`**:**
    - `Object`**:** é o objeto global base
    - `prototype`**:** é a propriedade que dá acesso ao protótipo do `Object`
    - `toString`**:** é o método que converte um objeto em uma string
    - `call(obj)`**:** invoca o método `toString` com `obj` como valor de `this`
2. **Saídas:**
    - `obj`**:** é um objeto padrão, então retorna "`[object Object]`"
    - `arr`**:** é um array, então retorna "`[object Array]`"
    - `date`**:** é uma instância de `Date`, então retorna "`[object Date]`"
    - `num`**:** é um número, então retorna "`[object Number]`"

**Por Que Isso É Útil**

Essa técnica é útil porque `typeof` não é suficiente para distinguir entre diferentes tipos de objetos. Observe como `typeof {}` e `typeof []` ambos retornam "`object`". Ao usar `Object.prototype.toString.call()`, podemos identificar precisamente o tipo de objeto.

**Conclusão**

`Object.prototype.toString.call()` é uma técnica poderosa para determinar o tipo de um objeto em JavaScript, especialmente quando precisamos distinguir entre tipos de objetos complexos como arrays, datas e null.

**Observações Importantes**

`Object.prototype.toString.call(obj)` x `Object.prototype.toString().call(obj)`

`Object.prototype.toString.call()` é o encadeamento correto:

1. `Object.prototype`**:** referência ao protótipo do objeto base `Object`
2. `toString`**:** método do protótipo que converte um objeto em uma string. **Aqui não estamos chamando o método ainda, apenas obtendo a referência a ele**
3. `call`**:** método das funções JavaScript que permite chamar uma função com um valor específico para `this`
4. `(obj)`**:** argumento passado para o método `call()`, especificando o valor de `this` dentro da função `toString`

Se você fizer `Object.prototype.toString().call(obj)`, você está chamando `.toString()` imediatamente no protótipo do objeto, o que retornaria a string "`[object Object]`". Então, você tentaria chamar `.call()` na string resultante, o que resultaria em um erro, porque strings não têm um método `.call()`.

## <a id="objetos-array"></a>`Array`

### Sumário

- [`.isArray()`](#objetos-array-isarray)
- [`.every()`](#objetos-array-every)
- [`.forEach()`](#objetos-array-foreach)
- [`.map()`](#objetos-array-map)
- [`.push()`](#objetos-array-push)
- [`.join()`](#objetos-array-join)

### <a id="objetos-array-isarray"></a>`.isArray()`

É um método estático do objeto `Array` que **verifica se um valor é um array**. Ele retorna `true` se o valor passado for um array, e `false` caso contrário.

**Sintaxe Básica**

```JavaScript
Array.isArray(value);
```

- **Parâmetros:**
    + `value`**:** o valor a ser verificado

**Exemplos**

- **Verificando Arrays:**

```JavaScript
console.log(Array.isArray([1, 2, 3]));       // Output: true
console.log(Array.isArray([]));              // Output: true
console.log(Array.isArray(['a', 'b', 'c'])); // Output: true
```

- **Verificando outros tipos de dados:**

```JavaScript
console.log(Array.isArray({}));        // Output: false
console.log(Array.isArray('Hello'));   // Output: false
console.log(Array.isArray(123));       // Output: false
console.log(Array.isArray(undefined)); // Output: false
console.log(Array.isArray(null));      // Output: false
console.log(Array.isArray(true));      // Output: false
```

**Uso em Funções**

`Array.isArray()` é especialmente útil quando se trabalhar com funções que podem receber diferentes tipos de dados e você precisa tratar arrays de maneia específica.

```JavaScript
function processData(data) {
    if (Arra.isArray(data)) {
        data.forEach(item => {
            console.log("Array item:", item);
        });
    } else {
        console.log("Not an array:", data);
    }
}

procesData([1, 2, 3]);      // Processa cada item do array;
procesData("Hello");        // Exibe a mensagem "Not an array".
procesData({key: "value"}); // Exibe a mensagem "Not an array".
```

**Comparação com** `instanceof`

Embora seja possível usar `instanceof` para verificar se um objeto é uma instância de `Array`, essa abordagem pode falhar quando se lida com múltiplos contextos de execução (por exemplo, ao trabalhar com iframes). `Array.isArray()` é uma maneira mais confiável de verificar arrays.

### <a id="objetos-array-every"></a>`.every()`

**Testa se todos os elementos em um array passam por um teste especificado por um função**.

**Sintaxe Básica**

```JavaScript
array.every(function(element, index, array) {
    // Retorna true ou false.
}, thisArg);
```

- **Parâmetros:**
    + `function()`**:** uma função de teste que é chamada para cada elemento do array. Ela recebe três argumentos
        - `element`**:** o elemento atual sendo processado no array
        - `index` **(opcional):** o índice do elemento atual sendo processado no array
        - `array` **(opcional):** o array no qual `.every()` foi chamado
    + `thisArg` **(opcional):** um valor a ser usado como `this` quando a função de teste é executada
- **Valor de Retorno:** retorna `true` se a função de teste retornar um valor truthy para cada elemento do array; caso contrário, retorna `false`
- **Como Funciona:**
    + `.every()` executa a função fornecida uma vez para cada elemento do array, até que encontre um onde a função retorna um valor falsy (como `false`, `null`, `0`, `""`, `undefined` ou `NaN`)
        - Se a função retorna `true` para todos os elementos do array, `.every()` também retorna `true`
    + Se a função retorna `false` para pelo menos um dos elementos, `.every()` retorna `false` e o restante dos elementos no array não será mais testado
    + O método não modifica o array original

**Exemplos**

```JavaScript
const ages = [32, 33, 16, 40];

function checkAdult(age) {
    return age >= 18;
}

const allAdults = ages.every(checkAdult);

console.log(allAdults); // Output: false. Porque 16 não é maior ou igual a 18.
```

Neste exemplo, `ages.every(checkAdult)` verifica se todos os elementos no array `ages` são maiores ou iguais a 18. A função `checkAdult` é chamada para cada elemento do array. Uma vez que um dos elementos, 16, não passa no teste (não é maior ou igual a 18), `.every()` retorna `false`.

`.every()` é uma ferramenta poderosa para validações onde todos os itens de uma coleção devem atender a uma condição específica.

### <a id="objetos-array-foreach"></a>`.forEach()`

É utilizado para **iterar sobre todos os elementos de um array e executar uma função fornecida para cada elemento**.

- **Sintaxe Básica**

```JavaScript
array.forEach(callback(currentValue, index, array), thisArg);
```

+ **Parâmetros:**
    - `callback()`**:** função a ser executada em cada elemento
        + `currentValue`**:** o valor do elemento atual sendo processado no array
        + `index` **(opcional):** o índice do elemento atual sendo processado no array
        + `array` **(opcional):** o array sobre o qual `.forEach()` foi chamado
    - `thisArg` **(opcional):** valor a ser usado como `this` ao executar a função `callback`

- **Exemplos**

+ **Usando índice e array como parâmetros:**

```JavaScript
const fruits = ["apple", "banana", "cherry"];

fruits.forEach(function(fruit, index, array) {
    console.log(`Index: ${index}, Fruit: ${fruit}, Array: ${array}`);
});

/*
Output:
Index: 0, Fruit: apple, Array: apple,banana,cherry
Index: 1, Fruit: banana, Array: apple,banana,cherry
Index: 2, Fruit: chery, Array: apple,banana,cherry
*/
```

+ **Usando** `thisArg`**:**

```JavaScript
const handler = {
    log: function(element) {
        console.log(element);
    }
};

const numbers = [1, 2, 3, 4, 5];
numbers.forEach(function(number) {
    this.log(number);
}, handler);

/*
Output:
1
2
3
4
5
*/
```

- **Observações Importantes**
    + **Não interrompe o loop:** diferentemente de um loop `for` tradicional, não é possível interromper um `.forEach()` (não há `break` ou `return` que interrompa o loop). Se você precisar de tal funcionalidade, considere usar um loop `for`, `for...of` ou métodos como `some` ou `every`
    + **Não retorna um novo array:** embora você possa modificar os elementos do array dentro de `.forEach()`, isso não é uma prática recomendada. Em vez disso, você deve usar `.map()` se precisar criar um novo array com os elementos modificados

### <a id="objetos-array-map"></a>`.map()`

É utilizado para **criar um novo array com os resultados da aplicação de uma função em cada elemento de um array original**. Este método não modifica o array original.

**Sintaxe Básica**

```JavaScript
array.map(callback(element, index, array), thisArg);
```

- **Parâmetros**:
    + `callback()`**:** função que é chamada para cada elemento do array
        - `element`**:** o elemento atual sendo processado no array
        - `index` **(opcional):** o índice do elemento atual sendo processado no array
        - `array` **(opcional):** o array ao qual `.map()` foi chamado
    + `thisArg` **(opcional):** valor a ser usado como `this` ao executar o `callback()`

**Exemplos**

- **Transformação simples**

Convertendo todos os números de um array em seus quadrados

```JavaScript
const numbers = [1, 2, 3, 4];
const squares = numbers.map(number => number * number);

console.log(squares); // Output: [ 1, 4, 9, 16 ]
```

- **Uso do índice**

Adicionando o índice de cada elemento ao próprio elemento.

```JavaScript
const numbers = [1, 2, 3, 4];
const indexedNumbers = numbers.map((number, index) => number + index);

console.log(indexedNumbers); // Output: [ 1, 3, 5, 7]
```

- **Mapeamento de objetos**

```JavaScript
const users = [
    { name: "Alice", age: 25 },
    { name: "Bob", age: 30 },
    { name: "Charlie", age: 35 },
];
const names = users.map(user => user.name);

console.log(names); // Output: [ 'Alice', 'Bob', 'Charlie' ]
```

- **Com** `thisArg`

```JavaScript
const numbers = [1, 2, 3, 4];
const multiplier = {
    factor: 10,
    multiply(value) {
        return value * this.factor;
    }
};
const multipliedNumbers = numbers.map(function (number) {
    return this.multiply(number)
}, multiplier);

console.log(multipliedNumbers); // Output: [ 10, 20, 30, 40 ]
```

**Exemplos Interessantes**

- **Encadeamento de métodos**

Você pode encadear o `.map()` com outros métodos, como `.filter()`.

```JavaScript
const numbers = [1, 2, 3, 4, 5];
const evenSquares = numbers
    .filter(number => number % 2 === 0)
    .map(number => number * number);

console.log(evenSquares); // Output: [ 4, 16 ]
```

- **Mapeamento e redução**

Usando `.map()` com `.reduce()` para somar os quadrados dos elementos de um array.

```JavaScript
const numbers = [1, 2, 3, 4];
const sumOfSquares = numbers
    .map(number => number * number)
    .reduce((sum, square) => sum + square, 0);

console.log(sumOfSquares); // Output: 30
```

### <a id="objetos-array-push"></a>`.push()`

É utilizado para **adicionar um ou mais elementos ao final de um array**. **Ele modifica o array original e retorna o novo comprimento do array**.

**Sintaxe Baśica**

```JavaScript
array.push(element1, ..., elementN);
```

- **Parâmetros:**
    + `element1, ..., elementN`**:** os elementos a serem adicionados ao final do array

**Exemplos Interessantes**

- **Concatenar arrays**

```JavaScript
let array1 = [1, 2, 3];
let array2 = [4, 5, 6];

Array.prototype.push.apply(array1, array2);

console.log(array1); // Output: [ 1, 2, 3, 4, 5, 6 ]
console.log(array2); // Output: [ 4, 5, 6 ]
```

### <a id="objetos-array-join"></a>`.join()`

É utilizado para **unir todos os elementos de um array em uma única string**. Um separador especificado é inserido entre os elementos no resultado final. Se nenhum separador for especificado, uma vírgula será usada por padrão.

**Sintaxe Básica**

```JavaScript
array.join(separator);
```

- **Parâmetros:**
    + `separator` **(opcional):** especifica a string a ser usada como separador entre os elementos. Se omitido, o separador padrão é uma vírgula

**Exemplos**

- **Unindo elementos com vírgula**

```JavaScript
const elements = ["Fire", "Air", "Water"];
const result = elements.join();

console.log(result); // Output: Fire,Air,Water
```

- **Sem separador (string vazia)**

```JavaScript
const elements = ["Fire", "Air", "Water"];
const result = elements.join("");

console.log(result); // Output: FireAirWater
```

- **Array com elementos vazios ou** `undefined`

```JavaScript
const elements = ["Fire", , "Water", undefined];
const result = elements.join("|");

console.log(result); // Output: Fire||Water|
```

## <a id="objetos-error"></a>`error`

**Quando se captura um erro usando um bloco** `try...catch`, o objeto `error` contém várias propriedades que ajudam a entender a natureza do error:

- `message`**:** contém uma descrição da mensagem de erro
- `stack`**:** é uma string que contém informações sobre a **pilha de chamadas no momento em que o erro foi lançado. Isso pode ser extremamente útil para depuração, pois mostra a sequência de chamadas de função que levarão ao erro**

## <a id="objetos-date"></a>`Date`

É **usado para trabalhar com datas e horas**. Ele fornece métodos para criar objetos de data, acessar e manipular componentes de data e hora, e formatar datas para exibição.

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

# <a id="funcao-flecha"></a>Função de Flecha

**Funções de flecha de uma linha retornam implicitamente o resultado da expressão após a seta. Funções de seta de mais de uma linha (quando o seu corpo está envolvido por chaves, quando seu escopo está especificado) retornam** `undefined` **implicitamente, quando você não define o retorno explicitamente**.

**Exemplos Interessantes**

- **Primeiro trecho de código**

```JavaScript
if (!requiredFields.every((key) => request.body[key] !== undefined)) {
    return send_error(request, response, "Invalid input format", request.body);
}
```

Neste trecho, você está usando uma função de flecha de uma linha. A função de flecha de uma linha retorna implicitamente o resultado da expressão após a seta (`=>`), portanto, esta função de flecha verifica se cada `key` em `requireFields` não é `undefined` no objeto `request.body` e se as chaves não forem `undefined`, o método `.every()` retornará `true`. A negação (`!`) antes disso inverte o resultado, então você entrará no `if` se pelo menos uma chave for `undefined`.

- **Segundo trecho de código**

```JavaScript
if (!requiredFields.every((key) => {request.body[key] !== undefined})) {
    return send_error(request, response, "Invalid input format", request.body);
}
```

Neste trecho, você está usando uma função de flecha de várias linhas, que está envolvida por chaves `{}`. Essa forma de função de flecha permite que você execute múltiplas instruções dentro dela, no entanto, como você não está explicitamente retornando um valor nesta função, ela retorná `undefined` implicitamente. Isso faz com que o método `.every()` sempre retorne `false` (`undefined` é um valor falsy), independente dos valores dos campos em `requiredFields`, portanto, você sempre entrará no `if`.

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

function() {
    count++;
    return count;
}

pois `contador()` retorna uma função. Como podemos ver, essa função continua conseguindo acessar a variável `count`.*/
const increment = contador();

console.log(increment()); // Output: 1
console.log(increment()); // Output: 2
console.log(increment()); // Output: 3
```

# <a id="async-await"></a>`async` e `await`

O suporte para `async` e `await` foi introduzido no Node.js versão 7.6.0, lançado em fevereiro de 2017. Essa versão trouxe suporte inicial para essas funcionalidades baseadas em Promises, permitindo que desenvolvedores escrevessem código assíncrono de maneira mais síncrona e legível.

A partir da versão 8.0.0, o Node.js estabilizou completamente o suporte para `async` e `await`, trazendo várias melhorias e correções de bugs. Por isso, é recomendado usar no mínimo a versão 8 para um suporte robusto.

# <a id="importacao-exportacao"></a>Importação e Exportação

No JavaScript, especialmente quando se usa módulos ES6, há diferentes formas de exportar e importar valores. As duas principais são exportações nomeadas (named exports) e a exportação padrão (default export).

## <a id="importacao-exportacao-commonjs"></a>CommonJS

- O CommonJS é o sistema de módulos usado pelo Node.js desde o início
- O `module.exports` e o `require` são a forma original de exportar e importar módulos no Node.js, utilizando o padrão CommonJS. O ES6 introduziu uma nova sintaxe de módulos com `import` e `export`, mas ambos coexistem no ecossistema Node.js

Você usa o `module.exports` para exportar **um valor** de um módulo. Pode ser um objeto, uma função, uma classe ou qualquer outro valor.

```JavaScript
// module.js
module.exports = function() {
    console.log("Função exportada!");
};

// ou

module.exports = {
    nome1: "Maria1",
    nome2: "João",
    saudacao: function() {
        console.log("Olá!");
    },
};
```

```JavaScript
// main.js
const saudacao = require("./module");

saudacao(); // Output: Função exportada!

// ou

const modulo = require("./module");

console.log(modulo.nome1); // Output: Maria
console.log(modulo.nome2); // Output: João

modulo.saudacao();         // Output: Olá!
```

**Exportações Nomeadas (Named Exports)**

**Embora** `module.exports` **exporte um único valor**, você pode estruturar seu módulo para imitar exportações nomeadas, colocando propriedades em um objeto.

```JavaScript
// module.js
module.exports.nome1 = "Maria";
module.exports.nome2 = "João";
module.exports.saudacao = function() {
    console.log("Olá");
};

// ou

exports.nome1 = "Maria";
exports.nome2 = "João";
exports.saudacao = function() {
    console.log("Olá");
};
```

## <a id="importacao-exportacao-es6"></a>ES6

**Exportações Nomeadas (Named Exports)**

Você pode exportar múltiplos valores de um módulo usando exportações nomeadas. Cada exportação tem um nome específico que é usado ao importar o valor em outro módulo.

```JavaScript
// module.js
export const nome1 = "Maria";
export const nome2 = "João";
export function saudacao() {
    console.log("Olá!");
}
```

```JavaScript
// main.js
import { nome1, nome2, saudacao } from "./module";

console.log(nome1); // Output: Maria
console.log(nome2); // Output: João

saudacao();         // Output: Olá!
```

Você também pode importar todas as exportações nomeadas de um módulo usando o operador `*` e um namespace.

```JavaScript
// main.js
import * as modulo from "./module";

console.log(modulo.nome1); // Output: Maria
console.log(modulo.nome2); // Output: João

modulo.saudacao();         // Output: Olá
```

**Exportação Padrão (Default Export)**

Um módulo pode ter **uma exportação padrão**. Este é um valor que é exportado por padrão quando o módulo é importado. **Um módulo só pode ter uma exportação padrão**.

```JavaScript
// module.js
const nome1 = "Maria";

export default nome1;
```

```JavaScript
// main.js
import nome from "./module";

console.log(nome); //Output: Maria
```

**Combinação de Exportações**

Você pode combinar exportações nomeadas e a exportação padrão no mesmo módulo.

```JavaScript
// module.js
const nome1 = "Maria";
const nome2 = "João";

function saudacao() {
    console.log("Olá");
}

export default nome1;
export { nome2, saudacao };
```

```JavaScript
// main.js
import nome, { nome2, saudacao } from "./module";

console.log(nome);  // Output: Maria
console.log(nome2); // Output: João

saudacao();         //Output: Olá
```

**Renomeando Exportações Durante a Importação**

Você pode renomear uma exportação ao importá-la para evitar conflitos de nome ou por clareza.

```JavaScript
// module.js
export const nome1 = "Maria";
export const nome2 = "João";
```

```JavaScript
// main.js
import { nome1 as primeiroNome, nome2 as segundoNome } from "./module";

console.log(primeiroNome); // Output: Maria
console.log(segundoNome);  // Output: João
```

## <a id="importacao-exportacao-commonjs-x-es6"></a>CommonJS x ES6

**Diferenças Principais**

1. **Sintaxe:**
    - **CommonJS:** `module.exports` e `require`
    - **ES6:** `export` e `import`
2. **Importação/Exportação padrão e nomeada:**
    - **CommonJS** não distingue entre exportações padrão e nomeadas, **você exporta e importa um único objeto**
    - **ES6** distingue claramente entre exportações padrão e nomeadas
3. **Sincronicidade:**
    - **CommonJS:** importações são síncronas
    - **ES6:** importações podem ser assíncronas
4. **Suporte em navegadores:**
    - **CommonJS:** é específico para Node.js e não é suportado nativamente por navegadores
    - **ES6:** ES6 modules são suportados nativamente em navegadores modernos
5. **Análise estática:** ES6 modules permitem análise estática, o que pode levar a melhores otimizações em ferramentas de bundling como Webpack

Ambos os sistemas de móduloes têm suas próprias vantagens e casos de uso. `module.exports` e `require` são amplamente usados em Node.js devido à sua simplicidade e ao longo tempo de suporte. Os módulos ES6 (`import` e `export`) são mais modernos e são a escolha padrão para novos projetos que visam interoperabilidade entre Node.js e navegadores modernos. Em muitos casos, você pode misturar ambos os sistemas, especialmente ao trabalhar em ambientes Node.js, usando transpilers como Babel para converter ES6 modules para CommonJS quando necessário.

**Importando CommonJS em ES Modules**

```JavaScript
// module.cjs (CommonJS)
const nome = "Maria";

module.exports = nome;

// main.mjs (ESM)
import nome from "./module.cjs"

console.log(nome); // Output: Maria
```

**Importando ES Modules em CommonJS**

```JavaScript
// module.mjs (ESM)
export const nome = "Maria";

// main.cjs (CommonJS)
const { createRequire } = require("module");
const require = createRequire(import.meta.url);
const { nome } = require("./module.mjs");

console.log(nome); // Output: Maria
```

# <a id="epoca-unix"></a>Época Unix

É um padrão comum para muitas linguagens de programação que as suas bibliotecas representem o tempo como um número em milissegundos decorridos desde um ponto de referência específico, como a Época Unix, para a biblioteca `moment` do JavaScript.

A Época Unix é o marco zero do sistema de tempo Unix, também é conhecida como "marco zero do calendário Unix", e é definida como primeiro de janeiro de 1970, 00:00:00 UTC. O `moment` realiza a conversão da data para milissegundos a partir da Época Unix.

# <a id="es6"></a>ES6

Os módulos ES6, também conhecidos como ECMAScripts Modules (ESM), foram introduzidos no Node.js de forma experimental a partir da versão 8.5.0, lançada em setembro de 2017. No entanto, foi apenas a partir da versão 12.0.0, lançada em abril de 2019, que o suporte a módulos ES6 começou a ser estável. O suporte completo e estável para módulos ES6 foi oficializado na versão 14.0.0, lançada em abril de 2020.

Aqui estão alguns marcos importantes:

1. **Node.js 8.5.0(Setembro de 2017):** introdução experimental do suporte a módulos ES6 com a extensão **.mjs**
2. **Node.js 12.0.0(Abril de 2019):** melhorias significativas no suporte a módulos ES6, tornando-o mais estável
3. **Node.js 14.0.0(Abril de 2020):** suporte oficial e estável para módulos ES6, permitindo o uso da extensão **.mjs** e a configuração "`"type": "module"`" no **package.json**

**Usando a Extensão .mjs**

```JavaScript
// module.mjs

export const nome = "Maria";

// main.mjs
import { nome } from "./module.mjs";

console.log(nome); // Output: Maria
```

**Usando** `"type": "module"` **no package.json**

```json
{
    "type": "module"
}
```

Agora você pode usar a extensão **.js**.

```JavaScript
// module.js
export const nome = "Maria";

// main.js
import { nome } from "./module.js";

console.log(nome); // Output: Maria
```

Ambos os métodos permitem o uso dos recurso do ES6. Se precisar de interoperabilidade com os módulos CommonJS, você pode usar técnicas de interoperabilidade fornecidas pelo Node.js.

# <a id="commonjs-x-es6"></a>CommonJS x ES6

Se seu arquivo tem a extensão **.js**, ele será tratado como um módulo CommonJS por padrão. Para usar a sintaxe de módulos ES6 (ESM) em arquivos **.js**, você precisa especificar "`"type": "module"`" no seu **package.json**. Caso contrário, você deve usar a extensão **.mjs** para que o Node.js reconheça or arquivos como módulos ES6.

Caso você use a chave "`"type": "module"`" no seu **package.json**, os arquivos **.js** serão tratados como módulos ES6 e os arquivos **.cjs** são tratados como módulos CommonJS.