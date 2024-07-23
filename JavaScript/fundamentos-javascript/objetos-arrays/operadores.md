# Operadores

Operadores 

## Operadores de Comparação Avançada

JavaScript suporta operadores avançados, como o operador de coalescência nula (`??`) e o operador de encadeamento opcional (`?.`).

- `??`**:** operador de coalescência nula
- `?.`**:** operador de encadeamento opcional

### Operador de coalescência nula

O operador de coalescência nula é utilizado para fornecer um valor padrão quando uma variável é `null` ou `undefined`. Ele é útil quando você quer garantir que uma variável tenha um valor, mesmo que ela não esteja definida.

```JavaScript
const result = value1 ?? value2;
```

- Se `value1` não for `null` nem `undefined`, `result` será igual a `value1`
- Se `value1` for `null` ou `undefined`, `result` será igual a `value2`

Por exemplo:

```JavaScript
let name;
const defaultName = "Visitor";
let nameDisplayed = name ?? defaultName;

console.log(nameDisplayed); // Output: Visitor

name = "Alice";
nameDisplayed = name ?? defaultName;

console.log(nameDisplayed); // Output: Alice
```

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