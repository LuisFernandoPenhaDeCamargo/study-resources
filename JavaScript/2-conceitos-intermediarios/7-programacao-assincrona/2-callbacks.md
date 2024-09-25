# Callbacks

Callbacks em JavaScript são funções que são passadas como argumento para outra função e executadas depois que uma ação ou evento é concluído. Elas são um dos principais mecanismos de JavaScript para trabalhar com operações assíncronas, como interações com APIs, temporizadores ou operações de leitura de arquivo.

### Estrutura básica de uma Callback

1. **Função principal:** a função que executa uma tarefa e recebe uma callback como parâmetro
2. **Função callback:** a função que será chamada após a tarefa ser concluída

# Benefícios

Vantagens do uso de Callbacks:

- **Flexibilidade:** permite que você escreva código que responde a eventos assíncronos, como o término de uma chamada de API
- **Modularidade:** Callbacks tornam funções mais genéricas, pois diferentes callbacks podem ser passados para realizar diferentes ações após uma tarefa ser concluída

No entanto, se não forem usados corretamente, podem levar a algo chamado de **"Callback Hell"**, quando há muitos callbacks aninhados, tornando o código difícil de ler e manter.

# Exemplo

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

# [[Próximo tópico: Tipos de Objetos Nativos]](./tipos-objetos-nativos/tipos-objetos-nativos.md)