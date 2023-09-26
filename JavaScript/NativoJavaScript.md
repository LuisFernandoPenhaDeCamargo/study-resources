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

Se você está considerando que o retorno de `.getPropertyOf()` é um objeto criado com `{}`, isso significa que o resultado de `.getPropertyOf()` é um objeto literal que serve como protótipo de outro objeto.\
O método `Object.getPropertyOf(objeto)` em JavaScript é usado para obter o protótipo (ou seja, o objeto de onde um objeto herda propriedades) de um objeto específico. Se o protótipo for um objeto criado com `{}` (um objeto literal), significa que o objeto não tem um protótipo personalizado definido e está herdando propriedades diretamente do **protótipo padrão**, que é o objeto `Object.prototype` em JavaScript. Por exemplo:

```JavaScript
const objeto = {};
const prototipo = Object.getPrototypeOf(objeto);

console.log(prototipo === Object.prototype); //true
```

Você pode adicionar propriedades ao protótipo padrão (`Object.prototype`), e essas propriedades serão herdadas por **todos os objetos que não tem um protótipo personalizado definido**. No entanto, é importante exercer cautela ao adicionar propriedades ao protótipo padrão, pois isso afetará todos os objetos em seu programa.

`console.log(Object.getPrototypeOf(Object.prototype));` não deveria retornar `{}`?\
A chamada `console.log(Object.getPrototypeOf(Object.prototype));` não retornará `{}` diretamente porque `Object.Prototype` é o protótipo raiz de todos os objetos em JavaScript, incluindo objetos literais criados com `{}`. No entanto, o protótipo de `Object.prototype` é `null`, e não um objeto vazio `{}`.

# <a name = "funcaodeseta"></a>Função de seta (arrow function).

## Retorno implícito x Retorno explícito.

O `return` é **implícito** em funções de seta de **corpo curto** quando **não há chaves** para definir um escopo e a função consiste em uma **única operação ou expressão**. Nesse caso, o resultado da expressão é implicitamente retornado com o valor de retorno da função. Exemplo:

```JavaScript
const somaImplicito = (a, b) => a + b; //O retorno é implícito.

const somaExplicito = (a, b) => {
  return a + b; //O retorno aqui precisa ser explícito. Pois as chaves criam um escopo de bloco dentro da função de seta.
};
```

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