# Operadores

Para compreender melhor como os operadores abaixo funcionam, antes era necessário entender o conceito de "objeto", por isso eles foram pontuados aqui.

# Operador de Encadeamento Opcional

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

# Operador `delete`

O operador `delete` em JavaScript é utilizado para **remover uma propriedade de um objeto**. Ele é especialmente útil para dinamicamente modificar a estrutura de um objeto durante a execução de um programa.

```JavaScript
delete object.property;
delete object["property"];
```

## Principais Características

- **Objetos:** `delete` remove a propriedade do objeto
- **Arrays:** usar `delete` em um array não altera o seu comprimento, ele simplesmente substitui o item deixando um `undefined` em seu lugar
- **Tipos de dados primitivos:** `delete` não pode ser usado em variáveis cujo o tipo do valor é um tipo de dado primitivo

## Exemplo

```JavaScript
// - `delete` em objetos
const person = {
    name: "Alice",
    age: 30,
    city: "New York",
};

// Removendo a propriedade `age`.
delete person.age;

console.log(person); // Output: { name: 'Alice', city: 'New York' }

// - `delete` em arrays
const fruits = ["apple", "banana", "orange"];

delete fruits[1];

console.log(fruits); // Output: [ 'apple', <1 empty item>, 'orange' ]

// É melhor utilizar o método `splice` para remover o elemento de um array, pois ele não deixa um `undefined` no lugar do item a ser removido, além de também alterar o comprimento do array.

fruits.splice(1, 1); // Remove 1 item na posição 1.

console.log(fruits); // Output: [ 'apple', 'orange' ]

// - `delete` em tipos de dados primitivos
const number = 42;

delete number;       // `SyntaxError: Delete of an unqualified identifier in strict mode` em ESM.

console.log(number); // Output: 42
```

[Objetos Globais -->](./objetos-globais.md)