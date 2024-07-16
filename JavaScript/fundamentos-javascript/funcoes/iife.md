# IIFE (Immediately Invoked Function Expressions)

A técnica conhecida como IIFE (Immediately Invoked Function Expressions) consiste em **definir uma função que é imediatamente invocada**. Abaixo está sendo exemplificado como utilizar esta técnica com a sintaxe da function expression ou a sintaxe da arrow function.

```JavaScript
// Sintaxe da function expression.
(function () {
    console.log("IIFE: implemented with Function Expression.");
})();

// Sintaxe da arrow function.
(() => {
    console.log("IIFE: implemented with Arrow Function.");
})();
```

Observe que você deve envolver a declaração da função entre parênteses e depois utilizar mais um conjunto de parênteses para invocá-la imediatamente.

[Funções de Ordem Superior -->](./funcoes-ordem-superior.md)