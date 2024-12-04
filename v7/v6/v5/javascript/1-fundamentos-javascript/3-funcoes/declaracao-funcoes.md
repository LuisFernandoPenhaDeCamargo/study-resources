# Declaração de Funções

Declaração de funções é uma das maneiras de definir funções em JavaScript, fornecendo um nome e, opcionalmente, parâmetros. Uma função declarada pode ser chamada a qualquer momento após ou mesmo antes de sua definição, devido ao conceito de **hoisting** (elevação) no JavaScript.

```JavaScript
function functionName(parameters) {
    // Corpo da função.

    return value; // Opcional.
}
```

# Principais Características

1. **Nome da função:** toda função declarada precisa ter um nome. Esse nome é utilizado para chamar a função posteriormente
2. **Parâmetros:** uma função pode receber zero ou mais parâmetros. Eles atuam como variáveis locais dentro do escopo da função
3. **Retorno:** a função pode ou não retornar um valor usando a palavra-chave `return`. Se não houver `return`, a função retorna `undefined` por padrão
4. **Hoisting:** funções declaradas são "elevadas" para o topo do escopo, o que significa que podem ser invocadas antes mesmo de sua definição no código

```JavaScript
function greet(name) {
    return `Hello, ${name}`;
}

console.log(greet("John")); // Output: Hello, John!
```

# Hoisting

No código abaixo, observe que o JavaScript "eleva" a função `sayHello` para o topo do escopo, permitindo que ela seja chamada antes de sua declaração no código.

```JavaScript
sayHello(); // Output: Hello, world!

function sayHello() {
    console.log("Hello, world!");
}
```

# Diferença entre Declaração e Expressão de Função

Além da **declaração de função**, existe a **expressão de função**, onde a função é atribuída a uma variável. Essa forma de definir funções não é afetada pelo hoisting.

```JavaScript
const add = function(a, b) {
    return a + b;
};

console.log(add(5, 10)); // Output: 15
```

# Resumo

A declaração de funções é uma das formas mais simples e diretas de definir funções no JavaScript. Devido ao hoisting, elas são bastante flexíveis, mas é importante entender as implicações disso em diferentes contextos.

# [[Próximo tópico: Operadores]](./operadores.md)