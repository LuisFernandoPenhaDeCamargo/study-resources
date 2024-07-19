# Namespaces

Em JavaScript, um namespace é um **objeto que serve como um contêiner para variáveis e funções**, ajudando a evitar conflitos de nomes e a organizar o código. Isso é especialmente útil em projetos grandes, onde diferentes partes do código podem ter variávei ou funções com os mesmos nomes.

## Principais Funções

1. **Evitando conflitos de nomes:** namespaces ajudam a evitar que diferentes partes do código sobrescrevam variáveis ou funções umas das outras
2. **Organização do código:** ao usar namespaces, você pode organizar seu código em módulos ou seções lógicas

## Criação de Namespaces

Aqui estão algumas formas comuns de criar e usar namespaces em JavaScript:

### 1. Objeto Literal

A maneira mais simples de criar um namespace é usando um objeto literal.

```JavaScript
let MyNamespace = {
    myFunction: function() {
        console.log("Hello from MyNamespace!");
    },
    myVariable: 42,
}

MyNamespace.myFunction();            // Output: Hello from MyNamespace!
console.log(MyNamespace.myVariable); // Output: 42
```

### 2. IIFE

Você pode usar uma IIFE para criar um namespace e encapsular variáveis e funções.

```JavaScript
let MyNamespace = (function () {
    let privateVariable = 42;

    function privateFunction() {
        console.log("Hello from a private function");
    }

    return {
        publicFunction: function () {
            console.log("Hello from a public function!");
            privateFunction();
        },
        publicVariable: privateVariable,
    };
})();

MyNamespace.publicFunction();
/*
Output: Hello from a public Function!
Output: Hello from a private Function!
*/
console.log(MyNamespace.publicVariable); // Output: 42
```

### 3. Módulos ES6

Com a introdução dos módulos ES6, você pode usar `import` e `export` para criar namespaces de forma mais nativa e modular.

```JavaScript
// module1.mjs
export function myFunction() {
    console.log("Hello from the module!");
}

export const myVariable = 42;

// main.mjs
import * as MyNamespace from "./module1.mjs";

MyNamespace.myFunction();            // Output: Hello from the module!
console.log(MyNamespace.myVariable); // Output: 42
```

## Benefícios

1. **Encapsulamento:** mantém variáveis e funções privadas e públicas
2. **Organização:** ajuda a organizar o código em diferentes módulos e seções
3. **Manutenção:** facilita a manutenção e leitura do código
4. **Reutilização:** facilita a reutilização de código em diferentes partes do projeto ou em projetos diferentes

## Mutabilidade

Namespaces em JavaScript, sejam eles criados com Objetos Literais, IIFE, módulos CommonJS ou módulos ES6, têm diferentes tipos de mutabilidade.

- **Objetos dentro de um mesmo módulos:** mutáveis por padrão. Isso significa que você pode adicionar, remover ou modificar propriedades e métodos dentro desse objeto
- **Módulos CommonJS (criados usando** `module.exports` **e** `require`**):** mutáveis por padrão
- **Módulos ES6 (criados usando** `export` **e** `import`**):** imutáveis em grande parte. Isso significa que você não pode reatribuir diretamente uma exportação importada, embora possa modificar objetos e arrays, já que **a referência ao objeto ou array em si permanece a mesma**

Em ESM, as exportações são vinculadas às suas declarações originais e, como resultado, não podem ser reatribuídas diretamente. No entanto, se você exportar um objeto ou array, você pode modificar suas propriedades ou elementos, pois as referências aos objetos e arrays permanecem as mesmas.

Isso se deve ao fato de que quando você importa um objeto ou array, você obtém uma referência a esse objeto ou array, e modificar suas propriedades não altera a referência original. No entanto, tentar reatribuir diretamente violaria a imutabilidade das exportações.

```JavaScript
// module.mjs
export const myConstant = 42;
export let myVariable  = 100;
export function myFunction() {
    console.log("Hello from myFunction!");
}
export let myObject = { key: "value" };
export let myArray  = [1, 2, 3];

// main.mjs
import { myConstant, myVariable, myFunction, myObject, myArray } from "./module.mjs"

// Modificações válidas.
myObject.key = "New value";
myArray.push(4);

console.log(myConstant);   // Output: 42
console.log(myVariable);   // Output: 100
myFunction();              // Output: Hello from myFunction!
console.log(myObject.key); // Output: New value
console.log(myArray);      // Output: [ 1, 2, 3, 4 ]

// Modificações inválidas (causarão um erro: `TypeError: Assignment to constant variable.`).
// myConstant = 50;
// myVariable = 200;
// myFunction = () => { console.log("New function!"); }
// myObject   = { newKey: "New value" };
// myArray    = [4, 5, 6];

// Se você importar o módulo da seguinte forma:
/*
import * as alias from "./module.mjs"; // criando assim o namespace alias, e fizer

alias.myObject.newKey = "New value";

console.log(alias.myObject.newKey); // Output: New value
console.log(alias);
/*
Output:
[Module null prototype] {
    myArray: [ 1, 2, 3, 4 ],
    myConstant: 42,
    myFunction: [Function: myFunction],
    myObject: { key: 'New value', newKey: 'New value' }
    myVariable: 100
}

// mas o que eu quero pontuar é o erro gerado pela linha abaixo
// alias.myObject = { newKey: "New value." };
// que agora será `TypeError: Cannot assign to read only property 'myObject' of '[object Module]'`
*/
```

Este exemplo mostra como a mutabilidade funciona em ESM, destacando a diferença entre modificar as propriedades de um objeto ou elementos de um array versus tentar reatribuir diretamente as exportações.

Vamos pontuar também a tentativa de modificar o namespace importado através do prototype, o que também não é permitido.

```JavaScript
// module.mjs
export const myObject = {
    key: "value",
};

// main.mjs
import * as moduleNamespace from "./module.mjs";

console.log(Object.getPrototypeOf(moduleNamespace)); // Output: null

// Tentativa de modificar o prototype do namespace importado (não permitido).
// Object.setPrototypeOf(moduleNamespace, {  newPrototype: true }); // `TypeError: [object Module] is not extensible`
```

[Criação e Manipulação de Arrays -->](./criacao-manipulacao-arrays.md)