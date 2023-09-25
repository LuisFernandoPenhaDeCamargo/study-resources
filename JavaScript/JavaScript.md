# JavaScript.

# Nativo do JavaScript.

- [Função de seta (arrow function);](NativoJavaScript.md#funcaodeseta)
- [Funções globais;](#NativoJavaScript.md#funcoesglobais)
- [Funções de array.](NativoJavaScript.md#funcoesdearray)

# Bibliotecas.

- [Sequelize.](Sequelize.md#sequelize)

É uma **linguagem de programação** que é **síncrona** e **single-threaded**, o que significa que ela é executada em uma única thread de execução e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript pode lidar com operações **assíncronas** e **não bloqueantes** usando recursos como **callbacks**, **promises** e **async/await**.

A **cadeia de protótipos**, também conhecida como **prototype chain**, é um conceito fundamental no JavaScript que descreve como objetos JavaScript estão relacionados uns aos outros através de seus protótipos. Essa cadeia é usada para permitir a herança de propriedades e métodos entre objetos em JavaScript. Pontos-chave sobre a cadeia de protótipos:

- Protótipo (prototype): em JavaScript, cada objeto tem uma referência a um outro objeto chamado "protótipo" (ou "prototype"). **O protótipo é um objeto que é usado como um modelo a partir do qual o objeto herda propriedades e métodos**. O protótipo é acessado através da propriedade `__proto__` (embora essa forma de acesso seja obsoleta e não recomendada) ou usando o método `Object.getPrototypeOf(<objeto>)`;
- Herança: **quando você tenta acessar uma propriedade ou método de um objeto e essa propriedade ou método não existe no objeto em si, o JavaScript procurará na cadeia de prótipos desse objeto para encontrar a propriedade ou método**. Isso permite a herança de propriedades e métodos de um objeto para outro;
- Objetos nativos e protótipos: objetos nativos do JavaScript, como `Array`, `String`, `Object`, entre outros, têm protótipos definidos que fornecem funcionalidades compartilhadas para todos os objetos desse tipo. Por exemplo, todos os objetos `Array` herdam métodos como `.push()`, `.pop()`, `forEach()`, etc, de seu protótipo `Array.prototype`;
- Cadeia de protótipos: a cadeia de protótipos é formada quando um objeto herda de outro objeto, que por sua vez herda de outro objeto, e assim por diante. Isso cria uma hierarquia de protótipos, e o JavaScript percorre essa hierarquia quando você faz referência a propriedades ou métodos em um objeto. Exemplo simples que ilustra a cadeia de protótipos:

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

Propriedade enumerável é uma propriedade de um objeto que pode ser percorrida ou listada usando estruturas de controle como `for...in` ou métodos como `Object.keys()`. As propriedades enumeráveis são aquelas que são consideradas "visíveis" durante iterações em objetos.\
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

console.log(Object.keys(objeto)); //["propriedadeEnumeravel"]
```

No exemplo acima, a propriedade `propriedadeEnumeravel` é definida com o enumerável, enquanto a `propriedadeNaoEnumeravel` é definida como não enumerável. Quando você itera pelas propriedades do objeto usando um loop `for...in` ou obtém as chaves do objeto usando `Object.keys()`, apenas a `propriedadeEnumeravel` é visível, porque é a única propriedade enumerável. A `propriedadeNaoEnumeravel` não é listada.\
Por padrão, a maioria das propriedades que você cria em objetos é enumerável, mas é importante estar ciente da enumerabilidade ao trabalhar com objetos e definir propriedades personalizadas, especialmente quando você deseja controlar quais propriedades são visíveis durante iterações.

**No linux, o Shebang é necessário para a impressão de logs no terminal de comando.**

- [Nativo do JavaScript;](#nativojavascript)
- [Bibliotecas;](#bibliotecas)
- [Frameworks.](#frameworks)

# <a id = "nativojavascript"></a>Nativo do JavaScript.

- [Objeto literal;](#objetoliteral)
- [Operadores de igualdade;](#operadoresigualdade)
- [Operador condicional ternário;](#operadorcondicionalternario)
- [Template Literals (Template Strings);](#templateliterals) <--
- [Spread properties;](#spreadproperties) <--
- [Sintaxe da função de flecha x Definição externa de uma função;](#flechaxexterna)
- [Callback;](#callback)
- [`String(<parâmetro>)`](#string)
- [`.toString()`](#tostring)
- [Funções de string;](#funcoesstring)
- [Funções de array;](#funcoesarray)
- [`isNaN(<parâmetro>)`](#isnan)
- [Objetos globais;](#objetosglobais)
- [`setTimeout(<callback>, <delay>)`](#settimeout)
- [Promise.](#promise)

### <a id = "objetoliteral"></a>Objeto literal.

Um objeto criado com `{}` (chave vazias) em JavaScript é um objeto literal, e ele é estrutura de dados fundamental na linguagem. **Esse objeto é uma coleção não ordenada de pares chave-valor**, onde as **chaves** (também chamadas de **propriedades**) são **strings** (ou símbolos em versões mais recentes do JavaScript) que atuam como **identificadores** exclusivos para acessar os valores associados. Exemplo simples de um objeto criado usando `{}`:

```JavaScript
const pessoa = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
};

console.log(pessoa.nome);   //Acessando a propriedade "nome".
console.log(pessoa.idade);  //Acessando a propriedade "idade".
console.log(pessoa.cidade); //Acessando a propriedade "cidade".
```

Neste exemplo, `pessoa` é um objeto literal que possui três propriedades: "nome", "idade" e "cidade". Cada propriedade tem um **valor** associado.\
Você pode adicionar, modificar e excluir propriedades de um objeto literal conforme necessário durante a execução do seu programa. Por exemplo:

```JavaScript
pessoa.profissao = "Engenheiro"; //Adicionando uma nova propriedade.
pessoa.idade = 31;               //Modificando o valor de uma propriedade existente.
delete pessoa.cidade;            //Excluindo uma propriedade.
```

Objetos literais são usados ára representar dados estruturados em JavaScript e são uma parte essencial da linguagem quando se trata de manipulação de dados e estruturas de dados complexas. Eles também podem ser aninhados para criar estruturas de dados mais complexas, como objetos dentro de objetos.

Se você está considerando que o retorno de `.getPropertyOf()` é um objeto criado com `{}`, isso significa que o resultado de `.getPropertyOf()` é um objeto literal que serve como protótipo de outro objeto.\
O método `Object.getPropertyOf(<object>)` em JavaScript é usado para obter o protótipo (ou seja, o objeto de onde um objeto herda propriedades) de um objeto específico. Se o protótipo for um objeto criado com `{}` (um objeto literal), significa que o objeto não tem um protótipo personalizado definido e está herdando propriedades diretamente do **prtótipo padrão**, que é o objeto `Object.prototype` em JavaScript. Por exemplo:

```JavaScript
const objeto = {};
const prototipo = Object.getPrototypeOf(objeto);

console.log(prototipo === Object.prototype); //true
```

Você pode adicionar propriedades ao protótipo padrão (`Object.prototype`), e essas propriedades serão herdadas por **todos os objetos que não tem um protótipo personalizado definido**. No entanto, é importante exercer cautela ao adicionar propriedades ao protótipo padrão, pois isso afetará todos os objetos em seu programa.

`console.log(Object.getPrototypeOf(Object.prototype));` não deveria retornar `{}`?\
A chamada `console.log(Object.getPrototypeOf(Object.prototype));` não retornará `{}` diretamente porque `Object.Prototype` é o protótipo raiz de todos os objetos em JavaScript, incluindo objetos literais criados com `{}`. No entanto, o protótipo de `Object.prototype` é `null`, e não um objeto vazido `{}`.

### <a id = "operadoresigualdade"></a>Operadores de igualdade.

- `===` : operador de igualdade estrita;\
Compara o **valor** e o **tipo do dado**.
- `==` : operador de igualdade.\
Compara o **valor** e **converte o tipo do dado**, se necessário.

### <a id = "operadorcondicionalternario"></a>Operador condicional ternário.

Também conhecida como **operação ternária**, é um operador em linguagens de programação que permite fazer uma escolha entre dois valores com base em uma condição. Ele é chamado de "ternário" porque envolve três partes: a condição, o valor que deeve ser retornado se a condição for verdadeira e o valor que deve ser retornado se a condição for falsa. A sintaxe básica de uma operação ternária é:

`<condição> ? (<valor caso a condição seja verdadeira>) : (<valor caso a condição seja falsa>)`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Exemplo mais complexo:

```JavaScript
row.accumulated_paid_at = isNaN(row.accumulated_paid_at) ? 0 : moment(row.accumulated_paid_at).format('YYYY-MM-DD HH:mm:ss') //Condição: isNaN(row.accumulated_paid_at)
```

Lembrando ainda que não é possível declarar variáveis dentro de uma operação ternária diretamente, isso ocorre porque é necessário um escopo de bloco mais amplo do que o oferecido por uma operação ternária.

### <a id = "templateliterals"></a>Template Literals.

### <a id = "spreadproperties"></a>Spread Properties.

O operador de propagação (`...`) é usado para copiar todas as propriedades enumeráveis de um objeto para outro objeto literal ou objeto existente.

### <a id = "flechaxexterna"></a>Sintaxe da função de flecha x Definição externa de uma função.

```JavaScript
function minhaFuncao() {
  //Corpo da função.
}
```

```JavaScript
const minhaFuncao = () => {
  //Corpo da função de flecha.
};
```

- Palavra-chave `function`: funções de flecha não usam a palavra-chave `function`. Em vez disso, elas são definidas usando `() => `;
- Valor do `this`: funções de flecha não possuem seu próprio valor `this`. Em vez disso, elas **capturam** o valor `this` do contexto que foram definidas.\
Isso pode ser útil em situações onde o valor de `this` é importante, como callbacks de eventos ou em métodos de objetos;
- Não podem usar método construtor: funções de flecha não podem ser usadas com a palavra-chave `new` para criar instâncias de objetos. Elas são projetadas para serem funções simples e curtas;
- Não possuem propriedade `arguments`: funções de flecha não possuem uma variável `arguments`. Se você precisar de uma lista de argumentos em uma função de flecha, pode usar a sintaxe de rest parameters (`(... args)`) para coletar os argumentos;
- Não possuem a propriedade `prototype`: funções de flecha não tem uma propriedade `prototype`, o que significa que não podem ser usadas como construtoras para criar objetos e métodos.

As funções de flecha são especialmente úteis para escrever código mais conciso e expressivo, principalmente em contextos assíncronos e de alto nível.

## <a id = "callback"></a>Callback.

Uma Callback (ou função de retorno) é o conceito que se refere a uma **função** que é **passada como argumento para outra função** e é **executada após a conclusão** de uma **operação assíncrona ou em reposta a um evento específico**.
São uma parte fundamental da programação assíncrona em JavaScript e são amplamente utilizadas em situações em que você precisa controlar o fluxo de código após uma conclusão de uma operação demorada. [Exemplo.](#exemplocallback)

### Callback helll. <--

### <a id = "string"></a>`String(<parâmetro>)`

- É um construtor que cria um novo objeto String a partir do valor passado como argumento, se não for uma string. Se você passar um valor não-string para `String()`, ele criará um novo objeto String com a representação da string desse valor;
- **Não altera o objeto original**, mas **retorna um novo objeto String** com a representação da string do valor.

### <a id = "tostring"></a>`.toString()`

- É um método disponível em objetos que são herdeiros da classe Object. Isso inclui tipos primitivos como números, booleanos e strings;
- Quando você chama `.toString()` em um objeto, ele **retorna uma representação string** desse objeto;
- `.toString()` **não cria um novo objeto**, mas sim gera uma representação de string do objeto original;
- Em muitos casos, `.toString()` é usado implicitamente quando você concatena um valor com uma string usando o operador `+`.

## <a id = "funcoesstring"></a>Funções de string.

- [`.trim()`;](#trim)

### <a id = "trim"></a>`.trim()`

Remove espaços em branco (espaços, tabulações e quebras de linha) do início e do final da string. **Ele não afeta os espaçoes em branco dentro da string, apenas os espaçoes em branco externos**.

## <a id = "funcoesarray"></a>Funções de array.

### `.push(<elemento1>, <elemento2>, ...)`

É usada para adicionar um ou mais elementos ao final de um array existente. Esses elementos podem ser valores individuais ou outros arrays, objetos, etc.

### `.pop()`

É usada para remover o último elemento de um array. Ele modifica o array original, reduzindo o seu comprimento (`length`) em 1 e **retornando o elemento que foi removido**.

### `.forEach(<item => {}>)` ou `.forEach(<callback(<elemento>, <índice>, <array>)>, <thisArg>)`

Função que permite iterar sobre todos os elementos do array e executar uma função de callback em cada um deles. É uma maneira conveniente de percorrer todos os elementos de um array sem a necessidade de um loop `for` tradicional. **A função altera o array original**.

- `item`: nome da variável temporária que representa cada elemento do array;
- `{}`: função passada como argumento para o `.forEach()` que é executada uma vez para cada elemento do array.

+ `<callback>`: função de callback que será chamada para cada elemento do array. Ela recebe três argumentos: o `elemento atual sendo processado`, o `índice` desse elemento e o próprio `array`;
+ `<thisArg>` (opcional): um valor que será usado como `this` dentro da função de callback.

Exemplo interessante usando `<thisArg>`:

```JavaScript
const pessoa = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
};
const frutas = ["maça", "banana", "laranja"];

//Definindo uma função de callback que usa "this".
function exibirDetalhes(fruta) {
  console.log(`${this.nome} gosta de ${fruta}`);
}

//Usando "thisArg" para definir o valor de "this" dentro da função de callback. Sem o this, exibirDetalhes não reconheceria a propriedade nome de pessoa.
frutas.forEach(exibirDetalhes, pessoa);
```

### `.filter(<callback(<elemento>, <índice>, <array>)>)`

É usado para **criar** um novo array contendo todos os elementos de um array original que atendem a um critério especificado por uma função de callback. Em outras palavras, ele filtra os elementos de um array com base em uma condição e retorna um novo array contendo apenas os elementos que atendem essa condição.

- `callback()`: uma função de callback que define a condição da filtragem;
- `<elemento>`: o valor atual do elemento sendo avaliado;
- `<índice>` (opcional): o índice do elemento atual no array;
- `<array>` (opcional): o próprio array original.

Exemplo:

```JavaScript
const novoArray = arrayOriginal.filter(callback(elemento, índice, array)) {
  //Lógica de filtragem.
  //Retorne true para incluir o elemento no novo array, false para excluí-lo.
}
```

### <a id = "isnan"></a> `isNaN(<parâmetro>)`

É usada para determinar se o `<parâmetro>` **não é um número ("is Not A Number")**.

Retorna `true` ou `false`.

Se o `<parâmetro>` for um número ou **puder ser convertido em um**, retornará `false` .
Como ela tenta converter o `<parâmetro>`, esta função pode se comportar de forma inesperada, quando o `<parâmetro>` não for númerico (especialmente quando se tratar de strings). Exemplo:

```JavaScript
console.log(isNaN(1));       //false (1 é um número).
console.log(isNaN("1"));     //false (a string "1" pode ser convertida em número).
console.log(isNaN("Hello")); //true (a string "Hello" não pode ser convertida em número).
console.log(isNaN(undefined)); //true (não é um número).
console.log(isNaN(null)); //false (não é um número estritamente válido, mas é convertido em 0 durante a verificação).
```

Observando que `.isNaN()` considera datas como valores númericos válidos em JavaScript. Isso pode ser um comportamento inesperado em alguns casos, á que datas não são números no sentido convencional. No entanto, JavaScript permite que datas sejam usadas em operações matemáticas e, portanto, elas são tratadas como números válidos pelo `isNaN()`.

## <a id = "objetosglobais"></a>Objetos globais.

### `Object`

Objeto global pré-definido (built-in object).

### `.assign(<destino>, <origem1>, <origem2>, ...);`

É usada para copiar os valores de uma ou mais propriedades de objetos de origem (ou fonte) para um objeto de destino. Isso é frequentemente usado para criar um novo objeto que contém uma combinação de propriedades de vários outros objetos.

- `<destino>`: é o objeto de destino onde as propriedades serão copiadas. Este objeto será modificado e retornado;
- `<origem1>, <origem2>, ...`: são os objetos de origem a partir dos quais as propriedades serão copiadas. Você pode passar múltiplos objetos de origem separados por vírgulas.

O `.assign()` copiará as propriedades de cada objeto de origem para o objeto de destino. Se houver conflitos de propriedades (ou seja, se o objeto de origem e o objeto de destino tiverem uma propriedade com o mesmo nome), o valor da propriedade no objeto de origem substituirá o valor correspondente no objeto de destino. Exemplo:

```JavaScript
const destino = {};
const origem1 = {a: 1, b: 2};
const origem2 = {b: 3, c: 4};

Object.assign(destino, origem1, origem2);

console.log(destino); // { a: 1, b: 3, c: 4 }
```

Neste exemplo, as propriedades de `origem1` e `origem2` são copiadas para `destino`, e o valor da propriedade `b` do `origem2` substitui o valor da propriedade `b` do `origem1` no objeto de destino.\
Lembre-se de que o `Object.assign()` funciona apenas para copiar as propriedades enumeráveis e próprias (**não as herdadas**) dos objetos de origem. Além disso, ele retorna o objeto de destino após a cópia das propriedades.

### `.keys(<objeto>)`

Usado para retornar um array com as chaves (nomes das propriedades) de um `<objeto>`.

### `.getPropertyOf(<objeto>)`

Utilizado para retornar o protótipo de um `<objeto>`.

### `.definePropertyOf(<objeto>, <propriedade>, <descritor>)`

Usada para definir uma nova propriedade diretamente em um objeto ou modificar uma propriedade existente com mais controle sobre suas características. Ela permite que você especifique várias opções para a propriedade, como se ela é enumerável, configurável ou gravável.

- `<objeto>`: o objeto no qual você deseja definir ou modificar a propriedade;
- `<propriedade>`: o nome da propriedade que você deseja definir ou modificar;
- `<descritor>`: um objeto que descreve as características da propriedade. Este objeto pode ter várias propriedades, incluindo:
  - `<value>`: o valor da propriedade (opcional);
  - `<writable>`: um booleano que indica se a propriedade pode ser modificada com o operador de atribuição (por padrão, `false`);
  - `<enumerable>`: um booleano que indica se a propriedade pode ser percorrida em um loop `for...in` ou listada usando `Object.keys()` (por padrão, `false`);
  - `<configurable>`: um booleano que indica se a propriedade pode ser reconfigurada ou excluída (por padrão, `false`).

### `JSON`

É usado para trabalhar com dados no formato JSON.

### `.stringify(<objeto, replacer, espaços>)`

Converte um objeto JavaScript em uma string JSON.

Observação importante: **serializar** um objeto significa converter esse objeto em uma representação de dados que possa ser armazenada ou transmitida de uma maneira que possa ser posteriormente desserializada e reconstruída em sua forma original. Geralmente, isso envolve transformar o objeto em uma sequência de caracteres ou bytes que possa ser facilmente armazenada em um arquivo, transmitida através de uma rede ou armazenada em um banco de dados.

- `<objeto>`: o objeto JavaScript que você deseja serializar em uma string JSON.
  - `replacer` (opcional): uma função ou um array que permite personalizar a serialização, filtrando e transformando os valores antes de serem convertidos em JSON. Você pode passar uma função de substituição para personalizar a serialização, ou um array de strings e números que especifica as propriedades a serem incluídas na serialização;
  - `espaços` (opcional): um argumento que controla o espaçamento (indentação) na string JSON resultante. Pode ser um número que indica o número de espaços para indentação ou uma string personalizada para a identação.

Exemplo:

```JavaScript
const objeto = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
};

//replacer é uma função que personaliza a serialização.
const replacer = (chave, valor) => {
  //Vamos omitir a propriedade "idade" na serialização.
  if (chave === "idade") {
    return undefined;
  }

  return valor;
}

//O espaço define a quantidade de espaços de indentação na string JSON.
const espaco = 2;
const jsonString = JSON.stringfy(objeto, replacer, espaco);

console.log(jsonString);

/*A saída será algo como:
{
  "nome": "João",
  "cidade": "São Paulo"
}
*/
```

Neste exemplo, estamos usando o `replacer` para personalizar a serialização. Ele verifica se a chave é "idade" e, se for, retorna `undefined`, o que efetivamente **omite a propriedade `idade` da serialização**. O `espaco` é definido como `2`, o que significa que a string JSON resultante será formatada com um recuo de 2 espaços. Observando que:

- Quando `JSON.stringfy()` é chamado com o `replacer` como argumento, ele começa a serialização do objeto a partir do topo (o objeto raiz) e desce na hierarquia das propriedades,
- A função `replacer` é chamada para cada propriedade do objeto sendo serializado. Elas recebe dois argumentos: a chave da propriedade atual o valor dessa propriedade;
- A função `replacer` pode retornar um novo valor para a propriedade atual. Se ela retornar `undefined`, a propriedade será omitida da saída final; caso contrário, o valor retornado será incluído na saída JSON.

### `.parse(<JSON>)`

Analisa uma string no formato JSON e a converte em um objeto JavaScript. A string precisa estar em um formato JSON válido. Exemplo:

```JavaScript
JSON.parse(content)[version] //Estamos acessando a chave "version" do objeto retornado por JSON.parse(content)
```

## <a id = "settimeout"></a>`setTimeout(<callback>, <delay>)`

Função que agenda a execução de uma [`<callback>`](#callback) após um período de tempo especificado em milissegundos (`<delay>`). <a id = "exemplocallback"></a>[Exemplo:](fazer_algo_async.js)

```JavaScript
function fazerAlgoAsync(callback) {
  setTimeout(function () {
    console.log("A operação assíncrona está concluída.");
    callback(); //Chamando a função de callback após a conclusão da operação.
  }, 2000);     //Espera 2 segundos antes de executar.
}

function minhaCallback() {
  console.log("A callback foi acionada.");
}

fazerAlgoAsync(minhaCallback);
```
`fazerAlgoAsync()` é uma função que recebe uma função callback como argumento.\
Dentro de `fazerAlgoAsync()` há uma operação assíncrona sendo simulada usando o `setTimeout()` , que espera 2 segundos antes de executar o que está no seu escopo.\
Após a conclusão da operação assíncrona, a função callback é chamada. Neste caso, `minhaCallBack()` é passada como função callback, e ela será executada após a conclusão da operação.

### `clearTimeout(<identificador>)`

Função usada para cancelar um temporizador (timeout) configurado anteriormente com a função `setTimeout()` . Ela permite interromper a execução de uma função ou bloco de código que foi agendado para ser executado após um determinado período de tempo.\
`<identificador>` : é o identificador único retornado quando você configurou o temporizador usando `setTimeout()`. Exemplo:

```JavaScript
const identificador = setTimeout(() => {
  console.log("Temporizador expirou."); //Esta função será executada após 3s.
  },
  3000);

  //Cancela o temporizador antes que ele expire (por exemplo, se necessário).
  clearTimeout(identificador);
```
[Exemplo mais complexo com `setTimeout()`.](#settimeoutpromise)

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
- [sequelize.](Sequelize.md)

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