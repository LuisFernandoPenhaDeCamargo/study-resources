# `reject`

O método `reject` é utilizado para **retornar uma promessa que já foi rejeitada com o motivo (ou erro) fornecido**. Ele é útil para criar promessas rejeitadas imediatamente, sem necessidade de passar pelo processo assíncrono.

### Sintaxe Básica

```JavaScript
Promise.reject(reason);
```

- `reason`**:** o motivo pelo qual a promessa está sendo rejeitada. Pode ser qualquer valor, mas geralmente é um objeto Error para representar um erro
- **Retorno:** retorna uma promessa que é imediatamente rejeitada com o motivo fornecido

# Exemplos

### 1. Exemplo simples

```JavaScript
const rejectedPromise = Promise.reject('Critical error!');

rejectedPromise.catch(error => console.log(error)); // Output: Critical error!
```

### 2. Exemplo com Error

```JavaScript
const errorPromise = Promise.reject(new Error('Operation failed'));

errorPromise.catch(error => console.log(error)); // Output: Operation failed
```

`reject` é uma forma direta de rejeitar uma promessa quando já se sabe que uma operação falhará.

# [[Voltar para: Promise]](1-promise.md)