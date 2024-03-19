# JavaScript

### Sumário

- [Época Unix](#epoca-unix)
- [Operadores](#operadores)
    + [`typeof`](#typeof)
- [Bibliotecas](#bibliotecas)

# <a id="epoca-unix"></a>Época Unix

É um padrão comum para muitas linguagens de programação que as suas bibliotecas representem o tempo como um número em milissegundos decorridos desde um ponto de referência específico, como a Época Unix, para a biblioteca `moment` do JavaScript.

A Época Unix, que é o marco zero do sistema de tempo Unix, também conhecido como "marco zero do calendário Unix", é definida como primeiro de janeiro de 1970, 00:00:00 UTC. O `moment` realiza a conversão da data para milissegundos a partir da Época Unix.

# <a id="operadores"></a>Operadores

Os operadores em JavaScript são símbolos ou palavras-chave que realizam operações em operandos. Alguns exemplos de operadores em JavaScript incluem operadores aritméticos (+, -, *, /), operadores de comparação (===, !==, >, <), operadores lógicos (&&, ||, !), entre outros.

## <a id="typeof"></a>`typeof`

`typeof` é um operador em JavaScript, ele é usado para determinar o tipo de dado de um valor, variável ou expressão. O operador `typeof` é uma palavra-chave da linguagem JavaScript e retorna uma string representando o tipo do operando.

**Exemplos**

```JavaScript
console.log(typeof 42);              // "number"
console.log(typeof "hello");         // "string"
console.log(typeof true);            // "boolean"
console.log(typeof { name: "John"}); // "object"
console.log(typeof [1, 2, 3]);       // "object"
console.log(typeof function() {});   // "function"
console.log(typeof undefined);       // "undefined"
console.log(typeof null);            // "object" (um erro conhecido em JavaScript, o tipo real de null é "object").
```

# <a id=""></a>Bibliotecas

### Sumário

- [`moment`](#moment)

## <a id=""></a>`moment`

O `moment` considera a data "0000-00-00 00:00:00" inválida, porque não é uma data reconhecida pelo sistema de calendário gregoriano. O marco zero do calendário gregoriano é primeiro de janeiro de 0001, portanto, não há um ano, mês ou dia zero, então a data "0000-00-00 00:00:00" é inválida.