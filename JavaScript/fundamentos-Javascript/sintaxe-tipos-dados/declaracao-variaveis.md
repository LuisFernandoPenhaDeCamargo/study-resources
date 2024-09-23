# Declaração de Variáveis

Em JavaScript, variáveis são declaradas para armazenar dados que podem ser usados e manipulados ao longo do código. Existem três palavras-chave para declarar variáveis: `var`, `let` e `const`, cada uma com regras específicas.

### Sintaxe Básica

```JavaScript
var variableName;
let variableName;
const variableName = value;
```

- `variableName`**:** o nome da variável, que será usado para referenciar o valor
- `value`**:** o valor atribuído à variável no momento da sua declaração, obrigatório para `const`

### 1. Hoisting

- `var`**:** é elevada ao topo do escopo, mas não inicializada
- `let`**:** não pode ser usada antes de ser declarada
- `const`**:** não pode ser usada antes de ser declarada

### 2. Escopo

- `var`**:** escopo de função ou global
- `let`**:** escopo de bloco
- `const`**:** escopo de bloco

### 3. Reatribuição e Redefinição

- `var`**:** pode ser redeclarada e ter seu valor alterado
- `let`**:** não pode ser redeclarada no mesmo escopo, mas pode ter seu valor alterado
- `const`**:** não pode ser redeclarada nem ter seu valor alterado (imutável)

# Exemplo

```JavaScript
console.log(x);    // Output: undefined. É elevada ao topo do escopo, mas não inicializada
// console.log(y); // Output: ReferenceError: y is not defined. Não pode ser usada antes de ser declarada
// console.log(z); // Output: ReferenceError: z is not defined. Não pode ser usada antes de ser declarada

{
    var x   = 5;
    let y   = 10;
    const z = 15;

    var x   = 20;
    // let y   = 25; // Output: SyntaxError: Identifier 'y' has already been declared. Não pode ser redeclarada no mesmo escopo.
    // const z = 30; // Output: SyntaxError: Identifier 'z' has already been declared. Não pode ser redeclarada no mesmo escopo.

    x = 35;
    y = 40;
    // z = 45; // Output: TypeError: Assignment to constant variable. Não pode ter o seu valor alterado (imutável).
}

console.log(x);    // Output: 35. Escopo de função ou global.
// console.log(y); // Output: ReferenceError: y is not defined. Escopo de bloco.
// console.log(z); // Output: ReferenceError: z is not defined. Escopo de bloco.
```

# [[Próximo tópico: Tipos de Dados Primitivos]](./tipos-dados-primitivos.md)