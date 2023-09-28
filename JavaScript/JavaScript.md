# JavaScript.

É uma **linguagem de programação** que é **síncrona** e **single-threaded**, o que significa que ela é executada em uma única thread de execução e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript pode lidar com operações **assíncronas** e **não bloqueantes** usando recursos como **callbacks**, **promises** e **async/await**.

**No linux, o Shebang é necessário para a impressão de logs no terminal de comando.**

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

# Nativo do JavaScript.

- [Objeto literal;](nativo.md#objetoliteral)
- [Operadores de igualdade;](nativo.md#operadoresigualdade)
- [Operador condicional ternário;](nativo.md#operadorcondicionalternario)
- [Sintaxe da função de flecha x Definição externa de uma função;](nativo.md#flechaxexterna)
- [Função de seta (arrow function);](nativo.md#funcaodeseta)
- [Callback;](nativo.md#callback)
- [`String()`;](nativo.md#string)
- [`.toString()`;](nativo.md#tostring)
- [`isNaN()`;](nativo.md#isnan)
- [`setTimeout()`;](nativo.md#settimeout)
- [Objetos globais;](nativo.md#objetosglobais)
- [Funções globais;](nativo.md#funcoesglobais)
- [Funções de array;](nativo.md#funcoesdearray)
- [Funções de string.](nativo.md#funcoesdestring)

# Bibliotecas.

- [`umzug`;](bibliotecas.md#umzug)
- [`request-promise-native`.](bibliotecas.md#requestpromisenative)

## Node.js

- [`path`;](bibliotecas.md#path)
- [`os`.](bibliotecas.md#os)

# Frameworks.

- [Vue.js;](frameworks.md#vuejs)
- [Next.js.](frameworks.md#nextjs)

---

- [Sequelize.](Sequelize.md#sequelize)

+ Callback hell;
+ Template literals;
+ Spread properties;
+ `.import()`;
+  `console.error()`.

---

# <a id = "nativojavascript"></a>Nativo do JavaScript.

- [Promise.](#promise)

### <a id = "promise"></a>Promise.

É um objeto JavaScript que representa a **eventual conclusão** ou **falha** de **uma operação assíncrona**. Ele é usado para lidar com operações assíncronas de maneira mais elegante e legível, tornando o código mais organizado e evitando o **callback hell**.

Uma promessa tem três estados possíveis:

- Pendente (Pending): o estado inicial, quando a Promise está esperando para ser cumprida ou rejeitada;
- Cumprida (Fulfilled): a operação assíncrona foi concluída com sucesso e a Promise foi cumprida, ou seja, a função `resolve()` foi chamada;
- Rejeitada (Reject): a operação assíncrona falhou e a Promise foi rejeitada, ou seja, a função `reject()` foi chamada.

```JavaScript
const minhaPromise = new Promise((resolve, reject) => {
  //Corpo da promessa.

  /*Código assíncrono a ser executado, como uma chamada API, leitura de arquivo, etc.*/

  /*Se a operação for bem-sucedida, chame "resolve" com o valor resultante.
  resolve(valorResultado);*/

  /*Se ocorrer um erro, chame "reject" com o motivo da rejeição (erro).
  reject(motivoErro);*/
});
```

- `resolve` é o parâmetro que representa a função de resolução.\
Retorna um valor;
- `reject` é o parâmetro que representa a função de rejeição.\
Retorna um motivo (geralmente uma mensagem de erro).

Para lidar com o resultado da Promise, você pode utilizar os métodos `.then()` e `.catch()`, ou usar a sintaxe do **async/await** para operações assíncronas mais legíveis.

Exemplo utilizando `.then()` e `.catch()`:

```JavaScript
minhaPromise
  .then((resultado) => {
    console.log("Operação bem-sucedida. Resultado:", resultado);
  })
  .catch((erro) => {
    console.log("Erro na operação:", erro);
  });
```

Exemplo utilizando async/await:


```JavaScript
async function executarOperacao() {
  try{
    const resultado = await minhaPromise;
    console.log("Operação bem-sucedida. Resultado:", resultado);
  }catch(erro){
    console.error("Erro na operação:", erro);
  }
}

executarOperacao();
```

A utilização de Promises ajuda a tornar o código mais legível e facilita o tratamento de erros em operações assíncronas, melhorando a experiência de desenvolvimento em JavaScript.

[Exemplo mais complexo com uma Promise.](#settimeoutpromise)

### <a id = "settimeoutpromise"></a>Exemplo envolvendo `setTimeout()` e Promise.

### Orion Games: orion-data-api

```JavaScript
module.exports = function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
```

- `return`: retorna o conteúdo;
- `new Promise()`: cria uma promessa;
- `resolve`: argumento de uma função anônima, como só estamos passando um argumento, se trata do parâmetro `resolve`, que representa a função de resolução de uma promessa;
- `=> setTimeout(resolve, ms)`: escopo da função anônima, nele, atrasamos a chamada da função de resolução da promessa.

Código equivalente ao de cima, mas utilizando de mecanismos para facilitar a sua compreensão.

```JavaScript
module.exports = function sleep(ms) {
  return (new Promise((resolve) => {
    setTimeout(resolve, ms);
  }))
}
```

O ponto chave deste módulo é que estamos **promissificando** o tempo de pausa do `setTimeout()`.

Para podermos repassar um argumento para a função de resolução é necessária a criação da promessa com uma variável que represente o parâmetro `resolve`.

```JavaScript
module.exports = function sleep(ms) {
  return (new Promise((resolve) => {
    setTimeout(() => {
      resolve("Atribuindo um valor para o parâmetro da função de resolução.")
    }, ms);
  }))
}
```

Lembrando que `resolve()` (abre e fecha parênteses) resolve imediatamente a promessa. Então

```JavaScript
module.exports = function sleep(ms) {
  return (new Promise((resolve) => {
    setTimeout(resolve("Atribuindo um valor para o parâmetro da função de resolução."), ms);
  }))
}
```

mesmo a função de resolução sendo passada como argumento para a função de atraso, a promessa seria resolvida imediatamente de forma ininterrupta.

# <a id = "bibliotecas"></a>Bibliotecas.

### JavaScript

- [axios;](#axios)

### Node.js

- [util;](#util)
- [fs;](#fs)
- [child_process.](#childprocess)

## <a id = "axios"></a>axios

Utilizada para fazer requisições HTTP, seja em navegadores ou em Node.js.

- `<url>` (string): URL de destino, para onde a solicitação será enviada;
- `<corpo da solicitação>` (objeto): corpo da solicitação que está sendo enviada;
- `<configurações>` (objeto, opcional): objeto de configuração opcional que permite personalizar a solicitação. Este objeto pode conter várias opções de configuração, como cabeçalhos personalizados, autenticação, parâmetros de consulta, entre outros.\
  Como por exemplo a chave: valor `cancelToken: <objeto .CancelToken>.token`, que é o token de cancelamento.

### Métodos.
- `.post(<url>, <corpo da solicitação>)`
- `.patch(<url>, <corpo da solicitação>, <configurações>)` : atualização parcial;
- [`.interceptors`](#interceptors)
- [`.CancelToken.source()`](#canceltoken)

### <a id = "interceptors"></a> `.interceptors`

Ao configurar um interceptador global, este será aplicado a todas as solicitações feitas por todas as partes do código que utilizam a mesma instância global do axios (no caso de um interceptador de requisição) ou será aplicado antes de retonar cada resposta ao código (interceptador de resposta).\
Lembrando que ele é **aplicado**, ou seja, ele é **executado** antes de cada requisição ou após cada resposta.

- `.request` : interceptador de solicitação (requisição). Isto permite que você execute código antes que cada solicitação seja enviada. Após realizarmos esta "configuração", todas as solicitações posteriores obedeceram esta configuração;
- `.response` : interceptador de resposta;
- `.use()` : registra o interceptador.

```JavaScript
//Response.

axios.interceptors.response.use(response => response, error => {
  return Promise.reject(error);
});
```

`response =: response`: o interceptador de resposta simplesmente passará a reposta sem fazer alterações. Isso é comum quando você deseja aénas fazer algum trabalho adicional com a resposta, como registro, mas não deseja modificar a resposta em si.

`return Promise.reject(error);`: a promessa com erro é rejeitada. Isso significa que o erro será **propagado** para qualquer código que chamou a solicitação axios original e que lidará com ele lá.

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