# Módulos

### Sumário

- [CommonJS e ES Modules no Mesmo Arquivo](#commonjs-es-mesmo-arquivo)
- [Import Dinâmico](#import-dinamico)

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