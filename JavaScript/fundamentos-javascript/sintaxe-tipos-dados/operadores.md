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
const a = 5;
const b = "5";

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

Esses operadores são usados para combinar expressões booleanas.

- `&&`**:** E lógico (AND)
- `||`**:** Ou lógico (OR)
- `!`**:** Não lógico (NOT)

```JavaScript
const a = true;
const b = false;

console.log(a && b); // Output: false
console.log(a || b); // Output: true
console.log(!a);     // Output: false
console.log(!b);     // Output: true
```

## 5. Operadores de string

- `+`**:** concatenação de strings

```JavaScript
const str1 = "Hello, ";
const str2 = "world!";
let str3 = str1 + str2;

console.log(str3); // Output: Hello, world!

// Coerção de tipos.
const a = 1;
const b = "20";

console.log(a + b);          // Output: 120
console.log(b + a);          // Output: 201
console.log(typeof (a + b)); // Output: string
console.log(typeof (b + a)); // Output: string
// Observe que `a` foi convertindo para uma string. Quando concatenamos um `number` e uma `string`, o resultado final é uma `string`, quando concatenamos um booleano e uma string, o resultado final é uma string; então fique atento ao que acontecerá quando for realizar uma concatenação.
```

## 6. Operadores bit a bit

Esses operadores trabalham a nível de bits.

- `&`**:** AND bit a bit
- `|`**:** OR bit a bit
- `^`**:** XOR bit a bit
- `~`**:** NOT bit a bit
- `<<`**:** deslocamento à esquerda
- `>>`**:** deslocamento à direita
- `>>>`**:** deslocamento à direita sem sinal

```JavaScript
const a = 5; // 0101 em binário.
const b = 3; // 0011 em binário.

console.log(a & b);   // Output: 1. 0001 em binário.
console.log(a | b);   // Output: 7. 0111 em binário.
console.log(a ^ b);   // Output: 6. 0110 em binário.
console.log(~a);      // Output: -6. 1010 em binário.
console.log(a << 1);  // Output: 10. 1010 em binário.
console.log(a >> 1);  // Output: 2. 0010 em binário.
console.log(a >>> 1); // Output: 2. 0010 em binário.
```

Esses são alguns dos principais operadores em JavaScript. Eles são fundamentais para manipular dados e controlar o fluxo do programa.

[Condicionais -->](../estruturas-controle/condicionais.md)