# Declaração de Variáveis

Em JavaScript, há três formas principais de declarar variáveis: `var`, `let` e `const`. Cada uma tem suas próprias características e usos específicos, vamos analisar cada uma delas em detalhes:

## `var`

1. **Escopo de função:** variáveis declaradas com `var` são limitadas ao escopo da função mais próxima. Se declaradas fora de uma função, têm escopo global  
    Veremos mais à frente a definição de escopo no tópico [Escopo](./escopo.md) (aqui está o link, caso ajude alternar entre ambos os conceitos).
2. **Hoisting:** variáveis declaradas com `var` são "içadas" (hoisted) ao topo do escopo, o que significa que podem ser usadas antes de serem declaradas, mas o valor inicial será `undefined`
3. **Reatribuição e redefinição:** variáveis declaradas com `var` podem ser reatribuídas e redefinidas

```JavaScript
// .mjs
function example() {
    console.log(a); // Ouput: undefined. Hoisted.
    var a = 10;
    console.log(a); // Ouput: 10
}

example();

var b = 1;
var b = 2; // Redefinição permitida: você pode declarar uma nova variável com um identificador já existente. Observe que o `b`, que possuía o valor igual a 1, não existe mais.

b = 3;     // Reatribuição permitida: você pode atribuir um novo valor a variável
```

## `let`

1. **Escopo de bloco:** variáveis declaradas com `let` são limitadas ao bloco de código (`{}`) em que são definidas
2. **Hoisting:** variáveis declaradas com `let` são içadas ao topo do bloco, mas não podem ser usadas antes de serem declaradas, resultando em um erro de referência se acessadas antes da declaração
3. **Reatribuição e redefinição:** variáveis declaradas com `let` podem ser reatribuídas, mas não redefinidas no mesmo escopo

```JavaScript
// .mjs
function example() {
    // console.log(a); // Hoisting: `ReferenceError: Cannot access 'a' before initialization`
    let a = 10;
    console.log(a);    // Output: 10
}

example();

let b = 1;
// let b = 2; // Redefinição: `SyntaxError: Identifier 'b' has already been declared`

b = 3;        // Reatribuição permitida.
```

## `const`

1. **Escopo de bloco:** assim como `let`, variáveis declaradas com `const` são limitadas ao bloco em que são definidas
2. **Hoisting:** variáveis declaradas com `const` são içadas ao topo do bloco, mas não podem ser usadas antes de declaradas, resultando em um erro de referência se acessadas antes da declaração
3. **Reatribuição e redefinição:** variáveis declaradas com `const` não podem ser reatribuídas ou redefinidas. Devem ser inicializadas no momento da declaração

```JavaScript
// .mjs
function example() {
    // console.log(a); // Hoisting: `ReferenceError: Cannot access 'a' before initialization`
    const a = 10;
    console.log(a);    // Ouput: 10
}

example();

// const b;     // `SyntaxError: Missing initializer in const declaration`
const b = 1;
// const b = 2; // Redefinição: `SyntaxError: Identifier 'b' has already been declared`

// b = 3;       // Reatribuição: `TypeError: Assignment to constant variable`
```

# Usos Comuns

- `var`**:** use quando precisar de escopo de função e for necessário redefinir variáveis no mesmo escopo. É menos comum e geralmente substituída por `let` e `const`
- `let`**:** use quando precisar de escopo de bloco e for necessário reatribuir variáveis
- `const`**:** use para declarar variáveis que não devem ser reatribuídas e que têm escopo de bloco. É a escolha preferida para declarar variáveis que não devem mudar de valor

# Conclusão

Em práticas modernas de JavaScript, `let` e `const` são preferidos sobre `var` devido ao seu escopo mais previsível e a proteção adicional contra erros de redefinição e reatribuição inadvertidas.

# [[Próximo tópico: Tipos de Dados Primitivos]](./tipos-dados-primitivos.md)