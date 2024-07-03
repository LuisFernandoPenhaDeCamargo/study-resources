# Módulos

### Sumário

- [Importações e Exportações nos Módulos ES](#importacoes-exportacoes-modulos-es)
- [CommonJS e ES Modules no Mesmo Arquivo](#commonjs-es-mesmo-arquivo)
- [Import Dinâmico](#import-dinamico)

# <a id="importacoes-exportacoes-modulos-es">Importações e Exportações nos Módulos ES</a>

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
// Exportando uma função como padrão.
export default function myFunction() {
    console.log("This is the default export function.");
}
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
// - Reexportar todas as exportações nomeadas de outro módulo
export * from "./anotherModule.mjs";

// - Reexportar exportações especificas
export { greeting, Person } from "./anotherModule.mjs";

// Reexportar a exportação padrão
export { default as defaultGreeting } from "./anotherModule.js";
```

# <a id="commonjs-es-mesmo-arquivo">CommonJS e ES Modules no Mesmo Arquivo</a>

Misturar a sintaxe Commonjs e ES Modules no mesmo arquivo não é permitido diretamente no Node.js, pois os dois sistemas de módulos têm modos de operação diferentes. No entanto, você pode utilizar algumas técnicas para trabalhar com ambos os sistemas no mesmo projeto.

## 1. Usando ES Modules em um Arquivo CommonJS (Importações)

Você pode importar módulos ES usando a função `import` de maneira dinâmica, também conhecido como "[import dinâmico](#import-dinamico)".

```JavaScript
const chaiPromise = import("chai");

chaiPromise.then(chai => {
    // Use o módulo Chai aqui.
    /*
    Por exemplo:
    const expect = chai.expect;
    */
}).catch(error => {
    console.error(error);
});
```

## 2. Usando CommonJS em um arquivo ES Module (Importações)

Você pode importar módulos CommonJS usando a função `createRequire` do módulo `module` do Node.js.

```JavaScript
import { createRequire } from "module";

const require = createRequire(import.meta.url);

// Agora você pode usar `require` como de costume.
// Observe que você não pode usar a função `require` com um módulo ES, isto é só um exemplo.
const chai = require("chai");
```

# <a id="import-dinamico">Import Dinâmico</a>

O import dinâmico é uma têcnica em JavaScript que permite **importar módulos de maneira assíncrona**, diferente das importações estáticas que são resolvidas durante a compilação. Ele é útil para carregar módulos apenas quando necessário, o que pode melhorar a performance e a organização do código. A sintaxe do import dinâmico utiliza a função `import` e retorna uma promessa.

### Principais Características

1. **Assíncrono:** retorna uma promessa que se resolve quando o módulo é carregado
2. **Condicional:** permite importar módulos com base em condições específicas
3. **Melhoria de performance:** pode ajudar a reduzir o tempo de carregamento inicial da aplicação, carregando módulos apenas quando eles são realmente necessários

### Benefícios

1. **Carregamento sob demanda:** módulos são carregados apenas quando necessários, o que pode economizar recursos e melhorar a performance
2. **Código mais limpo:** pode tornar o código mais limpo, evitando importações desnecessárias
3. **Facilidade em aplicações grandes:** em grandes aplicações, permite a divisão de código em partes menores e mais gerenciáveis

### Exemplo

```JavaScript
// Uma das maiores vantagens do import dinâmico é a capacidade de importar módulos condicionalmente.
async function loadComponent(componentName) {
    if (componentName === "header") {
        const { Header } = await import("./Header.js");

        return Header;
    } else if {
        const { Footer } =  await import("./Footer.js");

        return Footer;
    }
}

loadComponent("header").then(Header => {
    // Use o componente Header.
});
```