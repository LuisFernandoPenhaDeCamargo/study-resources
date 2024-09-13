# Funções Anônimas

Funções anônimas são funções que não possuem um nome explícito. Elas sçao frequentemente usadas como funções de callback ou quando não é necessário reutilizar a função.

- Assim como funções normais, funções anônimas podem receber parâmetros
- O retorno de uma função anônima depende da lógica implementada. Pode retornar valores ou nada, conforme a função

```JavaScript
// - Função anônima utilizada na criação de uma IIFE
(function() {
    // Código da função.
})();

// - Função anônima utilizada na declaração de uma função através da expressão de função
const sum = function(a, b) {
    return a + b;
}

console.log(sum(5, 3)); // Output: 8
```

Funções anônimas são comuns em expressões de função e callbacks em JavaScript.

# [[Pŕoximo tópico: Funções de Ordem Superior]](./funcoes-ordem-superior.md)