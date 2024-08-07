# Dificuldades Encontradas

Contexto:

- ESM
- Mocha
- Chai
- Sinon.JS
- esmock

- [`TypeError: ES Modules cannot be stubbed`](#es-modules-cannot-be-stubbed)
- [esmock: Exportações Nomeadas vs Exportação Padrão com Nomeadas](#esmock)
- [Mockar Função Interna](#mockar-funcao-interna)

# <a id="es-modules-cannot-be-stubbed">`TypeError: ES Modules cannot be stubbed`</a>

Quando você tenta criar um stub para uma função de um ESM, você recebe a mensagem de erro que é o nosso título. TODO: explicar que ESM são read-only.

```JavaScript
// foo-bar.mjs
export async function bar() {
    return foo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// foo-bar.test.mjs
import { expect }  from "chai";
import sinon       from "sinon";

import * as fooBar from "./foo-bar.mjs";

describe("test suite", () => {
    let fakeReturn, fooStub;

    before(() => {
        console.log("fooBar:", fooBar);
        /*
        Output: fooBar: [Module: null prototype] {
            bar: [AsyncFunction: bar],
            foo: [AsyncFunction: foo]
        }
        */
    });

    it("foo", async () => {
        fakeReturn = await fooBar.foo();
        console.log("fooFakeReturn:", fakeReturn); // Output: bar
        expect(fakeReturn).to.be.equal("bar");

        // fooStub = sinon.stub(fooBar, "foo");    // `TypeError: ES Modules cannot be stubbed`
    });

    it("bar", async () => {
        fakeReturn = await fooBar.bar();
        console.log("barFakeReturn:", fakeReturn); // Output: bar
    });
});
```

Uma forma de contornar isso é usando o esmock, que "fornece importação nativa de ESM e mocking global para testes de unidade". Mas antes de mostrar como o código acima ficaria usando o esmock, vamos entender a dificuldade abaixo:

# <a id="esmock">esmock: Exportações Nomeadas vs Exportação Padrão com Nomeadas</a>

```JavaScript
// foo-bar.mjs
export async function bar() {
    return foo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// default-bar.mjs
export default async function() {
    return foo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// foo-bar.test.mjs
import esmock      from "esmock";
import sinon       from "sinon";

import * as fooBar from "./foo-bar.mjs";

describe("test suite", () => {
    let fooBarNamedMock, fooBarDefaultMock, fooBarStub, fooBarNamedStub, fooBarDefaultStub;

    before(async () => {
        console.log("fooBar:", fooBar);
        /*
        fooBarNamedMock: [Module: null prototype] {
            bar: [AsyncFunction: bar],
            foo: [AsyncFunction: foo]
        }
        */

        fooBarNamedMock    = await esmock("./foo-bar.mjs");
        console.log("fooBarNamedMock:", fooBarNamedMock);
        /*
        fooBarNamedMock: [Module: null prototype] {
            bar: [AsyncFunction: bar],
            foo: [AsyncFunction: foo]
        }
        */

        fooBarDefaultMock  = await esmock("./default-bar.mjs");
        console.log("fooBarDefaultMock:", fooBarDefaultMock);
        /*
        fooBarDefaultMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [AsyncFunction: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */

        // fooBarStub      = sinon.stub(fooBar, "foo");            // `TypeError: ES Modules cannot be stubbed`
        // fooBarNamedStub = sinon.stub(fooBarNamedMock, "foo");   // `TypeError: ES Modules cannot be stubbed`
        fooBarDefaultStub  = sinon.stub(fooBarDefaultMock, "foo"); // O erro `TypeError: ES Modules cannot be stubbed` não ocorre.
    });

    it("foo", async () => {});

    it("bar", async () => {});
});
```

Como você pode perceber pelo log em **foo-bar.test.mjs**, `fooBarNamedMock` é idêntico a `fooBar` (que foi importado utilizando o `import` e não o `esmock`). Quando o módulo possui apenas exportações nomeadas, mesmo o `esmock` não permite que ele seja sobrescrito. O módulo deve possuir uma exportação padrão para que o `esmock` funcione (o identificador esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1' aparece no log).

Atente-se ao fato de que a exportação padrão deve ser uma **função** ou uma **classe**; se você exportar uma variável, o erro persiste. TODO: porque o esmock necessita de uma exportação padrão?

Tendo essa característica do esmock em mente, vamos finalmente utilizá-lo para criar um stub para uma função de um ESM:

```JavaScript
// default-bar.mjs
export default async function() {
    return foo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// foo-bar.test.mjs
import esmock     from "esmock";
import { expect } from "chai";
import sinon      from "sinon";

describe("test suite", () => {
    let fooBarMock, fooBarStub, fakeReturn;

    before(async () => {
        fooBarMock = await esmock("./default-bar.mjs");
        //console.log("fooBarMock:", fooBarMock);
        /*
        fooBarMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [AsyncFunction: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */
    });

    it("foo", async () => {
        fakeReturn = await fooBarMock.foo();
        console.log("foofakeReturn1:", fakeReturn);
        expect(fakeReturn).to.be.equal("bar");

        fooBarStub = sinon.stub(fooBarMock, "foo");
        console.log("fooBarMock:", fooBarMock);     // Output: bar
        /*
        fooBarMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [Function: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */

        fooBarStub.resolves("foo");
        fakeReturn = await fooBarMock.foo();
        console.log("foofakeReturn2:", fakeReturn); // Output: foo
        expect(fakeReturn).to.be.equal("foo");

        fooBarStub.restore();
    });

    it("default", async () => {
        fakeReturn = await fooBarMock.default();
        console.log("defaultfakeReturn1:", fakeReturn); // Output: bar
        expect(fakeReturn).to.be.equal("bar");

        fooBarStub = sinon.stub(fooBarMock, "foo");
        fooBarStub.resolves("foo");
        fakeReturn = await fooBarMock.foo();
        console.log("foofakeReturn2:", fakeReturn);     // Output: foo
        expect(fakeReturn).to.be.equal("foo");

        fakeReturn = await fooBarMock.default();
        console.log("defaultfakeReturn2:", fakeReturn); // Output: bar
        // expect(fakeReturn).to.be.equal("foo");       // `AssertionError: expected 'bar' to equal 'foo'`
    });
});
```

A impressão de `fooBarMock` antes e depois da criação do stub de `foo` é diferente. Após a criação do stub de `foo`, ela deixa de ser indicada como `[AsyncFunction: foo]` e passa a ser indicada como `[Function: foo]`.

Observe que agora a dificuldade é outra: o retorno de `foo` está sendo alterado, mas quando `default` invoca `foo`, o retorno ainda é `bar` e não `foo`. Isso se deve a outra dificuldade encontrada que será explicada no tópico abaixo.

# <a id="mockar-funcao-interna">Mockar Função Interna</a>

