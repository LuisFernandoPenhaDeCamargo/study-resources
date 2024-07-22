# Operadores

Em JavaScript, os operadores são utilizados para realizar operações sobre valores e variáveis. Eles são classificados em várias categorias, incluindo operadores aritméticos, de comparação, lógicos, de atribuição, entre outros.

## 1. Operadores aritméticos

Esses operadores são usados para realizar operações matemáticas.

- `+`**:** adição
- `-`**:** subtração
- `*`**:** multiplicação
- `/`**:** divisão
- `%`**:** módulo (resto da divisão)
- `++`**:** incremento
- `--`**:** decremento

```JavaScript
let a = 10;
let b = 5;

console.log(a + b); // Output: 15
console.log(a - b); // Output: 5
console.log(a * b); // Output: 50
console.log(a / b); // Output: 2
console.log(a % b); // Output: 0

a++;

console.log(a);     // Output: 11

b--;

console.log(b);     // Output: 4
```

## 2. Operadores de atribuição

Esses operadores são usados para atribuir valores a variáveis.

- `=`**:** atribuição simples
- `+=`**:** adição e atribuição
- `-=`**:** subtração e atribuição
- `*=`**:** multiplicação e atribuição
- `/=`**:** divisão e atribuição
- `%=`**:** módulo e atribuição

```JavaScript
let x = 10;

x += 5;         // x = x + 5;

console.log(x); // Output: 15

x -= 3;         // x = x - 3;

console.log(x); // Output: 12

x *= 2;         // x = x * 2;

console.log(x); // Output: 24

x /= 4;         // x = x / 4;

console.log(x); // Output: 6

x %= 2;         // x = x % 2;

console.log(x); // Output: 0
```

## 3. Operadores de comparação

Esses operadores são usado para comparar valores e retornam um valor booleano (`true` ou `false`).

- `==`**:** igual
- `===`**:** estritamente igual a (verifica valor e tipo)
- `!=`**:** diferente de
- `!==`**:** estritamente diferente de (verifica valor e tipo)
- `>`**:** maior que
- `>=`**:** maior ou igual a
- `<`**:** menor que
- `<=`**:** menor ou igual a

```JavaScript
let a = 5;
let b = "5";

console.log(a == b);  // Output: true
console.log(a === b); // Output: false
console.log(a != b);  // Output: false
console.log(a !== b); // Output: true
console.log(a > 3);   // Output: true
console.log(a >= 5);  // Output: true
console.log(a < 7);   // Output: true
console.log(a <= 5);  // Output: true
```

Observando que o JavaScript realiza a coerção de tipo para converter ambos os operandos ao mesmo tipo antes de compará-los, por isso `5` (number) é igual a `"5"` (string). Para comparar o valor e o tipo há as comparações estritas ("===" e "!=="), fique atento ao fato que não existe a versão estrita de `>`, `<`, `>=` e `<=`.

```JavaScript
console.log(5 > "4");   // Ouput: true. "4" é convertido para 4.
console.log("5" > 4);   // Ouput: true. "5" é convertido para 5.
console.log(5 > "5");   // Ouput: false. "5" é convertido para 5.
console.log("5" > "4"); // Ouput: true. Ambos são strings e a comparação é lexicográfica.
```

## 4. Operadores lógicos



```JavaScript
```

## 5.

```JavaScript
```

## 6.

```JavaScript
```

## 7.

```JavaScript
```

## 8.

```JavaScript
```
