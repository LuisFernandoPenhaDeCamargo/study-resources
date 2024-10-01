# `this`

A palavra-chave `this` em JavaScript faz referência ao contexto no qual a função ou código está sendo executado. O valor de `this` pode variar dependendo de como e onde a função é chamada (no contexto global, em um método de objeto, dentro de uma função, ou em eventos). Ele é essencial para acessar propriedades e métodos do objeto atual.

### Sintaxe Básica

```JavaScript
this;
```

- **Contexto global (modo estrito):** no modo estrito, `this` no contexto global é `undefined`
- **Contexto global (modo não estrito):** fora do modo estrito, `this` no contexto global faz referência ao objeto global (como `window` no navegador ou `global` no Node.js)
- **Método de objeto:** dentro de um método, `this` se refere ao objeto ao qual o método pertence
- **Função regular:** o valor de `this` pode depender de como a função é invocada. Em funções regulares, `this` pode referir-se ao objeto global ou ser indefinido, dependendo do modo estrito
- **Funções flecha (arrow functions):** ao contrário das funções normais, `this` em funções flecha herda o contexto no qual a função foi definida, ou seja, contexto externo

# Exemplos

### 1. Dentro de um método de objeto

```JavaScript
const person = {
    name:  'Alice',
    greet: function() {
        console.log(this.name);
    },
};

person.greet(); // Output: Alice
```

### 2. Em uma função regular

```JavaScript
function showThis() {
    console.log(this);
}

showThis(); // Output: undefined. Modo estrito.
```

### 3. Em uma função flecha

```JavaScript
const person = {
    name:  'Bob',
    greet: () => {
        console.log(this.name);
    },
};

person.greet(); // Output: TypeError: Cannot read properties of undefined (reading 'name'). Modo estrito.
```

# [[Voltar para: Técnicas Avançadas]](../tecnicas-avancadas.md)