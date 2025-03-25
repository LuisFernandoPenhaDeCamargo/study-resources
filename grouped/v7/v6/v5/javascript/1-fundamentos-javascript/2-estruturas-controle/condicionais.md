# Condicionais

Em JavaScript, condicionais são usadas para executar diferentes blocos de código com base em diferentes condições. As estruturas condicionais mais comuns são `if`, `else if`, `else` e `switch`.

### Sumário

- [`if`, `else if`, `else`](#if-elseif-else)
- [`switch`](#switch)
- [`else if` x `if` seguido de `if`](#elseif-x-if-seguido-if)

# <a id="if-elseif-else">`if`, `else if`, `else`</a>

Esses comandos são usados para executar blocos de código diferentes com base em condições específicas.

```JavaScript
if(condition) {
    // Bloco de código a ser executado se a condição for verdadeira.
} else if(anotherCondition) {
    // Bloco de código a ser executado se a primeira condição for falsa e esta condição for verdadeira.
} else {
    // Bloco de código a ser executado se todas as condições anteriores forem falsas.
}
```

## Exemplo

```JavaScript
const hour = 10;

if(hour < 12) {
    console.log("Good moorning!");
} else if(hour < 18) {
    console.log("Good afternoon!");
} else {
    console.log("Goodnight!");
}
```

# <a id="switch">`switch`</a>

O comando `switch` é usado para executar um dos vários blocos de código com base no valor de uma expressão.

```JavaScript
switch(expression) {
    case value1:
        // Bloco de código a ser executado se a expressão for igual ao value1.
        break;
    case value2:
        // Bloco de código a ser executado se a expressão for igual ao value2.
        break;
    default:
        // Bloco de código a ser executado se a expressão não corresponder a nenhum dos valores anteriores.
}
```

## Exemplo

```JavaScript
const day = 3;

switch(day) {
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

## Observações

- O `switch` realiza uma **comparação estrita**, ou seja, ele compara tanto o **valor** quanto o **tipo** das expressões

### `break` e o fall-through

O `break` é necessário no `switch` para interromper a execução após o `case` correspondente. Caso o `break` não seja utilizado, o JavaScript continua executando todos os casos subsequentes, mesmo que o valor correspondente já tenha sido encontrado. Esse comportamento é chamado de **fall-through**.

Quando o `switch` encontra um `case` que corresponde ao valor, ele **não faz mais verificações** para os próximos `case` e continua executando o código até **encontrar um** `break` **ou o fim do** `switch`.

```JavaScript
const value = 3;

switch(value) {
    case 2:
        console.log("Case 2");
    case 3:
        console.log("Case 3");        // Output: Case 3
    case 4:
        console.log("Case 4");        // Output: Case 4
    case 1:
        console.log("Case 1");        // Output: Case 1
    default:
        console.log("Default case");  // Output: Default case
}
```

O valor de `value` é `3`, então o `switch` faz a comparação e encontra o `case 3`. Após executar o bloco de código de `case 3` (`console.log("Case 3");`), ele **não faz mais comparações** e simplesmente executa todos os blocos de código subsequentes até encontrar um `break` ou o fim do `switch`.

Se fosse adicionado um `break` após cada `case`, a execução seria interrompida, e somente `Case 3` teria sido impresso.

# <a id="elseif-x-if-seguido-if">`else if` x `if` seguido de `if`</a>

A diferença entre `else if` e dois `if` separador está principalmente na forma como as condições são avaliadas e na eficiência do código:

## `else if`

O `else if` faz parte de uma cadeia condicional, ou seja, é usado junto com um `if` e, opcionalmente, um `else`. Quando você usa `else if`, o programa só avaliará essa condição **se a condição anterior (**`if` **ou outro** `else if`**) for falsa**.

- **Vantagem:** o código é mais eficiente, porque assim que uma condição é verdadeira, as condições subsequentes são ignoradas
- **Execução:** só uma das condições será executada

## `if` seguido de outro `if`

Quando você usa `if` seguido de outro `if`, ambas as condições são independentes e serão avaliadas separadamente, independentemente do resultado do primeiro `if`.

```JavaScript
if(condition1) {
    // Executa se condition1 for verdadeira.
}

if(condition2) {
    // Executa se condition2 for verdadeira, independentemente de condition1.
}
```

- **Vantagem:** útil quando você quer verificar várias condições independentemente
- **Execução:** ambos os `ifs`s podem ser executados, ou seja, se ambas as condições forem verdadeiras, ambos os blocos serão executados

### Exemplo

```JavaScript
let x = 5;

if(x > 3) {
    console.log("Bigger than 3"); // Output: Bigger than 3
} else if(x > 4) {
    console.log("bigger than 4");
} else {
    console.log("No conditions were met");
}

// Se usar dois ifs.
if(x > 3) {
    console.log("Bigger than 3"); // Output: Bigger than 3
}

if(x > 4) {
    console.log("Bigger than 4"); // Output: Bigger than 4
}
```

### Conclusão

- Use `else if` quando as condições são mutuamente exclusivas e você só quer que um bloco seja executado
- Use `if` separado quando as condições são independentes e podem ser verdadeiras ao mesmo tempo

Essas estruturas permitem que você controle o fluxo do seu programa com base em condições diferentes, tornando seu código mais flexível e dinâmico.

# [[Próximo tópico: Operadores]](./operadores.md)