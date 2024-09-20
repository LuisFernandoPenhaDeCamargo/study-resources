# Dinamicamente Tipada

Quando dizemos que uma linguagem de programação é dinamicamente tipada, isso significa que a verificação de tipos ocorre em tempo de execução e não em tempo de compilação. Em outras palavras, você não precisa declarar explicitamente o tipo de uma variável ao defini-la, e o tipo da variável pode mudar durante a execução do programa.

# Principais Características

Os códigos abaixo estão escritos em JavaScript.

### 1. Declaração implícita de tipos

Você não precisa especificar o tipo de uma variável ao declará-la. O tipo é inferido com base no valor atribuído.

```JavaScript
let x = 5       // `number`
x     = "hello" // `string`
```

### 2. Tipagem em tempo de execução

Os tipos são determinados e verificados em tempo de execução. Isso permite uma maior flexibilidade, mas pode levar a erros que só são detectados quando o código é executado.

```JavaScript
function add(a, b) {
    return a + b;
}

let value = add(5, 10);
console.log(value); // Ouput: 15

value     = add("5", 10);
console.log(value); // Ouput: 510. Concatenação de strings.
```

### 3. Conversão de tipos automática

A linguagem pode converter automaticamente tipos conforme necessário, o que pode levar a resultados inesperados.

```JavaScript
let y = "5";
let z = y * 2; // z será 10, porque "5" é convertido para o número 5.
```

### 4. Flexibilidade e produtividade

A tipagem dinâmica permite escrever código mais rapidamente e de forma mais concisa, sem a necessidade de declarações de tipo explícitas.

### 5. Maior risco de erros em tempo de execução

Como os tipos são verificados em tempo de execução, erros de tipo podem ocorrer durante a execução do programa, tornando-os potencialmente mais difíceis de rastrear e corrigir.

# Vantagens e Desvantagens

### Vantagens

- **Flexibilidade:** permite escrever código de maneira rápida e eficiente sem declarações de tipo explícitas
- **Produtividade:** pode aumentar a produtividade, especialmente em prototipagem e desenvolvimento rápido

### Desvantagens

- **Erros em tempo de execução:** erros de tipo podem surgir durante a execução, o que pode tornar a depuração mais difícil
- **Menos previsibilidade:** pode ser mais difícil prever o comportamento do código, especialmente em sistemas grandes e complexos

# Exemplo

```JavaScript
// Exemplo em JavaScript.

let value = 42;              // `value` é inicialmente um número.
console.log(typeof value);   // Ouput: number

value     = "Hello, world!"; // Agora `value` é uma string.
console.log(typeof value);   // Output: string

value     = true;            // Agora `value` é um booleano.
console.log(typeof value);   // Output: boolean

function printValue(val) {
    console.log("The value is " + val);
}

printValue(10);    // Output: The value is 10
printValue("Ten"); // Output: The value is Ten
```

Em resumo, linguagens dinamicamente tipadas como JavaScript oferecem uma grande flexibilidade e produtividade, mas com o custo potencial de uma maior incidência de erros em tempo de execução e a necessidade de testes rigorosos para garantir a correção de código.

# [[Voltar para: Fundamentos da Programação]](../fundamentos-programacao.md)