# `createRequire`

O método `createRequire` é uma funcionalidade do Node.js que permite criar uma função `require` personalizada em um módulo, especialmente útil quando você precisa [carregar módulos CommonJS em módulos ES](../../conceitos-intermediarios/modulos/modulos-commonjs-modulos-es-mesmo-arquivo.md). Isso é parte do módulo [`module`](./module.md).

### Sintaxe Básica

```JavaScript
const { createRequire } = require("module");

const require = createRequire(filename);
```

- `filename` **(string):** é uma string que representa o caminho ou URL do módulo em que o `require` está sendo criado. Geralmente você passará `import.meta.url` ao usar `createRequire` em um módulo ES para fornecer o contexto do módulo atual
- **Retorno:** o método `createRequire` retorna uma função que pode ser usada para carregar módulos CommonJS (**.cjs**), JSON (**.json**) ou nativos (**.node**) a partir de módulos ES. A função retornada funciona de maneira semelhante ao `require` padrão em módulos CommonJS

## Principais Características

### 1. Criar uma função `require` personalizada

- Permite criar uma função `require` que pode ser usada para carregar módulos, similar ao `require` global usado em CommonJS
- Útil em módulos ES, onde o `require` global não está disponível

### 2. Carregar CommonJS Modules em ES Modules

Permite que você use `require` dentro de um módulo ES para carregar um módulo CommonJS.

### 3. Carregar JSON e Nativos

Além de módulos JavaScript, você pode carregar arquivos JSON e módulos nativos (compilados em C/C++).

## Exemplos

```JavaScript
// example.mjs
// Criando um método `require` personalizado em um ESM.
import { createRequire } from "module";

const require = createRequire(import.meta.url);

// Usando o `require` personalizado para carregar um módulo CommonJS.
const fs = require("fs");
const lodash =  require("lodash");

console.log(fs.readFileSync); // Método `readFileAsync` do módulo `fs`.
console.log(lodash.chunk([1, 2, 3, 4], 2)); // Usando um método do lodash.

// Carregar um arquivo JSON.
const packageJson = require("./package.json");

console.log(packageJson.version); // Exibe a versão do package.json.

// Carregar Módulos Nativos.
const addon = require("./build/Release/addon");

console.log(addon.hello()); // Função exportada pelo módulo nativo.
```

## Observações

### <a id="importmetaurl">`import.meta.url`</a>

`import.meta.url` é uma propriedade disponível nos módulos ES que contém a URL completa do módulo atual, incluindo o protocolo `file://`. É utilizada como argumento para `createRequire` para que a função `require` saiba a localização do módulo atual. Isso é necessário porque a função `require` precisa conhecer o contexto de onde está sendo chamada para resolver corretamente os caminhos dos módulos a serem importados.

## Conclusão

O método `createRequire` é uma ferramenta poderosa para trabalhar com módulos ES, e carregar módulos CommonJS, arquivos JSON e módulos nativos dentro de um contexto de módulo ES. Isso fornece flexibilidade ao integrar diferentes sistemas de módulos e ao migrar ou manter projetos que usam tanto módulos CommonJS quanto módulos ES.