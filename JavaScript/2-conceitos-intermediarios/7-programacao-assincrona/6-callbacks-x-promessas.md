# Callbacks x Promessas

Tanto callbacks quanto promessas são técnicas usadas para lidar com operações assíncronas em JavaScript, mas elas possuem diferenças significativas em termos de estilo, legibilidade e funcionalidade. Vamos explorar essas duas abordagens para entender melhor como elas funcionam e comparar suas vantagens e desvantagens.

# Callbacks

Callbacks são funções passadas como argumentos para outras funções e que são invocadas quando uma operação assíncrona é concluída. Esse padrão é amplamente utilizado em APIs antigas de JavaScript e continua sendo uma ferramenta válida, embora as promessas tenham substituído callbacks em muitos casos, por serem mais organizadas.

# Promessas (Promises)

Promises são objetos que representam o eventual resultado de uma operação assíncrona. Elas foram introduzidas no ECMAScript 2015 (ES6) para resolver o problema do callback hell e melhorar a legibilidade do código assíncrono.

# Diferenças Chave entre Callbacks e Promises

|Característica|Callbacks|Promises|
|---|---|---|
|Estrutura|Aninhamento de funções|Encadeamento com `then` e `catch`|
|Manejo de error|Deve ser feito em cada callback|Centralizado com `catch`|
|Legibilidade|Difícil de manter em operações complexas (callback hell)|Mais fácil de ler e manter|
|Encadeamento|Fica profundo e confuso rapidamente|Mais limpo e linear|

# Exemplos

### 1. Exemplo comparativo

Callback:

```JavaScript
function fetchData(callback) {
    setTimeout(() => {
        callback(null, "Loaded data");
    }, 2000);
}

fetchData((error, data) => {
    if (error) {
        console.error("Error:", error);
    } else {
        console.log(data);
    }
}); // Output: Loaded data
```

Promessa:

```JavaScript
function fetchData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Loaded data");
        }, 2000);
    })
}

fetchData()
    .then(data => console.log(data))
    .catch(error => console.error("Error: error"));
```

### 2. Exemplo com encadeamento

Callback:

```JavaScript
// Exemplo não executável.

// Callback hell.
asyncOperation1(result1 => {
    asyncOperation2(result1, (result2) => {
        asyncOperation3(result2, (result3) => {
            console.log("Final result:", result3);
        });
    });
});
```

Promessa:

```JavaScript
// Exemplo não executável.

asyncOperation1()
    .then(result1 => asyncOperation2(result1))
    .then(result2 => asyncOperation3(result2))
    .then(result3 => console.log("Final result:", result3))
    .catch(error => console.error("Error:", error));
```

# Conclusão

Callbacks e Promises são ferramentas usadas para lidar com operações assíncronas. Callbacks são possíveis porque, em JavaScript, as funções são objetos de primeira classe, ou seja, podem ser passadas como argumentos para outras funções. Já Promises foram implementadas como um objeto, com o propósito de melhorar a maneira como lidamos com a execução assíncronas.

Para tratar a resolução ou rejeição de uma operação assíncrona, as Promises utilizam os métodos `then` e `catch`, mantendo o comportamento assíncrono, onde o código fornecido como argumento é executado apenas após a operação ser resolvida ou rejeitada. Alternativamente, com `async` e `await`, podemos forçar o fluxo do código a aguardar a resolução ou rejeição da Promise, proporcionando uma aparência de execução síncrona para operações assíncronas.

Enquanto callbacks ainda têm seu lugar em certos cenários, as promessas são a abordagem mais moderna e recomendada para lidar com operações assíncronas em JavaScript. Elas tornam o código mais legível, fácil de depurar e escalável. Além disso, a introdução de `async`/`await` em versões mais recentes do JavaScript facilitou ainda mais o uso de Promises, aproximando o código assíncrono do estilo síncrono.

# [[Próximo tópico: Tipos de Objetos Nativos]](./tipos-objetos-nativos/tipos-objetos-nativos.md)