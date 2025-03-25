# Callbacks

Callbacks em JavaScript são funções que são passadas como argumento para outra função e executadas depois que uma ação ou evento é concluído. Elas são um dos principais mecanismos de JavaScript para trabalhar com operações assíncronas, como interações com APIs, temporizadores ou operações de leitura de arquivo.

### Estrutura básica de uma Callback

1. **Função principal:** a função que executa uma tarefa e recebe uma callback como parâmetro
2. **Função callback:** a função que será chamada após a tarefa ser concluída

# Vantagens e Desvantagens

### Vantagens

- **Flexibilidade:** permite que você escreva código que responde a eventos assíncronos, como o término de uma chamada de API
- **Modularidade:** Callbacks tornam funções mais genéricas, pois diferentes callbacks podem ser passados para realizar diferentes ações após uma tarefa ser concluída
- **Simplicidade:** Callbacks são fáceis de entender e implementar para pequenas tarefas assíncronas
- **Amplamente suportadas:** muitas bibliotecas antigas ainda dependem de Callbacks, o que pode torná-las uma escolha necessária em certos contextos

### Desvantagens

- **Callback Hell:** quando várias operações assíncronas são encadeadas, o código se torna aninhado e difícil de ler. Isso é conhecido como callback hell

# Exemplos

### 1. Exemplo básico

```JavaScript
function fetchData(callback) {
    console.log('Fetching data...');

    // Simulando um tempo de espera, como uma chamada de API.
    setTimeout(() => {
        console.log('Data received.');
        callback();
    }, 2000);
}

function processData() {
    console.log('Processing data...');
}

// Passando `processData` como callback para `fetchData`
fetchData(processData);
/*
Output:
Fetching data...
Data received.
Processing data...
*/
```

- `fetchData`**:** função principal que simula buscar dados e recebe uma função `callback` como argumento
- `processData`**:** função `callback` que será executada assim que a busca de dados for concluída

No exemplo, `fetchData` faz uma operação assíncrona simulada com `setTimeout`, e assim que os dados são "recebidos", a função `processData` é chamada como uma callback.

### 2. Exemplo de callback hell

```JavaScript
// Exemplo não executável.

asyncOperation1((result1) => {
    asyncOperation2(result1, (result2) => {
        asyncOperation3(result2, (result3) => {
            console.log("Final result:", result3);
        });
    });
});
```

Esse aninhamento profundo complica o fluxo e a legibilidade do código, dificultando a manutenção e depuração.

# [[Próximo tópico: Promises]](./3-promises.md)