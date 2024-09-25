# Promise

Uma Promise é um objeto que representa a eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante. As promessas permitem lidar com operações assíncronas de forma mais legível, evitando o uso excessivo de callbacks.

### Sintaxe Básica

```JavaScript
const promise = new Promise(function(resolve, reject) {
    // Operação assíncrona.
    if (/* operação bem-sucedida */) {
        resolve(value); // Operação concluída com sucesso.
    } else {
        reject(error);   // Operação falhou.
    }
});
```

<F declarar uma função que recebe um função como argumento e essa função argumento recebe duas funções como argumento, é isso?

- `resolve`**:** função a ser chamada quando a operação for bem-sucedida. Recebe o valor da operação
- `reject`**:** função a ser chamada quando a operação falhar. Recebe o erro da operação

### Estados de uma Promise

- **Pendente (pending):** a operação ainda está em andamento
- **Concluída (fulfilled):** a operação foi concluída com sucesso e o valor está disponível
- **Rejeitada (rejected):** a operação falhou e um erro foi retornado

### Retorno: uma Promise Pode ter três Resultados

1. Um valor resolvido, que é passado adiante com `resolve`
2. Um erro rejeitado, passado com `reject`
3. Continuar pendente se nem `resolve` ou `reject` forem chamados

# Exemplo

```JavaScript
const promise = new Promise(function(resolve, reject) {
    let success = true;

    if (success) {
        resolve("Successful operation");
    } else {
        reject("Operation error");
    }
});

promise
    .then(function(value) {
        console.log(value);   // Output: Successful operation
    })
    .catch(function(error) {
        console.error(error); // Tratamento de erro.
    });
```

As Promises são amplamente utilizadas para lidar com operações assíncronas, como requisições HTTP e temporizadores, permitindo um código mais claro e legível comparado ao uso de callbacks.

# Métodos

- [reject](./reject.md)

# [[Voltar para: Tipos de Objetos Nativos]](../tipos-objetos-nativos.md)