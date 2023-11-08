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

```JavaScript
const objeto = {
  chaveLiteral: "Valor literal.",
  "chaveStringLiteral": "Valor da chave que é uma string literal."
}
  
//Acesso usando a notação de ponto para chaves literais.
console.log(objeto.chaveLiteral);          //Saída: Valor literal.
  
//Acesso usando a notação de colchetes para chaves literais.
console.log(objeto["chaveLiteral"]);       //Saída: Valor literal.
  
//Acesso usando a notação de colchetes para chaves que são strings literais.
console.log(objeto["chaveStringLiteral"]); //Saída: Valor da chave que é uma string literal.
```

Neste exemplo, você pode ver que a notação de ponto só funciona para chaves literais, enquanto a **notação de colchetes** pode ser usada para acessar **todas as chaves**, independente de serem strings literais ou não. Isso é especialmente útil quando você está lidando com chaves que contêm caracteres especiais, espaços ou quando as chaves são **determinadas dinamicamente em tempo de execução**.
Observe que quando colchetes são utilizados, você não usa o ponto (`.`) para acessar o valor da chave.

# <a name = "operadores"></a> Operadores.

- [Operadores de igualdade;](#operadoresigualdade)
- [Operadores lógicos;](#operadorlogicoou)
- [Operador condicional ternário;](#operadorcondicionalternario)
- [Operador de exclusão.](#operadorexclusao)

## <a id = "operadoresigualdade"></a>Operadores de igualdade.

- `===`**:** operador de **igualdade estrita**;\
Compara o **valor** e o **tipo do dado**.
- `==`**:** operador de **igualdade solta**.\
Compara o **valor** e **converte o tipo do dado**, se necessário.

## <a id = "operadorlogicoou"></a>Operador lógico "ou".

O operador `||` é usado para criar expressões lógicas condicionais. Ele retorna o primeiro valor verdadeiro encontrado em uma sequência de operandos. **Se todos os operandos forem falsos, ele retorna o último valor**. Exemplo:

```JavaScript
const valor1 = false;
const valor2 = 0;
const valor3 = null;

let resultado = valor1 || valor2 || valor3;

console.log(resultado); //Saída: null

resultado = valor1 || valor3 || valor2;

console.log(resultado); //Saída: 0

resultado = valor3 || valor2 || valor1;

console.log(resultado); //Saída: false
```

## <a id = "operadorcondicionalternario"></a>Operador condicional ternário.

Também conhecido como **operador ternário**, ajuda na realização de uma **operação ternária**, é um operador em linguagens de programação que permite fazer uma escolha entre dois valores com base em uma condição e é frequentemente usado para criar expressões condicionais concisas. Ele é chamado de "ternário" porque envolve três partes: a condição, o valor que deve ser retornado se a condição for verdadeira e o valor que deve ser retornado se a condição for falsa. A sintaxe básica de uma operação ternária é:

`condicao ? (valorCasoACondicaoSejaVerdadeira) : (valorCasoACondicaoSejaFalsa);`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Exemplo mais complexo:

```JavaScript
row.accumulated_paid_at = isNaN(row.accumulated_paid_at) ? 0 : moment(row.accumulated_paid_at).format('YYYY-MM-DD HH:mm:ss'); //Condição: isNaN(row.accumulated_paid_at)
```

Lembrando ainda que não é possível declarar variáveis dentro de uma operação ternária diretamente, isso ocorre porque é necessário um escopo de bloco mais amplo do que o oferecido por uma operação ternária.

## <a id = "operadorexclusao"> Operador de exclusão.

A palavra-chave `delete` é um operador de exclusão e é usado para remover uma propriedade de um objeto.\
O `delete` pode ser usado para excluir qualquer tipo de propriedade de um objeto, incluindo propriedades de objeto, propriedades de matriz (índices) e até funções. No entanto, existem algumas limitações:

- **Objetos padrão (built-in):** você não pode usar o `delete` para excluir propriedades de objetos internos (built-in), como `Object`, `Array`, `Function`, etc. Ele funciona apenas em objetos criados pelo usuário;
- **Variáveis globais:** o `delete` não pode ser usado para excluir variáveis globais ou propriedades globais declaradas com `var`. Ele só funciona em propriedades de objetos;
- **Não tem retorno:** o `delete` não retorna um valor específico. Se a propriedade for excluída com sucesso, retorna `true`. Se a propriedade não puder ser excluída (por exemplo, propriedades configuradas como não configuráveis), retorna `false`. No entato, se você tentar usar o `delete` em uma variável ou propriedade que não existe, ele simplesmente não gera um erro e retorna `true`.

Exemplos:

```JavaScript
const objeto = {
  chave1: "valor1",
  chave2: "valor2"
};

delete objeto.chave1; //Exclui com sucesso a propriedade com chave "chave1".

console.log(objeto.chave1); //Saída: undefined

const globalVar = "globalVar";
delete globalVar; //Isso não funcionará e não gerará erro.

console.log(globalVar); //"globalVar" ainda existe.

const array = [1, 2, 3];
delete array[0]; //Exclui com sucesso o elemento de índice 0 do array.

console.log(array);         //Saída: [ <1 empty item>, 2, 3]
```

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
- [`.exit()`;](#exit)
- [`.floor()`.](#floor)

## `console`

### <a id = "error"></a>`.error()`

Imprime uma mensagem de erro.

`.error(parametro, ...)`

`parametro`**:** argumento a ser exibido.

O JavaScript converte o argumento em uma string antes de exibi-lo.

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

## Node.js.

`__dirname` é uma variável global no Node.js que representa o diretório atual.

# <a name = "funcoesdearray"></a>Funções de array.

- [`.reduce()`;](#reduce)
- [`.concat()`;](#concat)
- [`.includes()`;](#includes)
- [`.some()`;](#some)

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

## <a id = "some"></a>`.some()`

Verifica se pelo menos um elemento do array satisfaz a condição especificada.

`array.some(callback[, thisArg])`

- `callback`**:** função chamada para cada elemento do array até que ela retorne `true`. Ela recebe até três argumentos:\
  -`elemento`**:** o valor do elemento atual do array;
  - `indice`**(opcional):** o índice do elemento atual no array;
  - `array`**(opcional):** array original no qual o método `.some()` foi chamado.
- `thisArg`**(opcional):** valor a ser usado como `this` ao chamar a função de `callback`.

Retorna `true` se pelo menos um elemento do array satisfazer a condição da função de `callback`. Caso contrário, retorna `false`.

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

# <a name = "importexport"></a>Import/Export.

As palavras-chave `import` e `export` são usadas em JavaScript para lidar com a modularização de código, permitindo que você divida seu código em módulos reutilizáveis.

### Exportação (`export`).

A palavra-chave `export` é usada para exportar funções, variáveis, classes ou qualquer código que você deseja disponibilizar para outros módulos ou arquivos.

**Exportação de valor nomeado (Named Exports):**

```JavaScript
//Em um módulo chamado "module.js".
export const nome = "João";
export function saudacao() {
  return "Olá!";
}
```

**Exportação padrão (Default Export):**

- Um módulo pode ter apenas uma exportação padrão;
- Ao importar uma exportação padrão em outro módulo, você pode dar qualquer nome à variável de importação.


```JavaScript
//Em um módulo chamado "module.js".
const nome = "Maria";

export default nome;
```

### Importação (`import`).

A palavra-chave `import` é usada para importar funções, variáveis, classes ou código de outros módulos.

**Importação de valor nomeado (Named Imports):**

- Um módulo pode ter várias exportações nomeadas;
- Ao importar exportações nomeadas em outro módulo, você deve usar o mesmo nome das exportações originais.

```JavaScript
import { nome, saudacao } from "./module.js";

console.log(nome);       //Saída: João
console.log(saudacao()); //Saída: Olá!
```

**Importação padrão (Default Import):**

```JavaScript
import nome from "./module.js";

console.log(nome); //Saída: Maria

//Outra forma de realizar a importação padrão.
import qualquerNome from "./module.js";

console.log(qualquerNome); //Saída: Maria
```

**Importação de tudo (Import All):**\
A exportação padrão não é incluída na importação de tudo pelo seu nome. Se você tiver uma exportação padrão com um nome específico, ele não estará disponível como uma propriedade do objeto importado.

```JavaScript
import * as modulo from "./module.js";

console.log(modulo.nome);       //Saída: João
console.log(modulo.saudacao()); //Saída: Olá!
```

É importante observar que as importações e exportações são específicas do ambiente de módulos ES6 (ECMAScript 2015). Antes disso era utilizada a seguinte sintaxe:

```JavaScript
//Em um módulo chamado "module.js".
const nome = "João";
function saudacao() {
  return "Olá!";
}

module.exports = {
  nome,
  saudacao
};
```

```JavaScript
const nomeQueVoceQuerDarAoObjeto = require("./module.js");

console.log(nomeQueVoceQuerDarAoObjeto.nome);       //Saída: João
console.log(nomeQueVoceQuerDarAoObjeto.saudacao()); //Saída: Olá!
```