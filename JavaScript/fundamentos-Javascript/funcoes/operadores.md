# Operadores

Para compreender melhor como os operadores abaixo funcionam, era necessário entender o conceito de "funções" previamente, razão pela qual eles foram abordados aqui.

# `typeof`

O operador `typeof` retorna uma string indicando o tipo de operando.

### Sintaxe Básica

```JavaScript
typeof operand;
```

- `operand`**:** a expressão ou variável cujo tipo será retornado
- **Retorno:** uma string representando o tipo do operando

## Observações

Os possíveis valores retornados são:

- `number` se o valor é um número
- `string` se o valor é uma string
- `boolean` se o valor é um booleano
- `undefined` se o valor é `undefined`
- `symbol` se o valor é um símbolo
- `bigint` se o valor é um `BigInt`
- `function` se o valor é uma função
- `object` se o valor é um objeto (objetos, arrays, datas, etc.) ou `null`

`typeof null` retornando `object` é considerado um comportamento peculiar de JavaScript, resultante de sua implementação original.

## Exemplo

```JavaScript
console.log(typeof 42);            // Output: number
console.log(typeof "Hello");       // Output: string
console.log(typeof true);          // Output: boolean
console.log(typeof undefined);     // Output: undefined
console.log(typeof Symbol("sym")); // Output: symbol
console.log(typeof BigInt(123));   // Output: bigint
console.log(typeof function() {}); // Output: function
console.log(typeof {});            // Output: object
console.log(typeof []);            // Output: object. Arrays são considerados objetos.
console.log(typeof null);          // Output: object. Isso é um comportamento histórico de JavaScript.
```

# [[Próximo tópico: Funções Anônimas]](./funcoes-anonimas.md)