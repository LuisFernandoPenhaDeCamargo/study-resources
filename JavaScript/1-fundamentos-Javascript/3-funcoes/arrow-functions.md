# Arrow Functions

**Arrow Functions (Funções de Flecha)** em JavaScript são uma forma concisa de escrever funções. Elas foram introduzidas no ECMAScript 6 e diferem das funções tradicionais em termos de sintaxe e comportamento do `this`.

Funções de flecha permitem declarar funções de forma mais curta e possuem um comportamento especial em relação ao contexto (`this`). Ao contrário das funções normais, o valor de `this` dentro de uma função de flecha é determinado pelo escopo onde a função foi definida, e não onde ela é invocada.

```JavaScript
(param1, param2, ..., paramN) => { /* Código */ }
```

Se houver apenas um parâmetro, os parênteses são opcionais. Além disso, quando o corpo da função contém uma única expressão, é possível omitir as chaves e o valor da expressão será retornado automaticamente.

- `param1, param2, ..., paramN`**:** são os parâmetros que a função aceita. Se a função não aceita parâmetros, utiliza-se `()`
- O valor retornado pela função. Em funções de flecha sem chaves (`{}`), o retorno é implícito. Com chaves, o `return` deve ser usado explicitamente

# Exemplos

```JavaScript
// - Exemplo com múltiplos parâmetros e retorno explícito
const sum = (a, b) => {
    return a + b;
};

console.log(sum(2, 3)); // Output: 5

// - Exemplo com um parâmetro e retorno implícito
const square = n => n * n;

console.log(square(4)); // Output: 16

// - Exemplo sem parâmetros
const greet = () => "Hello, world!";

console.log(greet());   // Output: Hello, world!

```

# [[Próximo tópico: Immediately Invoked Function Expressions (IIFE)]](./iife.md)