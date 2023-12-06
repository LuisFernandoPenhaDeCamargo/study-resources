# Métodos de Arrays

### Sumário

- [`.includes()`](#includes)
- [`.indexOf()`](#indexof);
- [`.isArray()`](#isarray);
- [`.find()`](#find);
- [`.filter()`](#filter);
- [`.slice()`](#slice).


# Método de Busca

## <a id = "includes">`.includes()`

O método `.includes()` verifica se um array contém um determinado elemento e retorna `true` se o elemento estiver presente, e `false` caso contrário.

`array.includes(element, startIndex);`

- `element` **(value):** o valor que você deseja verificar se está presente no array;
- `startIndex` **(int, opcional):**  o índice no array a partir do qual a busca deve começar.

```JavaScript
const array = [1, 2, 3, 4, 5];

console.log(array.includes(3)); // Saída: true
console.log(array.includes(6)); // Saída: false
```

É usada principalmente para **valores simples** (números, strings, booleanos) e **não é adequada para verificar a existência de objetos complexos ou verificar com base em propriedades específicas de objetos**.

## <a id = "indexof"></a>`.indexOf()`

O método `.indexOf()` retorna o índice da primeira ocorrência de um elemento em um array. Se o elemento não estiver presente, retorna -1.

`array.indexOf(searchElement[, fromIndex]);`

- `searchElement`**:** o elemento a ser procurado no array;
- `fromIndex` **(opcional):** o índice a partir do qual iniciar a busca. Se não for fornecido, a busca começa do início do array.

Retorna o índice da primeira ocorrência do elemento ou -1 se o elemento não for encontrado.

```JavaScript
const array = [1, 2, 3, 4, 5];
const indice = array.indexOf(3);

console.log(indice); // Saída: 2 (o índice da primeira ocorrência de 3 no array).
```

# Métodos de Verificação de Tipo

Métodos que ajudam a identificar o tipo de dado.

## <a id = "isarray"></a>`isArray()`

Verifica se o valor passado como argumento é um array.

`Array.isArray(valor);`

`valor`**:** valor que você deseja verificar se é um array.

Retorna um booleano. `true` se o valor for um array e `false` se não for.

```JavaScript
const array = [1, 2, 3];
const naoEhArray = "Isso não é um array.";

console.log(Array.isArray(array));      // Saída: true
console.log(Array.isArray(naoEhArray)); // Saída: false
```

# Métodos de Iteração

Métodos que percorrem os elementos do array.

## <a id = "find"></a>`.find()`

O método `.find()` retorna o primeiro elemento em um array que satisfaça uma condição fornecida por uma função de callback. Ele percorre cada elemento do array e retorna o primeiro elemento para o qual a função de callback retorna `true`, ou `undefined` se nenhum elemento satisfazer a condição.

`array.find(callback(element, index, array), thisArg);`

- `callback` **(function):** função que é chamada para cada elemento do array. Ela recebe três argumentos:
    - `element`**:** o elemento atual;
    - `index`**:** o índice do elemento atual;
    - `array`**:** o array original.
- `thisArg` **(opcional):** valor para usar como `this` quando executar a função de callback.

Retorna o primeiro elemento do array que satisfaz a condição especificada pela função de callback; caso contrário, `undefined` se nenhum elemento satisfizer a condição.

```JavaScript
const numbers = [1, 2, 3, 4, 5];

// Encontrar o primeiro número mais que 3.
const foundNumber = numbers.find(num => num > 3);

console.log(foundNumber); // Saída: 4
```

# Métodos de Iteração e Transformação

Métodos que iteram sobre cada elemento do array, resultando em um novo array transformado.

## <a id = "filter"></a>`.filter()`

Cria um novo array com todos os elementos que passam no teste implementado pela função fornecida. Em outras palavras, ele filtra os elementos de um array com base em uma condição e retorna um novo array contendo apenas os elementos que atendem essa condição.

`const newArray = array.filter(callback(element[, index[, array]])[, thisArg]);`

- `callback` **(function):** função é um predicado, para testar cada elemento do array. Deve retornar `true` para manter o elemento, `false` caso contrário. Aceita três argumentos:
    - `element`**:** o elemento atual sendo processado no array;
    - `index` **(opcional):** o índice do elemento atual sendo processado no array;
    - `array` **(opcional):** o array ao qual a função `.filter()` foi chamada.
- `thisArg` **(opcional):** um valor para ser usado como `this` ao executar a função de `callback`.

Retorna um novo array contendo os elementos que passam no teste implementado pela função de `callback`.

```JavaScript
const numbers = [1, 2, 3, 4, 5];
const evenNumbers = numbers.filter(function (number) {
    retunr number % 2 === 0;
});

console.log(evenNumbers); // Saída: [2,4]
```

Este exemplo usa `.filter()` para criar um novo array contendo apenas os números pares do array original.\
Devemos nos lembrar também que em JavaScript, valores numéricos são considerados `true` quando diferentes de zero (`0`) em contextos booleanos. Portanto, se você usar um valor numérico como retorno em uma função de filtro, ele será considerado `true` se for diferente de zero e `false` se for zero.\
Por exemplo:

```JavaScript
const array = [0, 1, 2, 3, 4];

// Retorna um novo array contendo apenas os elementos considerados verdadeiros (diferentes de zero).
const newArray = array.filter(element => element);

console.log(newArray); // Saída: [1, 2, 3, 4]
```

Neste exemplo, a função de filtro `element => element` retorna `true` para todos os elementos diferentes de zero e `false` para o elemento zero. Portanto o novo array contém apenas os elementos `[1, 2, 3, 4]`.
Caso interessante:

```JavaScript
!!(promises.filter(i => i).length)
```

Considerando que `promises` é um array de valores booleanos e a função filter **retorna um array contendo apenas os elementos que atendem a condição da callback**.\
Vamos considerar também que `promises` possui 3 de comprimento. Se ele for `[ false, false, false ]`, `.filter(i => i)` **retornará um array vazio, pois nenhum elemento atende a condição da callback** e `[].length` é `0`, então `!0` é `true`, logo a negativa dupla "`!!`" vai fazer com que a saída seja `false`.\
Se `promises` possuir uma posição igual a `true` ou mais, `.filter(i => i)` **retornará um array composto por todos os elementos iguais a** `true`**, pois a callback verifica que o elemento é igual a** `true`**, o que satisfaz a sua condição** e seu `.length` será diferente de `0`, então qualquer número maior que zero antecedido por `!` é `false`, logo a negativa dupla vai fazer com que a saída seja `true`.\
**Então essa linha verifica se o array possui pelo menos uma posição com o valor** `true`**.**

# <a id = "slice"></a>`.slice()`

Como `.slice()` é um método tanto de arrays quanto de strings, nós o pontuamos em [um lugar só](metodos-strings.md#slice).