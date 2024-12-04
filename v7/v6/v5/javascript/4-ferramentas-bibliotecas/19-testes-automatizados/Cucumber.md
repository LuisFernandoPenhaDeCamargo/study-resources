# Cucumber

Cucumber é uma ferramenta de software de código aberto que suporta BDD. Ela permite que você escreva especificações de software em um formato compreensível tanto por técnicos quanto por não técnicos, usando uma linguagem de domínio específica chamada Gherkin.

## Principais Características

### 1. Especificações executáveis

As especificações são escritas em Gherkin, uma linguam simples de texto estruturado, e podem ser executadas como testes automatizados.

### 2. Integração com ferramentas de teste

O Cucumber pode ser integrado com várias bibliotecas e frameworks de teste, como JUnit, RSpec, Selenium, etc.

### 3. Suporte multiplataforma

O Cucumber suporta diversas linguagens de programação, incluindo Ruby, Java, JavaScript, C#, Python, entre outras.

### 4. Foco na colaboração

Promove a colaboração entre desenvolvedores, testadores e stakeholders através de uma linguagem comum e especificações claras.

## Sintaxe Gherkin

Gherkin é a linguagem utilizada para escrever especificações no Cucumber. Abaixo estão os componentes básicos da sintaxe Gherkin:

- **Feature:** define a funcionalidade que está sendo especificada
- **Scenario:** descreve um exemplo específico de como a funcionalidade deve se comportar
- **Given:** define o contexto inicial do cenário
- **When:** descreve a ação que é realizada no cenário
- **Then:** descreve o resultado esperado da ação
- **And:** conecta passos adicionais em Given, When ou Then

## Benefícios

### 1. Comunicação clara

Promove uma comunicação clara e concisa entre todos os envolvidos no projeto.

### 2. Documentação viva

As especificações em Gherkin servem como documentação viva que descreve o comportamento do sistema

### 3. Facilidade de manutenção

As especificações são de fácil manutenção e atualização conforme o sistema evolui

### 4. Testes automatizados

Permite a automação dos testes a partir das especificações, garantindo que o comportamento esperado do sistema seja validado continuamente.

## Exemplo

### 1. Instalação

```Bash
$ npm install --save-dev @cucumber/cucumber
```

### 2. Estrutura do projeto

Crie a seguinte estrutura de diretórios:

```Bash
project-root/
└── features/
│   ├── login.feature
│   └── step_definitions/
│       └── login.step.js
└── package.json
```

### 3. Escreva o arquivo de feature (login.feature)

Especificação escrita em Gherkin.

```Gherkin
Feature: Login no sistema
    Scenario: Login com sucesso
        Given que o usuário está na página de login
        And o usuário tem um nome de usuário e senha válidos
        When o usuário insere o nome do usuário e senha
        And clica no botão de login
        Then o usuário deve ser redirecionado para a página inicial
        And deve ver uma mensagem de boas-vindas
```

### 4. Defina os passos (login.step.js)

```JavaScript
// Exemplo que não foi testado, mas já fique ciente que Chai é um módulo ES.
const { Given, When, Then } = require("@cucumber/cucumber");
const { expect }            = require("chai");
const { Builder, By }       = require("selenium-webdriver");

let driver;

Given("que o usuário está na página de login", async function () {
    driver = new Builder().forBrowser("firefox").build();
    await driver.get("http://localhost:3000/login");
});

Given("o usuário tem um nome de usuário e senha válidos", function () {
    this.username = "validUser";
    this.password = "validPassword";
});

When("o usuário insere o nome de usuário e senha", async function () {
    await driver.findElement(By.id("username")).sendKeys(this.username);
    await driver.findElement(By.id("password")).sendKeys(this.password);
});

When("clica no botão de login", async function () {
    await driver.findElement(By.id("login-button")).click();
});

Then("o usuário deve ser redirecionado para a página inicial", async function () {
    const url = await driver.getCurrentUrl();

    expect(url).to.be.equal("http://localhost:3000/home");
});

Then("deve ver uma mensagem de boas-vindas", async function () {
    const message = await driver.findElement(By.css(".welcome-message")).getText();

    expect(message).to.be.equal("Welcome, validUser!");
});
```

### 5. Configuração no package.json

```JSON
{
    "scripts": {
        "test": "cucumber-js"
    }
}
```

### 6. Executar os testes

```Bash
$ npm test
```

## Conclusão

O Cucumber é uma ferramenta poderosa para BDD, permitindo que equipes de desenvolvimento, QA, stackholders colaborem de maneira eficaz na definição e validação do comportamento do sistema. Ao utilizar especificações executáveis e uma linguagem comum, o Cucumber ajuda a garantir que o software desenvolvido atenda às expectativas do usuário final e aos requisitos de negócio.