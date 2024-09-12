# Laços de Repetição

Os laços de repetição (loops) em JavaScript são utilizados para executar uma série de instruções repetidamente até que uma condição específica seja atendida. Eles são fundamentais para automatizar tarefas repetitivas e são amplamente utilizados em diversas aplicações, como percorrer arrays, executar funções múltiplas vezes, entre outras.

# `for` Loop

O `for` loop é usado quando o número de iterações é conhecido. Ele executa um bloco de código repetidamente até que a condição especificada seja falsa.

### Sintaxe Básica

```JavaScript
for(initialization; condition; increment) {
    // Código a ser executado.
}
```

- `initialization`**:** declara e inicializa uma variável de controle (geralmente um contador)
- `condition`**:** a condição que será verificada antes de cada iteração
- `increment`**:** atualiza a variável de controle após cada iteração

## Exemplo

```JavaScript
for(let i = 0; i < 3; i++) {
    console.log(i);
}
/*
Output:
0
1
2
*/
```

# `while` Loop

O `while` loop executa um bloco de código enquanto a condição fornecida for verdadeira.

### Sintaxe Básica

```JavaScript
while(condition) {

}
```

- `condition`**:** expressão booleana que é avaliada antes de cada iteração. Quando falsa, o loop para

## Exemplo

```JavaScript
let count = 0;

while(count < 3) {
    console.log(count);
    count++;
}
/*
Output:
0
1
2
*/
```

# `do...while` Loop

O `do...while` loop é semelhante ao `while`, mas garante que o bloco de código seja executado pelo menos uma vez, pois a condição é verificada após a execução.

### Sintaxe Básica

```JavaScript
do {
    // Código a ser executado.
} while(condition);
```

- `condition`**:** expressão booleana que é avaliada após a execução do bloco de código

## Exemplo

```JavaScript
let count = 0;

do {
    console.log(count);
    count++;
} while(count < 3);
/*
Output:
0
1
2
*/
```

# `for...in` Loop

O `for...in` loop percorre todas as propriedades enumeráveis de um objeto, permitindo acessar os nomes das chaves (propriedades).

### Sintaxe Básica

```JavaScript
for(let key in object) {
    // Código a ser executado.
}
```

- `key`**:** a variável que armazena a chave atual do objeto durante cada iteração
- `object`**:** o objeto cujas propriedades serão percorridas

## Exemplo

```JavaScript
let user = { name: "Alice", age: 25 };

for(let key in user) {
    console.log(key + ": " + user[key]);
}
/*
Output:
name: Alice
age: 25
*/
```

# `for...of` Loop

O `for...of` loop percorre elementos de coleções iteráveis como arrays, strings, ou outros objetos iteráveis, acessando diretamente os valores de cada elemento.

### Sintaxe Básica

```JavaScript
for(let value of iterable) {
    // Código a ser executado.
}
```

- `value`**:** a variável que armazena o valor do elemento atual durante cada iteração
- `iterable`**:** a coleção (array, string, etc.) a ser percorrida

## Exemplo

```JavaScript
let fruits = ["apple", "banana", "cherry"];

for(let fruit of fruits) {
    console.log(fruit);
}
/*
Output:
apple
banana
cherry
*/
```

# [[Próximo tópico: Break e Continue]](./break-continue.md)