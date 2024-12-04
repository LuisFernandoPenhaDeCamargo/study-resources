# Tipos de Dados Primitivos

Os tipos de dados primitivos em JavaScript são valores básicos e imutáveis que representam os dados mais simples. Existem sete tipos de dados primitivos:

1. String
2. Number
3. Boolean
4. Null
5. Undefined
6. Symbol
7. BigInt

Aqui estão detalhes sobre cada um deles:

### 1. String

Representa uma sequência de caracteres.

```JavaScript
const name     = 'Alice';
const greeting = "Hello";
const message  = `Hello, ${name}`; // Template Literal.
```

### 2. Number

Representa números, incluindo inteiros e decimais.

```JavaScript
const age         = 25;
const price       = 19.99;
const temperature = - 10;
const notANumber  = NaN;      // Representa "Not-A-Number".
const infinite    = Infinity; // Representa infinito.
```

### 3. Boolean

Representa dois valores possíveis: `true` ou `false`.

```JavaScript
const isStudent    = true;
const hasGraduated = false;
```

### 4. Null

Representa a ausência intencional de qualquer valor, ou um valor nulo.

```JavaScript
const emptyValue = null;
```

### 5. Undefined

Representa uma variável que foi declarada mas não recebeu nenhum valor.

```JavaScript
let notAssigned;

console.log(notAssigned); // Output: undefined
```

### 6. Symbol

Representa um valor único e imutável, frequentemente usado para criar identificadores únicos.

```JavaScript
const symbol = Symbol('description');
```

### 7. BigInt

Representa números inteiros de precisão arbitrária, sendo útil para trabalhar com números muito grandes, que excedem o limite permitido para o tipo Number. 

```JavaScript
const bigNumber        = BigInt(1234567890123456789012345678901234567890);
const anotherBigNumber = 12345678901234567890n;
```

- Um valor é considerado um BigInt se possui um `n` ao seu final ou se for inicializado com `BigInt(A< valor >)`
- Se for inicializado com `BigInt(A< valor >)`, você pode optar por adicionar um `n` ao final ou não

# Exemplos

### 1. Symbol

```JavaScript
const symbol1 = Symbol('sameDescription');
const symbol2 = Symbol('sameDescription');

console.log(symbol1);             // Output: Symbol(sameDescription)
console.log(symbol2);             // Output: Symbol(sameDescription)
console.log(symbol1 === symbol2); // Output: false. Cada símbolo é único.
```

### 2. BigInt

```JavaScript
const bigNumber        = 1234567890123456789012345678901234567890n;
const anotherBigNumber = BigInt('1234567890123456789012345678901234567890');

console.log(bigNumber);                      // Output: 1234567890123456789012345678901234567890n
console.log(anotherBigNumber);               // Output: 1234567890123456789012345678901234567890n
console.log(bigNumber === anotherBigNumber); // Output: true
```

# [[Próximo tópico: Aspas Simples x Aspas Duplas]](./4-aspas-simples-x-aspas-duplas.md)