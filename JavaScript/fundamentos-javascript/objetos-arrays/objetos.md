# Objetos

## <a id="objetos-declarados-const">Objetos Declarados com `const`</a>

Em JavaScript, você pode modificar objetos declarados com `const`. A declaração `const` significa que a **referência** a esses objetos não pode ser reatribuída a um valor diferente, mas as propriedades do objeto podem ser alteradas, a mutação do seu conteúdo interno é permitida.

### Exemplo

```JavaScript
const myObject = {
    key: "value",
};

// Modificar uma propriedade existente.
myObject.key = "New value";

// Adicionar uma nova propriedade.
myObject.newKey = "Another value";

console.log(myObject);          // Ouput: { key: 'New value', newKey: 'Another value' }

// Tentativa de reatribuir o objeto causará um erro.
// myObject = { key: "value" }; // `TypeError: Assignment to constant variable.`
```

## <a id="operadores-comparacao-avancada">Operadores de Comparação Avançada</a>

JavaScript suporta operadores avançados, como o operador de coalescência nula (`??`) e o operador de encadeamento opcional (`?.`).

- `??`**:** operador de coalescência nula
- `?.`**:** operador de encadeamento opcional

### Operador de coalescência nula

O operador de coalescência nula é utilizado para fornecer um valor padrão quando uma variável é `null` ou `undefined`. Ele é útil quando você quer garantir que uma variável tenha um valor, mesmo que ela não esteja definida.

```JavaScript
const resultado = valor1 ?? valor2;
```

- Se `valor1` não for `null` nem `undefined`, `resultado` será igual a `valor1`
- Se `valor1` for `null` ou `undefined`, `resultado` será igual a `valor2`

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
console.log(user.profile.name);   // `TypeError: Cannot read properties of null (reading 'profile')`
```

## <a id="comparando-objetos">Comparando dois Objetos</a>

### Shallow Equality (Igualdade Superficial)

### Deep Equality (Igualdade Profunda)

O JavaScript não possui uma função embutida específica para realizar comparações profundas, no entanto, bibliotecas populares como Lodash, fornecem funções para deep equality.

[Objetos Globais -->](./objetos-globais.md)