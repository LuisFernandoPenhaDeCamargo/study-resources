# `then`/`catch`

Quando você usa `then` e `catch` em uma promessa em JavaScript, o código no escopo superior (ou contexto externo) é executado imediatamente, ou seja, antes do código dentro do `then` ou `catch`. A execução dentro do `then` ou `catch` ocorre somente após a resolução ou rejeição da promessa.

Escopo superior refere-se ao contexto externo ou ao nível de código que está fora do `then` ou `catch`, este código é executado de forma síncrona.

### Exemplo

Para ajudar a visualizar o fluxo de execução.

```JavaScript
console.log("Step 1: Synchronous start.");

const promise = new Promise((resolve) => {
    setTimeout(() => {
        resolve("Step 4: Promise resolved.");
    }, 1000);
});

// A promessa foi criada acima, em "`const promise = new Promise...`"
console.log("Step 2: Promise created.");

promise.then((message) => {
    console.log(message);
});

console.log("Step 3: Synchronous end.");
```

A saída será:

```Bash
Step 1: Synchronous start.
Step 2: Promise created.
Step 3: Synchronous end.
Step 4: Promise resolved.
```

Esta sequência demonstra que o código fora da promessa (contexto externo) é executado imediatamente, enquanto o código dentro do `then` é executado após a promessa ser resolvida.

### Observações Importantes

Mesmo que o código dentro do `then` seja resolvido, praticamente, instântaneamente, o código no contexto externo ainda será executado antes, afinal o contexto externo é síncrono e não importa o quão rápida seja a resolução do código dentro do `then`, **ele é assíncrono**.

[`async`/`await` -->](./async-await.md)