# Promise

Uma Promise é um objeto que representa a eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante. As promessas permitem lidar com operações assíncronas de forma mais legível, evitando o uso excessivo de callbacks.

### Sintaxe Básica

```JavaScript
const promise = new Promise(function(resolve, reject) {
    // Operação assíncrona.
    if (/* operação bem-sucedida */) {
        resolve(value); // Operação concluída com sucesso.
    } else {
        reject(error);  // Operação falhou.
    }
});
```

- `function(resolve, reject)`**:** função executora (executor function), que recebe dois argumentos (`resolve` e `reject`)
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
        resolve('Successful operation');
    } else {
        reject('Operation error');
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

# Observações Importantes

O construtor de uma Promise aceita uma função, que por sua vez, recebe duas funções como argumentos: `resolve` e `reject`. É basicamente uma função de ordem superior (uma função que recebe outras funções como argumentos).

Para ilustrar o conceito de maneira simples, abaixo temos uma função que recebe outra função como argumento, e essa função de callback recebe dois argumentos que também são funções.

```JavaScript
function exampleFunction(callback) {
    const func1 = () => console.log('This is function 1');
    const func2 = () => console.log('This is function 2');

    // Chama a função de callback passando func1 e func2 como argumentos.
    callback(func1, func2);
}

// Função que será passada como argumento.
function argFunc(f1, f2) {
    console.log('Callback function');

    console.log('f1:', f1);
    f1(); // Chama a primeira função.

    console.log('f2:', f2);
    f2(); // Chama a segunda função.
}

// argFunc();
/*
Output:
Callback function
f1: undefined
TypeError: f1 is not a function
*/

exampleFunction(argFunc);
/*
Output:
Callback function
f1: [Function: func1]
This is function 1
f2: [Function: func2]
This is function 2
*/
```

- `exampleFunction` recebe uma função de callback como argumento
- Dentro de `exampleFunction`, definimos duas funções (`func1` e `func2`)
- A função `callback` é chamada com `func1` e `func2` como argumentos
- No final, a função passada como callback executa `f1()` e `f2()`, que são as funções `func1` e `func2`

Esse é o conceito básico que o construtor de Promise segue. No caso da Promise, o callback que você passa para o construtor recebe `resolve` e `reject` como argumentos, que são funções que você usa para resolver ou rejeitar a promessa.

# Métodos

- [reject](./reject.md)

# [[Voltar para: Tipos de Objetos Nativos]](../tipos-objetos-nativos.md)