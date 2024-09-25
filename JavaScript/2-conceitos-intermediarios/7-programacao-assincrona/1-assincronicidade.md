# Assincronicidade

Assincronicidade é um conceito fundamental na programação que descreve a capacidade de executar operações em paralelo ao fluxo principal do programa, sem bloquear a execução de outras partes do código. Isso permite que o código continue rodando enquanto operações mais demoradas, como leitura de arquivos, chamadas de API ou consultas a bancos de dados, sejam processadas em segundo plano. Quando a operação é concluída, o código é notificado e as ações apropriadas são tomadas.

# Operações Assíncronas

Operações assíncronas são aquelas que não ocorrem de forma imediata e que podem levar tempo para serem concluídas. Ao contrário das operações síncronas, que bloqueiam a execução do código até que terminem, as operações assíncronas permitem que o código continue rodando enquanto aguardam seu resultado.

### exemplo de operações assíncronas

- **Requisições HTTP:** ao buscar dados de uma API, a resposta pode demorar, mas o programa não precisa esperar o término da requisição para continuar com outras tarefas
- **Leitura e escrita de arquivos:** operações de E/S (Entrada/Saída) geralmente são assíncronas para não interromper a execução de outras partes do código enquanto o sistema acessa o disco rígido
- **Temporizadores:** funções como `setTimeout` e `setInterval` também são operações assíncronas. Elas permitem que o código agende uma ação para acontecer após um certo período, sem pausar o fluxo principal do código

# Benefícios

1. **Desempenho otimizado:** a execução do programa não é bloqueada por operações demoradas, permitindo que o sistema utilize recursos de forma mais eficiente
2. **Responsividade:** especialmente importante em aplicações web, onde a interface do usuário pode continuar a responder enquanto operações no servidor ou outras atividades de background são processadas
3. **Melhor escabilidade:** permite que um sistema gerencie múltiplas tarefas simultaneamente, sem sobrecarregar o fluxo principal

# Como Funciona a Assincronicidade no JavaScript?

O JavaScript utiliza o **event loop** para gerenciar operações assíncronas. Ele funciona assim:

1. **Fila de tarefas:** quando uma operação assíncrona é iniciada (por exemplo, uma requisição HTTP), ela é enviada para uma fila de tarefas
2. **Event loop:** o event loop monitora continuamente a pilha de execução principal e a fila de tarefas. Se a pilha principal estiver vazia, ele processa as tarefas de fila (como o retorno de uma Promise ou uma callback)
3. **Callback:** quando a operação assíncrona é concluída, o resultado é tratado por uma função de callback ou resolvido/rejeitado em uma Promise

# Exemplo

```JavaScript
console.log('Start');

// Simulando uma operação assíncrona (como uma requisição HTTP).
setTimeout(() => {
    console.log('Asynchronous operation completed');
}, 2000);

console.log('End');
/*
Output:
Start
End
Asynchronous operation completed
*/
```

No exemplo acima, o `setTimeout` não bloqueia o fluxo principal. O JavaScript continua a exeutar o código enquanto a função temporizada aguarda os 2 segundos. Após esse tempo, a callback passada ao `setTimeout` é executada.

# [[Próximo tópico: Callbacks]](./2-callbacks.md)