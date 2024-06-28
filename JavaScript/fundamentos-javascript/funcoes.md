# Funções

### Sumário

- [Arrow Functions](#arrow-functions)
- [IIFE (Immediately Invoked Function Expressions)](#iife)

# <a id="arrow-functions">Arrow Functions</a>

## Exemplos Interessantes

```JavaScript
(async () => {
    const chaiModule = await import("chai");
    expect = chaiModule.expect;
})();
```

No código acima, a função assíncrona está sendo definida e imediatamente invocada, o que é uma técnica conhecida como [IIFE (Immediately Invoked Function Expressions)](#iife). Nesse caso, você não precisa usar a palavra-chave `function`, pois a **sintaxe da função de seta (arrow function) está sendo utilizada para definir a função de forma concisa**.

# <a id="iife">IIFE (Immediately Invoked Function Expressions)</a>

A técnica conhecida como IIFE (Immediately Invoked Function Expressions) consiste em **definir uma função que é imediatamente invocada**. Abaixo está sendo exemplificado como utilizar desta técnica com a sintaxe de arrow function ou a sintaxe de function expressions.

```JavaScript
// Sintaxe de arrow function.
(() => {
    console.log("IIFE: implemented with Arrow Function.");
})();

// Sintaxe de function expression.
(function () {
    console.log("IIFE: implemented with Function Expression.");
})();
```

Observe que você deve envolver a declaração da função entre parênteses e depois, utilizar mais um conjunto de parênteses para invocá-la imediatamente.