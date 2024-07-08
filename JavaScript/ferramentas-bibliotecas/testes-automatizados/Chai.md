# Chai

Chai é uma biblioteca de assertivas para JavaScript que pode ser utilizada com qualquer framework de teste, como Mocha, Jasmine ou Jest. Ela fornece uma maneira simples e expressiva de escrever testes, permitindo que os desenvolvedores verifiquem se os resultados esperados correspondem aos resultados reais do código testado.

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
// - BDD com `expect`
import { expect } from "chai";

expect(2 + 2).to.be.equal(4);
expect([1, 2, 3]).to.be.an("array").that.includes(2);
expect("foo").to.have.lengthOf(3);

// - BDD com `should`
import { should } from "chai";

(2 + 2).should.be.equal(4);
[1, 2, 3].should.be.an("array").that.includes(2);
"foo".should.have.lengthOf(3);

// - TDD com `assert`
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

expect(fetchData()).to.eventually.be.equal("data");
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
        chai.request(app)
            .get("./users")
            .end((err, res) => {
                expect(res).to.have.status(200);
                expect(res.body).to.be.an("array");
                done();
            })
    });
});
```

# Métodos e Propriedades

### Sumário

- [`expect`](#expect)
- [Cadeias de Conveniência](#cadeias-conveniencia)
- [Propriedades de Asserção](#propriedades-assercao)
- [`equal`](#equal)
- [`use`](#use)

## <a id="expect">`expect`</a>

O método `expect` é utilizado para **escrever afirmações nos testes**. Ela permite verificar se os resultados de sua função ou expressão atendem às expectativas definidas. É uma parte fundamental para escrever testes legíveis e mantíveis.

### Sintaxe Básica

```JavaScript
expect(actual).$< cadeia de conveniência >.$< propriedade de afirmação ou método >;
```

- `actual`**:** o valor ou expressão que está sendo testado
- `cadeia de conveniência`**:** representa uma cadeia de conveniência
- `propriedade de afirmação ou método`**:** uma propriedade de afirmação ou método que verifica se o valor testado corresponde a outro.

## <a id="cadeias-conveniencia">Cadeias de Conveniência</a>

Cadeias de conveniência (como o `to`, por exemplo) não alteram a verificação, mas melhoram a legibilidade das assertivas. Elas permitem a construção de sentenças mais naturais quando se escreve testes, facilidando a leitura e a compreensão das intenções do teste.

### Exemplo

```JavaScript
expect(actual).to.be.true;
```

### Lista de Cadeias de Conveniência

- `to`
- `be`

### Observações

Como dito acima, as cadeias de conveniência não alteram a verificação, então em termos de funcionalidade a ordem não importa, elas são intercambiáveis. No entanto, é importante manter a ordem convencional para melhorar a legibilidade e seguir as práticas comuns da comunidade, portanto, enquanto você tecnicamente poderia usar `be.to`, é mais claro e legível usar `to.be`.

## <a id="propriedades-assercao">Propriedades de Asserção</a>

Uma propriedade de asserção é uma propriedade que verifica se o valor testado corresponde a outro. Por exemplo, a propriedade `true` é uma propriedade de asserção do Chai que verifica se o valor testado é exatamente `true`.

### Lista de Propriedades de Asserção

- `true`
- `undefined`

## <a id="equal">`equal`</a>

O método `equal` é utilizado para **verificar a igualdade estrita (sem coersão de tipo) entre dois valores**.

### Sintaxe Básica

```JavaScript
expect(actual).equal(expected);
```

- `actual`**:** o valor que você está testando
- `expected`**:** o valor que você espera que `actual` seja igual

## <a id="use">`use`</a>

O método `use` é utilizado para **adicionar plugins ou estender a funcionalidade padrão do Chai**.

### Sintaxe Básica

```JavaScript
chai.use(plugin);
```

- `plugin`**:** um módulo que estende a funcionalidade do Chai. Esse plugin deve ser uma função que aceita a instância do Chai como argumento e adiciona novas asserções ou funcionalidades

## Observações Interessantes

Você também pode criar seu próprio plugin customizado para adicionar funcionalidades personalizadas ao Chai. Por exemplo:

### 1. Crie o plugin

```JavaScript
// myPlugin.js

module.exports = function(chai, utils) {
    const Assertion = chai.Assertion;

    Assertion.addMethod("greaterThan", function(expectValue) {
        const actualValue = this._obj;

        this.assert(
            actualValue > expectValue,
            'expect #{this} to be greater than #{exp}',
            'expect #{this} not to be greater than #{exp}',
            expectValue,
            actualValue
        );
    });
};
```

### 2. Use o plugin

```JavaScript
// Observe que você não pode usar a função `require` com um módulo ES, isto é só um exemplo.
const chai = require("chai");

const meuPlugin = require("./myPlugin.js");

// Usar o plugin customizado.
chai.use(myPlugin);

const expect = chai.expect;

// Exemplo de uso do plugin customizado.
describe("Testing my custom plugin", function() {
    it("should be greater than 10", function() {
        expect(15).to.be.greaterThan(10);
    });

    it("should not be greater than 20", function() {
        expect(15).to.not.be.greaterThan(20);
    });
});
```