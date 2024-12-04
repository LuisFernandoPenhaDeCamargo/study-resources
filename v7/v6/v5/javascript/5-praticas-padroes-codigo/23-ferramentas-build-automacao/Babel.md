# Babel

Babel é uma ferramenta amplamente usada no ecossistema JavaScript para transpilação de código. Basicamente, Babel permite que você escreva código JavaScript utilizando as versões mais recentes da linguagem (incluindo recursos que podem não ser suportados por todos os navegadores ou ambientes) e o transforma em uma versão mais antiga e amplamente compatível do JavaScript.

## Principais Funções

### 1. Transpilar código

Babel converte o código escrito em versões mais recentes do JavaScript (ES6, ES7, etc.) para um versão que seja suportada por todos os navegadores mais antigos ou ambientes que não suportam os recursos mais novos. Por exemplo, Babel pode converter sintaxe de classes, arrow functions, e outros recursos modernos para versões mais antigas.

### 2. Suporte a plugins

Babel é altamente configurável e suporta uma vasta gama de plugins que podem ser usados para transformar o código de maneiras específicas. Isso inclui plugins para transformar sintaxe específica, como `async/await`, decorators, JSX (usado no React), e muito mais.

### 3. Presets

Em vez de configurar cada plugin individualmente, Babel oferece "presets", que são conjuntos de plugins que ajudam a transformar o código de maneira abrangente. Um dos presets mais populares é o `@babel/preset-env`, que automaticamente inclui os plugins necessários com base nas configurações do ambiente alvo (como versões específicas de navegadores).

### 4. Compatibilidade com ferramentas de build

Babel se integra facilmente com diversas ferramentas de build como Webpack, Parcel, Gulp, e outros, permitindo que o código seja transpilado como parte do processo de build.

### 5. Polifill

Embora Babel seja excelente para converter sintaxe, algumas funcionalidades novas de JavaScript (como `Array.prototype.includes` ou `Promise`) não são apenas sobre sintaxe, mas também sobre novas APIs que não existem em navegadores mais antigos. Para isso, o Babel pode incluir "polifills" que adicionam essas funcionalidades quando necessário.

## Usos Comuns

Quando usar Babel?

- **Suporte a navegadores antigos:** se você precisa suportar navegadores mais antigos que não têm suporte completo para as novas versões do JavaScript
- **Uso de sintaxe moderna:** se você deseja usar as últimas funcionalidades da linguagem, sem se preocupar com a compatibilidade imediata
- **Trabalhando com React/JSX:** Babel é amplamente usado para transformar o código JSX em JavaScript que pode ser executado em navegadores

## Exemplo

Se você escrever um código em ES6:

```JavaScript
const greet = () => {
    console.log("Hello, World!");
};
```

Babel pode transpilar isso para ES5:

```JavaScript
var greet = function() {
    console.log("Hello, World!");
}
```

Babel é essencial para desenvolvedores que querem aproveitar as últimas funcionalidades da linguagem JavaScript sem sacrificar a compatibilidade com diferentes ambientes de execução.

### Sumário

- [`@babel/core`](#core)
- [`@babel/cli`](#cli)
- [`@babel/preset-env`](#preset-env)
- [Resumindo o Papel de Cada Componente](#resumindo-papel-cada-componente)
- [babel.config.json x .babelrc](#babelconfigjson-x-babelrc)

# <a id="core">`@babel/core`</a>

O `@babel/core` é o núcleo do Babel e é responsável por todo o processo de transformação do código. Ele fornece a API central que lida com a interpretação, a análise (parsing), a transformação e a geração do código.

## Principais Funções

### 1. Parsing

O Babel converte o código-fonte em uma estrutura de dados intermediária conhecida como Abstract Syntax Tree (AST). Isso permite que o código seja analisado e manipulado programaticamente.

### 2. Transformação

Utilizando plugins e presets, o Babel pode aplicar transformações ao AST. Por exemplo, pode converter sintaxe moderna de JavaScript (ES6+) em uma versão mais antiga e compatível com navegadores antigos ou ambientes que não suportam novas funcionalidades.

### 3. Geração de código

Depois que as transformações são aplicadas, o AST é convertido de volta em código JavaScript.

### 4. Gestão de plugins e presets

O `@babel/core` carrega e aplica os plugins e presets que realizam transformações específicas no código. Por exemplo, o preset `@babel/preset-env` é usado para converter ES6+ em ES5.

O `@babel/core` é o motor por trás dessas operações, gerenciando todas as etapas do processo de transpilação do código.

# <a id="cli">`@babel/cli`</a>

O `@babel/cli` é uma ferramenta de linha de comando que permite que você execute o Babel diretamente no terminal. Ele facilita a compilação de arquivos JavaScript usando o Babel sem a necessidade de configurar um script de build mais complexo.

## Principais Funções

### 1. Transpilar arquivos ou diretórios

Com o `@babel/cli`, você pode facilmente transpilar arquivos JavaScript individuais ou diretórios inteiros de código. Por exemplo, você pode converter todos os seus arquivos **.mjs** em **.cjs** de uma só vez.

### 2. Especificar configurações de transpilação

Você pode passar presets e plugins diretamente na linha de comando ou configurar um arquivo **.babelrc** para determinar como o código será transformado.

### 3. Opções de saída

O `@babel/cli` permite especificar o diretório de saída para os arquivos transformados ou sobreescrever os arquivos originais. Também pode gerar mapas de origem (source maps) para ajudar na depuração.

### 4. Automatização

Pode ser facilmente integrado em scripts npm, pipelines CI/CD, ou qualquer outra ferramenta de automação para transpilar o código como parte do processo de build.

## Exemplo

Suponha que você tenha uma pasta **src/** com arquivos ESM e queira transpilar para CJS, colocando a saída na pasta **lib/**.

1. Primeiro, você instala o `@babel/cli` e o preset `@babel/preset-env` (que é comumente usado para transpilar código ES6+ para ES5)

```Bash
$npm install --save-dev @babel/core @babel/cli @babel/preset-env
```

2. Crie um arquivo de configuração **.babelrc** para usar o preset `@babel/preset-env`

```JSON
{
    "presets": ["@babel/preset-env"]
}
```

3. Execute o Babel via CLI para transpilar o código

```Bash
$npx babel src --out-dir lib
```

Isso transpilará todos os arquivos JavaScript na pasta **src/** e colocará os arquivos convertidos na pasta **lib/**.

### Exemplo de Script no package.json

Você pode adicionar um script no **package.json** para automatizar o processo:

```JSON
"scripts": {
    "build": "babel src --out-dir lib"
}
```

Então, você pode rodar:

```Bash
$npm run build
```

## Observações Importantes

Você ainda precisa do `@babel/cli` se for utilizar scripts no **package.json** para executar o Babel, porque o `@babel/cli` é o que fornece a funcionalidade de linha de comando que você vai invocar dentro desses scripts.

O npm chama o comando `babel`, que é fornecido pelo `@babel/cli`. Sem o `@babel/cli` instalado, o comando `babel` não estaria disponível, e o npm não seria capaz de executar a tarefa de transpilação.

Então, mesmo usando scripts no **package.json**, você precisa do `@babel/cli` instalado no seu projeto para que o Babel funcione através desses scripts.

# <a id="preset-env">`@babel/preset-env`</a>

O `@babel/preset-env` é um preset do Babel que permite que você transpile seu código JavaScript Moderno para uma versão mais antiga e compatível com uma ampla gama de navegadores e ambientes. Ele faz isso analisando o ambiente de execução que você deseja suportar (por exemplo, navegadores específicos, versões do Node.js, etc.) e inclui automaticamente os plugins necessários para transformar os recursos modernos do JavaScript (ES6+).

## Principais Características

1. **Alvo configurável:** você pode especificar quais navegadores ou versões do Node.js você deseja suportar. Com base nessa configuração, o `@babel/preset-env` determinará quais transformações e polyfills são necessários
2. **Polyfilling automático:** ele pode adicionar automaticamente polyfills para APIs modernas do JavaScript que não são suportadas em ambientes mais antigos. Isso pode ser feito em conjunto com a biblioteca core-js
3. **Compactação:** o preset só inclui as transformações e polyfills que são realmente necessários para o seu ambiente alvo, o que ajuda a manter o tamanho do código final mais enxuto
4. **Suporte a módulos:** ele pode transpilar módulos ES para CommonJS, AMD, UMD, ou outros formatos, dependendo do ambiente de destino

## Exemplo

```JSON
{
    "presets": [
        ["@babel/preset-env", {
            "targets": {
                "browsers": ["> 0.25%", "not dead"],
                "node": "current"
            },
            "useBuiltIns": "usage",
            "corejs": 3
        }]
    ]
}
```

Neste exemplo:

- `targets` especifica que o código deve ser compatível com qualquer navegador usado por mais de 0,25% dos usuários e com a versão atual do Node.js
- `useBuiltIns`: `usage` adiciona polyfills automaticamente com base nos recursos do código que realmente são usados
- `corejs`: `3` indica que deve usar a versão 3 do core-js para os polyfills

O `@babel/preset-env` é uma ferramenta essencial para garantir que o seu código JavaScript funcione em uma ampla gama de ambientes, sem que você precise gerenciar manualmente todos os detalhes das transformações e polyfills necessários.

# <a id="resumindo-papel-cada-componente">Resumindo o Papel de Cada Componente (`@babel/core`, `@babel/cli`, `@babel/preset-env`)</a>

- `@babel/core` realiza a transpilação do código usando as transformações e plugins fornecidos
- `@babel/cli` invoca o Babel através de comandos na linha de comando ou scripts
- `@babel/preset-env` informa ao Babel (`@babel/core`) quais transformações aplicar com base nas configurações de ambientes que você definiu

# <a id="">babel.config.json x .babelrc</a>

O arquivo **babel.config.json** e o **.babelrc** são usados para configurar o Babel, mas existem diferenças no escopo e na forma como essas configurações são aplicadas.

### .babelrc

- **Escopo:** as configurações no **.babelrc** são aplicadas localmente ao diretório onde o arquivo está localizado e seus subdiretórios
- **Formato:** arquivo de configuração baseado em JSON, com o nome **.babelrc**
- **Usos comuns:** ideal para projetos pequenos ou pacotes individuais onde a configuração do Babel deve ser limitada a uma parte específica do código

### babel.config.json

- **Escopo:** o **babel.config.json** tem um escopo global para todo o projeto. As configurações nele definidas são aplicadas a todos os arquivos do projeto, independente do diretório em que estão localizados
- **Formato:** arquivo de configuração baseado em JSON, mas com o nome **babel.config.json**
- **Usos comuns:** recomendado para projetos maiores ou monorepos onde uma configuração consistente do Babel é necessária em todo o projeto

### Quando Usar Cada Um

- **.babelrc:** use quando você precisar de configurações específicas do Babel apenas para um subdiretório ou parte do projeto
- **babel.config.json:** use quando você quiser definir uma configuração global do Babel que se aplique a todo o projeto

Esses dois arquivos podem coexistir, mas o **babel.config.json** geralmente tem precedência sobre o **.babelrc** se ambos estiverem presentes.

# [[Próximo tópico: ESLint]](./ESlint.md)