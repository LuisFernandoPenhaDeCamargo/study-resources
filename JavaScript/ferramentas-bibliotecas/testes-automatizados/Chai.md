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

# Métodos e Propriedades

### Sumário

- [`expect`](#expect)
- [`to`](#to)

## <a id="expect">`expect`</a>

O método `expect` é utilizado para **escrever afirmações nos testes**. Ela permite verificar se os resultados de sua função ou expressão atendem às expectativas definidas. É uma parte fundamental para escrever testes legíveis e mantíveis.

### Sintaxe Básica

```JavaScript
expect(actual).convenienceChain.;
```

- `actual`**:** o valor ou expressão que está sendo testado
- `convenienceChain`**:** cadeia de conveniência

## <a id="to">`to`</a>

`to` é uma cadeia de conveniência que não altera a verificação, mas melhora a legibilidade das assertivas. Ele permite a construção de sentenças mais naturais quando se escreve testes, facilitando a leitura e a compreensão das intenções do teste.