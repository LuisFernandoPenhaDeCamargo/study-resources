- Palavra-chave: "TODO" <--
- Links de referência: "frase: frase", só utilizar uma das "frases". <--

# Dificuldades Encontradas

Contexto:

- ESM
- Mocha
- Chai
- Sinon.JS
- esmock

+ [`TypeError: ES Modules cannot be stubbed`](#es-modules-cannot-be-stubbed)
+ [esmock: Exportações Nomeadas vs Exportação Padrão com Nomeadas](#esmock)
+ [Mockar Função Interna](#mockar-funcao-interna)
+ [Lidando com o Método Construtor]() <--
+ [Método Construtor Simulado Lançando um Erro]() <--

# <a id="es-modules-cannot-be-stubbed">`TypeError: ES Modules cannot be stubbed`</a>

Quando você tenta criar um stub para uma função de um ESM (substituí-la), você recebe a mensagem de erro mencionado no título. Quando você importa um ESM, o objeto obtido será "somente leitura" (read-only), o que significa que você não pode modificar suas propriedades, como suas funções.

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
        console.log("fooReturn:", fakeReturn); // Output: fooReturn: bar
        expect(fakeReturn).to.be.equal("bar");
    });

    it("bar", async () => {
        fakeReturn = await fooBar.bar();
        console.log("barReturn:", fakeReturn);  // Output: barReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        // fooStub = sinon.stub(fooBar, "foo"); // `TypeError: ES Modules cannot be stubbed`
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
    let fooBarMock, defaultBarMock, fooBarFooStub, fooBarMockFooStub, defaultBarMockFooStub;

    before(async () => {
        console.log("fooBar:", fooBar);
        /*
        fooBar: [Module: null prototype] {
            bar: [AsyncFunction: bar],
            foo: [AsyncFunction: foo]
        }
        */

        fooBarMock             = await esmock("./foo-bar.mjs");
        console.log("fooBarMock:", fooBarMock);
        /*
        fooBarMock: [Module: null prototype] {
            bar: [AsyncFunction: bar],
            foo: [AsyncFunction: foo]
        }
        */

        defaultBarMock         = await esmock("./default-bar.mjs");
        console.log("defaultBarMock:", defaultBarMock);
        /*
        defaultBarMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [AsyncFunction: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */

        // fooBarFooStub       = sinon.stub(fooBar, "foo");         // `TypeError: ES Modules cannot be stubbed`
        // fooBarMockFooStub   = sinon.stub(fooBarMock, "foo");     // `TypeError: ES Modules cannot be stubbed`
        defaultBarMockFooStub  = sinon.stub(defaultBarMock, "foo"); // O erro `TypeError: ES Modules cannot be stubbed` não ocorre.
    });

    it("foo", async () => {});

    it("bar", async () => {});
});
```

Como você pode perceber pelo log em **foo-bar.test.mjs**, `fooBarMock` é idêntico a `fooBar` (que foi importado utilizando o `import` e não o `esmock`). Quando o módulo possui apenas exportações nomeadas, mesmo o `esmock` não permite que ele seja sobrescrito. O módulo deve possuir uma exportação padrão para que o `esmock` funcione (o identificador esmkTreeId: `'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'` aparece no log).

Atente-se ao fato de que a exportação padrão deve ser uma **função** ou uma **classe**; se você exportar uma variável, o erro persiste. O esmock requer uma exportação padrão porque ele depende dessa exportação para poder "substituir" ou "simular" as exportações do módulo. Quando um ESM tem apenas exportações nomeadas. cada exportação é vinculada de forma estática e direta, o que significa que elas são imutáveis e não podem ser substituídas ou modificadas depois que o módulo é carregado.

Já com uma exportação padrão, o esmock consegue contornar essa limitação. A exportação padrão funciona como um ponto de entrada que pode ser interceptado e modificado, permitindo que o esmock faça as injeções necessárias para os testes. Sem uma exportação padrão, o esmock não tem como "redirecionar" ou interceptar as chamadas às funções exportadas, limitando a sua capacidade de simulação.

Tendo essa característica do esmock em mente, vamos finalmente utilizá-lo para substituir uma função de um ESM:

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
    let defaultBarMock, fakeReturn, fooStub;

    before(async () => {
        defaultBarMock = await esmock("./default-bar.mjs");
        console.log("defaultBarMock:", defaultBarMock);
        /*
        defaultBarMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [AsyncFunction: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */
    });

    it("foo", async () => {
        fakeReturn = await defaultBarMock.foo();
        console.log("fooReturn:", fakeReturn);     // Output: fooReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooStub    = sinon.stub(defaultBarMock, "foo");
        console.log("defaultBarMock:", defaultBarMock);
        /*
        defaultBarMock: <ref *1> [AsyncFunction: default] {
            default: [Circular *1],
            foo: [Function: foo],
            esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/default-bar.mjs?esmk=1'
        }
        */
        fooStub.resolves("foo");

        fakeReturn = await defaultBarMock.foo();
        console.log("fooFakeReturn:", fakeReturn); // Output: fooFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");

        fooStub.restore();
    });

    it("default", async () => {
        fakeReturn = await defaultBarMock.default();
        console.log("defaultReturn:", fakeReturn);     // Output: defaultReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooBarStub = sinon.stub(defaultBarMock, "foo");
        fooBarStub.resolves("foo");

        fakeReturn = await defaultBarMock.foo();
        console.log("fooFakeReturn:", fakeReturn);     // Output: fooFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");

        fakeReturn = await defaultBarMock.default();
        console.log("defaultFakeReturn:", fakeReturn); // Output: defaultFakeReturn: bar
        // expect(fakeReturn).to.be.equal("foo");      // `AssertionError: expected 'bar' to equal 'foo'`
    });
});
```

A impressão de `defaultBarMock` antes e depois da substituição de `foo` é diferente. Após a substituição de `foo`, ela deixa de ser indicada como `[AsyncFunction: foo]` e passa a ser indicada como `[Function: foo]`.

Observe que agora a dificuldade é outra: o retorno de `foo` está sendo alterado, mas quando `default` invoca `foo`, o retorno ainda é `bar` e não `foo`. Isso se deve a outra dificuldade encontrada que será explicada no tópico abaixo.

# <a id="mockar-funcao-interna">Mockar Função Interna</a>

Se um ESM exportar diretamente duas funções, sem encapsulá-las em uma classe ou objeto, e uma delas chamar a outra, essa chamada não poderá ser mockada (simulada).

Nesse caso, `foo` não pode ser substituída dentro da função `default` da maneira como o código está escrito atualmente. A simulação substitui a exportação do módulo para `foo`, mas `default` **não chama a exportação do módulo para** `foo`**, apenas chama** `foo` **diretamente**.

Para conseguir substituir `foo` neste cenário, temos três opções:

# Mover `foo` para seu Próprio Módulo

```JavaScript
// foo.mjs
export default async function() { // Lembrando que o módulo deve possuir uma exportação padrão para que esmock funcione.
    return Promise.resolve("bar");
}

// default-bar.mjs
import foo from "./foo.mjs"

export default async function() {
    return foo();
}

// foo-bar.test.mjs
import esmock     from "esmock";
import { expect } from "chai";
import sinon      from "sinon";

describe("test suite", () => {
    /*
    - `fooMockFooStub`: stub de `foo` (função `default`) do módulo foo.mjs que foi importado através do esmock ("fooMock" - "fooStub")
    - `fooStub`: stub que substitui a função `foo` no momento da importação (`import foo from "./foo.mjs"`) no módulo default-bar.mjs
    */
    let fooMock, fooMockFooStub, fooStub, defaultBarMock, fakeReturn;

    before(async () => {
        fooMock         = await esmock("./foo.mjs");
        fooMockFooStub  = sinon.stub(fooMock, "default");
        fooStub         = sinon.stub();
        defaultBarMock  = await esmock("./default-bar.mjs", {
            "./foo.mjs": {
                default: fooStub, // Agora você controla o comportamento de `foo`.
            },
        });
    });

    it("foo", async () => {
        fakeReturn     = await fooMock.default();
        console.log("fooReturn:", fakeReturn);     // Output: fooReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooMockFooStub.resolves("foo");

        fakeReturn     = await fooMock.default();
        console.log("fooFakeReturn:", fakeReturn); // Output: fooFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");

        fooStub.restore();
    });

    it("default", async () => {
        fooStub.resolves("foo");

        fakeReturn = await defaultBarMock.default();
        console.log("defaultFakeReturn:", fakeReturn); // Output: defaultFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");
    });
});
```

"Agora você controla o comportamento de `foo`": como vimos, o esmock fornece importação nativa de ESM e mocking global para testes de unidade. A importação `import foo from "./foo.mjs"` em **default-bar.mjs** está sendo substituída pelo que você fornece (`fooStub`), então, em vez de invocar o código exportado por **foo.mjs** (a função `default`), iremos retornar a string `foo` (`fooStub.resolves("foo")`).

O problema disso é que teríamos que criar um módulo para cada função, o que possivelmente resultaria em uma quantidade muito grande de arquivos. Outra forma de conseguir substituir `foo` seria:

# Importe o Módulo em si mesmo

"Os ESM suportam dependências cíclicas automaticamente", portanto, é perfeitamente válido que um módulo importe a si mesmo, permitindo que as funções dentro dele possam chamar a exportação do módulo para outras funções do mesmo módulo:

```JavaScript
// default-bar.mjs
import * as fooBar from "./default-bar.mjs"

export default async function() {
    return fooBar.foo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// foo-bar.test.mjs
import esmock     from "esmock";
import { expect } from "chai";
import sinon      from "sinon";

describe("test suite", () => {
    let defaultBarMock, fakeReturn, fooStub;

    it("foo", async () => {
        defaultBarMock = await esmock("./default-bar.mjs");

        fakeReturn     = await defaultBarMock.foo();
        console.log("fooReturn:", fakeReturn);     // Output: fooReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooStub        = sinon.stub(defaultBarMock, "foo");
        fooStub.resolves("foo");

        fakeReturn     = await defaultBarMock.foo();
        console.log("fooFakeReturn:", fakeReturn); // Output: fooFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");

        fooStub.restore();
    });

    it("default", async () => {
        fooStub        = sinon.stub();
        defaultBarMock = await esmock("./default-bar.mjs", {
            "./default-bar.mjs": {
                foo: fooStub,
            },
        });
        fooStub.resolves("foo");

        fakeReturn = await defaultBarMock.default();
        console.log("defaultFakeReturn:", fakeReturn); // Output: defaultFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");
    });
});
```

Como podemos observar, o comportamento de `foo` foi alterado com sucesso novamente. Outra forma de conseguir simular `foo` seria:

# Injeção de Dependências

```JavaScript
// default-bar.mjs
export default async function(fnFoo = foo) {
    return fnFoo();
}

export async function foo() {
    return Promise.resolve("bar");
}

// foo-bar.test.mjs
import esmock     from "esmock";
import { expect } from "chai";
import sinon      from "sinon";

import * as fooBar from "./default-bar.mjs";

describe("test suite", () => {
    let defaultBarMock, fakeReturn, fooStub;

    before(async () => {
        defaultBarMock = await esmock("./default-bar.mjs");
    });

    it("foo", async () => {        
        fakeReturn     = await defaultBarMock.foo();
        console.log("fooReturn:", fakeReturn);     // Output: fooReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooStub        = sinon.stub(defaultBarMock, "foo");
        fooStub.resolves("foo");

        fakeReturn     = await defaultBarMock.foo();
        console.log("fooFakeReturn:", fakeReturn); // Output: fooFakeReturn: foo
        expect(fakeReturn).to.be.equal("foo");

        fooStub.restore();
    });

    it("default", async () => {
        fakeReturn = await fooBar.default();
        console.log("defaultReturn:", fakeReturn);     // Output: defaultReturn: bar
        expect(fakeReturn).to.be.equal("bar");

        fooStub    = sinon.stub(defaultBarMock, "foo");
        fooStub.resolves("foo");

        fakeReturn = await fooBar.default(fooStub);
        console.log("defaultFakeReturn:", fakeReturn); // Output: defaultFakeReturn: bar
        expect(fakeReturn).to.be.equal("foo");
    });
});
```

Observe que no caso de teste do método default, nós não utilizamos a simulação criada pelo esmock (defaultBarMock). Como nós injetamos as dependências, para substituir foo, só foi preciso passar o seu substituto como argumento para fooBar.default. <--

# Auto Importação vs Injeção de Dependências

## Auto Importação

Usa importações cíclicas permitindo que as funções dentro do módulo possam chamar a sua própria exportação para outras funções do mesmo módulo.

### Vantagens

- **Simplicidade imediata:**
    + Menos refatoração inicial necessária
    + Pode ser implementado rapidamente
- **Facilidade de implementação:** mais simples de entender e implementar no curto prazo

### Desvantagens

- **Dificuldades em testes:**
    + Simular funções internar é mais difícil
    + Testes podem ser menos isolados e precisos
- **Manutenção e escalabilidade:**
    + Maior acoplamento entre módulos
    + Menos modularidade e dificuldade na manutenção a longo prazo

## Injeção de Dependências

Funções necessárias são passadas como argumentos para outras funções, facilitando a simulação e a substituição em testes.

### Vantagens

- **Flexibilidade e testabilidade:**
    + Simulação e substituição de funções são mais fáceis, pois as dependências são passadas como argumentos
    + Testes podem ser mais isolados e precisos
- **Manutenção e escabilidade:**
    + Facilita a manutenção e evolução do código
    + Reduz o acoplamento entre módulos

### Desvantagens

- **Refatoração inicial:** requer mudanças iniciais no código para permitir a injeção de dependências
- **Complexidade adicional:** introduz alguma complexidade ao design do código

## Conclusão

A injeção de dependências tem um custo inicial mais alto, mas oferece benefícios significativos em termos de flexibilidade, testabilidade e manutenção a longo prazo. A auto importação é mais rápida e fácil de implementar, mas pode levar a problemas de manutenção e testes à medida que o projeto cresce. Se o projeto for de longa duração e a testabilidade for uma prioridade, a injeção de dependências pode ser a melhor abordagem.

# <a id=""></a>

Outra dificuldade encontrada foi substituir o método construtor, a abordagem abaixo utiliza o método Object.setPrototypeOf para alcançar isto. <--

```JavaScript
import sinon from "sinon";

class A {
    constructor() {
        console.log("Class A");
    }
}

class B extends A {}

console.log("Object.getPrototypeOf(A):", Object.getPrototypeOf(A)) // Output: Object.getPrototypeOf(A): {}
console.log("Object.getPrototypeOf(B):", Object.getPrototypeOf(B)) // Output: Object.getPrototypeOf(B): [class A]
console.log("A.prototype:", A.prototype)                           // Output: A.prototype: {}
console.log("B.prototype:", B.prototype)                           // Output: B.prototype: A {}
console.log("A.prototype.constructor:", A.prototype.constructor)   // Output: A.prototype.constructor: [class A]
console.log("B.prototype.constructor:", B.prototype.constructor)   // Output: B.prototype.constructor: [class B extends A]
console.log("A.constructor:", A.constructor)                       // Output: A.constructor: [Function: Function]
console.log("B.constructor:", B.constructor)                       // Output: B.constructor: [Function: Function]

new A();                                                           // Output: Class A
new B();                                                           // Output: Class A

let constructorStub = sinon.stub(B, "constructor");
new B();                                                           // Output: Class A
console.log(constructorStub.calledOnce);                           // Output: false

constructorStub = sinon.stub(B.prototype, "constructor");
new B();                                                           // Output: Class A
console.log(constructorStub.calledOnce);                           // Output: false

Object.setPrototypeOf(B, sinon.stub().callsFake(function() { console.log("Class B"); }));

console.log("Object.getPrototypeOf(A):", Object.getPrototypeOf(A)) // Output: Object.getPrototypeOf(A): {}
console.log("Object.getPrototypeOf(B):", Object.getPrototypeOf(B)) // Output: Object.getPrototypeOf(B): [Function: functionStub]
console.log("A.prototype:", A.prototype)                           // Output: A.prototype: {}
console.log("B.prototype:", B.prototype)                           // Output: B.prototype: A {}
console.log("A.prototype.constructor:", A.prototype.constructor)   // Output: A.prototype.constructor: [class A]
console.log("B.prototype.constructor:", B.prototype.constructor)   // Output: B.prototype.constructor: [class B extends functionStub]
console.log("A.constructor:", A.constructor)                       // Output: A.constructor: [Function: Function]
console.log("B.constructor:", B.constructor)                       // Output: B.constructor: [Function: Function]

new A();                                                           // Output: Class A
new B();                                                           // Output: Class B

console.log(Object.getPrototypeOf(B).callCount);                   // Output: 1
console.log(Object.getPrototypeOf(B) === B.__proto__);             // Output: true
```

```JavaScript
import esmock            from "esmock";
import sinon             from "sinon";

import * as defaultClass from "./default-bar.mjs";

const defaultClassMock = await esmock("./default-bar.mjs");
let obj, constructorStub, classStubbedInstance;

console.log("defaultClass:", defaultClass);                                             // Output: defaultClass: [Module: null prototype] { default: [class A] }
console.log("defaultClass.default:", defaultClass.default);                             // Output: defaultClass.default: [class A]
console.log("defaultClass.default.constructor:", defaultClass.default.constructor);     // Output: defaultClass.default.constructor: [Function: Function]
console.log("Object.getPrototypeOf(defaultClass.default):", Object.getPrototypeOf(defaultClass.default));
// Output: Object.getPrototypeOf(defaultClass.default): {}
console.log("defaultClass.default.prototype:", defaultClass.default.prototype);         // Output: defaultClass.default.prototype: {}

obj = new defaultClass.default();
console.log("obj:", obj);                                                               // Output: obj: A { arg: 'Class A' }

constructorStub = sinon.stub(defaultClass.default, "constructor");
obj = new defaultClass.default();
console.log(constructorStub.calledOnce);                                                // Output: false

// constructorStub = sinon.stub(defaultClass.default.prototype, "constructor");
// obj = new defaultClass.default();
// console.log("obj:", obj);                                                            // Output: obj: { arg: 'Class A' }
// console.log(constructorStub.calledOnce);                                             // Output: false

Object.setPrototypeOf(defaultClass.default, sinon.stub().callsFake(function() { console.log("Class B"); }));
obj = new defaultClass.default();

classStubbedInstance = sinon.createStubInstance(defaultClass.default);
console.log("classStubbedInstance:", classStubbedInstance);                             // Output: A {}

obj = new defaultClassMock.default();
console.log("objMock:", obj);                                                           // Output: objMock: A { arg: 'Class A' }
obj = new defaultClass.default();
console.log("objDefault:", obj);                                                        // Output: objDefault: A { arg: 'Class A' }

// constructorStub = sinon.stub(defaultClass, "default").returns(classStubbedInstance); // `TypeError: ES Modules cannot be stubbed`
constructorStub = sinon.stub(defaultClassMock, "default").returns(classStubbedInstance);

obj = new defaultClassMock.default();
console.log("objMock:", obj);                                                           // Output: objMock: A {}
obj = new defaultClass.default();
console.log("objDefault:", obj);                                                        // Output: objDefault: A { arg: 'Class A' }

console.log(constructorStub.calledOnce);                                                // Output: true

new defaultClassMock.default();

console.log(constructorStub.calledTwice);                                               // Output: true
```

Capturar os argumentos <--

# <a id=""></a>

brain, object, js, mo, dificuldades