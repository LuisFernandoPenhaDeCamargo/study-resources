# Operadores

Para compreender melhor como os operadores abaixo funcionam

Para você entender estes operadores, seria bom você entender o conceito de objeto antes.

Operadores os quais você precisa

## Operadores de Comparação Avançada

JavaScript suporta operadores avançados, como o operador de coalescência nula (`??`) e o operador de encadeamento opcional (`?.`).

- `??`**:** operador de coalescência nula
- `?.`**:** operador de encadeamento opcional

### Operador de encadeamento opcional

O operador de encadeamento opcional permite acessar propriedades de objetos ou chamar métodos de maneira segura, evitando erros se uma referência for `null` ou `undefined`.

```JavaScript
object?.property;
object?.[property];
object?.method?.();
```

- Se  `object` for `null` ou `undefined`, a expressão retorna `undefined` em vez de lançar um erro

Por exemplo:

```JavaScript
let user = {
    profile: {
        name: "Alice",
    },
};

console.log(user?.profile?.name); // Output: Alice
console.log(user?.address?.city); // Output: undefined. Não lança um erro.

user = null;

console.log(user?.profile?.name); // Output: undefined. Não lança um erro.

// Sem encadeamento opcional.
// console.log(user.profile.name);   // `TypeError: Cannot read properties of null (reading 'profile')`
```

## `delete`

[Objetos Globais -->](./objetos-globais.md)