# Metodologias de Desenvolvimento

### Sumário

- [Test-Driven Development (TDD)](#tdd)
- [Driven Development (TDD)](#bdd)

# <a id="tdd">Test-Driven Development (TDD)</a>

Test-Driven Development (TDD) é uma prática de desenvolvimento de software que enfatiza a criação de testes automatizados antes da implementação do código funcional. O processo de TDD segue um ciclo iterativo, frequentemente descrito como "Red-Green-Refactor". A ideia central é escrever testes que definem o comportamento esperado do código antes de realmente escrever o código que realiza esse comportamento.

## Ciclo Red-Green-Refactor

### 1. Red: escrever um teste que falha

- Antes de escrever qualquer código funcional, você escreve um teste para a funcionalidade que deseja implementar
- Esse teste, inicialmente, falhará, pois a funcionalidade ainda não foi implementada

### 2. Green: escrever o código mínimo necessário para fazer o teste passar

- Escreva o código funcional apenas o suficiente para fazer o teste passar
- O objetivo é fazer o teste passar com o mínimo de esforço, mesmo que o código não esteja otimizado ou bem estruturado

### 3. Refactor: refatorar o código

- Melhore a estrutura e a qualidade do código que você acabou de escrever, sem alterar seu comportamento externo
- Refatore o código para tornar mais limpo, eficiente e mantenível, garantindo que todos os testes ainda passem

## Beneficíos

### 1. Qualidade do código

O TDD incentiva a escrita de código limpo e bem estruturado desde o início, o que resulta em um código de alta qualidade e mais fácil de manter.

### 2. Design melhorado

Escrever testes primeiro força os desenvolvedores a pensar sobre a API e o design do código antes de implementar a funcionalidade, resultando em um design mais bem pensado.

### 3. Feedback rápido

Como os testes são executados frequentemente, os desenvolvedores recebem feedback rápido sobre a funcionalidade e a correção do código.

### 4. Confiança para refatorar

Com uma suíte de testes abrangente, os desenvolvedores podem refatorar o código com confiança, sabendo que os testes os alertarão sobre quaisquer problemas introduzidos durante o processo de refatoração.

### 5. Documentação

Os testes funcionam como uma forma de documentação viva, mostrando exatamente como o código deve se comportar em várias situações.

## Exemplo

Vamos considerar um exemplo simples onde queremos implementar uma função que soma dois números.

### 1. Red: escrever um teste que falha

```JavaScript
// .mjs
import { expect } from "chai";

import add from "./add.js"

describe("add", () => {
    it("should return the sum of two numbers", () => {
        const result = add(2, 3);

        expect(result).to.equal(5);
    });
});
```

Neste ponto, o teste falhará porque a função `add` ainda não está implementada.

### 2. Green: escrever o código mínimo necessário para fazer o teste passar

```JavaScript
// add.js

function add(a, b) {
    return a + b;
}

module.exports = add;
```

Agora, ao executar o teste, ele deve passar.

### 3. Refactor: refatorar o código

Nesse caso simples, não há muito a refatorar, mas se houvesse uma implementação mais complexa, você poderia melhorar a estrutura e a legibilidade do código neste estágio, garantindo que todos os testes passem.

## Conclusão

O TDD é uma abordagem poderosa para desenvolver software de alta qualidade. Ele não só ajuda a garantir que o código esteja correto desde o início, mas também promove um design mais limpo e bem pensado. Embora possa exigir um investimento inicial maior em termos de tempo e esforço, os benefícios a longo prazo em termos de manutenção, qualidade e robustez do código são significativos.

# <a id="bdd">Driven Development (TDD)</a>

Behavior-Driven Development (BDD) é uma prática de desenvolvimento de software que estende a ideia do TDD ao focar no comportamento do sistema em vez de simplesmente testar sua funcionalidade. O BDD promove a comunicação entre desenvolvedores, QA e stackholders não técnicos para garantir que todos tenham uma compreensão clara dos requisitos e do comportamento esperado do sistema.

## Principais Características

### 1. Foco no comportamento

O BDD foca em descrever o comportamento do software do ponto de vista do usuário final. Isso é feito através de especificações que descrevem como o software deve se comportar em diferentes cenários.

### 2. Linguagem ubíqua

O BDD utiliza linguagem comum (geralmente derivada do domínio do problema) que é compreensível tanto para técnicos quanto para não técnicos. Isso facilita a comunicação e ajuda a evitar mal-entendidos sobre os requisitos.

### 3. Especificações executáveis

No BDD, as especificações são escritas de forma que possam ser executadas como testes automatizados. Essas especificações são discutidas em formato Given-When-Then (Dado-Quando-Então).

### 4. Colaboração

O BDD promove a colaboração entre todos os membros da equipe, incluindo desenvolvedores, testadores e stackholders. As especificações são discutidas e revisadas em conjunto para garantir um entendimento comum.

## Formato Given-When-Then

Um dos aspectos distintivos do BDD é o uso do formato Given-When-Then para descrever os cenários de teste. Esse formato ajuda a estruturar as especificações de uma maneira clara e concisa.

- **Given:** contexto inicial ou pré-condições
- **When:** ação que é realizada
- **Then:** resultado esperado da ação

## Benefícios

### 1. Melhor comunicação

A linguagem comum utilizada no BDD melhora a comunicação entre todos os membros da equipe e stackholders, garantindo um entendimento comum dos requisitos.

### 2. Documentação viva

As especificações do BDD servem como documentação viva do comportamento do sistema, sendo mantidas atualizadas à medida que o software evolui.

### 3. Foco no valor do negócio

O BDD ajuda a garantir que o desenvolvimento seja guiado pelo valor do negócio, focando no comportamento que realmente importa para os usuários finais.

### 4. Testes automatizados

As especificações do BDD são executáveis como testes automatizados, proporcionando uma validação contínua do comportamento do sistema.

## Exemplo

Vamos considerar um exemplo onde queremos especificar o comportamento de um sistema de login.

### 1. Especificação em linguagem natural

```plaintext
Cenário: Login com sucesso
    Dado que o usuário está na página de login
    E o usuário tem um nome de usuário e senha válidos
    Quando o usuário insere o nome de usuário e senha
    E clica no botão de login
    Então o usuário deve ser redirecionado para a página inicial
    E deve ter uma mensagem de boas-vindas
```

### 2. Implementação com uma ferramenta BDD (como Cucumber)

```JavaScript
const { Given, When, Then } = require("cucumber");
const { expect } = require("chai");

Given("que o usuário está na página de login", async function () {
    await browser.url("/login");
});

Given("o usuário tem um nome de usuário e senha válidos", async function () {
    this.username = "validUser";
    this.password = "validPassword";
});

When("o usuário insere o nome de usuário e senha", async function () {
    await browser.setValue("#username", this.username);
    await browser.setValue("#password", this.password);
});

When("clica no botão de login", async function () {
    await browser.click("#login-button");
});

Then("o usuário deve ser redirecionado para a página inicial", async function () {
    await browser.waitForUrl("/home");
});

Then("deve ver uma mensagem de boas-vindas", async function () {
    const message = await browser.getText(".welcome-message");

    expect(message).to.equal("Bem-vindo, validUser!");
});
```

## Conclusão

O BDD é uma abordagem que promove um desenvolvimento mais colaborativo e centrado no comportamento esperado do sistema. Ao utilizar uma linguagem comum e focar em especificações executáveis, o BDD ajuda a garantir que todos os membros da equipe tenham um entendimento claro e compartilhado dos requisitos, resultando em software de alta qualidade que atende às expectativas dos usuários finais.