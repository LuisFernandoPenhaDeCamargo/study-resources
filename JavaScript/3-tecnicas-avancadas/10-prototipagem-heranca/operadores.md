# Operadores

- [`new`](#new)

# <a id="new">`new`</a>

A palavra-chave `new` em JavaScript é utilizada para criar uma nova instância de um objeto baseado em uma função construtora ou em uma classe. Ao utilizar `new`, o JavaScript cria um novo objeto, vincula o contexto (o valor de `this`) dentro da função construtora ao novo objeto e retorna o objeto recém-criado, desde que a função não retorne outro valor explicitamente.

### Sintaxe Básica

```JavaScript
const obj = new ConstructorFunction();
```

- `ConstructorFunction`**:** função ou classe que atua como uma construtora de objetos
- **Retorno:** o operador `new` retorna uma nova instância de um objeto

## Exemplos

1. Usando uma função construtora:

```JavaScript
function Person(name, age) {
    this.name = name;
    this.age  = age;
}

const person1 = new Person("Alice", 30);

console.log(person1.name); // Output: Alice
console.log(person1.age);  // Output: 30
```

2. Usando uma classe:

```JavaScript
class Car {
    constructor(model, year) {
        this.model = model;
        this.year  = year;
    }
}

const car1 = new Car("Tesla", 2022);

console.log(car1.model); // Output: Tesla
console.log(car1.year);  // Output: 2022
```

O operador `new` é essencial para a criação de objetos e a utilização de padrões de orientação a objetos em JavaScript.

# [[Métodos Estáticos e de Instância]](./metodos-estaticos-instancia.md)