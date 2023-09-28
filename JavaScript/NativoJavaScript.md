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

# <a name = "operadoresigualdade"></a>Operadores de igualdade.

- `===` : operador de igualdade estrita;\
Compara o **valor** e o **tipo do dado**.
- `==` : operador de igualdade.\
Compara o **valor** e **converte o tipo do dado**, se necessário.

# <a name = "operadorcondicionalternario"></a>Operador condicional ternário.

Também conhecida como **operação ternária**, é um operador em linguagens de programação que permite fazer uma escolha entre dois valores com base em uma condição. Ele é chamado de "ternário" porque envolve três partes: a condição, o valor que deve ser retornado se a condição for verdadeira e o valor que deve ser retornado se a condição for falsa. A sintaxe básica de uma operação ternária é:

`condicao ? (valorCasoACondicaoSejaVerdadeira) : (valorCasoACondicaoSejaFalsa);`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Exemplo mais complexo:

```JavaScript
row.accumulated_paid_at = isNaN(row.accumulated_paid_at) ? 0 : moment(row.accumulated_paid_at).format('YYYY-MM-DD HH:mm:ss'); //Condição: isNaN(row.accumulated_paid_at)
```

Lembrando ainda que não é possível declarar variáveis dentro de uma operação ternária diretamente, isso ocorre porque é necessário um escopo de bloco mais amplo do que o oferecido por uma operação ternária.

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

Uma Callback (ou função de retorno) é o conceito que se refere a uma **função** que é **passada como argumento para outra função** e é **executada após a conclusão** de uma **operação assíncrona ou em reposta a um evento específico**.
São uma parte fundamental da programação assíncrona em JavaScript e são amplamente utilizadas em situações em que você precisa controlar o fluxo de código após uma conclusão de uma operação demorada. [Exemplo.](#exemplocallback)

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

# <a id = "settimeout"></a>`setTimeout()`

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

# <a name = "objetosglobais"></a>Objetos globais.

- [`.assign()`;](#assign)
- [`.keys()`;](#keys)
- [`.definePropertyOf()`;](#definepropertyof)
- [`.getPropertyOf()`;](#getpropertyof)
- [`.stringify()`;](#stringify)
- [`.parse()`.](#parse)

## `Object`

Objeto global pré-definido (built-in object).

### <a id = "assign"></a>`.assign()`

É usada para copiar os valores de uma ou mais propriedades de objetos de origem (ou fonte) para um objeto de destino. Isso é frequentemente usado para criar um novo objeto que contém uma combinação de propriedades de vários outros objetos.

`.assign(destino, origem1, origem2, ...)`

- `destino`: é o objeto de destino onde as propriedades serão copiadas. Este objeto será modificado e retornado;
- `origem1, origem2, ...`: são os objetos de origem a partir dos quais as propriedades serão copiadas. Você pode passar múltiplos objetos de origem separados por vírgulas.

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

- `objeto`: o objeto no qual você deseja definir ou modificar a propriedade;
- `propriedade`: o nome da propriedade que você deseja definir ou modificar;
- `descritor`: um objeto que descreve as características da propriedade. Este objeto pode ter várias propriedades, incluindo:
  - `value` (opcional): o valor da propriedade;
  - `writable`: um booleano que indica se a propriedade pode ser modificada com o operador de atribuição (por padrão, `false`);
  - `enumerable`: um booleano que indica se a propriedade pode ser percorrida em um loop `for...in` ou listada usando `Object.keys()` (por padrão, `false`);
  - `configurable`: um booleano que indica se a propriedade pode ser reconfigurada ou excluída (por padrão, `false`).

### <a id = "getpropertyof"></a>`.getPropertyOf()`

`.getPropertyOf(objeto)`

Utilizada para retornar o protótipo de um `objeto`.

## `JSON`

Usado para trabalhar com dados no formato JSON.

### <a id = "stringify"></a>`.stringify()`

Converte um objeto JavaScript em uma string JSON.

Observação importante: **serializar** um objeto significa converter esse objeto em uma representação de dados que possa ser armazenada ou transmitida de uma maneira que possa ser posteriormente desserializada e reconstruída em sua forma original. Geralmente, isso envolve transformar o objeto em uma sequência de caracteres ou bytes que possa ser facilmente armazenada em um arquivo, transmitida através de uma rede ou armazenada em um banco de dados.

`.stringify(objeto, replacer, espaços)`

- `objeto`: o objeto JavaScript que você deseja serializar em uma string JSON.
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
- [`.push()`;](#push)
- [`.pop()`.](#pop)

## <a id = "foreach"></a>`.forEach()`

Função que permite iterar sobre todos os elementos do array e executar uma função de callback em cada um deles. É uma maneira conveniente de percorrer todos os elementos de um array sem a necessidade de um loop `for` tradicional. **A função altera o array original**.

`.forEach(item => {})` ou `.forEach(callback(elemento, indice, array)>, thisArg)`

- `item`: nome da variável temporária que representa cada elemento do array;
- `{}`: função passada como argumento para o `.forEach()` que é executada uma vez para cada elemento do array.

+ `callback`: função de callback que será chamada para cada elemento do array. Ela recebe três argumentos: o `elemento` atual sendo processado, o `indice` desse elemento e o próprio `array`;
+ `thisArg` (opcional): um valor que será usado como `this` dentro da função de callback.

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

- `callback()`: uma função de callback que define a condição da filtragem;
- `elemento`: o valor atual do elemento sendo avaliado;
- `indice` (opcional): o índice do elemento atual no array;
- `array` (opcional): o próprio array original.

Exemplo:

```JavaScript
const novoArray = arrayOriginal.filter(callback(elemento, indice, array)) {
  //Lógica de filtragem.
  //Retorne true para incluir o elemento no novo array, false para excluí-lo.
};
```

## <a id = "join"></a>`.join()`

É usada para criar uma **nova string juntando todos os elementos de um array em uma única string, separando-os por um delimitador específico** que você fornece como argumento.

`array.join(delimitador)`

- `array`: o array cujos elementos você deseja unir em uma única string;
- `delimitador` (opcional): o **caractere** ou **string** que será usado como separador entre os elementos no resultado. Este argumento é opcional; se não for fornecido, os elementos do array serão separados por vírgulas por padrão.

## <a id = "reduce"></a>`.reduce()`

É usada para reduzir (ou acumular) todos os elementos de um array em um único valor. Ele executa uma função de callback em cada elemento do array, acumulando um valor final à medida que percorre os elementos.

`array.reduce(callback(accumulator, currentValue, currentIndex, array), initialValue)`

- `array`: o array que você deseja reduzir;
- `callback`: uma função de callback que é chamada para cada elemento no array. Ela recebe quatro argumentos:
    - `accumulator`: o valor acumulado até o momento;
    - `currentValue`: o valor do elemento atual no array;
    - `currentIndex` (opcional): o índice do elemento atual;
    - `array` (opcional): o array original que está sendo percorrido.
- `initialValue` (opcional): um valor inicial para o acumulador. Se não for fornecido, o primeiro elemento do array será usado como valor inicial e a redução começará a partir do segundo elemento.

## <a id = "concat"></a>`.concat()`

É usada para concatenar dois ou mais arrays ou valores em um novo array, sem modificar os arrays originais. Ela retorna um novo array que contém os elementos dos arrays ou valores que foram concatenados.

`const novoArray = array1.concat(array2, valor1, valo2, ...)`

- `array1`: o primeiro array a ser concatenado;
- `array2`, `valor1`, `valor2`: outros arrays ou valores que você deseja concatenar ao `array1`.

## <a id = "includes"></a>`.includes()`

É usada para verificar se um determinado valor está presente no array.

É usada principalmente para **valores simples** (números, strings, booleanos) e não é adequada para verificar a existência de objetos complexos ou verificar com base em propriedades específicas de objetos.

`array.includes(valor, aPartirDe)`

- `array`: o array no qual você deseja realizar a pesquisa;
- `valor`: o valor que você deseja verificar se está presente no array;
- `aPartirDe` (opcional):  o índice a partir do qual você deseja iniciar a pesquisa. Se não for fornecido, a pesquisa começará do início do array.

Retorna `true` se o valor especificado estiver presente no array e `false` caso contrário.

## <a id = "push"></a>`.push()`

`.push(<elemento1>, <elemento2>, ...)`

É usada para adicionar um ou mais elementos ao final de um array existente. Esses elementos podem ser valores individuais ou outros arrays, objetos, etc.

## <a id = "pop"></a>`.pop()`

É usada para remover o último elemento de um array. Ele modifica o array original, reduzindo o seu comprimento (`length`) em 1 e **retornando o elemento que foi removido**.

# <a name = "funcoesdestring"></a>Funções de string.

- [`.trim()`.](#trim)

## <a id = "trim"></a>`.trim()`

Remove espaços em branco (espaços, tabulações e quebras de linha) do início e do final da string. **Ele não afeta os espaçoes em branco dentro da string, apenas os espaços em branco externos**.