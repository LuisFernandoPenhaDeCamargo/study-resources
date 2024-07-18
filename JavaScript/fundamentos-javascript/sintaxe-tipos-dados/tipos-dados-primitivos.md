# Tipos de Dados Primitivos

Em JavaScript, os tipos de dados primitivos são os valores básicos e imutáveis que representam os dados mais simples. Existem sete tipos de dados primitivos:

1. `string`
2. `number`
3. `boolean`
4. `null`
5. `undefined`
6. `symbol`
7. `bigint` (adicionado no ES 2020)

Aqui estão detalhes sobre cada um deles:

### 1. `string`

```JavaScript
// Representa texto.
const name     = "Alice";
const greeting = 'Hello.';
const message  = `Hello, ${name}.`; // Template Literal.
```

### 2. `number`

```JavaScript
// Representa números, tanto inteiros quanto de ponto flutuante.
const age         = 25;
const temperature = - 10.5;
const sum         = 1 + 2;
const notANumber  = NaN;      // Representa "Not-A-Number".
const infinite    = Infinity; // Representa infinito.
```

### 3. `boolean`

```JavaScript
// Representa um valor lógico: verdadeiro (`true`) ou falso (`false`).
const isStudent    = true;
const hasGraduated = false;
```

### 4. `null`

```JavaScript
// Representa a ausência intencional de um valor (um valor nulo).
const emptyValue = null;
```

### 5. `undefined`

```JavaScript
// Representa uma variável que foi declarada mas ainda não foi atribuída um valor.
let notAssigned;

console.log(notAssigned); // Output: undefined
```

### 6. `symbol`

```JavaScript
// Representa um valor único e imutável, frequentemente usado como identificadores únicos.
let symbol1 = Symbol();
let symbol2 = Symbol("description");

console.log(symbol1 === symbol2); // Output: false. Cada símbolo é único.
```

### 7. `bigint`

```JavaScript
// Representa números inteiros de precisão arbitrária, úteis para trabalhar com números inteiros muito grandes.
const bigNumber        = BigInt(1234567890123456789012345678901234567890n);
const anotherBigNumber = 12345678901234567890n;
```

## Exemplo

```JavaScript
// - Usando `symbol`
let symbol1 = Symbol("sameString");
let symbol2 = Symbol("sameString");

console.log(symbol1 === symbol2); // Output: false. Cada símbolo é único.

// - Usando `bigint`.
const bigNumber        = 1234567890123456789012345678901234567890n;
const anotherBigNumber = BigInt("1234567890123456789012345678901234567890");

console.log(bigNumber === anotherBigNumber); // Output: true. Com exceção do caracter "n", o restante do número precisa ser igual para a comparação ser verdadeira.
```

## Conclusão

Os tipos de dados primitivos são fundamentais em JavaScript. representando os blocos de construção básicos do gerenciamento de dados. Cada tipo tem suas características e usos específicos, permitindo que os desenvolvedores manipulem e armazenem dados de forma eficiente e eficaz.

[Operadores (Aritméticos, Comparação, Lógicos) -->](./operadores.md)