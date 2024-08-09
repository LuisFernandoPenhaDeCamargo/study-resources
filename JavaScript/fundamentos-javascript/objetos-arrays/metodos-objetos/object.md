# `Object`

### Sumário

- [`setPrototypeOf`](#setprototypeof)
- [`getPrototypeOf`](#getprototypeof)

# <a id="setprototypeof">`setPrototypeOf`</a>

O método `setPrototypeOf` é utilizado para **definir o protótipo (ou seja, a propriedade** `[[prototype]]`**) de um objeto especificado para outro objeto ou** `null`. Isso permite que você altere a cadeia de protótipos de um objeto em tempo de execução, o que pode ser útil para várias finalidades, como a substituição temporária de comportamentos em objetos durante testes.

### Sintaxe Básica

```JavaScript
Object.setPrototypeOf(obj, prototype);
```

- `obj`**:** o objeto cujo protótipo será alterado
- `prototype`**:** o novo protótipo do objeto. Pode ser outro objeto ou `null`

## Exemplo

```JavaScript
const obj    = {};
const parent = { foo: "bar" };

console.log(obj.foo); // Output: undefined

Object.setPrototypeOf(obj, parent);

console.log(obj.foo); // Ouput: bar
```

## Observações

- **Desempenho:** alterar o protótipo de um objeto pode ter implicações de desempenho, pois pode afetar otimizações feitas pelo motor de JavaScript
- **Segurança e boas práticas:** usar `setPrototypeOf` diretamente em código de produção não é recomendado, pois pode resultar em código mais difícil de manter e portencialmente em bugs complexos

# <a id="getprototypeof">`getPrototypeOf`</a>

O método `getPrototypeOf` é utilizado para **obter o protótipo (ou seja, a propriedade** `[[Prototype]]`**) do objeto especificado**. Esse método retorna o valor do protótipo do objeto, que é o objeto que foi usado como base para criar o objeto atual ou `null` se não houver nenhum protótipo.

### Sintaxe Básica

```JavaScript
Object.getPrototypeOf(obj);
```

- `obj`**:** o objeto do qual você deseja obter o protótipo

## Exemplo

```JavaScript
const obj   = {};
const proto = Object.getPrototype(obj);

console.log(proto); // Retorna o protótipo padrão do objeto, geralmente `Object.prototype`.
```

## Observações

- **Compatibilidade:** este método é uma parte do padrão ES5 e é suportado na maioria dos ambientes JavaScript modernos

# [[Retornar a Métodos de Objetos]](./metodos-objetos.md)