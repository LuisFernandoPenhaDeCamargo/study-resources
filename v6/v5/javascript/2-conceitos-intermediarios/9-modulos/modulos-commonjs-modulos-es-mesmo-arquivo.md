# Módulos CommonJS e Módulos ES no Mesmo Arquivo

Misturar a sintaxe Commonjs e ES no mesmo arquivo não é permitido diretamente no Node.js, pois os dois sistemas de módulos têm modos de operação diferentes. No entanto, você pode utilizar algumas técnicas para trabalhar com ambos os sistemas no mesmo projeto.

## 1. Usando Módulos ES em um Arquivo CommonJS (Importações)

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

## 2. Usando Módulos CommonJS em um Arquivo ES (Importações)

Você pode importar módulos CommonJS usando a função `createRequire` do módulo `module` do Node.js.

```JavaScript
import { createRequire } from "module";

const require = createRequire(import.meta.url);

// Agora você pode usar `require` como de costume.
// Observe que você não pode usar a função `require` com um módulo ES, isto é só um exemplo.
const chai = require("chai");
```