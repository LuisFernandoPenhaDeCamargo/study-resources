# Testes Automatizados

### Sumário

- [Testes Unitários](#testes-unitarios)
- [Mocha](#mocha)
- [Chai](#chai)
- [Biblioteca de Assertivas](#biblioteca-assertivas)
- [Criando Testes para uma Função](#criando-testes-funcao)
- [Cucumber](#cucumber)

# <a id="testes-unitarios">Testes Unitários</a>

Testes unitários são uma forma de teste de software que verifica a menor parte do código aplicável, chamada de "unidade". Uma unidade pode ser uma função, método, procedimento, módulo, ou objeto. O objetivo dos testes unitários é garantir que cada unidade do código funcione conforme o esperado.

## Principais Características

### 1. Isolamento

Testes unitários isolam a unidade de código dos outros componentes do sistema. Isso significa que depedências externas, como banco de dados, serviços externos, ou até mesmo outras partes do código, **são simuladas (mocked)** ou **substituídas por dublês (stubs)**.

### 2. Automatização

Os teste unitários são frequentemente automatizados para serem executados rapidamente e frequentemente, geralmente como parte de um processo de integração contínua.

### 3. Rapidez

Por serem focados em pequenas partes do código e serem executados de forma isolada, os testes unitários tendem a ser rápidos.

### 4. Determinismo

Testes unitários devem ser determinísticos, ou seja, a mesma entrada deve sempre produzir a mesma saída, independente do ambiente em que são executados.

### 5. Documentação

Servem como documentação do comportamento esperado do código. Quando bem escritos, os testes unitários podem ajudar os desenvolvedores a entender o que o código deve fazer.

## Benefícios

1. **Detecção precoce de erros:** ajudam a identificar erros e problemas no código logo no início do ciclo de desenvolvimento
2. **Facilidade de refatoração:** proporcionam segurança ao refatorar o código, garantindo que as mudanças não quebrem funcionalidades existentes
3. **Confiança no código:** aumentam a confiança dos desenvolvedores na estabilidade e na qualidade do código
4. **Documentação:** fornecem uma forma viva de documentação sobre como o código deve se comportar

## Conclusão

Os testes unitários são uma prática essencial no desenvolvimento de software que ajudam a garantir que cada parte individual do código funcione conforme o esperado. Eles são rápidos, isolados, automatizados e determinísticos, proporcionando benefícios significativos como detecção precoce de erros, facilidade de refatoração e maior confiança no código.

# <a id="mocha">Mocha</a>

Mocha é um framework de teste para JavaScript que roda em Node.js e no navegador, desenvolvido para tornar a escrita de teste simples e divertida. Ele permite a criação de testes de unidade e de integração, com suporte a vários estilos assertivos e bibliotecas de mocks.

## Principais Características

### 1. Flexibilidade

Mocha não impõe nenhuma estrutura específica para seus testes, permitindo que os desenvolvedores escolham suas próprias bibliotecas de assertivas (como Chai), bibliotecas de mocks (como Sinon), e abordagens de estruturação de testes.

### 2. Suporte a `async`

Suporta testes assíncronos com facilidade, utilizando callbacks e promises, também aceita a sintaxe `async`/`await`.

### 3. Hooks de ciclo de vida

Fornece hooks (`before`, `after`, `beforeEach`, `afterEach`) para configurar e limpar o ambiente de teste, permitindo que você execute código antes e depois de cada teste ou grupo de testes.

### 4. Relatórios de saída

Vários repórteres disponíveis para saída de resultados de testes, desde simples relatórios de linha de comando até relatórios mais complexos em HTML, JSON e outros formatos.

### 5. Fácil integração

Integra-se facilmente com ferramentas de automação de testes e de integração contínua, como Jenkins, Travis CI, e outros.

## Estrutura de Testes com Mocha

- **Suites (**`describe`**):** agrupamentos de testes relacionados
- **Testes (**`it`**):** blocos de código que testam uma funcionalidade específica
- **Hooks (**`before`**,** `after`**,** `beforeEach`**,** `afterEach`**):** blocos de código executados em pontos específicos do ciclo de vida dos testes

## Hooks de Ciclo de Vida

- **before:** executado uma vez antes de todos os testes no bloco
- **after:** executado uma vez após todos os testes no bloco
- **beforeEach:** executado antes de cada teste no bloco
- **afterEach:** executado após cada teste no bloco

## Sumário

- [`describe`](#mocha-describe)
- [`it`](#mocha-it)
- [`before`](#mocha-before)
- [`beforeEach`](#mocha-beforeeach)
- [`after`](#mocha-after)
- [`afterEach`](#mocha-aftereach)

## <a id="mocha-describe">`describe`</a>

O método `describe` é utilizado para **agrupar um conjunto de testes relacionados (para criar suites)**, ele define um bloco de teste que descreve uma funcionalidade específica ou um componente do código que está sendo testado. Dentro de um bloco `describe`, você pode definir vários testes individuais usando o método `it`.

### Sintaxe Básica

```JavaScript
describe(title, callback);
```

- `title` **:** uma **string** que descreve o conjunto de testes
- `callback` **:** uma **função** que contém as definições dos testes e os hooks

## <a id="mocha-it">`it`</a>

O método `it` é utilizado para **definir casos de testes individuais**, cada bloco `it` representa um teste específico que você deseja executar. Dentro desse bloco, você escreve o código para configurar o teste, realizar as ações necessárias e fazer as assertivas para verificar se o comportamento do código está conforme esperado.

### Sintaxe Básica

```JavaScript
it(title, callback)
```

- `title` **:** uma **string** que descreve o caso de teste que se deve verificar
- `callback` **:** uma **função** que contém o código do teste e as assertivas que verificam o comportamento esperado

## <a id="mocha-before">`before`</a>

O Método `before` é utilizado para **definir um bloco de código que será executado antes de qualquer teste dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
before(callback);
```

- `callback`**:** uma **função** a ser executada antes dos testes

## <a id="mocha-beforeeach">`beforeEach`</a>

A função `beforeEach` é utilizada para **definir um bloco de código que será executado antes de cada teste dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
beforeEach(callback);
```

- `callback`**:** uma função a ser executada antes de cada teste

## <a id="mocha-after">`after`</a>

O método `after` é utilizado para **definir um bloco de código que será executado após todos os testes dentro de um determinado escopo** (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
after(callback);
```

- `callback`**:** uma **função** a ser executada após todos os testes

## <a id="mocha-aftereach">`afterEach`</a>

O método `afterEach` é utilizado para definir um bloco de código que será executado após cada teste dentro de um determinado escopo (geralmente um `describe`).

### Sintaxe Básica

```JavaScript
afterEach(callback);
```

- `callback`**:** uma **função** a ser executada após cada teste

# <a id="chai">Chai</a>

Chai é uma biblioteca de assertivas para JavaScript que pode ser utilizada com qualquer framework de teste, como Mocha, Jasmine ou Jest. Ele fornece uma maneira simples e expressiva de escrever testes, permitindo que os desenvolvedores verifiquem se os resultados esperados correspondem aos resultados reais do código testado.

## Principais Características

### 1. Estilos de assertivas

- **BDD (Behavior Driven Development):** `expect` e `should`
- **TDD (Test Driven Development):** `assert`

### 2. Interface flexíveis

- **Expect/should:** estilo mais legível e descritivo, adequado para escrita de testes que leem como frases em inglês
- **Assert:** estilo clássico e direto, mais semelhante a outras bibliotecas de asssertivas

### 3. Plugins

Chai suporta uma variedade de plugins que estendem suas funcionalidades, como `chai-as-promised` para trabalhar com promises e `chai-http` para testar APIs HTTP.

## Estilos de Assertivas

```JavaScript
// BDD com `expect`.
import { expect } from "chai";

expect(2 + 2).to.equal(4);
expect([1, 2, 3]).to.be.an("array").that.includes(2);
expect("foo").to.have.lengthOf(3);

// BDD com `should`.
import { should } from "chai";

(2 + 2).should.equal(4);
[1, 2, 3].should.be.an("array").that.includes(2);
"foo".should.have.lengthOf(3);

// TDD com `assert`.
import { assert } from "chai";

assert.equal(2 + 2, 4);
assert.isArray([1, 2, 3]);
assert.lengthOf("foo", 3);
```

## Plugins

### Chai-as-Promised

Chai-as-Promised é um plugin para Chai que adiciona assertivas para trabalhar com promises.

```JavaScript
import { expect } from "chai";
import chaiAsPromised from "chai-as-promised";

chai.use(chaiAsPromised);

async function fetchData() {
    return "data";
}

expect(fetchData()).to.eventually.equal("data");
```

### Chai-HTTP

Chai-HTTP é um plugin para Chai que facilita o teste de APIs HTTP.

```JavaScript
import { expect } from "chai";
import chaiHttp from "chai-http";

chai.use(chaiHttp);

import app from "../app"; // Supondo que app é a sua aplicação Express.

describe("GET /users", () => {
    it("should return all users", (done) => {
        chai.request(app);
            .get("./users")
            .end((err, res) => {
                expect(res).to.have.status(200);
                expect(res.body).to.be.an("array");
                done();
            })
    })
});
```

# <a id="biblioteca-assertivas">Biblioteca de Assertivas</a>

Uma biblioteca de assertivas é uma ferramenta que fornece um conjunto de funções ou métodos para realizar verificações em seu código durante os testes. Essas verificações são chamadas de assertivas (ou assertions, em inglês), e elas comparam os resultados esperados com os resultados reais obtidos pelo código que está sendo testado. Se a assertiva falhar (ou seja, se o resultado real não corresponder ao esperado), a biblioteca de assertivas lança um erro, indicando que algo está errado no código que está sendo testado.

## Principais Funções

### 1. Comparações simples

- Verificar se um valor é igual ao outro
- Verificar se um valor é verdadeiro ou falso

### 2. Verificações de tipos

Verificar se um valor é de um tipo específico.

### 3. Verificações de propriedades

Verificar se um objeto tem uma propriedade específica.

### 4. Verificações de estrutura de dados

- Verificar o tamanho de arrays ou strings
- Verificar se um array contém um elemento específico

### 5. Verificações avançadas

- Verificar se uma função lança um erro quando chamada
- Verificar o conteúdo de objetos complexos

## Benefícios

- **Clareza:** assertivas tornam os testes mais legíveis e compreensíveis
- **Facilidade de uso:** bibliotecas de assertivas fornecem métodos simples para verificar resultados esperados
- **Flexibilidade:** muitas bibliotecas de assertivas suportam diferentes estilos de escrita de testes, permitindo que os desenvolvedores escolham o que melhor se adapta ao seu fluxo de trabalho
- **Diagnóstico:** quando uma assertiva falha, as mensagens de erro claras ajudam a diagnosticar rapidamente o problema

# <a id="criando-testes-funcao">Criando Testes para uma Função</a>

Tome como exemplo a função abaixo, iremos criar testes para ela:

```JavaScript
const si = require("systeminformation");
const axios = require("axios");

const os = require("os");
const fs = require("fs");
const crypto = require("crypto");

module.exports = class SensitiveDataGetters {
    // Responsável por obter o token de acesso.
    static async getAccessToken() {
        try {
            let disks = await si.diskLayout();

            disks = disks.find(disk => disk.device === "/dev/sda").serialNum;

            const cpuModel = os.cpus()[0].model;
            const macAddress = fs.readFileSync("/sys/class/net/eth0/address", "utf8").trim();
            const hardwareInfo = `${disks}|${cpuModel}|${macAddress}`;
            const hash = crypto.createHash("sha512");

            hash.update(hardwareInfo);

            const token = hash.digest("hex");

            /*
            - Endpoint para o qual você fornece o hash do servidor e obtém um token de acesso
            - Aqui, ainda não sabemos o enviroment do servidor, por isso a URL não pode ser dinâmica
            */
            const url = `https://exemplo.net:443/v2/servers/${process.env.SERVER_ID}/auth`;
            const response = await axios.post(url, { token });

            return response.data.access_token;
        } catch (error) {
            console.error(`[ Failed to generate server token ], ${error.message}`);
        }
    }
}
```

Para testar a função `getAccessToken` com o Mocha, o Chai e o Sinon, você pode seguir os seguintes passos:

### 1. Instale o Mocha, o Chai e o Sinon

```Bash
$ npm install --save-dev mocha chai sinon
```

### 2. Crie um arquivo de teste

```JavaScript
// Por exemplo: ./test/getAccessToken.test.mjs.

import sinon from "sinon";
import axios from "axios";
import { expect } from "chai";

import SensitiveDataGetters from "../services/sensitive_data_getters.js";

describe("getAccessToken", () => {
  let postStub;

  beforeEach(() => {
    postStub = sinon.stub(axios, "post");
  });

  afterEach(() => {
    postStub.restore();
  });

  it("should return an access token when the request is successful", async () => {
    const fakeResponse = { data: { access_token: "fake_access_token" } };
    postStub.resolves(fakeResponse);

    const token = await SensitiveDataGetters.getAccessToken();

    expect(token).to.equal("fake_access_token");
    expect(postStub.calledOnce).to.be.true;
    expect(postStub.calledWith(`https://example.net:443/v2/servers/${process.env.SERVER_ID}/auth`)).to.be.true;
  });

  it("should log an error message when the request fails", async () => {
    const consoleErrorStub = sinon.stub(console, "error");
    const fakeError = new Error("Request failed");
    postStub.rejects(fakeError);

    const token = await SensitiveDataGetters.getAccessToken();

    expect(token).to.be.undefined;
    expect(consoleErrorStub.calledOnce).to.be.true;
    expect(consoleErrorStub.calledWith(`[ Failed to generate server token ], ${fakeError.message}`)).to.be.true;

    consoleErrorStub.restore();
  });
});
```

### 3. Configue o Mocha no seu package.json para rodar os testes

```JSON
{
    "scripts:" {
        "test": "mocha"
    }
}
```

### 4. Execute os testes

```Bash
$ npm test
```

## Nome do Diretório

Considerando o exemplo acima, se atente que o nome do diretório não precisa ser obrigatoriamente "**./test/**". É uma convenção comum usar "test" ou "tests" para armazenar arquivos de teste, mas você pode nomear o diretório como quiser, o importante é que o Mocha saiba onde encontrar os arquivos de teste.

Por padrão, o Mocha procura arquivos de teste no diretório "**./test/**", se você usar um diretório diferente, precisará especificar o caminho ao executar o Mocha.

### Exemplo

Vamos supor que você tenha a seguinte estrutura abaixo:

```Bash
my-project/
└── src/
    ├── services/
    │   └── sensitive_data_getters.js
    ├── custom-tests/
    │   └── getAccessToken.test.js
    ├── index.js
    └── package.json
```

Neste exemplo, os testes estão no diretório "**./custom-tests/"**.

### Configurando o Mocha para Usar um Diretório Personalizado

Ajuste o script `test` no seu **package.json** para incluir o diretório personalizado.

```JSON
{
    "scripts": {
        "test": "mocha custom-tests"
    }
}
```

## Nome do Arquivo

O sufixo **.test** no nome do arquivo, como em **getAccessToken.test.js**, é uma convenção comum usada para indicar que o arquivo contém testes automatizados. Essa convenção é útil por vários motivos:

1. **Clareza e organização:** facilita a identificação dos arquivos de teste no seu projeto, diferenciando-os claramente dos arquivos de código em produção
2. **Configuração de ferramentas:** ferramentas de teste e automação (como o Mocha, o Jest, etc.) frequentemente utilizam de convenções de nomenclatura para localizar e executar arquivos de teste automaticamente. Usar o sufixo **.test.js** permite que essas ferramentas detectem facilmente quais arquivos contêm testes
3. **Manutenção:** ajuda a manter o código organizado, especialmente em projetos grandes, onde é essencial distinguir entre o código de aplicação e o código de teste

Por exemplo, se você está usando o Mocha e tem um arquivo **getAccessToken.test.js**, o Mocha pode ser configurado para encontrar e executar todos os arquivos que terminam com **.test.js**:

```JSON
{
    "scripts": {
        "test": "mocha '**/*.test.js'"
    }
}
```

Isso instruirá o Mocha a procurar por arquivos que terminam com **.test.js** em qualquer diretório e subdiretório e executá-lo como parte da suíte de testes.

Observe que não há um padrão obrigatório para o nome dos arquivos de teste, mas há convenções comuns que muitos desenvolvedores e projetos seguem. Uma dessas convenções é nomear os arquivos de teste de forma que seja fácil identificar o que está sendo testado. Isso facilita a manutenção e a compreensão do código.

Aqui estão algumas convenções populares:

### 1. Nome da função

Se você tem uma função chamada `getAccessToken`, o arquivos de teste pode ser nomeado como **getAccessToken.test.js**.

### 2. Nome do módulo

Se você tem um módulo chamado **auth**, o arquivo de teste pode ser nomeado como **auth.test.js**.

### 3. Uso de subdiretórios para organizar testes por funcionalidade ou módulo

Considerando as situações acima, você pode ter uma estrutura de diretórios como:

```Bash
test/
└── auth/
    └── getAccessToken.test.js
```

Essas convenções ajudam a manter os testes organizados e facilmente identificáveis.

## Observações

Se você executar o Mocha sem especificar nenhum caminho ou padrão de arquivo, o Mocha, por padrão, procurará arquivos de teste apenas no diretório **./test/** e executará qualquer arquivo que esteja diretamente dentro desse diretório, com as extensões **.js**, **.mjs**, **.ts** e **.coffe**.

Isso significa que, por padrão, ele não busca recursivamente em subdiretórios dentro de **./test/**.

# <a id="cucumber">Cucumber</a>

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

As especificações são de fãcil manutenção e atualização conforme o sistema evolui

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

```gherkin
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
const { expect } = require("chai");
const { Builder, By } = require("selenium-webdriver");

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

    expect(url).to.equal("http://localhost:3000/home");
});

Then("deve ver uma mensagem de boas-vindas", async function () {
    const message = await driver.findElement(By.css(".welcome-message")).getText();

    expect(message).to.equal("Bem-vindo, validUser!");
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