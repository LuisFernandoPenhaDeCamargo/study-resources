# Testes Unitários

### Sumário

- [TDD e BDD](#tdd-bdd)
- [Bibliotecas de Asserção](#bibliotecas-assercao)
- [Mocha](#mocha)

# <a id="tdd-bdd">TDD e BDD</a>

TDD (Test Driven Development) e BDD (Behavior Driven Development) são duas metodologias de desenvolvimento de software que enfatizam a importância de testes para garantir a qualidade e a funcionalidade do código. Embora ambos enfoquem a escrita de testes, eles têm abordagens e objetivos ligeiramente diferentes.

## TDD

É uma metodologia de desenvolvimento onde os testes são escritos antes do código de produção. O ciclo de desenvolvimento em TDD segue três passos principais, conhecidos como Red-Green-Refactor:

1. **Red:** escreva um teste unitário que falha, pois a funcionalidade ainda não foi implementada
2. **Green:** implemente o código mínimo necessário para fazer o teste passar
3. **Refactor:** refatore o código, melhorando a sua estrutura e qualidade sem alterar seu comportamento externo

### Benefícios

- **Qualidade do código:** garante que o código seja testável e modular
- **Menos bugs:** bugs são identificados e corrigidos no ciclo de desenvolvimento
- **Documentação:** os testes servem como documentação viva do comportamento do código

### Exemplo

```JavaScript
// Teste em Mocha + Chai.
const { expect } = require("chai");

describe("Calculadora.", function() {
    it("Deve adicionar dois números.", function () {
        const resultado = adicionar(2, 3);
        
        expect(resultado).to.equal(5);
    });
});

// Implementação.
function adicionar(a, b) {
    return a + b;
}
```

## BDD

BDD é uma extensão do TDD que foca no comportamento do software a partir da perspectiva do usuário. BDD utiliza uma linguagem mais natural e legível por humanos para descrever os testes, facilitando a colaboração entre desenvolvedores, testadores e stakeholders não técnicos.

### Benefícios

- **Comunicação:** melhora a comunicação entre todos os membros da equipe
- **Foco no usuário:** garante que o desenvolvimento seja guiado pelo comportamento esperado do software
- **Documentação:** os testes servem como uma documentação compreensível do comportamento do sistema

### Exemplo

```JavaScript
// Teste em Mocha + Chai.
const { expect } = require("chai");

describe("Calculadora.", function() {
    context("Quando adicionanddo dois números", function() {
        it("deve retornar a soma dos números", function() {
            const resultado = adicionar(2, 3);

            expect(resultado).to.equal(5);
        });
    });
});

// Implementação.
function adicionar(a, b) {
    return a + b;
}
```

## Difereças entre TDD e BDD

### 1. Foco

- **TDD:** foco em garantir que o código esteja correto
- **BDD:** foco em garantir que o comportamento do sistema esteja correto e em alinhamento com as expectativas do usuário

### 2. Linguagem

- **TDD:** geralmente usa uma linguagem mais técnica e específica para descrever os testes
- **BDD:** usa uma linguagem natural, muitas vezes utilizando frameworks como Cucumber para descrever testes em uma linguagem próxima ao inglês natural

### 3. Colaboração

- **TDD:** principalmente entre desenvolvedores
- **BDD:** entre desenvolvedores, testadores e stakeholders não técnicos

## Conclusão

Ambas as metodologias, TDD e BDD, são práticas valiosas no desenvolvimento de software, ajudando a garantir a qualidade e a funcionalidade do código. A escolha entre TDD e BDD pode depender das necessidades específicas do projeto e da equipe, bem como do nível de colaboração necessário entre desenvolvedores e stakeholders.

# <a id="bibliotecas-assercao">Bibliotecas de Asserção</a>

Uma biblioteca de asserção é uma ferramenta usada em testes automatizados para verificar se o código funciona conforme esperado. Essas bibliotecas fornecem uma variedade de funções (asserções) que permitem comparar o valor real obtido do código testado com o valor esperado. Se a comparação falhar, a asserção gera um erro, indicando que o teste não passou.

O principal objetivo das bibliotecas de asserção é facilitar a escrita de testes claros e compreensíveis, permitindo que os desenvolvedores expressem suas expectativas sobre o comportamento do código de maneira concisa e legível.

### Principais Funcionalidades

1. **Comparações simples:** verificações de igualdade, diferença, maior que, menor que, etc.
    - **Exemplo:** `expect(resultado).to.equal(5);`
2. **Verificações de tipos:** verificação de tipos de dados
    - **Exemplo:** `expect(resultado).to.be.a("string");`
3. **Verificações de propriedades:** verificações de propriedades de objetos
    - **Exemplo:** `expect(objeto).to.have.property("nome");`
4. **Verificações de lançamento de erros:** verificações se uma função lança um erro quando chamada
    - **Exemplo:** `expect(funcao).to.throw(Error);`

### Bibliotecas de Asserção Populares (Chai)

Chai é uma das bibliotecas de asserção mais populares para JavaScript, conhecida por sua flexibilidade e suporte para três estilos de interface: assert, expect, should.

- **assert:** sintaxe tradicional de TDD

```JavaScript
const assert = require("chai").assert;

assert.equal(resultado, 5, "Resultado deve ser 5.");
```

- **expect:** sintaxe encadeável de BDD

```JavaScript
const expect = require("chai").expect;

expect(resultado).to.equal(5);
```

- **should:** sintaxe de asserção baseada em propriedades

```JavaScript
const should = require("chai").should();

resultado.should.equal(5);
```

### Exemplo do Mocha e Chai

```JavaScript
// adicao.js
function adicao(a, b) {
    return a + b;
}

module.exports = adicao;

// ./test/adicao.js
const { expect } = require("chai");
const adicao = require("./adicao");

describe("Função adicao.", function() {
    it("Deve retornar a soma de dois números.", function() {
        const resultado = adicao(2, 3);

        expect(resultado).to.equal(5);
    });

    it("Deve retornar um número negativo se a soma for negativa.", function() {
        const resultado = adicao(-2, -3);

        expect(resultado).to.equal(-5);
    });
});
```

Em seu **package.json**, inclua:

```JSON
{
    "scripts:" {
        "test": "mocha"
    }
}
```

e execute os testes com o comando abaixo no terminal

```Bash
$npm test
```

# <a id="mocha">Mocha</a>

Mocha é um framework de testes que roda no Node.js e no navegador, projetado para facilitar a escrita de testes de unidade e testes assíncronos. É amplamente utilizado devido à sua flexibilidade e suporte extensivo para diferentes estilos de interface e bibliotecas de asserção.

## Principais Características

### 1. Suporte a testes assíncronos

- Mocha facilita a execução de testes assíncronos, permitindo o uso de callbacks, promises e as palavras-chave `async`/`await` para lidar com operações assíncronas

### 2. Flexibilidade de interface

- Mocha suporta diferentes estilos de interface, como TDD e BDD
- Com TDD, você usa `suite()`, `test()`, `setup()` e `teardown()`
- Com BDD, você usa `describe()`, `it()`, `before()`, `after()`, `beforeEach()` e `afterEach()`

### 3. Integrável com outras bibliotecas

- Mocha não vem com uma biblioteca de asserção própria, permitindo que você escolha a biblioteca que melhor se adapte às suas necessidades

### 4. Suporte a Hooks

- Mocha permite a definição de hooks (`before`, `after`, `beforeEach`, `afterEach`) para configurar e limpar o ambiente de teste antes e depois de cada teste ou conjunto de testes

### 5. Extensível com plugins e repórteres

- Mocha pode ser estendido com plugins e repórteres personalizados para adaptar a saída e a funcionalidade aos requisitos específicos do projeto

## Hooks

Hooks são funções que são executadas em momentos específicos durante o ciclo de vida dos testes, permitindo configurar e limpar o ambiente de teste de maneira eficaz.

```JavaScript
describe("Usuário.", function() {
    let usuario;

    // Executa antes de todos os testes.
    before(function() {
        usuario = new Usuario();
    });

    // Executa depois de todos os testes.
    after(function() {
        usuario.cleanup();
    });

    // Executa antes de cada teste.
    beforeEach(function() {
        usuario.init();
    });

    // Executa depois de cada teste.
    afterEach(function() {
        usuario.reset();
    });

    it("Deve possuir um nome.", function() {
        expect(usuario.nome).to.exist;
    });

    it("Deve salvar com sucesso.", function() {
        expect(usuario.save()).to.be.true;
    });
});
```