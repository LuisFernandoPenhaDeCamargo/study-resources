# Arrow Functions

### Exemplo Interessante

```JavaScript
(async () => {
    const chaiModule = await import("chai");

    expect = chaiModule.expect;
})();
```

No código acima a função assíncrona está sendo definida e imediatamente invocada, o que é uma técnica conhecida como IIFE (Immediately Invoked Function Expressions). Nesse caso, você não precisa usar a palavra-chave `function`, pois a **sintaxe da arrow function está sendo utilizada para definir a função de forma concisa**.

[IIFE (Immediately Invoked Function Expressions) -->](./iife.md)