# Testes Automatizados

### Sumário

- [Testes Unitários](#testes-unitarios)
- [Mocha](#mocha)
- [Chai](#chai)
- [Biblioteca de Assertivas](#biblioteca-assertivas)
- [Sinon](#sinon)
- [Criando Testes para uma Função](#criando-testes-funcao)

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

# <a id="sinon">Sinon</a>

Sinon é uma biblioteca para JavaScript que facilita a criação de espições (spies), esboços (stubs), e mocks, que são usados para testes unitários. É especialmente útil quando você precisa testar o comportamento de uma função ou módulo isoladamente, sem depender de suas dependências externas.

## Principais Funções

### 1. Espiões (spies)

- Monitoram as chamadas para funções existentes, registrando informações sobre cada chamada (como argumentos, valores de retorno, e exceções lançadas)
- Útil para verificar se uma função foi chamada, quantas vezes foi chamada, com quais argumentos, etc.

### <a id="sinon-stubs">2. Esboços (stubs)</a>

- Substituem funções existentes com funções que você controla completamente
- Permitem definir o comportamento de uma função (por exemplo, o valor de retorno ou se lança uma exceção)
- Útil para isolar a função que você está testando de suas dependências

### <a id="sinon-mocks">3. Mocks</a>

- São como esboços, mas com a capacidade adicional de definir expectativas (como está função deve ser chamada uma vez com esses argumentos)
- Útil para testes que verificam interações específicas entre diferentes partes do código

## Exemplos

```JavaScript
const sinon = require("sinon");

const myObj = {
    myMethod: function() {
        console.log("Method called.");
    },
    myOtherMethod: function () {
        return "Original value.";
    },
    myEmptyMethod: function() {},
};
// Usando spies.
const spy = sinon.spy(myObj, "myMethod");

myObj.myMethod();

console.log(spy.called);    // Output: true
console.log(spy.callCount); // Output: 1

// Usando stubs.
const stub = sinon.stub(myObj, "myOtherMethod").returns("Stubbed value.");

console.log(myObj.myOtherMethod()); // Output: Stubbed value.

// Usando mocks.
const mock = sinon.mock(myObj);

mock.expects("myEmptyMethod").once().withArgs("arg1", "arg2");
myObj.myEmptyMethod("arg1", "arg2");
mock.verify(); // Verifica se as expectativas foram atendidas, caso contrário, lança um erro.
```

## Beneficíos

- **Isolamento:** permite isolar a unidade de código que está sendo testada de suas depedências
- **Controle:** dá controle total sobre o comportamento de funções durante o teste
- **Flexibilidade:** suporta spies, stubs, e mocks, permitindo diferentes níveis de verificação e controle conforme necessário
- **Diagnóstico:** as ferramentas de verificação do Sinon ajudam a diagnosticar problemas ao verificar se as funções são chamadas corretamente

## Observações

Você não pode chamar a função `spy`, `stub` ou `mock.expects` no mesmo método.

## Conclusão

Sinon é uma ferramenta poderosa para desenvolvedores que escrevem testes unitários em JavaScript. Ela complementa bibliotecas de testes como o Chai, fornecendo os meios para monitorar, controlar e verificar o comportamento de funções e interações no código, contribuindo para um conjunto de testes mais robusto e confiável.

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