# README (JavaScript)

- Se você encontrar algum conceito ou termo que não entende em um tópico em questão, não se preocupe, eles serão explicados mais a frente
- No sumário abaixo há subseções que foram pontuadas porque eu achei necessário destacar a existência delas, mas fique atento ao fato de que nem toda subseção foi listada

## [Fundamentos de JavaScript](./fundamentos-javascript/)

### [1. Sintaxe e Tipos de Dados](./fundamentos-javascript/sintaxe-tipos-dados/)

- [JavaScript](./fundamentos-javascript/sintaxe-tipos-dados/javascript.md)
- [Variáveis](./fundamentos-javascript/sintaxe-tipos-dados/variaveis.md)
- [Tipos de Dados Primitivos](./fundamentos-javascript/sintaxe-tipos-dados/tipos-dados-primitivos.md)
- [Dinamicamente Tipada](./fundamentos-javascript/sintaxe-tipos-dados/dinamicamente-tipada.md)
- [Escopo](./fundamentos-javascript/sintaxe-tipos-dados/escopo.md)
- [Operadores](./fundamentos-javascript/sintaxe-tipos-dados/operadores.md)

### [2. Estruturas de Controle](./fundamentos-javascript/estruturas-controle/)

- [Condicionais](./fundamentos-javascript/estruturas-controle/condicionais.md)
    + [Operador Condicional (Ternário)](./fundamentos-javascript/estruturas-controle/condicionais.md#ternario)
- Laços de Repetição (`for`, `while`, do...while) <--
- Break e Continue

### [3. Funções](./fundamentos-javascript/funcoes/)

- Declaração de Funções
- Funções Anônimas
- [Arrow Functions](./fundamentos-javascript/funcoes/arrow-functions.md)
- [IIFE (Immediately Invoked Function Expressions)](./fundamentos-javascript/funcoes/iife.md)
- [Funções de Ordem Superior](./fundamentos-javascript/funcoes/funcoes-ordem-superior.md)
- Parâmetros e Valores de Retorno

### [4. Objetos e Arrays](./fundamentos-javascript/objetos-arrays/)

- [Objetos](./fundamentos-javascript/objetos-arrays/objetos.md)
    + [Objetos Declarados com `const`](./fundamentos-javascript/objetos-arrays/objetos.md#objetos-declarados-const)
    + [Comparando dois Objetos](./fundamentos-javascript/objetos-arrays/objetos.md#comparando-objetos)
- [Operadores](./fundamentos-javascript/objetos-arrays/operadores.md)
- Objetos Globais
- Criação e Manipulação de Objetos
- [Template Literals](./fundamentos-javascript/objetos-arrays/template-literals.md) <--
    + [Utilizando a Crase Dentro de um Template Literal](./fundamentos-javascript/objetos-arrays/template-literals.md#utilizando-acento-grave-dentro-template-literal)
- [Tipos de Objetos](./fundamentos-javascript/objetos-arrays/objetos/README.md)
- [Métodos de Objetos](./fundamentos-javascript/objetos-arrays/metodos-objetos/README.md)
- [Namespaces](./fundamentos-javascript/objetos-arrays/namespaces.md)
- Criação e Manipulação de Arrays
- Métodos de Array (`map`, `filter`, `reduce`, `forEach`, etc.)

## [Conceitos Intermediários](./conceitos-intermediarios/)

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

### [8. Módulos](./conceitos-intermediarios/modulos/)

Devo pontuar aqui o que são os módulos CommonJS e os módulos ES? Sobre os módulos ES:

+ O termo para se referir ao CommonJS e ao ES é mesmo "módulos"?
+ Eu posso dizer que eles possuem versões? Qual é o termo mais adequado?
+ Quantos existem e quais features cada um adicionou ao Node.js?

- [O que são módulos?](./conceitos-intermediarios/modulos/modulos.md)
    + [Escopo de Módulo](./conceitos-intermediarios/modulos/modulos.md#escopo-modulo)
- Importações e Exportações nos Módulos CommonJS
- [Importações e Exportações nos Módulos ES](./conceitos-intermediarios/modulos/importacoes-exportacoes-modulos-es.md)
- [Módulos CommonJS e Módulos ES no Mesmo Arquivo](./conceitos-intermediarios/modulos/modulos-commonjs-modulos-es-mesmo-arquivo.md)
- [Import dinâmico](./conceitos-intermediarios/modulos/import-dinamico.md)
    + [Importação Dinâmica de Exportação Padrão](./conceitos-intermediarios/modulos/import-dinamico.md#importacao-dinamica-exportacao-padrao)

## Técnicas Avançadas

### 9. Prototipagem e Herança

- Prototipagem e Herança Prototípica
- Classes (ES6)
- Métodos Estáticos e de Instância

### 10. Manipulação de JSON

- `JSON.parse` e `JSON.stringify`

### 11. Tratamento de Erros

- `try`/`catch`
- Lançamentos de Erros (`throw`)

### 12. Armazenamento no Navegador

- Cookies
- LocalStorage e SessionStorage

### 13. Trabalhando com APIs

- Fetch API
- AJAX com XMLHttpRequest
- Manipulação de Dados de API

## [Ferramentas e Bibliotecas](./ferramentas-bibliotecas/Nodejs/)

### [14. Node.js](./ferramentas-bibliotecas/)

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

### [15. Bibliotecas](./ferramentas-bibliotecas/bibliotecas/)

- [esmock](./ferramentas-bibliotecas/bibliotecas/esmock.md)

### 16. Frameworks Populares

- React.js
- Angular
- Vue.js
- jQuery (para manipulação de DOM mais antiga)

### [17. Testes Automatizados](./ferramentas-bibliotecas/testes-automatizados/)

- [Testes Unitários](./ferramentas-bibliotecas/testes-automatizados/testes-unitarios.md)
- [Mocha](./ferramentas-bibliotecas/testes-automatizados/Mocha.md)
- [Chai](./ferramentas-bibliotecas/testes-automatizados/Chai.md)
- [Biblioteca de Assertivas](./ferramentas-bibliotecas/testes-automatizados/biblioteca-assertivas.md)
- [Sinon](./ferramentas-bibliotecas/testes-automatizados/Sinon.md)
    + [Stubs](./ferramentas-bibliotecas/testes-automatizados/Sinon.md#stubs)
    + [Mocks](./ferramentas-bibliotecas/testes-automatizados/Sinon.md#mocks)
- [Criando Testes para uma Função](./ferramentas-bibliotecas/testes-automatizados/criando-testes-funcao.md)
- [Cucumber](./ferramentas-bibliotecas/testes-automatizados/Cucumber.md)
- Jest
- Cypress
- [Testes de Integração](./ferramentas-bibliotecas/testes-automatizados/testes-integracao.md)
- [Testes de Regressão](./ferramentas-bibliotecas/testes-automatizados/testes-regressao.md)

## [Práticas e Padrões de Código](./praticas-padroes-codigo/)

### 18. Boas Práticas

- Código Limpo
- Modularização
- Comentários e Documentação

### 19. Padrões de Projeto

- Padrões Comuns (Singleton, Factory, Observer, etc.)
- Aplicação de Padrões em JavaScript

### [20. Metodologias de Desenvolvimento](./praticas-padroes-codigo/metodologias-desenvolvimento.md)

- [Test-Driven Development (TDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#tdd)
- [Behavior-Driven Development (BDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#bdd)

### [21. Ferramentas de Build e Automação](./praticas-padroes-codigo/ferramentas-build-automacao.md)

- [Webpack](./praticas-padroes-codigo/ferramentas-build-automacao.md#webpack)
- Babel
- ESLint
- Prettier

## Performance e Segurança

### 22. Otimização de Código

- Melhores Práticas de Desempenho
- Profiling e Debugging

### 23. Segurança

- Prevenção de Vulnerabilidades Comuns (XSS, CSRF, etc.)
- Práticas de Segurança em Desenvolvimento Web

## Projetos Práticos

### 24. Projetos de Exemplo

- Aplicação ToDo List
- Aplicação CRUD com uma API RESTful
- Jogo Simples (ex.: Jogo da Velha)

## Recursos Adicionais

### 25. Comunidade e Fóruns

- Stack Overflow
- GitHub
- Reddit (r/javascript)

### 26. Documentação e Tutoriais

- MDN Web Docs
- W3Schools
- Eloquent JavaScript (livro)