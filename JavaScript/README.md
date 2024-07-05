# README (JavaScript)

Anotações para mim mesmo.

- Quando os subtópicos forem adicionados por mim, irei pontuar um "LF" em parênteses ao final dele
- O "M" entre parênteses ao final do subtópico indica que eu o modifiquei. Nos parênteses, também devo pontuar o que foi alterado

### Sumário

## [Fundamentos de JavaScript (OK)](./fundamentos-javascript/)

No sumário abaixo, há subseções que foram pontuadas porque eu achei necessário destacar a existência delas, mas fique atento ao fato de que nem toda subseção foi listada.

### 1. Sintaxe e Tipos de Dados

- O que é JavaScript? (LF)
- Variáveis (var, let, const)
- Tipos de dados primitivos (string, number, boolean, null, undefined, symbol)
- Operadores (aritméticos, comparação, lógicos)

### 2. Estruturas de Controle

- Condicionais (if, else, switch)
- Laços de repetição (for, while, do...while)
- Break e continue

### [3. Funções](./fundamentos-javascript/funcoes.md)

- Declaração de funções
- Funções anônimas (M. Desmembrei este subtópico em dois, este e o abaixo eram um só)
- [Arrow functions](./fundamentos-javascript/funcoes.md#arrow-functions)
- [IIFE (Immediately Invoked Function Expressions)](./fundamentos-javascript/funcoes.md#iife)
- Funções de ordem superior
- Parâmetros e valores de retorno

### 4. Objetos e Arrays

- O que são objetos? (LF)
- Objetos Globais (LF)
- Criação e manipulação de objetos
- Métodos de objetos
- Criação e manipulação de arrays
- Métodos de array (map, filter, reduce, forEach, etc.)

## [Conceitos Intermediários](./conceitos-intermediarios/)

### 5. Manipulação do DOM

- Seleção de elementos (getElementById, querySelector, etc.)
- Modificação de elementos (innerHTML, textContent, etc.)
- Manipulação de atributos e estilos
- Manipulação de classes

### 6. Eventos

- Tipos de eventos (click, submit, keydown, etc.)
- Adicionar e remover event listeners
- Delegação de eventos

### [7. Programação Assíncrona](./conceitos-intermediarios/programacao-assincrona.md)

- O que é assincronicidade? (LF)
- Callbacks
- Promises
- [`then`/`catch` (OK)](./conceitos-intermediarios/programacao-assincrona.md#thencatch)
- Async/await

Devo pontuar aqui o que são os módulos CommonJS e os módulos ES? Sobre os módulos ES:

- O termo para se referir ao CommonJS e ao ES é mesmo "módulos"?
- Eu posso dizer que eles possuem versões? Qual é o termo mais adequado?
- Quantos existem e quais features cada um adicionou ao Node.js?

### [8. Módulos](./conceitos-intermediarios/modulos/)

- Importações e Exportações nos Módulos CommonJS
- [Importações e Exportações nos Módulos ES (OK)](./conceitos-intermediarios/modulos/importacoes-exportacoes-modulos-es.md)
- [CommonJS e ES Modules no Mesmo Arquivo](./conceitos-intermediarios/modulos.md#commonjs-es-mesmo-arquivo) <--
- [Import dinâmico](./conceitos-intermediarios/modulos.md#import-dinamico)

## Técnicas Avançadas

### 9. Prototipagem e Herança

- Prototipagem e herança prototípica
- Classes (ES6)
- Métodos estáticos e de instância

### 10. Manipulação de JSON

- JSON.parse e JSON.stringify

### 11. Tratamento de Erros

- Try/catch
- Lançamentos de erros (throw)

### 12. Armazenamento no Navegador

- Cookies
- LocalStorage e SessionStorage

### 13. Trabalhando com APIs

- Fetch API
- AJAX com XMLHttpRequest
- Manipulação de dados de API

## [Ferramentas e Bibliotecas](./ferramentas-bibliotecas/Nodejs/)

### [14. Node.js](./ferramentas-bibliotecas/)

- Introdução ao Node.js
- [Módulos nativos (ou core)](./ferramentas-bibliotecas/Nodejs.md#modulos-nativos)
- [Módulos internos](./ferramentas-bibliotecas/Nodejs.md#modulos-internos)
- [`module`](./ferramentas-bibliotecas/Nodejs.md#modulos-internos-module)
    + [`createRequire`](./ferramentas-bibliotecas/Nodejs.md#modulos-internos-module-createrequire)
- [Módulos Nativos x Módulos Internos](./ferramentas-bibliotecas/Nodejs.md#modulos-nativos-x-modulos-internos)
- [Erros Enfrentados](./ferramentas-bibliotecas/Nodejs/erros-enfrentados.md)
- NPM (Node Package Manager)
- Boas práticas na hora de dar upgrade na versão do Node.js

### 15. Frameworks e Bibliotecas Populares

- React.js
- Angular
- Vue.js
- jQuery (para manipulação de DOM mais antiga)

### [16. Testes Automatizados](./ferramentas-bibliotecas/testes-automatizados/)

- [Testes unitários](./ferramentas-bibliotecas/testes-automatizados.md#testes-unitarios)
- [Mocha (OK)](./ferramentas-bibliotecas/testes-automatizados/Mocha.md)
- [Chai (OK)](./ferramentas-bibliotecas/testes-automatizados/Chai.md)
- [Biblioteca de Assertivas](./ferramentas-bibliotecas/testes-automatizados.md#biblioteca-assertivas)
- [Sinon (OK)](./ferramentas-bibliotecas/testes-automatizados/Sinon.md)
    + [Stubs](./ferramentas-bibliotecas/testes-automatizados/Sinon.md#stubs)
    + [Mocks](./ferramentas-bibliotecas/testes-automatizados/Sinon.md#mocks)
- [Criando Testes para uma Função](./ferramentas-bibliotecas/testes-automatizados.md#criando-testes-funcao)
- [Cucumber](./ferramentas-bibliotecas/testes-automatizados.md#cucumber)
- Jest
- Cypress
- [Testes de Integração (OK)](./ferramentas-bibliotecas/testes-automatizados/testes-integracao.md)
- [Testes de Regressão (OK)](./ferramentas-bibliotecas/testes-automatizados/testes-regressao.md)

## [Práticas e Padrões de Código](./praticas-padroes-codigo/)

### 17. Boas Práticas

- Código limpo
- Modularização
- Comentários e documentação

### 18. Padrões de Projeto

- Padrões comuns (Singleton, Factory, Observer, etc.)
- Aplicação de padrões em JavaScript

### [19. Metodologias de Desenvolvimento](./praticas-padroes-codigo/metodologias-desenvolvimento.md)

- [Test-Driven Development (TDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#tdd)
- [Behavior-Driven Development (BDD)](./praticas-padroes-codigo/metodologias-desenvolvimento.md#bdd)

### [20. Ferramentas de Build e Automação](./praticas-padroes-codigo/ferramentas-build-automacao.md)

- [Webpack](./praticas-padroes-codigo/ferramentas-build-automacao.md#webpack)
- Babel
- ESLint
- Prettier

## Performance e Segurança

### 21. Otimização de Código

- Melhores práticas de desempenho
- Profiling e debugging

### 22. Segurança

- Prevenção de vulnerabilidades comuns (XSS, CSRF, etc.)
- Práticas de segurança em desenvolvimento web

## Projetos Práticos

### 23. Projetos de Exemplo

- Aplicação ToDo List
- Aplicação CRUD com uma API RESTful
- Jogo simples (ex.: jogo da velha)

## Recursos Adicionais

### 24. Comunidade e Fóruns

- Stack Overflow
- GitHub
- Reddit (r/javascript)

### 25. Documentação e Tutoriais

- MDN Web Docs
- W3Schools
- Eloquent JavaScript (livro)