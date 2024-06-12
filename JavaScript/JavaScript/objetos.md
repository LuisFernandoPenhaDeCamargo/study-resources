# Objetos (Ok)

Em JavaScript, objetos são coleções de propriedades, onde cada propriedade é uma associação entre um nome (ou chave) e um valor. Eles são uma estrutura de dados central em JavaScript e são usados para armazenar vários tipos de dados e entidades complexas.

Objetos em JavaScript são extremamente versáteis e são usados para representar tudo, desde dados simples até estruturas complexas e entidades do mundo real.

### Principais Tipos de Objetos

1. `Object`

- É o tipo mais básico de objeto
- Pode conter propriedades e métodos
- Criado usando a sintaxe do objeto literal `{}` ou o construtor `new Object()`

```JavaScript
let objeto = {
    nome: "Alice",
    idade: 25,
    saudacao: function() {
        console.log("Hello");
    }
};
```

2. `Number`

- É um objeto que representa números
- Criado com literais (`42`) ou usando o construtor `new Number()`

```JavaScript
let numero1 = 42;
let numero2 = new Number(42);
```

3. `String`

- É um objeto que representa uma sequência de caracteres
- Strings podem ser criadas como literais (`"text"`) ou usando o construtor `new String()`

```JavaScript
let string1 = "Hello, world!";
let string2 = new String("Hello, world!");
```

4. `Array`

- É um tipo especial de objeto usado para armazenar listas ordenadas de valores
- Criado usando colchetes `[]` ou o construtor `new Array()`

```JavaScript
let array = [1, 2, 3, 4];
```

5. `Boolean`

- Representa um valor booleano (`true` ou `false`)
- Criado como literais (`true`, `false`) ou usando o construtor `new Boolean()`

```JavaScript
let booleano1 = true;
let booleano2 = new Boolean(true);
```

6. **Função**

- É um objeto que representa uma função
- Funções são objetos de primeira classe em JavaScript e podem ser atribuídas a variáveis, passadas como argumentos e retornadas de outras funções

```JavaScript
function saudacao() {
    console.log("Hello");
}
```

7. `Date`

- É um objeto que representa datas e horas
- Criado usando o construtor `new Date()`

```JavaScript
let dataNesteMomento = new Date();
```

8. `Error`

- Representa um erro em execução
- Criado usando o construtor `new Error()`

```JavaScript
let erro = new Error("Something went wrong");
```

9. `JSON`

- É um objeto global que fornece métodos para trabalhar com dados JSON (JavaScript Object Notation)
- Inclui métodos como `JSON.parse()` para analisar strings JSON

```JavaScript
let stringJson = '{"name":"Alice", "age":25}'
let json = JSON.parse(stringJson);
```

10. `RegExp`

- Representa expressões regulares
- Criado usando a sintaxe literal "`/pattern/`" ou o construtor `new RegExp()`

```JavaScript
let regex1 = /abc/;
let regex2 = new RegExp("abc");
```

### Exemplos de Criação de Objetos

```JavaScript
// Objeto Literal
let pessoaLiteral = {
    primeiroNome: "Alice",
    segundoNome: "Doe",
    idade: 25,
};

// Construtor de Objeto
let pessoaConstrutor =  new Object();
pessoaConstrutor.primeiroNome = "Alice";
pessoaConstrutor.segundoNome = "Doe";
pessoaConstrutor.idade = 25;

// Função Construtora
function Pessoa(primeiroNome, segundoNome, idade) {
    this.primeroNome = primeroNome;
    this.segundoNome = segundoNome;
    this.idade = idade;
}

let alice = new Pessoa("Alice", "Doe", 25);
```

### Objetos Literais x Objetos Criados com `new`

**Tipos Primitivos (Number, String, Boolean)**

- **Literais:** criar um valor de tipo primitivo de forma literal resulta em um valor que é realmente do tipo primitivo
    + Operações em literais retornam novos valores sem modificar o original
    + Você pode acessar métodos e propriedades diretamente no literal devido ao autoboxing (conversão automática do valor primitivo para o objeto correspondente)
- **Operador** `new`**:** usar o operador `new` com construtores dos tipos primitivos cria um objeto wrapper, que é um objeto real em JavaScript

**Prototipagem (**`Object`**)**

- Objetos ("`Object`") criados com literais não têm acesso a um protótipo específico, além do protótipo base (`Object`)
- Objetos ("`Object`") criados com `new` têm acesso ao protótipo da função construtora, permitindo a definição de métodos compartilhados

**Exemplos**

```JavaScript
let string1 = "hello";
let string2 = "hello";

console.log (string1 === string2); // Output: true

let objeto1 = new String("hello");
let objeto2 = new String("hello");

console.log(objeto1 === objeto2);                      // Output: false (compara referências).
console.log(objeto1.valueOf() ==== objeto2.valueOf()); // Output: true (compara valores).
```

### Sumário

- [`Object`](#object)
- [`Number`](#number)
- [`String`](#string)
    + [`.trim()`](#string-trim)
- [`Array`](#array)
- [`Boolean`](#boolean)
- [Função](#funcao)
    + [`.bind()`](#funcao-bind)
- [`Date`](#date)
- [`Error`](#error)
- [`JSON`](#json)
    + [`.stringify()`](#json-stringify)
- [`RegExp`](#regexp)

# <a id="string"></a>`String`

### Sumário

- [`.trim()`](#string-trim)

## <a id="string-trim"></a>`.trim()`

É utilizado para **remover os espaços em branco do ínicio e do fim de uma string**. Espaços em branco no meio da string não são afetados. Este método não altera a string original, mas retorna uma nova string com os espaços em branco removidos.

**Observações Importantes**

Espaços removidos:

- Espaços
- Quebras de linha (\n)
- Tabulações (\t)
- Quebras de página (\f)
- Retornos de carro (\r)

### Exemplos

```JavaScript
// Removendo espaços em uma string com apenas espaços.
const string = "     ";
const trimmedString = string.trim();

console.log(trimmedString); // Output: ""
```

# <a id="funcao"></a>Função

- Em JavaScript, funções são objetos, isso significa que elas possuem propriedades e métodos, assim como qualquer outro objeto
- Elas são um tipo especial de objeto, são objetos de primeira classe, o que significa que podem ser atribuídas a variáveis, passadas como argumentos para outras funções e retornadas por outras funções
- Além disso, elas têm propriedades e métodos próprios.

### Sumário

- [`.bind()`](#funcao-bind)

## <a id="funcao-bind"></a>`.bind()`

É utilizado para **criar uma nova função que, quando chamada, tem seu** `this` **setado para um valor específico**. Isso permite que você controle o contexto de execução da função, garantindo que ela sempre use o mesmo objeto como `this`, independentemente de como ou onde a função é chamada.

**Sintaxe Básica**

```JavaScript
funcao.bind(thisArg[, argumento1 [, argumento2 [, ...]]]);
```

- `thisArg`**:** o valor a ser passado como o `this` para a função quando a função é chamada. Em funções não estritas, `null` e `undefined` serão substituídos pelo objeto global (window em navegadores). Em funções estritas, o valor de `this` permanece como o valor especificado
- **"argumentos":** argumentos a serem pré-preenchidos na função vinculada

**Observações Importantes**

- **Criação de uma nova função:** `.bind()` não altera a função original. Em vez disso, ele cria uma nova função com o `this` pré-definido
- **Pré-preenchimento de argumentos:** você pode usar `.bind()` para pré-preencher alguns ou todos os argumentos de uma função. Isso é útil para criar funções de ordem superior
- **Contexto em funções de retorno de chamada:** `.bind()` é frequentemente usado para garantir que o contexto `this` seja preservado quando funções são passadas como callbacks

### Exemplos

```JavaScript
const pessoa = {
    nome: "Alice",
    saudacao: function() {
        console.log(`Hello, my name is ${this.nome}`);
    },
};

// `.bind()` para um objeto.
const saudacao = pessoa.saudacao.bind(pessoa);

saudacao(); // Output: Hello, my name is Alice

// `.bind()` com pré-preenchimento de argumentos.
function multiplica(a, b) {
    return a * b;
}

const dobrado = multiplica.bind(null, 2); // Preenche o primeiro argumento como 2.

console.log(dobrado(5)); // Output: 10

// `.bind()` em métodos de classes.
class Contador {
    constructor() {
        this.contador = 0;
        this.incrementa = this.incrementa.bind(this);
    }

    incrementa() {
        this.contador++

        console.log(this.contador);
    }
}

const contador = new Contador();

setTimeout(contador.incrementa, 1000); // Output: 1
```

### Comparação com `.call()` e `.apply()`

- `.bind()`**:** cria uma nova função com um contexto `this` específico e, opcionalmente, argumentos pré-preenchidos. Não chama a função imediatamente
- `.call()`**:** chama a função imediatamente com um contexto `this` específico e argumentos passados individualmente
- `.apply()`**:** chama a função imediatamente com um contexto `this` específico e argumentos passados como um array

```JavaScript
function saudacao(cumprimento, pontuacao) {
    console.log(cumprimento + ", " + this.usuario + pontuacao);
}

const objeto = { usuario: "Alice" };

saudacao.call(objeto, "Hello", "!");   // Output: Hello, Alice!
saudacao.apply(objeto, ["Hi", "..."]); // Output: Hi, Alice...

const saudacaoAlice = saudacao.bind(objeto, "Hey");

saudacaoAlice("?");                    // Output: Hey, Alice?
```

# <a id="json"></a>`JSON`

### Sumário

- [`.stringify()`](#json-stringify)

## <a id="json-stringify"></a>`.stringify()`

É utilizado para **converter objetos JavaScript em strings JSON**. Ele é amplamente utilizado para serializar dados para armazenamento ou transmissão em formatos compatíveis com JSON.

**Sintaxe Básica**

```JavaScript
JSON.stringify(valor[, replacer[, espacamento]]);
```

- `valor`**:** o valor a ser convertido em uma string JSON. Pode ser um **objeto**, **array**, **número**, **string**, **booleano** ou `null`
- `replacer` **:** uma **função** ou **array** que pode ser usada para selecionar ou alterar as propriedades que serão incluídas na string JSON. Se for uma função, recebe cada par chave-valro durante a serialização. Se for um array, apenas as propriedades cujos nomes estão neste array serão incluídas
- `espacamento `**:** um **número** ou **string** usado para adicionar espaçamento à string JSON para formatação legível. Se for um número, representa o número de espaços; se for uma string, essa string será usada como o espaço

**Observações Importantes**

- **Funções e valores** `undefined`**:** propriedades de objeto cujos valores são funções ou `undefined` são ignoradas durante a serialização
- **Ciclos de referência:** `.stringfy()` lança um erro se tentar serializar um objeto com referências circulares (um objeto que refere a si mesmo)

### Exemplos

```JavaScript
function exemplo() {};

const objeto = {
    nome: "Alice",
    undefined: undefined,
    idade: 25,
    funcao: exemplo,
    cidade: "New York",
};

// Exemplo básico.
let stringJson = JSON.stringify(objeto);

console.log(stringJson); // Output: {"nome":"Alice","idade":25,"cidade":"New York"}

// Com `replacer`.
stringJson = JSON.stringify(objeto, (chave, valor) => {
    if (chave === "idade") {
        return undefined;
    }

    return valor;
});

console.log(stringJson); // Output: {"nome":"Alice","idade":25,"cidade":"New York"}

// Com `space` para formatação legível.
stringJson = JSON.stringify(objeto, null, 2);

console.log(stringJson);
/*
Output:
{
    "nome":"Alice",
    "idade":25,
    "cidade":"New York"
}
*/

// Serializando Arrays.
const array = [1, "false", false];

stringJson = JSON.stringify(array);

console.log(stringJson); // Output: [1,"false",false]
```