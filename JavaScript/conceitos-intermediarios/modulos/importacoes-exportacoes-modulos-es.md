# Importações e Exportações nos Módulos ES

Nos módulos ES, você pode exportar variáveis, funções, classes ou objetos para que possam ser utilizados em outros módulos. Existem duas formas principais de fazer exportações, as nomeadas e a padrão.

## Exportações Nomeadas

Exportações nomeadas permitem exportar múltiplas entidades do mesmo módulo, você pode exportar variáveis, funções, classes ou objetos com um nome específico.

```JavaScript
// myModule.mjs
// - Declaração e exportação de variáveis
export const myVariable = 42;
export const anotherVariable = "Hello, World!";

// - Declarando e exportando funções
export function myFunction() {
    console.log("This is my function.");
}

// - Declarando e exportando classes
export class MyClass {
    constructor() {
        console.log("This is my class.");
    }
}

// - Declarando e exportando objetos
export const address = {
    street: "Main Street",
    number: 123,
};

/*
- Você também pode exportar múltiplas entidades juntas
export { myVariable, anotherVariable, myFunction, MyClass, address }
*/
```

## Importação de Exportações Nomeadas

Para importar exportações nomeadas, você deve usar o mesmo nome com o qual foram exportadas.

```JavaScript
// anotherModule.mjs
import { myVariable, anotherVariable, myFunction, MyClass, address } from "./myModule.mjs";

console.log(myVariable);        // Output: 42
console.log(anotherVariable);   // Output: Hello, World!
myFunction();                   // Output: This is my function.
const instance = new MyClass(); // Output: This is my Class.
console.log(address);           // Output: { street: 'Main Street', number: 123 }
```

## Exportações Padrão

A exportação padrão permite exportar uma **única** entidade como padrão do módulo. Pode ser uma variável, função, classe ou objeto.

```JavaScript
// myModule.mjs
// - Exportando uma função como padrão
export default function myFunction() {
    console.log("This is the default export function.");
}

/*
// - Para exportar variáveis (ou objetos) como padrão de um módulo, você precisa declará-las antes de exportá-las. Por exemplo:
const myVariable = 42;
export default myVariable;

// O código acima está correto, o abaixo gera um erro.

export default const myVariable; // Você não pode nem utilizar as palavras-chave `var`, `let` e `const` após `default`.
*/
```

## Importação de Exportações Padrão

Para importar uma exportação padrão, você pode usar qualquer nome.

```JavaScript
// anotherModule.mjs
import myFunctionWithAnyName from "./myModule.mjs";

myFunctionWithAnyName(); // Output: This is the default export function.
```

## Exportações Combinadas

Você pode combinar exportações nomeadas e a exportação padrão no mesmo módulo.

```JavaScript
// myModule.mjs
const myVariable = 42;

function myFunction() {
    console.log("This is my function.");
}

export { myVariable, myFunction };

export default class MyClass {
    constructor() {
        console.log("This is the default export class.");
    }
}
```

## Importações Combinadas

```JavaScript
// anotherModule.mjs
import MyClassWithAnyName, { myVariable, myFunction } from "./myModule.mjs";

console.log(myVariable); // Output:
myFunction(); // Ouput: 
const instance = new MyClassWithAnyName(); // Ouput:
```

## Exportações Reexportadas

Você pode reexportar entidades de outro módulo, facilitando a organização e o agrupamento de exportações.

```JavaScript
// currentModule.mjs
// - Reexportar todas as exportações nomeadas de outro módulo
export * from "./anotherModule.mjs";

// - Reexportar exportações especificas
export { greeting, Person } from "./anotherModule.mjs";

/*
- Reexportar a exportação padrão
Para realizar a reexportação padrão de um módulo, você precisa atribuir um nome à exportação padrão ao reexportá-la.
*/
export { default as defaultGreeting } from "./anotherModule.js";
```