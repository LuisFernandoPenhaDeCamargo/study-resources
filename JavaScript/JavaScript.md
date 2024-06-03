# JavaScript

### Sumário

- [Operadores](#operadores)
    + [`new`](#operadores-new)
    + [`typeof`](#operadores-typeof)
- [Objetos](#objetos)
    + [Definindo Métodos em Objetos](#objetos-definindo-metodos-objetos)
    + [`Object`](#objetos-object)
        - [`.hasOwnProperty()`](#objetos-object-hasownproperty)
        - [`.toString()`](#objetos-object-tostring)
        - [`.prototype.toString.call()`](#objetos-object-prototype-tostring-call)
    + [`Array`](#objetos-array)
        - [`.isArray()`](#objetos-array-isarray)
        - [`.every()`](#objetos-array-every)
        - [`.forEach()`](#objetos-array-foreach)
    + [`error`](#objetos-error)
    + [`Date`](#objetos-date)
- [Função de Flecha](#funcao-flecha)
- [Closures](#closures)
- [Época Unix](#epoca-unix)

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
- [`.toString()`](#objetos-object-tostring)
- [`.prototype.toString.call()`](#objetos-object-prototype-tostring-call)

### <a id="objetos-object-hasownproperty"></a>`.hasOwnProperty()`

É uma função nativa de JavaScript que verifica se um objeto possui uma propriedade específica como uma propriedade direta (não herdada) do objeto. Esse método é útil para distinguir propriedades do próprio objeto de propriedades herdadas do seu protótipo.

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

**Conclusão**

O método `.hasOwnProperty()` é uma ferramenta essencial para trabalhar com objetos em JavaScript, especialmente quando se lida com herança prototípica. Ela permite que você verifique de forma confiável se uma propriedade pertence diretamente a um objeto, evitando possíveis problemas causados por propriedades herdadas.

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
    + `function(element, index, array)`**:** uma função de teste que é chamada para cada elemento do array. Ela recebe três argumentos
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
    - `callback`**:** função a ser executada em cada elemento
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
Index: 0, Fruit: apple, Array: apple, banana, cherry
Index: 1, Fruit: banana, Array: apple, banana, cherry
Index: 2, Fruit: chery, Array: apple, banana, cherry
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

# <a id="epoca-unix"></a>Época Unix

É um padrão comum para muitas linguagens de programação que as suas bibliotecas representem o tempo como um número em milissegundos decorridos desde um ponto de referência específico, como a Época Unix, para a biblioteca `moment` do JavaScript.

A Época Unix é o marco zero do sistema de tempo Unix, também é conhecida como "marco zero do calendário Unix", e é definida como primeiro de janeiro de 1970, 00:00:00 UTC. O `moment` realiza a conversão da data para milissegundos a partir da Época Unix.