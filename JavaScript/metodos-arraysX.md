# Métodos de Arrays

### Sumário

- [.isArray()](#isarray).

### Métodos de Verificação de Tipo

Funções que ajudam a identificar o tipo de dado.

# <a id = "isarray"></a>`isArray()`

Verifica se o valor passado como argumento é um array.

`Array.isArray(valor)`

`valor`**:** valor que você deseja verificar se é um array.

Retorna um booleano. `true` se o valor for um array e `false` se não for.

```JavaScript
const array = [1, 2, 3];
const naoEhArray = "Isso não é um array.";

console.log(Array.isArray(array));      // Saída: true
console.log(Array.isArray(naoEhArray)); // Saída: false
```