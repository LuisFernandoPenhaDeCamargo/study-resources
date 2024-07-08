# Mocha

Mocha é um framework de teste para JavaScript que roda em Node.js e no navegador, desenvolvido para tornar a escrita de teste simples e divertida. Ele permite a criação de testes de unidade e de integração, com suporte a vários estilos assertivos e bibliotecas de mocks.

## Principais Características

### 1. Flexibilidade

Mocha não impõe nenhuma estrutura específica para seus testes, permitindo que os desenvolvedores escolham suas próprias bibliotecas de assertivas (como Chai), bibliotecas de mocks (como Sinon) e abordagens de estruturação de testes.

### 2. Suporte a `async`

Suporta testes assíncronos com facilidade, utilizando callbacks e promises, também aceita a sintaxe `async`/`await`.

### 3. Hooks de ciclo de vida

Fornece hooks (`before`, `after`, `beforeEach`, `afterEach`) para configurar e limpar o ambiente de teste, permitindo que você execute código antes e depois de cada teste ou grupo de testes.

### 4. Relatórios de saída

Vários repórteres disponíveis para saída de resultados de testes, desde simples relatórios de linha de comando até relatórios mais complexos em HTML, JSON e outros formatos.

### 5. Fácil integração

Integra-se facilmente com ferramentas de automação de testes e de integração contínua, como Jenkins, Travis CI e outros.

## Estrutura de Testes com Mocha

- **Suites (**`describe`**):** agrupamentos de testes relacionados
- **Testes (**`it`**):** blocos de código que testam uma funcionalidade específica
- **Hooks (**`before`**,** `after`**,** `beforeEach`**,** `afterEach`**):** blocos de código executados em pontos específicos do ciclo de vida dos testes

## Hooks de Ciclo de Vida

- **before:** executado uma vez antes de todos os testes no bloco
- **after:** executado uma vez após todos os testes no bloco
- **beforeEach:** executado antes de cada teste no bloco
- **afterEach:** executado após cada teste no bloco

## Observações Importantes

**Não importa aonde o hook está sendo invocado dentro da suite**, por exemplo, aonde o método `before` está sendo invocado dentro da suite criada pelo método `describe`. O método `before`, no caso do exemplo anterior, será executado uma vez **antes de todos os testes no bloco**.

# Métodos e Propriedades

### Sumário

- [`describe`](#describe)
- [`it`](#it)
- [`before`](#before)
- [`beforeEach`](#beforeeach)
- [`after`](#after)
- [`afterEach`](#aftereach)

## <a id="describe">`describe`</a>

O método `describe` é utilizado para **agrupar um conjunto de testes relacionados (para criar suites)**, ele define um bloco de teste que descreve uma funcionalidade específica ou um componente do código que está sendo testado. Dentro de um bloco `describe`, você pode definir vários testes individuais usando o método `it`.

### Sintaxe Básica

```JavaScript
describe(description, callback);
```

- `description` **:** uma **string** que descreve o conjunto de testes
- `callback` **:** uma **função** que contém as definições dos testes e os hooks

## <a id="it">`it`</a>

O método `it` é utilizado para **definir casos de testes individuais**, cada bloco `it` representa um teste específico que você deseja executar. Dentro desse bloco, você escreve o código para configurar o teste, realizar as ações necessárias e fazer as assertivas para verificar se o comportamento do código está conforme esperado.

### Sintaxe Básica

```JavaScript
it(description, callback([done]));
```

- `description` **:** uma **string** que descreve o caso de teste que se deve verificar
- `callback` **:** uma **função** que contém o código do teste e as assertivas que verificam o comportamento esperado
    + `done`**:** função a ser chamada quando o teste assíncrono estiver completo. Isso é particularmente útil para testes que envolvem operações assíncronas, como chamadas de API, temporizadores ou promessas

## <a id="before">`before`</a>

O Método `before` é utilizado para **definir um bloco de código que será executado antes de qualquer teste dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
before(callback);
```

- `callback`**:** uma **função** a ser executada antes dos testes

## <a id="beforeeach">`beforeEach`</a>

A função `beforeEach` é utilizada para **definir um bloco de código que será executado antes de cada teste dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
beforeEach(callback);
```

- `callback`**:** uma função a ser executada antes de cada teste

## <a id="after">`after`</a>

O método `after` é utilizado para **definir um bloco de código que será executado após todos os testes dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
after(callback);
```

- `callback`**:** uma **função** a ser executada após todos os testes

## <a id="aftereach">`afterEach`</a>

O método `afterEach` é utilizado para definir um bloco de código que será executado após cada teste dentro de um determinado escopo (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
afterEach(callback);
```

- `callback`**:** uma **função** a ser executada após cada teste