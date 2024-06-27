# README (JavaScript)

Anotações para mim mesmo:

- Quando os subtópicos forem adicionados por mim, irei pontuar um "LF" em parênteses ao final dele
- O "M" entre parênteses ao final do subtópico indica que eu o modifiquei. Nos parênteses, também devo pontuar o que foi alterado

## Fundamentos de JavaScript

O que é JavaScript?

### 1. Sintaxe e Tipos de Dados

- Variáveis (var, let, const)
- Tipos de dados primitivos (string, number, boolean, null, undefined, symbol)
- Operadores (aritméticos, comparação, lógicos)

### 2. Estruturas de Controle

- Condicionais (if, else, switch)
- Laços de repetição (for, while, do...while)
- Break e continue

### 3. Funções

- Declaração de funções
- Funções anônimas (M. Desmembrei este subtópico em dois, este e o abaixo eram um só)
- Arrow functions
- Funções de ordem superior
- Parâmetros e valores de retorno

### 4. Objetos e Arrays

- O que são objetos? (LF)
- Objetos Globais (LF)
- Métodos dos Objetos (LF)
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

### 7. Programação Assíncrona

- O que é assincronicidade? (LF)
- Callbacks
- Promises
- Async/await

Devo pontuar aqui o que são os módulos CommonJS e os módulos ES? Sobre os módulos ES:

- Por enquanto o arquivo que trata dos tópicos abaixo se chama **commonjs-es.md**
- O termo para se referir ao CommonJS e o ES é mesmo "módulos"?
- Eu posso dizer que eles possuem versões? Qual é o termo mais adequado?
- Quantos existem e quais features cada um adicionou ao Node.js?
- Como eu utilizo da sintaxe do CommonJS em conjunto com a sintaxe do ES, por exemplo, import e require no mesmo arquivo <--

### 8. Módulos

- Import e export (ES6 Modules)
- CommonJS (require, module.exports)

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

## Ferramentas e Bibliotecas

### 14. Node.js

- Introdução ao Node.js
- Módulos core (fs, http, path, etc.)
- NPM (Node Package Manager)
- Boas práticas na hora de dar upgrade na versão do Node.js

### 15. Frameworks e Bibliotecas Populares

- React.js
- Angular
- Vue.js
- jQuery (para manipulação de DOM mais antiga)

### [16. Testes Automatizados](./testes-automatizados/)

- [Mocha](./testes-automatizados/Mocha.md)
- Chai
- Jest
- Cypress

## Práticas e Padrões de Código

### 17. Boas Práticas

- Código limpo
- Modularização
- Comentários e documentação

### 18. Padrões de Projeto

- Padrões comuns (Singleton, Factory, Observer, etc.)
- Aplicação de padrões em JavaScript

### 19. Metodologias de Desenvolvimento

- Test-Driven Development (TDD)
- Behavior-Driven Development (BDD)

### [20. Ferramentas de Build e Automação](./ferramentas-build-automacao/)

- [Webpack](./ferramentas-build-automacao/Webpack.md)
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