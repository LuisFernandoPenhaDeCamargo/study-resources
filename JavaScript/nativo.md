# Nativo do JavaScript.

# <a name = "objetoliteral"></a>Objeto literal.

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

Objetos literais são usados para representar dados estruturados em JavaScript e são uma parte essencial da linguagem quando se trata de manipulação de dados e estruturas de dados complexas. Eles também podem ser aninhados para criar estruturas de dados mais complexas, como objetos dentro de objetos.

---

Se você está considerando que o retorno de `.getPropertyOf()` é um objeto criado com `{}`, isso significa que o resultado de `.getPropertyOf()` é um objeto literal que serve como protótipo de outro objeto.\
O método `Object.getPropertyOf(objeto)` em JavaScript é usado para obter o protótipo (ou seja, o objeto de onde um objeto herda propriedades) de um objeto específico. Se o protótipo for um objeto criado com `{}` (um objeto literal), significa que o objeto não tem um protótipo personalizado definido e está herdando propriedades diretamente do **protótipo padrão**, que é o objeto `Object.prototype` em JavaScript. Por exemplo:

```JavaScript
const objeto = {};
const prototipo = Object.getPrototypeOf(objeto);

console.log(prototipo === Object.prototype); //true
```

Você pode adicionar propriedades ao protótipo padrão (`Object.prototype`), e essas propriedades serão herdadas por **todos os objetos que não tem um protótipo personalizado definido**. No entanto, é importante exercer cautela ao adicionar propriedades ao protótipo padrão, pois isso afetará todos os objetos em seu programa.

---

`console.log(Object.getPrototypeOf(Object.prototype));` não deveria retornar `{}`?\
A chamada `console.log(Object.getPrototypeOf(Object.prototype));` não retornará `{}` diretamente porque `Object.Prototype` é o protótipo raiz de todos os objetos em JavaScript, incluindo objetos literais criados com `{}`. No entanto, o protótipo de `Object.prototype` é `null`, e não um objeto vazio `{}`.

# <a name = "propriedadechavenomevalor"></a>Propriedade { chave: Nome { valor } }

Objetos em JavaScript são compostos por propriedades. Uma propriedade é uma combinação de chave e o seu valor.\
Quando encontramos o caso de, por exemplo, imprimir algo no console e aparecer o caso abaixo:

```JavaScript
{
  chave: Nome {}
}
```

Isso quer dizer que o valor associado a chave é um objeto que é uma instância da classe ou construtor chamado `Nome`.

Chaves que estão entre aspas simples indicam que o nome da chave é uma string literal, então você deve usar colchetes para acessá-la.

`objeto['chaveEntreAspasSimples']`

Observe que quando colchetes são utilizados, você não usa o ponto (`.`) para acessar a propriedade.

# <a name = "operadoresigualdade"></a>Operadores de igualdade.

- `===`**:** operador de igualdade estrita;\
Compara o **valor** e o **tipo do dado**.
- `==`**:** operador de igualdade.\
Compara o **valor** e **converte o tipo do dado**, se necessário.

# <a name = "operadoreslogicos"></a>Operadores lógicos.

`||`**: or** (**ou**).

# <a name = "operadorcondicionalternario"></a>Operador condicional ternário.

Também conhecida como **operação ternária**, é um operador em linguagens de programação que permite fazer uma escolha entre dois valores com base em uma condição. Ele é chamado de "ternário" porque envolve três partes: a condição, o valor que deve ser retornado se a condição for verdadeira e o valor que deve ser retornado se a condição for falsa. A sintaxe básica de uma operação ternária é:

`condicao ? (valorCasoACondicaoSejaVerdadeira) : (valorCasoACondicaoSejaFalsa);`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Exemplo mais complexo:

```JavaScript
row.accumulated_paid_at = isNaN(row.accumulated_paid_at) ? 0 : moment(row.accumulated_paid_at).format('YYYY-MM-DD HH:mm:ss'); //Condição: isNaN(row.accumulated_paid_at)
```

Lembrando ainda que não é possível declarar variáveis dentro de uma operação ternária diretamente, isso ocorre porque é necessário um escopo de bloco mais amplo do que o oferecido por uma operação ternária.

# <a name = "templateliterals"></a>Template literals.

Os **template literals** (**literais de modelo**) são uma característica introduzida no JavaScript com o ECMAScript 6 (ES6) que permite a criação de strings de uma forma mais flexível e legível. Eles são definidos usando crases (`) em vez de aspas simples ou duplas, e permitem a interpolação de variáveis e a criação de strings multilinhas. Exemplos:

```JavaScript
//Interpolação de variáveis.
const nome = "Alice";
const idade = 30;

const mensagem = `Olá, meu nome é ${nome} e eu tenho ${idade} anos.`;

console.log(mensagem); //Saída: Olá, meu nome é Alice e eu tenho 30 anos.
```

```JavaScript
//Strings multilinhas.
const paragrafo = `
  Este é um exemplo
  de uma string
  multilinhas.
`;

console.log(paragrafo);
/*
Saída:
  Este é um exemplo
  de uma string
  multilinhas.
*/
```

```JavaScript
//Expressões embutidas.
const valor1 = 10;
const valor2 = 20;

const resultado = `A soma de ${valor1} e ${valor2} é igual a ${valor1 + valor2}.`;

console.log(resultado); //Saída: A soma de 10 e 20 é igual a 30.
```

# <a name = "sequenciadeescape"></a>Sequência de escape.

`\n`**:** é uma sequência de escape usada em muitas linguagens de programação, para representar uma quebra de linha ou caractere de nova linha. Quando você insere `\n` em uma string, ele é interpretado como um comando para iniciar uma nova linha de texto.

# <a name = "spreadproperties"></a>Spread properties.

**Spread properties** (ou **propriedade de espalhamento**) é uma funcionalidade introduzida no ECMAScript 2018 (também conhecido como ES9) que permite copiar todas as propriedades enumeráveis de um objeto para outro objeto. Isso é útil para criar cópias de objetos, combinar objetos ou adicionar propriedades a objetos existentes de forma concisa. Exemplo:

```JavaScript
const objeto1 = { a: 1, b: 2 };
const objeto2 = { ...objeto1 };

console.log(objeto2); //Saída: { a: 1, b: 2 }
```

Você também pode usar o operador de espalhamento para combinar propriedades de objetos diferentes.

```JavaScript
const objeto1 = { a: 1, b: 2};
const objeto2 = { b: 3, c: 4};
const objeto3 = { ...objeto1, ...objeto2 };

console.log(objeto3); //Saída: { a: 1, b: 3, c: 4 }
```

Observe que, se houver propriedades com o mesmo nome em ambos os objetos, a última propriedade encontrada prevalecerá.\
Além disso, o operador de espalhamento também pode ser usado para adicionar propriedades a um objeto existente:

```JavaScript
const objeto1 = { a: 1, b: 2 };
const objeto2 = { ...objeto1, c: 3};

console.log(objeto2) //Saída: { a: 1, b: 2, c: 3}
```

# <a name = "flechaxexterna"></a>Sintaxe da função de flecha x Definição externa de uma função.

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

- **Palavra-chave** `function`**:** funções de flecha não usam a palavra-chave `function`. Em vez disso, elas são definidas usando `() => `;
- **Valor do** `this`**:** funções de flecha não possuem seu próprio valor `this`. Em vez disso, elas **capturam** o valor `this` do contexto que foram definidas.\
Isso pode ser útil em situações onde o valor de `this` é importante, como callbacks de eventos ou em métodos de objetos;
- **Não podem usar método construtor:** funções de flecha não podem ser usadas com a palavra-chave `new` para criar instâncias de objetos. Elas são projetadas para serem funções simples e curtas;
- **Não possuem propriedade** `arguments`**:** funções de flecha não possuem uma variável `arguments`. Se você precisar de uma lista de argumentos em uma função de flecha, pode usar a sintaxe de rest parameters (`(... args)`) para coletar os argumentos;
- **Não possuem a propriedade** `prototype`**:** funções de flecha não tem uma propriedade `prototype`, o que significa que não podem ser usadas como construtoras para criar objetos e métodos.

As funções de flecha são especialmente úteis para escrever código mais conciso e expressivo, principalmente em contextos assíncronos e de alto nível.

# <a name = "funcaodeseta"></a>Função de seta (arrow function).

### Retorno implícito x Retorno explícito.

O `return` é **implícito** em funções de seta de **corpo curto** quando **não há chaves** para definir um escopo e a função consiste em uma **única operação ou expressão**. Nesse caso, o resultado da expressão é implicitamente retornado com o valor de retorno da função. Exemplo:

```JavaScript
const somaImplicito = (a, b) => a + b; //O retorno é implícito.

const somaExplicito = (a, b) => {
  return a + b; //O retorno aqui precisa ser explícito. Pois as chaves criam um escopo de bloco dentro da função de seta.
};
```

# <a name = "callback"></a>Callback.

Uma Callback (ou função de retorno) é o conceito que se refere a uma **função** que é **passada como argumento para outra função** e é **executada após a conclusão** de um **de um evento específico**.
São uma parte fundamental da programação assíncrona em JavaScript e são amplamente utilizadas em situações em que você precisa controlar o fluxo de código após uma conclusão de uma operação demorada. [Exemplo.](#exemplocallback)

### Callback hell.

Callback hell é uma expressão usada na programação para descrever uma situação em que o código se torna difícil de ler e manter devido ao aninhamento excessivo de callbacks **assíncronos**. Essa situação ocorre comumente em linguagens de programação que usam callbacks para lidar com operações assíncronas, como JavaScript.\
Algumas das características típicas do callback hell:

- **Aninhamento profundo:** múltiplas funções de callback são aninhadas dentro de outras funções de callback, criando uma estrutura profundamente aninhada;
- **Código inclinação para a direita:** o código tende a se inclinar para a direita no editor de texto devido ao alinhamento de várias chamadas de função de callback;
- **Dificuldade de leitura e manutenção:** o código se torna díficil de ler ou entender devido à complexidade causada pelo aninhamento excessivo;
- **Gerenciamento de erros complexo:** lidar com erros em callbacks aninhados pode ser complicado, resultando em código propenso a erros;
- **Dificuldade de reutilização:** o código pode ser difícil de reutilizar ou modificar devido à sua estrutura complexa.

Aqui está um exemplo simplificado que ilustra o callback hell com chamadas de função assíncrona:

```JavaScript
asyncFunction1(arg1, function (result1) {
  asyncFunction2(result1, function (result2) {
    asyncFunction3(result2, function (result3) {
          //E assim por diante...
    });
  });
});
```

Para lidar com o callback hell, foram desenvolvidos vários padrões e técnicas, como promises, async/await e bibliotecas como a **async.js**. Essas abordagens tornam o código mais legível, mais organizado e mais fácil de manter, evitando o aninhamento excessivo de callbacks.

### Assíncrona x síncrona.

Nem toda função de callback é necessariamente assíncrona. O termo callback refere-se principalmente a uma função que é passada como argumento para outra função e é executada quando um evento específico ocorre. A natureza síncrona ou assíncrona da função de callback depende do contexto em que é usada e da implementação da função que a chama.\
Algumas distinções importantes:

Callbacks síncronas: em algunas casos, as callbacks podem ser síncronos, o que significa que são executados imediatamente dentro da mesma pilha de chamadas de função em que são registrados. Isso ocorre quando a função que chama o callback não realiza operações assíncronas, como E/S de arquivo, solicitações de rede, temporizadores, etc. Por exemplo:

```JavaScript
function sincrona(callback) {
  callback();
}
```

Neste caso, `callback()` é uma função de callback síncrona.

Callbacks assíncronas: as callbacks frequentemente são usadas em operações assíncronas, onde a função que chama a callback retorna imediatamente e a execução da callback ocorre em um momento posterior, geralmente quando a operação assíncrona é concluída. Isso é comum em situações como requisições de rede, leitura de arquivos ou uso de temporizadores. Por exemplo:

```JavaScript
function assincrona(callback) {
  setTimeout(callback, 1000);
}
```

Neste caso, `callback()` é uma função assíncrona, pois será executada após um atraso de 1 segundo.

Portanto, a chave para entender se uma callback é síncrona ou assíncrona é observar o contexto em que ela é usada e as operações realizadas pela função que a chama. Callbacks são uma técnica de programação poderosa usada em uma variedade de contextos, tanto síncronos quanto assíncronos.

# <a name = "string"></a>`String(parametro)`

- É um construtor que cria um novo objeto String a partir do valor passado como argumento, se não for uma string. Se você passar um valor não-string para `String()`, ele criará um novo objeto String com a representação da string desse valor;
- **Não altera o objeto original**, mas **retorna um novo objeto String** com a representação da string do valor.

# <a name = "tostring"></a>`.toString()`

- É um método disponível em objetos que são herdeiros da classe Object. Isso inclui tipos primitivos como números, booleanos e strings;
- Quando você chama `.toString()` em um objeto, ele **retorna uma representação string** desse objeto;
- `.toString()` **não cria um novo objeto**, mas sim gera uma representação de string do objeto original;
- Em muitos casos, `.toString()` é usado implicitamente quando você concatena um valor com uma string usando o operador `+`.

# <a name = "isnan"></a> `isNaN()`

É usada para determinar se o argumento **não é um número ("is Not A Number")**.

`isNaN(parametro)`

Retorna `true` ou `false`.\
Se o `parametro` for um número ou **puder ser convertido em um**, retornará `false`.\
Como ela tenta converter o `parametro`, esta função pode se comportar de forma inesperada, como quando o `parametro` não for númerico (especialmente quando se tratar de strings). Exemplo:

```JavaScript
console.log(isNaN(1));         //false (1 é um número).
console.log(isNaN("1"));       //false (a string "1" pode ser convertida em número).
console.log(isNaN("Hello"));   //true (a string "Hello" não pode ser convertida em número).
console.log(isNaN(undefined)); //true (não é um número).
console.log(isNaN(null));      //false (não é um número estritamente válido, mas é convertido em 0 durante a verificação).
```

Observando que `isNaN()` considera datas como valores númericos válidos em JavaScript. Isso pode ser um comportamento inesperado em alguns casos, já que datas não são números no sentido convencional. No entanto, JavaScript permite que datas sejam usadas em operações matemáticas e, portanto, elas são tratadas como números válidos pelo `isNaN()`.

# <a name = "parseint"></a>`parseInt()`

É uma função que converte uma string em um número inteiro. Ela analisa a string do ínicio ao fim até encontrar um caractere que não seja um dígito válido (0-9) ou, no caso de números com sinal, um sinal positivo (+) ou negativo (-). Em seguida, converte os caracteres analisados em um número inteiro e retorna esse valor.

`parseInt(string, radix)`

- `string`**:** a string que você deseja converter em um número inteiro;
- `radix` **(opcional):** a base numérica usada para interpretar a string. É um número inteiro entre 2 e 36. Se não for fornecido, a função assume que a base é 10.

Exemplo:

```JavaScript
const numeroString = "42";
const numeroInteiro = parseInt(numeroString);

console.log(numeroInteiro); //Resultado: 42.

const texto = "ABC";
const numeroInteiro = parseInt(texto);

console.log(numeroInteiro); //Resultado: NaN (não é um número).
```

Observando que se a string contiver uma parte que é um número válido no início, `parseInt()` irá extrair o número válido **até encontrar um caractere que não seja parte de um número, que não seja válido**. Exemplo:

```JavaScript
const texto = "12345texto67890";
const numeroInteiro = parseInt(texto);

console.log(numeroInteiro); //12345.
```

# <a name = "settimeout"></a>`setTimeout()`

Função que agenda a execução de uma [`callback`](#callback) após um período de tempo especificado em milissegundos (delay). <a id = "exemplocallback"></a>Exemplo:

```JavaScript
function fazerAlgoAsync(callback) {
  setTimeout(function () {
    console.log("A operação assíncrona está concluída.");
    callback(); //Chamando a função de callback após a conclusão da operação.
  }, 2000);     //Espera 2 segundos antes de executar (delay).
}

function minhaCallback() {
  console.log("A callback foi acionada.");
}

fazerAlgoAsync(minhaCallback);
```

`fazerAlgoAsync()` é uma função que recebe uma função callback como argumento.\
Dentro de `fazerAlgoAsync()` há uma operação assíncrona sendo simulada usando o `setTimeout()` , que espera 2 segundos antes de executar o que está no seu escopo.\
Após a conclusão da operação assíncrona, a função callback é chamada. Neste caso, `minhaCallBack()` é passada como função callback e ela será executada após a conclusão da operação.

### `clearTimeout()`

`clearTimeout(identificador)`

Função usada para cancelar um temporizador (timeout) configurado anteriormente com a função `setTimeout()`. Ela permite interromper a execução de uma função ou bloco de código que foi agendado para ser executado após um determinado período de tempo.\
`identificador` : é o identificador único retornado quando você configura o temporizador usando `setTimeout()`. Exemplo:

```JavaScript
const identificador = setTimeout(() => {
  console.log("Temporizador expirou."); //Esta função será executada após 3s.
  },
  3000);

  //Cancela o temporizador antes que ele expire (por exemplo, se necessário).
  clearTimeout(identificador);
```
[Exemplo mais complexo com o `setTimeout()`.](#settimeoutpromise)

# <a name = "promises"></a>Promises.

É um objeto JavaScript que representa a **eventual conclusão** ou **falha** de **uma operação assíncrona**. Ele é usado para lidar com operações assíncronas de maneira mais elegante e legível, tornando o código mais organizado e evitando o [**callback hell**](#callbackhell).

Uma promessa tem três estados possíveis:

- **Pendente (Pending):** o estado inicial, quando a Promise está esperando para ser cumprida ou rejeitada;
- **Cumprida (Fulfilled):** a operação assíncrona foi concluída com sucesso e a Promise foi cumprida, ou seja, a função `resolve()` foi chamada;
- **Rejeitada (Reject):** a operação assíncrona falhou e a Promise foi rejeitada, ou seja, a função `reject()` foi chamada.

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

[Exemplo mais complexo utilizando uma Promise.](#settimeoutpromise)

# <a name = "settimeoutpromise"></a>Exemplo envolvendo `setTimeout()` e Promise.

### Orion Games: orion-data-api

```JavaScript
module.exports = function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
```

- `return`**:** retorna o conteúdo;
- `new Promise()`**:** cria uma promessa;
- `resolve`**:** argumento de uma função anônima, como só estamos passando um argumento, se trata do parâmetro `resolve`, que representa a função de resolução de uma promessa;
- `=> setTimeout(resolve, ms)`**:** escopo da função anônima, nele, atrasamos a chamada da função de resolução da promessa.

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

Lembrando que `resolve()` (abre e fecha parênteses) resolve imediatamente a promessa.

```JavaScript
module.exports = function sleep(ms) {
  return (new Promise((resolve) => {
    setTimeout(resolve("Atribuindo um valor para o parâmetro da função de resolução."), ms);
  }))
}
```

Então mesmo a função de resolução sendo passada como argumento para a função de atraso, a promessa seria resolvida imediatamente de forma ininterrupta.

# <a name = "objetosglobais"></a>Objetos globais.

- [`.error()`;](#error)
- [`.assign()`;](#assign)
- [`.keys()`;](#keys)
- [`.definePropertyOf()`;](#definepropertyof)
- [`.getPropertyOf()`;](#getpropertyof)
- [`.stringify()`;](#stringify)
- [`.parse()`;](#parse)
- [`.exit()`;](#exit)
- [`.floor()`.](#floor)

## `console`

### <a id = "error"></a>`.error()`

Imprime uma mensagem de erro.

`.error(parametro, ...)`

`parametro`**:** argumento a ser exibido.

O JavaScript converte o argumento em uma string antes de exibi-lo.

## `Object`

Objeto global pré-definido (built-in object).

### <a id = "assign"></a>`.assign()`

É usada para copiar os valores de uma ou mais propriedades de objetos de origem (ou fonte) para um objeto de destino. Isso é frequentemente usado para criar um novo objeto que contém uma combinação de propriedades de vários outros objetos.

`.assign(destino, origem1, origem2, ...)`

- `destino`**:** é o objeto de destino onde as propriedades serão copiadas. Este objeto será modificado e retornado;
- `origem1, origem2, ...`**:** são os objetos de origem a partir dos quais as propriedades serão copiadas. Você pode passar múltiplos objetos de origem separados por vírgulas.

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

### <a id = "keys"></a>`.keys()`

`.keys(objeto)`

Usada para retornar um array com as chaves (nomes das propriedades) de um `objeto`.

### <a id = "definepropertyof"></a>`.definePropertyOf()`

Usada para definir uma nova propriedade diretamente em um objeto ou modificar uma propriedade existente com mais controle sobre suas características. Ela permite que você especifique várias opções para a propriedade, como se ela é enumerável, configurável ou gravável.

`.definePropertyOf(objeto, propriedade, descritor)`

- `objeto`**:** o objeto no qual você deseja definir ou modificar a propriedade;
- `propriedade`**:** o nome da propriedade que você deseja definir ou modificar;
- `descritor`**:** um objeto que descreve as características da propriedade. Este objeto pode ter várias propriedades, incluindo:
  - `value` **(opcional):** o valor da propriedade;
  - `writable`**:** um booleano que indica se a propriedade pode ser modificada com o operador de atribuição (por padrão, `false`);
  - `enumerable`**:** um booleano que indica se a propriedade pode ser percorrida em um loop `for...in` ou listada usando `Object.keys()` (por padrão, `false`);
  - `configurable`**:** um booleano que indica se a propriedade pode ser reconfigurada ou excluída (por padrão, `false`).

### <a id = "getpropertyof"></a>`.getPropertyOf()`

`.getPropertyOf(objeto)`

Utilizada para retornar o protótipo de um `objeto`.

## `JSON`

Usado para trabalhar com dados no formato JSON.

### <a id = "stringify"></a>`.stringify()`

Converte um objeto JavaScript em uma string JSON.

Observação importante: **serializar** um objeto significa converter esse objeto em uma representação de dados que possa ser armazenada ou transmitida de uma maneira que possa ser posteriormente desserializada e reconstruída em sua forma original. Geralmente, isso envolve transformar o objeto em uma sequência de caracteres ou bytes que possa ser facilmente armazenada em um arquivo, transmitida através de uma rede ou armazenada em um banco de dados.

`.stringify(objeto, replacer, espaços)`

- `objeto`**:** o objeto JavaScript que você deseja serializar em uma string JSON.
- `replacer` **(opcional):** uma função ou um array que permite personalizar a serialização, filtrando e transformando os valores antes de serem convertidos em JSON. Você pode passar uma função de substituição para personalizar a serialização, ou um array de strings e números que especifica as propriedades a serem incluídas na serialização;
- `espaços` **(opcional):** um argumento que controla o espaçamento (indentação) na string JSON resultante. Pode ser um número que indica o número de espaços para indentação ou uma string personalizada para a identação.

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

Neste exemplo, estamos usando o `replacer` para personalizar a serialização. Ele verifica se a chave é "idade" e, se for, retorna `undefined`, o que efetivamente **omite a propriedade** `idade` **da serialização**. O `espaco` é definido como `2`, o que significa que a string JSON resultante será formatada com um recuo de 2 espaços. Observando que:

- Quando `JSON.stringfy()` é chamado com o `replacer` como argumento, ele começa a serialização do objeto a partir do topo (o objeto raiz) e desce na hierarquia das propriedades;
- A função `replacer` é chamada para cada propriedade do objeto sendo serializado. Ela recebe dois argumentos: a `chave` da propriedade atual e o `valor` dessa propriedade;
- A função `replacer` pode retornar um novo valor para a propriedade atual. Se ela retornar `undefined`, a propriedade será omitida na saída final; caso contrário, o valor retornado será incluído na saída JSON.

### <a id = "parse"></a>`.parse()`

`.parse(JSON)`

Analisa uma string no formato JSON e a converte em um objeto JavaScript. A string precisa estar em um formato JSON válido. Exemplo:

```JavaScript
JSON.parse(content)[version]; //Estamos acessando a chave "version" do objeto retornado por JSON.parse(content)
```

## `process`

É um objeto global no **ambiente Node.js** que fornece informações e funcionalidades relacionadas ao processo em execução. Ele é uma parte fundamental do ambiente Node.js e pode ser usado para acessar várias informações e controlar o comportamento do processo Node.js.

Algumas das funcionalidades e informações mais comuns fornecidas pelo objeto `process` estão listadas no arquivo: [objeto global process.](process.md)

### <a id = "exit"></a>`.exit()`

Permite encerrar explicitamente o processo Node.js com um código de saída personalizado.

`.exit(code)`

`code`: número inteiro que representa o código de saída. Normalmente, um código de saída zero (`0`) indica que o processo foi concluído com sucesso, enquanto qualquer outro número indica um erro ou uma saída não bem-sucedida.

Os códigos de saída podem ser capturados pelo SO ou pela plataforma que invoca o aplicativo Node.js para identificar o estado de saída do aplicativo. Exemplo:

```Bash
node meu_app.js
echo $?
```

Se você estiver executando o aplicativo diretamente do terminal ou da linha de comando, o código de saída será retornado como um código de saída do processo. Com o código acima você pode verificar o código de saída após a execução da aplicação. Neste caso `$?` conterá o código de saída personalizado por `process.exit()`.

## `Math`

Fornece uma série de funções e constantes matemáticas que podem ser usadas para realizar operações matemáticas em números.

### <a id = "floor"></a>`.floor()`

Converte um número decimal em um número inteiro, selecionando somente a parte inteira.

`.floor(x)`**:** `x` é um number. Retorna um number.

# <a name = "funcoesglobais"></a>Funções globais.

- [`Array.isArray().`](#arrayisarray)

## <a id = "arrayisarray"></a>`Array.isArray()`

É usado para verificar se um valor passado como argumento é um array. Retorna `true` se o valor for um array e `false` caso contrário.

`Array.isArray(valor)`

`valor`: o valor que você deseja verificar se é um array.

# <a name = "funcoesdearray"></a>Funções de array.

- [`.forEach()`;](#foreach)
- [`.map()`;](#map)
- [`.filter()`;](#filter)
- [`.join()`;](#join)
- [`.reduce()`;](#reduce)
- [`.concat()`;](#concat)
- [`.includes()`;](#includes)
- [`.some()`;](#some)
- [`.push()`;](#push)
- [`.pop()`.](#pop)

## <a id = "foreach"></a>`.forEach()`

Itera sobre os elementos de um array e executa uma função de callback em cada um deles.

`.forEach(item => {})` ou `.forEach(callback(elemento, indice, array), thisArg)`

- `item`**:** nome da variável temporária que representa cada elemento do array;
- `{}`**:** função passada como argumento para o `.forEach()` que é executada uma vez para cada elemento do array.

+ `callback`**:** função de callback que será chamada para cada elemento do array. Ela recebe três argumentos: o `elemento` atual sendo processado, o `indice` desse elemento e o próprio `array`;
+ `thisArg` **(opcional):** um valor que será usado como `this` dentro da função de callback.

---

Função que permite iterar sobre todos os elementos do array e executar uma função de callback em cada um deles. É uma maneira conveniente de percorrer todos os elementos de um array sem a necessidade de um loop `for` tradicional. **A função altera o array original**.

Exemplo interessante usando `thisArg`:

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

## <a id = "map"></a>`.map()`

É usada para percorrer todos os elementos de um array e aplicar uma função em cada elemento, **gerando um novo array** com os resultados das chamadas de função. A função que você fornece como argumento para o `.map()` é chamada para cada elemento do array e permite que você transforme ou processe cada delemento individualmente.

```JavaScript
const novoArray = arrayOriginal.map(funcaoDeMapeamento(elemento, indice, arrayOriginal) => {
  //Código que processa o elemento e retorna um novo valor.
});
```

- `arraOriginal`: o array original que você deseja percorrer;
- `funcaoDeMapeamento()`: função chamada para cada elementos do array. Ela pode receber três argumentos:
  - `elemento`: elemento atual sendo processado;
  - `indice` (opcional): o índice do elemento atual;
  - `arrayOriginal` (opcional): o array original que está sendo percorrido.
- `novoArray`: o novo array gerado pelo `.map()`.

Exemplo interessante:

```JavaScript
const array = [{}, {}, {}];

const novoArray = array.map(indice => "?,?,?,?,?"); //Os três objetos literais vazios (cada um deles) foram substituídos pela string ?,?,?,?,? no novoArray.

console.log(array);     //[ {}, {}, {} ]
console.log(novoArray); //[ '?,?,?,?,?', '?,?,?,?,?', '?,?,?,?,?' ]
```

## <a id = "filter"></a>`.filter()`

É usado para **criar** um novo array contendo todos os elementos de um array original que atendem a um critério especificado por uma função de callback. Em outras palavras, ele filtra os elementos de um array com base em uma condição e retorna um novo array contendo apenas os elementos que atendem essa condição.

`.filter(callback(elemento, indice, array))`

- `callback()`**:** uma função de callback que define a condição da filtragem;
- `elemento`**:** o valor atual do elemento sendo avaliado;
- `indice` **(opcional):** o índice do elemento atual no array;
- `array` **(opcional):** o próprio array original.

Exemplo:

```JavaScript
const novoArray = arrayOriginal.filter(callback(elemento, indice, array)) {
  //Lógica de filtragem.
  //Retorne true para incluir o elemento no novo array, false para excluí-lo.
};
```

## <a id = "join"></a>`.join()`

Cria uma **nova string juntando todos os elementos de um array em uma única string, separando-os por um** `separador` **específico** que você fornece como argumento.

`array.join(delimitador)`

- `array`**:** array cujos elementos você deseja unir em uma única string;
- `separador` **(opcional):** o **caractere** ou **string** que será usado como separador entre os elementos no resultado. Este argumento é opcional; se não for fornecido, os elementos do array serão separados por vírgulas por padrão.

## <a id = "reduce"></a>`.reduce()`

É usada para reduzir (ou acumular) todos os elementos de um array em um único valor. Ele executa uma função de callback em cada elemento do array, acumulando um valor final à medida que percorre os elementos.

`array.reduce(callback(accumulator, currentValue, currentIndex, array), initialValue)`

- `array`**:** o array que você deseja reduzir;
- `callback`**:** uma função de callback que é chamada para cada elemento no array. Ela recebe quatro argumentos:
    - `accumulator`**:** o valor acumulado até o momento;
    - `currentValue`**:** o valor do elemento atual no array;
    - `currentIndex` **(opcional):** o índice do elemento atual;
    - `array` **(opcional):** o array original que está sendo percorrido.
- `initialValue` **(opcional):** um valor inicial para o acumulador. Se não for fornecido, o primeiro elemento do array será usado como valor inicial e a redução começará a partir do segundo elemento.

## <a id = "concat"></a>`.concat()`

É usada para concatenar dois ou mais arrays ou valores em um novo array, sem modificar os arrays originais. Ela retorna um novo array que contém os elementos dos arrays ou valores que foram concatenados.

`const novoArray = array1.concat(array2, valor1, valo2, ...)`

- `array1`**:** o primeiro array a ser concatenado;
- `array2`**,** `valor1`**,** `valor2`**:** outros arrays ou valores que você deseja concatenar ao `array1`.

## <a id = "includes"></a>`.includes()`

Verifica se um determinado valor está presente no array.

`array.includes(valor, aPartirDe)`

- `array`**:** o array no qual você deseja realizar a pesquisa;
- `valor`**:** o valor que você deseja verificar se está presente no array;
- `aPartirDe` **(opcional):**  o índice a partir do qual você deseja iniciar a pesquisa. Se não for fornecido, a pesquisa começará do início do array.

Retorna `true` ou `false`.

É usada principalmente para **valores simples** (números, strings, booleanos) e não é adequada para verificar a existência de objetos complexos ou verificar com base em propriedades específicas de objetos.

## <a id = "some"></a>`.some()`

Verifica se pelo menos um elemento do array satisfaz a condição especificada.

`array.some(callback[, thisArg])`

- `callback`**:** função chamada para cada elemento do array até que ela retorne `true`. Ela recebe até três argumentos:\
  -`elemento`**:** o valor do elemento atual do array;
  - `indice`**(opcional):** o índice do elemento atual no array;
  - `array`**(opcional):** array original no qual o método `.some()` foi chamado.
- `thisArg`**(opcional):** valor a ser usado como `this` ao chamar a função de `callback`.

Retorna `true` se pelo menos um elemento do array satisfazer a condição da função de `callback`. Caso contrário, retorna `false`.

## <a id = "push"></a>`.push()`

`.push(<elemento1>, <elemento2>, ...)`

É usada para adicionar um ou mais elementos ao final de um array existente. Esses elementos podem ser valores individuais ou outros arrays, objetos, etc.

## <a id = "pop"></a>`.pop()`

É usada para remover o último elemento de um array. Ele modifica o array original, reduzindo o seu comprimento (`length`) em 1 e **retornando o elemento que foi removido**.

# <a name = "funcoesdestring"></a>Funções de string.

- [`.trim()`;](#trim)
- [`.split()`.](#split)

## <a id = "trim"></a>`.trim()`

Remove espaços em branco (espaços, tabulações e quebras de linha) do início e do final da string. **Ele não afeta os espaçoes em branco dentro da string, apenas os espaços em branco externos**.

## <a id = "split"></a>`.split()`

É usado para dividir uma string em um array de substrings com base em um separador especificado.

`string.split(separador, limite)`

- `string`**:** a string original que você deseja dividir em substrings;
- `separador`**:** o separador que determina onde a string será dividida em substrings. Pode ser uma string ou uma expressão regular. Se você omitir o separador, a string inteira será considerada como uma única substring no array resultante;
- `limite` **(opcional):** um número inteiro que especifica o número máximo de divisões a serem feitas. As divisões além desse limite não serão incluídas no array resultante. Se você omitir o limite, todas as divisões possíveis serão feitas.

Exemplo usando um separador de espaõ em branco:

```JavaScript
const frase = "Isso é uma frase de exemplo.";
const palavras = frase.split(" ");

console.log(palavras); //["Isso", "é", "uma", "frase", "de", "exemplo."]
```

Neste exemplo, a string foi dividida em substrings sempre que um espaço em branco foi encontrado como separador.\
Exemplo usando um separador de vírgula:

```JavaScript
const lista = "maçã,banana,uva,morango";
const frutas = lista.split(",");

console.log(frutas); //["maçã", "banana", "uva", "morango"]
```

Neste exemplo, a string foi dividida em substrings sempre que uma vírgula foi encontrada como separador.