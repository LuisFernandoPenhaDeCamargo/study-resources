# Node.js

### Sumário

- [Módulos Nativos (ou Core)](#modulos-nativos)
- [Módulos Internos](#modulos-internos)
- [`module`](#modulos-internos-module)
    + [`createRequire`](#modulos-internos-module-createrequire)
- [Módulos Nativos x Módulos Internos](#modulos-nativos-x-modulos-internos)

# <a id="modulos-nativos">Módulos Nativos (ou Core)</a>

Módulos Nativos e Módulos Core são geralmente sinônimos e podem ser utilizados de forma intercambiável, eles são módulos que vêm integrados com o ambiente de execução (como Node.js) e não requerem instalação adicional, fazendo parte da distribuição padrão. Estão diretamente acessíveis através da função `require`, por exemplo, e alguns deles (ou partes deles) são escritos em C/C++ para obter melhor performance ou para acessar funcionalidades de baixo nível do SO.

Módulos escritos (ou partes deles) em C/C++ são chamados de bindings nativos, por exemplo, o módulo `crypto` utiliza bindings C/C++ para acessas bibliotecas criptográficas nativas. Ainda assim, tenha em mente, que a maioria dos módulos core do Node.js é implementada em JavaScript para facilitar manutenção e extensibilidade.

# <a id="modulos-internos">Módulos Internos</a>

Módulos internos (built-in) são partes do código Node.js que não são expostas diretamente para desenvolvedores via `require`, por exemplo. Eles são usados internamente pela própria implementação do Node.js.

Não são diretamente acessíveis para os desenvolvedores em código comum, em vez disso, são utilizados pelo próprio Node.js para implementar funcionalidades expostas através de módulos nativos ou outras APIs.

Observe que o módulo [`module`](#modulos-internos-module) é um caso especial, ele não é um módulo nativo no sentido comum, como o `fs`, por exemplo, mas é um módulo interno do Node.js que está disponível para uso. Abaixo falaremos melhor sobre as funcionalidades dele.

### Sumário

- [`module`](#modulos-internos-module)

# <a id="modulos-internos-module">`module`</a>

`module` é um dos módulos internos (built-in) do Node.js que fornece informações e funcionalidades relacionadas à carga e à definição de módulos no ambiente Node.js. Ele é parte do sistema de módulos do Node.js, que permite dividir o código em partes reutilizáveis e organizadas.

## Principais Características

### 1. Acessar informações do módulo atual

O objeto `module` fornece informações sobre o módulo atual, como seu ID, caminho do arquivo, dependências, etc.

```JavaScript
console.log(module.id);       // ID do módulo.
console.log(module.filename); // Caminho completo do arquivo.
console.log(module.loaded);   // Indica se o módulo foi carregado completamente.
```

### 2. Cache de módulos

Todos os módulos carregados são armazenados em cache para evitar carregamentos duplicados. O `module` permite acessar e manipular essa cache.

```JavaScript
console.log(require.cache); // Exibe todos os módulos em cache.
```

### 3. Resolução de caminho de módulo

O método estático `Module.__resolveFilename` pode ser usado para resolver o caminho completo de um módulo.

```JavaScript
const Module = require("module");

const resolvedPath = Module.__resolveFilename("express");

console.log(resolvedPath); // Caminho completo do módulo Express.
```

### 4. Criação e carregamento de módulos

Você pode criar e carregar novo módulos dinamicamente usando o `module`.

```JavaScript
const newModule = new module.constructor();

newModule.__compile("module.exports = () => console.log('Hello, World!');", "newModule.js");
newModule.exports(); // Executa a função exportada pelo novo módulo.
```

### 5. Método `require` local

Cada módulo tem seu próprio método `require`, que pode ser usado para carregar outros módulos.

```JavaScript
const fs = module.require("fs");  // Carrega o módulo `fs` usando o método `require` local.

console.log(fs.readFileSync);     // Exibe a função `readFileSync` do módulo `fs`.
```

## Exemplo

```JavaScript
// Exibir informações sobre o módulo atual.
console.log("ID do módulo:", module.id);
console.log("Caminho do arquivo:", module.filename);
console.log("Módulo carregado:", module.loaded);

// Listar todos os módulos em cache.
console.log("Módulos em chace:", Object.keys(require.cache));

// Resolver o caminho completo de um módulo.
const Module = require("module");
const path = Module._resolveFilename("express");
console.log("Caminho completo do módulo Express:", path);

// Criar e carregar um novo módulo dinamicamente.
const newModule = new module.constructor();

newModule._compile("module.exports = () => console.log('Hello, Dynamic Module!')", "dynamicModule.js");
newModule.exports(); // Executa a função exportada pelo novo módulo.
```

## Conclusão

O módulo `module` do Node.js é uma ferramenta poderosa que oferece controle detalhado sobre o comportamento e o gerenciamento de módulos na sua aplicação. Ele é especialmente útil para desenvolvedores que precisam de flexibilidade adicional ao trabalhar com módulos, seja para depuração, manipulação de cache, ou carregamento dinâmico de código.

# <a id="modulos-internos-module-createrequire">`createRequire`</a>

O método `createRequire` é uma funcionalidade do Node.js que permite criar uma função `require` personalizada em um módulo, especialmente útil ao trabalhar com [ES Modules (ESM) quando você precisa carregar CommonJS modules](../conceitos-intermediarios/modulos.md#commonjs-es-mesmo-arquivo). Isso é parte do módulo [`module`](#module).

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
- Útil em ES Modules, onde o `require` global não está disponível

### 2. Carregar CommonJS Modules em ES Modules

- Permite que você use `require` dentro de um ES Module para carregar um módulo CommonJS

### 3. Carregar JSON e Nativos

- Além de módulos JavaScript, você pode carregar arquivos JSON e módulos nativos (compilados em C/C++)

## Exemplos

```JavaScript
// example.js
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

### `import.meta.url`

`import.meta.url` é uma propriedade disponível nos módulos ES que contém a URL completa do módulo atual, incluindo o protocolo `file://`. É utilizada como argumento para `createRequire` para que a função `require` saiba a localização do módulo atual. Isso é necessário porque a função `require` precisa conhecer o contexto de onde está sendo chamada para resolver corretamente os caminhos dos módulos a serem importados.

## Conclusão

O método `createRequire` é uma ferramenta poderosa para trabalhar com ES Modules e carregar CommonJS modules, arquivos JSON e módulos nativos dentro de um contexto de ES Module. Isso fornece flexibilidade ao integrar diferentes sistemas de módulos e ao migrar ou manter projetos que usam tanto CommonJS quanto ES Modules.

# <a id="modulos-nativos-x-modulos-internos">Módulos Nativos x Módulos Internos</a>

- **Módulos Nativos:** parte da API pública do Node.js, disponível diretamente para desenvolvedores, sem a necessidade de instalação
- **Módulos Internos:** parte da implementação interna do Node.js, não destinados ao uso direto pelo desenvolvedores