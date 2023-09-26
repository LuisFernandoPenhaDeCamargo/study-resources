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

`condicao ? (valorCasoACondicaoSejaVerdadeira) : (valorCasoACondicaoSejaFalsa)`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Exemplo mais complexo:

```JavaScript
row.accumulated_paid_at = isNaN(row.accumulated_paid_at) ? 0 : moment(row.accumulated_paid_at).format('YYYY-MM-DD HH:mm:ss') //Condição: isNaN(row.accumulated_paid_at)
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

# <a name = "funcoesglobais"></a>Funções globais.

- [`Array.isArray().`](#arrayisarray)

## <a id = "arrayisarray"></a>`Array.isArray()`

É usado para verificar se um valor passado como argumento é um array. Retorna `true` se o valor for um array e `false` caso contrário.

`Array.isArray(valor);`

`valor`: o valor que você deseja verificar se é um array.

# <a name = "funcoesdearray"></a>Funções de array.

- [`.map()`;](#map)
- [`.join()`;](#join)
- [`.reduce()`;](#reduce)
- [`.concat()`;](#concat)
- [`.includes()`.](#includes)

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

## <a id = "join"></a>`.join()`

É usada para criar uma **nova string juntando todos os elementos de um array em uma única string, separando-os por um delimitador específico** que você fornece como argumento.

`array.join(delimitador);`

- `array`: o array cujos elementos você deseja unir em uma única string;
- `delimitador` (opcional): o **caractere** ou **string** que será usado como separador entre os elementos no resultado. Este argumento é opcional; se não for fornecido, os elementos do array serão separados por vírgulas por padrão.

## <a id = "reduce"></a>`.reduce()`

É usada para reduzir (ou acumular) todos os elementos de um array em um único valor. Ele executa uma função de callback em cada elemento do array, acumulando um valor final à medida que percorre os elementos.

`array.reduce(callback(accumulator, currentValue, currentIndex, array), initialValue);`

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

`array.includes(valor, aPartirDe);`

- `array`: o array no qual você deseja realizar a pesquisa;
- `valor`: o valor que você deseja verificar se está presente no array;
- `aPartirDe` (opcional):  o índice a partir do qual você deseja iniciar a pesquisa. Se não for fornecido, a pesquisa começará do início do array.

Retorna `true` se o valor especificado estiver presente no array e `false` caso contrário.

# <a name = "funcoesdestring"></a>Funções de string.

- [`.forEach()`;](#foreach)
- [`.trim()`;](#trim)
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

## <a id = "trim"></a>`.trim()`

Remove espaços em branco (espaços, tabulações e quebras de linha) do início e do final da string. **Ele não afeta os espaçoes em branco dentro da string, apenas os espaços em branco externos**.

## <a id = "push"></a>`.push()`

`.push(<elemento1>, <elemento2>, ...)`

É usada para adicionar um ou mais elementos ao final de um array existente. Esses elementos podem ser valores individuais ou outros arrays, objetos, etc.

## <a id = "pop"></a>`.pop()`

É usada para remover o último elemento de um array. Ele modifica o array original, reduzindo o seu comprimento (`length`) em 1 e **retornando o elemento que foi removido**.