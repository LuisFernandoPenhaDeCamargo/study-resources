# JavaScript

<!--
TODO: tópicos que vou estudar:

- `new`
- `new Obj` x `new Obj()`
- `new` em funções. Exemplo: `new exampleFunction()`
- `constructor`
- A "real interação" do `constructor` e o JavaScript
- `interface`
- `delete` de valores cujo tipo de dado é primitivo em ESM
- Array
    + `isArray`
    + `forEach`
    + `slice`
- `Date`
    + `getMonth`
    + `getDate`
    + `getHours`
    + `getMinutes`
    + `getSeconds`
- `Array.prototype.slice.call()`
- `process`
- `process.env`
- `util`
    + `inspect`
- `redis`
    + `createClient`
    + `on`
    + `auth`
    + `config`
- `have` (provavelmente uma cadeia de asserção)
- `request.path`
- `join`
- `include`
- `reset`
- `arguments`
- `push`
- `inspect`
- `replace`
- Me explique cada detalhe do log abaixo:

```Bash
<ref *1> [AsyncFunction: getTemporaryCredentials] {
  default: [Circular *1],
  getDatabasePassword: [AsyncFunction: getDatabasePassword],
  esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/services/sensitive_data_getters.mjs?esmk=1'
}
```

- O que significa o "`_`" no exemplo:
  + Qual é o nome deste símbolo?

```JavaScript
const _ = require("lodash");
```
-->

### Sumário

- [Fundamentos de JavaScript](#fundamentos-javascript)
- [Conceitos Intermediários](#conceitos-intermediarios)
- [Técnicas Avançadas](#tecnicas-avancadas)
- [Ferramentas e Bibliotecas](#ferramentas-bibliotecas)
- [Práticas e Padrões de Código](#praticas-padroes-codigo)
- [Performance e Segurança](#performance-seguranca)
- [Projetos Práticos](#projetos-praticos)
- [Recursos Adicionais](#recursos-adicionais)

# <a id="fundamentos-javascript">Fundamentos de JavaScript</a>

### 1. Sintaxe e Tipos de Dados

- [JavaScript](./fundamentos-Javascript/sintaxe-tipos-dados/JavaScript.md)
- [Declaração de Variáveis](./fundamentos-Javascript/sintaxe-tipos-dados/declaracao-variaveis.md)
- [Tipos de Dados Primitivos](./fundamentos-Javascript/sintaxe-tipos-dados/tipos-dados-primitivos.md)
- [Escopo](./fundamentos-Javascript/sintaxe-tipos-dados/escopo.md)
- [Operadores](./fundamentos-Javascript/sintaxe-tipos-dados/operadores.md)

### 2. Estruturas de Controle

- [Condicionais](./fundamentos-Javascript/estruturas-controle/condicionais.md)
- [Operadores](./fundamentos-Javascript/estruturas-controle/operadores.md)
- [Laços de Repetição](./fundamentos-Javascript/estruturas-controle/lacos-repeticao.md)
- [`break` e `continue`](./fundamentos-Javascript/estruturas-controle/break-continue.md)

### 3. Funções

- [Declaração de Funções](./fundamentos-Javascript/funcoes/declaracao-funcoes.md)
- [Operadores](./fundamentos-Javascript/funcoes/operadores.md)
- [Parâmetros e Valores de Retorno](./fundamentos-Javascript/funcoes/parametros-valores-retorno.md)
- [Arrow Functions](./fundamentos-Javascript/funcoes/arrow-functions.md)
- [Immediately Invoked Function Expressions (IIFE)](./fundamentos-Javascript/funcoes/iife.md)
- [Funções Anônimas](./fundamentos-Javascript/funcoes/funcoes-anonimas.md) <!-- <F -->
- [Funções de Ordem Superior](./fundamentos-Javascript/funcoes/funcoes-ordem-superior.md)

### 4. Objetos e Arrays

- [Objetos](./fundamentos-Javascript/objetos-arrays/objetos.md)
    + [Objetos Declarados com `const`](./fundamentos-Javascript/objetos-arrays/objetos.md#objetos-declarados-const)
    + [Comparando dois Objetos](./fundamentos-Javascript/objetos-arrays/objetos.md#comparando-objetos)
- [Operadores](./fundamentos-Javascript/objetos-arrays/operadores.md)
- Objetos Globais
- Criação e Manipulação de Objetos
- [Template Literals](./fundamentos-Javascript/objetos-arrays/template-literals.md)
    + [Utilizando a Crase Dentro de um Template Literal](./fundamentos-Javascript/objetos-arrays/template-literals.md#utilizando-acento-grave-dentro-template-literal)
- [Tipos de Objetos](./fundamentos-Javascript/objetos-arrays/tipos-objetos/README.md)
- [Métodos de Objetos](./fundamentos-Javascript/objetos-arrays/metodos-objetos/metodos-objetos.md)
- [Namespaces](./fundamentos-Javascript/objetos-arrays/namespaces.md)
- Criação e Manipulação de Arrays
- Métodos de Array (`map`, `filter`, `reduce`, `forEach`, etc.)

# <a id="conceitos-intermediarios">Conceitos Intermediários</a>

### 5. Manipulação do DOM

- Seleção de Elementos (getElementById, querySelector, etc.)
- Modificação de Elementos (innerHTML, textContent, etc.)
- Manipulação de Atributos e Estilos
- Manipulação de Classes

### 6. Eventos

- Tipos de Eventos (click, submit, keydown, etc.)
- Adicionar e Remover Event Listeners
- Delegação de Eventos

### [7. Programação Assíncrona](./conceitos-intermediarios/programacao-assincrona/)

- O que é Assincronicidade?
- Callbacks
- Promises
- [`then`/`catch`](./conceitos-intermediarios/programacao-assincrona/then-catch.md)
- `async`/`await`

### 8. Ecma Internacional e o ECMAScript

- [ECMA Internacional e o ECMAScript](./conceitos-intermediarios/ecma-internacional-ecmascript/ecma-internacional-ecmascript.md)
- [Resumo do ES1 ao ES13](./conceitos-intermediarios/ecma-internacional-ecmascript/resumo-es1-es13.md)
- [ES6](./conceitos-intermediarios/ecma-internacional-ecmascript/ES6.md)

### 9. Módulos

- [O que são módulos?](./conceitos-intermediarios/modulos/modulos.md)
    + [Escopo de Módulo](./conceitos-intermediarios/modulos/modulos.md#escopo-modulo)
- [Sistema de Módulos](./conceitos-intermediarios/modulos/sistema-modulos.md)
- [CJS](./conceitos-intermediarios/modulos/CJS.md)
- [ESM](./conceitos-intermediarios/modulos/ESM.md)
- [`strict mode`](./conceitos-intermediarios/modulos/strict-mode.md)
- Importações e Exportações nos Módulos CommonJS
- [Importações e Exportações nos Módulos ES](./conceitos-intermediarios/modulos/importacoes-exportacoes-modulos-es.md)
- [Módulos CommonJS e Módulos ES no Mesmo Arquivo](./conceitos-intermediarios/modulos/modulos-commonjs-modulos-es-mesmo-arquivo.md)
- [Import dinâmico](./conceitos-intermediarios/modulos/import-dinamico.md)
    + [Importação Dinâmica de Exportação Padrão](./conceitos-intermediarios/modulos/import-dinamico.md#importacao-dinamica-exportacao-padrao)

# <a id="tecnicas-avancadas">Técnicas Avançadas</a>

### 10. Prototipagem e Herança

- Prototipagem e Herança Prototípica
- [`obj.prototype` x Função Construtora](./tecnicas-avancadas/prototipagem-heranca.md/obj-prototype-x-funcao-construtora.md)
- Classes (ES6)
- Métodos Estáticos e de Instância

### 11. Manipulação de JSON

- `JSON.parse` e `JSON.stringify`

### 12. Tratamento de Erros

- `try`/`catch`
- Lançamentos de Erros (`throw`)

### 13. Armazenamento no Navegador

- Cookies
- LocalStorage e SessionStorage

### 14. Trabalhando com APIs

- Fetch API
- AJAX com XMLHttpRequest
- Manipulação de Dados de API

### 15. Expressões Regulares

- [Expressões Regulares](./tecnicas-avancadas/expressoes-regulares/expressoes-regulares.md)
- [Exemplos de Expressões Regulares](./tecnicas-avancadas/expressoes-regulares/exemplos-expressoes-regulares.md)

# <a id="ferramentas-bibliotecas">Ferramentas e Bibliotecas</a>

### [16. Node.js](./ferramentas-bibliotecas/)

- Introdução ao Node.js
- [Módulos Nativos (ou Core)](./ferramentas-bibliotecas/Nodejs/modulos-nativos.md)
- [Módulos Internos](./ferramentas-bibliotecas/Nodejs/modulos-internos.md)
    + [`module`](./ferramentas-bibliotecas/Nodejs/modulos-internos.md)
        - [`createRequire`](./ferramentas-bibliotecas/Nodejs/createrequire.md)
            + [`import.meta.url`](./ferramentas-bibliotecas/Nodejs/createrequire.md#importmetaurl)
- [Módulos Nativos x Módulos Internos](./ferramentas-bibliotecas/Nodejs/modulos-nativos-x-modulos-internos.md)
- [Erros Enfrentados](./ferramentas-bibliotecas/Nodejs/erros-enfrentados.md)
- NPM (Node Package Manager)
- Boas Práticas na Hora de Dar Upgrade na Versão do Node.js

### [17. Bibliotecas](./ferramentas-bibliotecas/bibliotecas/)

- [Sequelize](./ferramentas-bibliotecas/bibliotecas/Sequelize.md)
- [esmock](./ferramentas-bibliotecas/bibliotecas/esmock.md)

### 18. Frameworks Populares

- React.js
- Angular
- Vue.js
- jQuery (para manipulação de DOM mais antiga)

### [19. Testes Automatizados](./ferramentas-bibliotecas/testes-automatizados/)

- [Testes Unitários](./ferramentas-bibliotecas/testes-automatizados/testes-unitarios.md)
- [Mocha](./ferramentas-bibliotecas/testes-automatizados/Mocha.md)
- [Chai](./ferramentas-bibliotecas/testes-automatizados/Chai.md)
- [Biblioteca de Assertivas](./ferramentas-bibliotecas/testes-automatizados/biblioteca-assertivas.md)
- [Sinon.JS](./ferramentas-bibliotecas/testes-automatizados/SinonJS/SinonJS.md)
- [Desenvolvendo Testes para Funções](./ferramentas-bibliotecas/testes-automatizados/desenvolvendo-testes-funcoes.md)
- [Dificuldades Encontradas](./ferramentas-bibliotecas/testes-automatizados/dificuldades-encontradas/dificuldades-encontradas.md)
- [Cucumber](./ferramentas-bibliotecas/testes-automatizados/Cucumber.md)
- Jest
- Cypress
- [Testes de Integração](./ferramentas-bibliotecas/testes-automatizados/testes-integracao.md)
- [Testes de Regressão](./ferramentas-bibliotecas/testes-automatizados/testes-regressao.md)

# <a id="praticas-padroes-codigo">Práticas e Padrões de Código</a>

### 20. Boas Práticas

- Código Limpo
- Modularização
- Comentários e Documentação

### 21. Padrões de Projeto

- Padrões Comuns (Singleton, Factory, Observer, etc.)
- Aplicação de Padrões em JavaScript

### [22. Metodologias de Desenvolvimento](./praticas-padroes-codigo/metodologias-desenvolvimento.md)

- [Test-Driven Development (TDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#tdd)
- [Behavior-Driven Development (BDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#bdd)

### [23. Ferramentas de Build e Automação](./praticas-padroes-codigo/ferramentas-build-automacao.md)

- [Webpack](./praticas-padroes-codigo/ferramentas-build-automacao.md#webpack)
- Babel
- ESLint
- Prettier

# <a id="performance-seguranca">Performance e Segurança</a>

### 24. Particularidades da Linguagem

- [JS x Quantidade de Memória Alocada](./performance-segurança/particularidades-linguagem/JS-x-quantidade-memoria-alocada.md)

### 25. Otimização de Código

- Melhores Práticas de Desempenho
- Profiling e Debugging

### 26. Segurança

- Prevenção de Vulnerabilidades Comuns (XSS, CSRF, etc.)
- Práticas de Segurança em Desenvolvimento Web

# <a id="projetos-praticos">Projetos Práticos</a>

### 27. Projetos de Exemplo

- Aplicação ToDo List
- Aplicação CRUD com uma API RESTful
- Jogo Simples (ex.: Jogo da Velha)

# <a id="recursos-adicionais">Recursos Adicionais</a>

### 28. Comunidade e Fóruns

- Stack Overflow
- GitHub
- Reddit (r/javascript)

### 29. Documentação e Tutoriais

- MDN Web Docs
- W3Schools
- Eloquent JavaScript (livro)