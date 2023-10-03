# JavaScript.

É uma **linguagem de programação** que é **síncrona** e **single-threaded**, o que significa que ela é executada em uma única thread de execução e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript pode lidar com operações **assíncronas** e **não bloqueantes** usando recursos como **callbacks**, **promises** e **async/await**.

**No linux, o Shebang é necessário para a impressão de logs no terminal de comando.**

# Objeto de objetos indexado por chaves.

Exemplo para entender como você pode acessar objetos de um objeto utilizando suas chaves.

```JavaScript
const objetoDeObjetos = {
  chave1: { nome: "Primeiro objeto." },
  chave2: { nome: "Segundo objeto." },
  chave1: { nome: "Terceiro objeto." }
};

console.log(objetoDeObjetos.chave1);    //Saída: { nome: 'Terceiro objeto.' }. O valor da chave foi sobreescrito quando você a utilizou novamente.
console.log(objetoDeObjetos.chave2);    //Saída: { nome: 'Segundo objeto.' }.
console.log(objetoDeObjetos['chave1']); //Saída: { nome: 'Terceiro objeto.' }. O objeto é indexado por chaves, então você pode acessar suas propriedades desta forma também.
```

# Cadeia de protótipos.

Também conhecida como também conhecida como **prototype chain**, é um conceito fundamental no JavaScript que descreve como **objetos JavaScript estão relacionados uns aos outros através de seus protótipos**. Essa cadeia é usada para permitir a **herança de propriedades e métodos** entre objetos em JavaScript.\
Pontos-chave sobre a cadeia de protótipos:

- **Protótipo (prototype):** em JavaScript, cada objeto tem uma referência a um outro objeto chamado "protótipo" (ou "prototype"). **O protótipo é um objeto que é usado como um modelo a partir do qual o objeto herda propriedades e métodos**. O protótipo é acessado através da propriedade `__proto__` (embora essa forma de acesso seja obsoleta e não recomendada) ou usando o método `Object.getPrototypeOf(objeto)`;
- **Herança: quando você tenta acessar uma propriedade ou método de um objeto e essa propriedade ou método não existe no objeto em si, o JavaScript procurará na cadeia de prótipos desse objeto para encontrar a propriedade ou método**. Isso permite a herança de propriedades e métodos de um objeto para outro;
- **Objetos nativos e protótipos:** objetos nativos do JavaScript, como `Array`, `String`, `Object`, entre outros, têm protótipos definidos que fornecem funcionalidades compartilhadas para todos os objetos desse tipo. Por exemplo, todos os objetos `Array` herdam métodos como `.push()`, `.pop()`, `forEach()`, etc, de seu protótipo `Array.prototype`;
- **Cadeia de protótipos:** a cadeia de protótipos é formada quando um objeto herda de outro objeto, que por sua vez herda de outro objeto, e assim por diante. Isso cria uma hierarquia de protótipos, e o JavaScript percorre essa hierarquia quando você faz referência a propriedades ou métodos em um objeto.

Exemplo simples que ilustra a cadeia de protótipos:

```JavaScript
const pessoa = {
  nome: "João",
  idade: 30
};

const estudante = Object.create(pessoa);
estudante.matricula = "12345";

console.log(estudante.nome);  //Herda "nome" de pessoa.
console.log(estudante.idade); //Herda "idade" de pessoa.
```

Neste exemplo, `estudante` é um objeto filho que herda propriedades de `pessoa` através da cadeia de protótipos. Portanto, ele pode acessar as propriedades `nome` e `idade` que não existem diretamente em `estudante`, mas estão disponíveis através da cadeia de protótipos.

# Propriedades enumeráveis.

Uma propriedade enumerável é uma propriedade de um objeto que pode ser percorrida ou listada usando estruturas de controle como `for...in` ou métodos como `Object.keys()`. As propriedades enumeráveis são aquelas que são consideradas "visíveis" durante iterações em objetos.\
Por padrão, as propriedades que você cria diretamente em um objeto são enumeráveis. No entanto, muitas propriedades internas dos objetos nativos do JavaScript não são enumeráveis.\
Você pode controlar a enumerabilidade de uma propriedade ao definir ou modificar uma propriedade em um objeto usando o método `Object.defineProperty()`. Este método permite que você especifique várias opções, incluindo se a propriedade deve ser enumerável ou não. Por exemplo:

```JavaScript
const objeto = {};

//Definindo uma propriedade enumerável.
Object.defineProperty(objeto, "propriedadeEnumeravel", {
  value: 42,
  enumerable: true //Esta propriedade é enumerável.
});

Object.defineProperty(objeto, "propriedadeNaoEnumeravel", {
  value: "Não enumerável.",
  enumerable: false //Esta propriedade não é enumerável.
});

for (const key in objeto) {
  console.log(key, objeto[key]);
}

console.log(Object.keys(objeto));             //[ 'propriedadeEnumeravel' ]
console.log(objeto.propriedadeNaoEnumeravel); //Não enumerável.
```

No exemplo acima, a propriedade `propriedadeEnumeravel` é definida como enumerável, enquanto a `propriedadeNaoEnumeravel` é definida como não enumerável. Quando você itera pelas propriedades do objeto usando um loop `for...in` ou obtém as chaves do objeto usando `Object.keys()`, apenas a `propriedadeEnumeravel` é visível, porque é a única propriedade enumerável. A `propriedadeNaoEnumeravel` não é listada.\
Por padrão, a maioria das propriedades que você cria em objetos é enumerável, mas é importante estar ciente da enumerabilidade ao trabalhar com objetos e definir propriedades personalizadas, especialmente quando você deseja controlar quais propriedades são visíveis durante iterações.

# `'use strict'`

A expressão `'use strict'` é uma diretiva de uso no JavaScript que faz com que o interpretador do JavaScript trate o código em um modo estrito, impondo regras adicionais e evitando comportamentos potencialmente problemáticos. Ela foi introduzida no **ECMAScript 5 (ES5)** como uma forma de melhorar a qualidade e a segurança do código JavaScript.\
Quando você inclui a diretiva `'use strict'` no início de um arquivo JavaScript ou no início de uma função, ela ativa o modo estrito para todo o código dentro desse escopo. Aqui estão algumas das principais características do modo estrito:

- **Evita a criação automática de variáveis globais:** em modo estrito, você não pode criar variáveis globais acidentalmente. Se você tentar atribuir um valor a uma variável que não foi declarada com `var`, `let` ou `const`, isso resultará em um erro;
- **Evita a reatribuição de variáveis somente leitura:** em modo estrito, você não pode reatribuir valores a variáveis que foram declaradas como constantes (com `const`). Isso ajuda a evitar erros de reatribuição acidental;
- **Restringe o uso do objeto** `this`**:** em modo estrito, o valor de `this` em funções anônimas e funções internas não é automaticamente ligado ao objeto global (como em não estrito). Isso ajuda a evitar erros sutis relacionados ao `this`;
- **Torna as eliminações de variáveis mais restritas:** em modo estrito, você não pode usar a palavra-chave `delete` em variáveis, funções ou funções de nível superior. Isso torna o código mais previsível;
- **Impede a utilização de palavras reservadas futuras:** o modo estrito proíbe o uso de identificadores que são palavras reservadas que podem ser introduzidas em futuras versões do ECMAScript;
- **Força parâmetros de função únicos:** em modo estrito, funções com parâmetros nomeados duplicados ou com nomes iguais a palavras-chaves geram erros;
- **Outras restrições:** existem outras restrições e alterações de comportamento em modo estrito que visam tornar o código mais seguro e mais fácil de otimizar.

# Nativo do JavaScript.

- [Objeto literal;](nativo.md#objetoliteral)
- [Operadores de igualdade;](nativo.md#operadoresigualdade)
- [Operador condicional ternário;](nativo.md#operadorcondicionalternario)
- [Template literals;](nativo.md#templateliterals)
- [Spread properties;](nativo.md#spreadproperties)
- [Sintaxe da função de flecha x Definição externa de uma função;](nativo.md#flechaxexterna)
- [Função de seta (arrow function);](nativo.md#funcaodeseta)
- [Callback;](nativo.md#callback)
- [`String()`;](nativo.md#string)
- [`.toString()`;](nativo.md#tostring)
- [`isNaN()`;](nativo.md#isnan)
- [`parseInt()`;](nativo.md#parseint)
- [`setTimeout()`;](nativo.md#settimeout)
- [Promises;](nativo.md#promises)
- [Objetos globais;](nativo.md#objetosglobais)
- [Funções globais;](nativo.md#funcoesglobais)
- [Funções de array;](nativo.md#funcoesdearray)
- [Funções de string.](nativo.md#funcoesdestring)

# Bibliotecas.

- [`sequelize`;](Sequelize.md)
- [`axios`;](bibliotecas.md#axios)
- [`umzug`;](bibliotecas.md#umzug)
- [`chai`;](bibliotecas.md#chai)
- [`request-promise-native`.](bibliotecas.md#requestpromisenative)

## Node.js

- [`path`;](bibliotecas.md#path)
- [`os`;](bibliotecas.md#os)
- [`fs`.](bibliotecas.md#fs)

# Frameworks.

- [Mocha;](#frameworks.md#mocha)
- [Vue.js;](frameworks.md#vuejs)
- [Next.js.](frameworks.md#nextjs)

## <a id = "axios"></a>axios

### <a id = "canceltoken"></a>`.CancelToken.source()`

Para que o axios saiba qual token de cancelamento está associado a uma requisição específica, você o passa na configuração da requisição usando a propriedade `cancelToken`. Portanto, `cancelToken: <objeto .CancelToken>.token` informa ao axios que esta requisição está vinculada ao `<objeto .CancelToken>.token` que você criou.\
Então quando você chama `<objeto .CancelToken>.cancel()`, o axios sabe que deve cancelar qualquer requisição que tenha o `<objeto .CancelToken>.token` associado a ela.

- `.CancelToken` : utilizado para criar um Token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()` : cria o objeto `.CancelToken` e seu respectivo método `.cancel(<mensagem sobre o cancelamento>)`
- `.cancel(<mensagem sobre o cancelamento>)` o parâmetro `<mensagem sobre o cancelamento>` que atribui o valor da chave `.reason.message`. É o **método utilizado para cancelar a requisição**.

Um objeto `.CancelToken` possui um atributo `.token`

O atributo `.token` é composto por uma `.promise` e uma `.reason`

A chave `.reason` possui um atributo `.message`

[Exemplo.](axios_cancel_token.js)

## <a id = "util"></a>util

Fornece várias funções utilitárias para ajudar na programação assíncrona e em outros aspectos de desenvolvimento.

### `.promisify(<callback>)`

É usada para converter funções de retorno de chamada (callback) em funções que retornam promessas.

## <a id = "fs"></a>fs

**File System** (**Sistema de Arquivos**). Fornece métodos para interagir com o sistema de arquivos do computador, permitindo que você leia, escreva, manipule e gerencie arquivos e diretórios.
O **"Sync"** no nome das funções, indica que essas funções são **síncronas**.

`<pwd>` (string): caminho para o arquivo/diretório.

### `.readdirSync(<__dirname, pwd>)`

Usado para ler o conteúdo de um diretório, ou seja, lista os arquivos e subdiretórios.

**__dirname** é uma variável global no Node.js que representa o diretório atual.

Retorna uma matriz.

### `readFileSync(<pwd>, <opcional, especifica a codificação do arquivo>)`

Lê o conteúdo de um arquivo.

Retorna o conteúdo do arquivo em formato de buffer ou em uma condição específica, se especificada.

### `statSync(<pwd>)`

Usado para obter informações sobre um arquivo/diretório especificado.

Retorna um objeto da classe **fs** com propriedades como `.mtime` , que é a data de modificação (timestamp) do arquivo/diretório.

## <a id = "childprocess"></a>child_process

É usado para criar e gerenciar processos filhos (subprocessos) a partir de um aplicativo Node.js

### `.exec(<comando>, <opções>, <callback>)`

- `<comando>` (string): representa o comando a ser executado;
- `<opções>` (objeto, opcional): pode conter várias opções para controlar o comportamento da execução do comando;
- `<callback>` (opcional): função de retorno de chamada que será chamada quando a execução do comando for concluída.\
  `(<erro>, <stdout>, <stderr>) => {}`
  - `<erro>` (string): variável que conterá informações sobre qualquer erro que ocorrer durante a execução do comando;
  - `<stdout>` (string): variável que conterá a saída padrão (**stdout**) do comando executado;
  - `<stderr>` (string): variável que conterá a saída de erro (**stderr**) do comando executado.

É usada para executar comandos do sistema operacional em um subprocesso. Ela é uma forma de criar processos filhos para executar comandos shell ou outros programas externos.