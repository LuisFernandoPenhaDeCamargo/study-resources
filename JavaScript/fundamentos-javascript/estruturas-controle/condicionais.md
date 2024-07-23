# Condicionais

Em JavaScript, condicionais são usadas para executar diferentes blocos de código com base em diferentes condições. As estruturas condicionais mais comuns são `if`, `else if`, `else` e `switch`.

## `if`, `else if`, `else`

Esses comandos são usados para executar blocos de código diferentes com base em condições específicas.

```JavaScript
if (condicao) {
    // Bloco de código a ser executado se a condição for verdadeira.
} else if (outraCondicao) {
    // Bloco de código a ser executado se a primeira condição for falsa e esta condição for verdadeira.
} else {
    // Bloco de código a ser executado se todas as condições anteriores forem falsas.
}
```

### Exemplo

```JavaScript
const hour = 10;

if (hour < 12) {
    console.log("Good moorning!");
} else if (hour < 18) {
    console.log("Good afternoon!");
} else {
    console.log("Goodnight!");
}
```

## `switch`

O comando `switch` é usado para executar um dos vários blocos de código com base no valor de uma expressão.

```JavaScript
switch (expressao) {
    case valor1:
        // Bloco de código a ser executado se a expressão for igual ao valor1.
        break;
    case valor2:
        // Bloco de código a ser executado se a expressão for igual ao valor2.
        break;
    default:
        // Bloco de código a ser executado se a expressão não corresponder a nenhum dos valores anteriores.
}
```

### Exemplo

```JavaScript
const day = 3;

switch (day) {
    case 1:
        console.log("Monday.");
        break;
    case 2:
        console.log("Tuesday.");
        break;
    case 3:
        console.log("Wednesday.");
        break;
    case 4:
        console.log("Thursday.");
        break;
    case 5:
        console.log("Friday.");
        break;
    case 6:
        console.log("Saturday.");
        break;
    case 7:
        console.log("Sunday.");
        break;
    default:
        console.log("Invalid day.");
}
```

Essas estruturas permitem que você controle o fluxo do seu programa com base em condições diferentes, tornando seu código mais flexível e dinâmico.

[Laços de Repetição -->](./lacos-repeticao.md)