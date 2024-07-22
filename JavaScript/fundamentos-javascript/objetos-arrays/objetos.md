# O que são Objetos?

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

## <a id="comparando-objetos">Comparando dois Objetos</a>

### Shallow Equality (Igualdade Superficial)

### Deep Equality (Igualdade Profunda)

O JavaScript não possui uma função embutida específica para realizar comparações profundas, no entanto, bibliotecas populares como Lodash, fornecem funções para deep equality.

[Objetos Globais -->](./objetos-globais.md)