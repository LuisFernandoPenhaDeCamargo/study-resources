### Sumário

- [CommonJS e ES Modules no Mesmo Arquivo](#commonjs-es-mesmo-arquivo)

# <a id="commonjs-es-mesmo-arquivo">CommonJS e ES Modules no Mesmo Arquivo</a>

Misturar a sintaxe Commonjs e ES Modules no mesmo arquivo não é permitido diretamente no Node.js, pois os dois sistemas de módulos têm modos de operação diferentes. No entanto, você pode utilizar algumas técnicas para trabalhar com ambos os sistemas no mesmo projeto.

## 1. Usando ES Modules em um Arquivo CommonJS

Você pode importar módulos ES usando a função `import` de maneira dinâmica.

```JavaScript
const chaiPromise = import("chai");

chaiPromise.then(chai => {
    // Use o módulo Chai aqui.
}).catch(error => {
    console.error(error);
});
```

## 2. Usando CommonJS em um arquivo ES Module

Você pode importar módulos CommonJS usando a função `createRequire` do módulo `module` do Node.js.

```JavaScript
import { createRequire } from "module";

const require = createRequire(import.meta.url);

// Agora você pode usar `require` como de costume.
const chai = require("chai");
```