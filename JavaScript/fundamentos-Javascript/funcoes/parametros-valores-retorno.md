# Parâmetros e Valores de Retorno

Os **parâmetros** e **valores de retorno** são conceitos fundamentais em JavaScript e fazem parte do funcionamento das funções. Eles controlam como os dados entram e saem de uma função.

# Parâmetros

- **Parâmetros** são variáveis que você define ao declarar uma função e que são usadas para receber valores quando a função é chamada
- Esses valores são conhecidos como **argumentos** quando passados para a função

```JavaScript
function add(a, b) {
    return a + b;
}

console.log(add(3, 4)); // Retorna 7.
```

Aqui,  `a` e `b` são os parâmetros, e `3` e `4` são os argumentos passados na chamada.

# Valores de Retorno

- O **valor de retorno** é o resultado que uma função pode devolver ao ser chamada
- Para devolver um valor, utiliza-se a palavra-chave `return`. Se `return` não for usado, a função retorna `undefined` por padrão

```JavaScript
function multiply(a, b) {
    return a * b;
}

const result = multiply(5, 6);

console.log(result); // Output: 30
```

# Parâmetros Padrão

Você também pode definir valores padrão para parâmetros, caso a função seja chamada sem argumentos ou com argumentos `undefined`.

```JavaScript
function greet(name = "Guest") {
    return `Hello, ${name}`;
}

console.log(greet());       // Output: Hello, Guest!
console.log(greet("John")); // Output: Hello, John!
```

Esses conceitos são essenciais para a criação de funções reutilizáveis e dinâmicas em JavaScript.

# [[Próximo tópico: Arrow Functions]](./arrow-functions.md)