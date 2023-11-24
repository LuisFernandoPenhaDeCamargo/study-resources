# Sumário

- [`.isInteger()`](#isinteger);
- [`.isNaN()`](#isnan);
- [`.floor()`](#floor);
- [`.bind()`](#bind);
- [`.now()`](#now);
- [`.toString()`](#tostring).

# `Number`

## <a id = "isinteger"></a>`.isInteger()`

`.isInteger()` é um método estático do objeto global `Number`, ele verifica se um valor é um número inteiro.

`Number.isInteger(value);`

`value`**:** valor a ser verificado.

Retorna `true` se o valor fornecido for um número inteiro, caso contrário, retorna `false`.

```JavaScript
console.log(Number.isInteger(42));        // Saída: true
console.log(Number.isInteger(42.1));      // Saída: false
console.log(Number.isInteger("42"));      // Saída: false
console.log(Number.isInteger(NaN));       // Saída: false
console.log(Number.isInteger(undefined)); // Saída: false 
```

Lembre-se de que `Number.isInteger()` é usado para verificar se os valores fornecidos são inteiros, ele não converte o valor para um número inteiro, apenas verifica se o tipo e o valor correspondem a um número inteiro.

## <a id = "isnan"></a>`.isNaN()`

`.isNaN()` é um método estático do objeto global `Number`, ele retorna `true` se o valor fornecido for um `NaN` e `false`, caso contrário.

`Number.isNaN(value);`

`value`**:** o valor a ser testado se é um `NaN`.

Retorna um booleano. `true` se o valor for um `NaN` e `false`, caso contrário.

```JavaScript
Number.isNaN(NaN);       // Saída: true
Number.isNaN(123);       // Saída: false
Number.isNaN("abc");     // Saída: false
Number.isNaN(undefined); // Saída: false
```

`NaN` é uma propriedade do objeto global `Number` e ela é considerada um valor primitivo do tipo `Number`. Quando você imprime o tipo de `NaN`, a saída é `[object Number]`.

# `Math`

Objeto global. `Math` é um objeto incorporado que fornece operações matemáticas e constantes.\
Diferentemente dos métodos que são associados a instâncias de objetos, como métodos de array ou de string, os métodos do objeto `Math` são chamados diretamente no objeto global e não exigem uma instância específica. Portanto, é mais apropriado chamá-lo de uma função global do que um método de objeto.

## <a id = "floor"></a>`.floor()`

`.floor()` é uma função global no JavaScript usada para arredondar para baixo um número decial para o inteiro mais próximo, ele retorna o maior número inteiro menor ou igual a um determinado número.

`Math.floor(x);`

`x`**:** o número para o qual você deseja calcular o maior número inteiro menor ou igual.

Retorna o maior número inteiro menor ou igual a `x`.

```JavaScript
const number = 8.75;
const roundedDown = Math.floor(number);

console.log(roundedDown); // Saída: 8
```

Neste exemplo, `Math.floor()` é usado para arredondar para baixo o número decimal 8.75 para o inteiro mais próximo, que é 8.

# Function

## <a id = "bind"></a>`.bind()`

O método `bind()` é um método de objetos (os objetos em questão são funções, ou seja, um método de funções), ele cria uma nova função que, quando chamada, tem uma palavra-chave `this` predefinida com um valor específico, e alguns argumentos iniciais também podem ser fixados.\
Cria uma nova função **vinculada a um determinado objeto ou valor** para a palavra-chave `this`.

`function.bind(thisArg[, arg1[, arg2[, ...]]]);`

- `thisArg`**:** o valor a ser usado como `this` quando uma nova função é chamada;
- `arg1`, `arg2`, `...` **(opcionais):** argumentos que serão fixados à frente daqueles fornecidos quando a nova função é chamada.

Retorna uma nova função com a palavra-chave `this` predefinida e, opcionalmente, alguns argumentos fixados.

```JavaScript
const objeto = {
    valor: "batata",
    imprimeValor: function () {
      const valor = "cenoura";
      console.log(this.valor);
    }
};
const novaImprimeValor = objeto.imprimeValor;
/* O que você está fazendo na linha de cima está ilustrado basicamente abaixo:
const novaImprimeValor = function () {
    const valor = "cenoura";
    console.log(this.valor);
}
*/

objeto.imprimeValor();  // Saída: batata
/* O "(this.valor)" se refere ao "valor" definido no objeto, não na função, por conta da palavra-chave "this". "this" se refere ao "objeto".
Se ao invés de "console.log(this.valor)", estivesse "console.log(valor)", ai sim a saída seria "cenoura".*/
novaImprimeValor();     // Saída: undefined
/* Considerando a ilustração que foi feita acima do que realmente a atribuição representa, podemos perceber que "novaImprimeValor()" não está vinculada a nenhum objeto, então não possui valor para o "this", por isso a saída é "undefined".*/

const novaImprimeValorBind = objeto.imprimeValor.bind(objeto);

novaImprimeValorBind(); // Saída: batata
// Pois o método ".bind()" vincula o objeto "objeto" a "novaImprimeValorBind()", fazendo com que ela possui valor "this".

objeto.valor = "abobrinha";

objeto.imprimeValor();  // Saída: abobrinha
novaImprimeValor();     // Saída: undefined
novaImprimeValorBind(); // Saída: abobrinha
// Lembrando que a criação foi feita por atribuição, considerando que são objetos, a criação é feita por referência e não por cópia.

const objeto2 = {
    valor: "berinjela",
    imprimeValor: function () {
        console.log(this.valor);
    }
}

objeto2.imprimeValor(); // Saída: 

objeto2.imprimeValor = objeto2.imprimeValor.bind(objeto);

objeto2.imprimeValor(); // Saída:
```

# `Date`

## <a id = "now"></a>`.now()`

`.now()` é um método estático do objeto `Date` em JavaScript, ele retorna o número de milissegundos desde primeiro de janeiro de 1970 00:00:00 UTC até o momento atual.\
Ele retorna o número de milissegundos desde o Unix Epoch até o momento atual.

`Date.now();`

Retorna um número representando os milissegundos desde o Unix Epoch.

```JaVaScript
let timestamp = Date.now();

console.log(timestamp);
```

O código acima imprime o número de milissegundos desde o Unix Epocj até o momento em que `Date.now()` foi chamado.

# Objeto

## <a id = "tostring"></a>`.toString()`

`.toString()` é um método de objetos em JavaScript, ele converte um objeto para uma string.

`.toString();`

Retorna uma string que representa o objeto.

```JavaScript
const number = 42;
const stringRepresentation = number.toString();

console.log(stringRepresentation); // Saída: 42
```

No exemplo acima, `.tostring()` é chamado no número `42`, convertendo-o para a string `42`.