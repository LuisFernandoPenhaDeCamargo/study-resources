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

- [Objeto de Primeira Classe](#objeto-de-primeira-classe)
- [Objetos Globais](#objetos-globais)
- [`Object`](#object)
- [`Number`](#number)
- [`String`](#string)
    + [`.trim()`](#string-trim)
- [`Array`](#array)
    + [`.find()`](#array-find)
- [`Boolean`](#boolean)
- [Função](#funcao)
    + [`.bind()`](#funcao-bind)
- [`Date`](#date)
- [`Error`](#error)
- [`JSON`](#json)
    + [`.stringify()`](#json-stringify)
- [`RegExp`](#regexp)
- [`Promise`](#promise)
    + [`.reject()`](#promise-reject)
- [`process`](#process)
    + [`.exit()`](#process-exit)

# <a id="objeto-de-primeira-classe"></a>Objeto de Primeira Classe

Em programação, um objeto de primeira classe (ou cidadão de primeira classe) é uma **entidade que pode ser tratrada como qualquer outro valor**. Em outras palavras, um objeto de primeira classe possui as seguintes propriedades:

1. **Pode ser atribuído a uma variável:** você pode armazenar o objeto em uma variável
2. **Pode ser passado como argumento para uma função:** você pode passar o objeto como um argumento para funções
3. **Pode ser retornado de uma função:** uma função pode retornar um objeto
4. **Pode ser armazenado em estruturas de dados:** você pode armazenar o objeto em arrays, objetos, ou outras estruturas de dados

### Exemplos em JavaScript

Em JavaScript, funções são objetos de primeira classe. Isso significa que funções podem ser tratadas como qualquer outro objeto.

```JavaScript
// Atribuição a variáveis.
const digaOla = function () {
    console.log("Hello!");
}

// Passagem como argumentos.
function saudacao(funcao) {
    funcao();
}

saudacao(digaOla); // Passa a função como argumento.

// Retorno de funções.
function getSaudacao() {
    return function () {
        console.log("Hello!");
    };
}

const cumprimentador = getSaudacao();

cumprimentador(); // Chama a função retornada.

// Armazenamento em estruturas de dados.
const funcoes = [
    function () { console.log("Hello from function 1"); },
    function () { console.log("Hello from function 2"); }
];

funcoes.forEach(funcao => funcao()); // Chama cada função no array.
```

**Objetos de Primeira Classe em Geral**

Além de funções, todos os outros tipos de valores em JavaScript (números, strings, arrays, objetos) também são considerados de primeira classe, pois possuem as mesmas propriedades.

### Comparação com Outras Linguagens

Em algumas linguagens de programação, como C, funções não são objetos de primeira classe. Isso significa que, embora você possa chamar funções e passá-las como ponteiros de funções, não pode atribuí-las diretamente a variáveis ou retorná-las de outras funções de maneira tão simples e direta quanto em linguagens que tratam funções como objetos de primeira classe.

### Conclusão

O conceito de objetos de primeira classe é fundamental para a compreensão de linguagens de programação modernas, especialmente aquelas que suportam programação funcional. Ele permite um estilo de programação mais flexível e poderoso, onde funções podem ser manipuladas e usadas como qualquer outro valor.

# <a id="objetos-globais"></a>Objetos Globais

Os objetos globais são aqueles que **estão disponíveis em qualquer ponto do seu código, sem a necessidade de importá-los ou defini-los**. Eles são propriedades do objeto global (`window` no navegador, `global` no Node.js) e podem ser acessados diretamente.

### Contexto do Node.js

No Node.js, além dos objetos globais padrão, existem outros objetos globais específicos do ambiente Node.js, como:

- `global`**:** o objeto global em Node.js
- `process`**:** fornece informações e controle sobre o processo Node.js em execução
- `Buffer`**:** útil para manipulação de dados binários
- `require`**:** função usada para importar módulos
- `module` **e** `exports`**:** usados para exportar módulos

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

# <a id="array"></a>`Array`

### Sumário

- [`.find()`](#array-find)

## <a id="array-find"></>`.find()`

É utilizado para **retornar o primeiro elemento em um array que satisfaz a condição a condição fornecida em uma função de callback**. Se nenhum elemento satisfizer a condição, ele retorna `undefined`.

**Sintaxe Básica**

```JavaScript
array.find(callback(elemento[, index[, array]])[, thisArg]);
```

- `callback`**:** função que é chamada para cada elemento do array
    + `elemento`**:** o elemento atual sendo processado no array
    + `index`**:** o índice do elemento atual sendo processado no array
    + `array`**:** o array sobre o qual o método `.find()` foi executado
- `thisArg`**:** valor a ser usado como `this` ao executar o `callback`

O método `.find()` é útil para localizar o primeiro elemento em um array que satisfaz uma determinada condição. É uma forma conveniente de **pesquisa linear**, especialmente quando você deseja apenas o primeiro resultado que corresponde a um critério.

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

É um **utilitário global que fornece métodos para manipulação de dados no formato JSON** (JavaScript Object Notation). Ele é frequentemente utilizado para serializar e desserializar dados entre JavaScript e outros sistemas, como APIs, arquivos de configuração, e banco de dados.

### Considerações de Segurança

- **Validação de entrada:** ao utilizar `.parse()` em dados externos, é importante validar os dados para evitar ataques de injeção
- **Manuseio de erros:** use `try...catch` para tratar erros potenciais durante a conversão de JSON

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

# <a id="promise"></a>`Promise`

É um objeto que representa a **eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante**. Ela fornece uma maneira mais limpa e poderosa de lidar com operações assíncronas do que callbacks, permitindo a execução sequencial e melhor tratamento de erros.

### Conceitos Básicos

- **Pending (Pendente):** estado inicial da Promise, que ainda não foi resolvida nem rejeitada
- **Fulfilled (Resolvida):** a operação foi completada com sucesso
- **Rejected (Rejeitada):** a operação falhou

### Métodos Importantes

- `.then(seResolvida, seRejeitada)`**:** adiciona handlers para a eventual conclusão ou falha da Promise
- `.catch(seRejeitada)`**:** adiciona um handler apenas para a falha da Promise
- `.finally(finalmente)`**:** adicionar um handler para ser executado independentemente da conclusão ou falha da Promise

### Exemplos

```JavaScript
// Criando uma Promise.
let minhaPromessa = new Promise((resolve, reject) => {
    let sucesso = true; // Pode ser o resultado de uma operação assíncrona.
    if (sucesso) {
        resolve("Operation was successful!");
    } else {
        reject("Operation failed.");
    }
});

// Consumindo uma Promise.
minhaPromessa
    .then(resultado => {
        console.log(resultado); // Output: Operation was successful!
    })
    .catch(error => {
        console.error(error);   // Output: Operation failed.
    });

// Criando uma Promise simples.
let promiseResolvida = Promise.resolve("Resolved value");

promiseResolvida.then(valor => console.log(valor)); // Output: Resolved value

// Criando uma Promise simples que falha.
let promiseRejeitada = Promise.reject("Rejected reason");

promiseRejeitada.catch(razao => console.error(razao)); // Output: Rejected reason

// Usando `async` e `await`
async function funcaoAssincrona() {
    try {
        let resultado = await minhaPromessa

        console.log(resultado); // Output: Operation was successful!
    } catch (error) {
        console.error(error);   // Output: Operation failed.
    } finally {
        console.log("This is always executed.");
    }
}

funcaoAssincrona();
```

### Sumário

- [`.reject()`](#promise-reject)

## <a id="promise-reject"></a>`.reject()`

É utilizado para **criar uma nova Promise que é imediatamente rejeitada com o motivo fornecido**. Ele é útil quando você **deseja retornar um erro ou uma situação indesejada de uma operação assíncrona**.

**Sintaxe Básica**

```JavaScript
Promise.reject(mensagemErro);
```

- `mensagemErro`**:** mensagem de erro

# <a id="process"></a>`process`

O objeto `process` em Node.js é um **objeto global que fornece informações e controle sobre o processo Node.js em execução**. Ele pode ser usado para interagir com o ambiente de execução, como acessar variáveis de ambiente, lidar com eventos do processo e controlar o ciclo de vida do processo.

### Sumário

- [`.exit()`](#process-exit)

## <a id="process-exit"></a>`.exit()`

É utilizado para **encerrar o processo Node.js em execução**. Você pode especificar um código de saída opcional que indica o motivo do encerramento do processo. O padrão é `0`, que geralmente indica uma saída bem-sucedida.

**Sintaxe Básica**

```JavaScript
process.exit([codigo]);
```

- `codigo`**:** um número inteiro que representa o código de saída do processo. Se não for especificado, o padrão é `0`

**Observações Importantes**

Eventos `exit` e `beforeExit`:

- O evento `exit` é emitido quando o processo está prestes a terminar
- O evento `beforeExit` é emitido quando o Node.js limpa o loop de eventos, mas ainda há trabalhos pendentes, permitindo a execução de código assíncrono adicional

+ `process.exit()` força o encerramento do processo sem aguardar a conclusão das operações pendentes, como callbacks ou timers assíncronos. Isso pode resultar em perda de dados ou operações incompletas