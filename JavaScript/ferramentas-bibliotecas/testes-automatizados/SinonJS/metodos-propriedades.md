# Métodos e Propriedades

### Sumário

Criam objetos:

- [`spy`](#spy)
- [`stub`](#stub)
- [`createStubInstance`](#createstubinstance)

Definem comportamento:

- [`returns`](#returns)
- [`throws`](#throws)
- [`resolves`](#resolves)
- [`rejects`](#rejects)
- [`callsFake`](#callsfake)
- [`returnsThis`](#returnsthis)
- [`onCall`](#oncall)
- [`replace`](#replace)
- [`restore`](#restore)

Ajudam a avaliar o comportamento:

- [`callCount`](#callcount)
- [`firstCall`](#firstcall)
- [`args`](#args)
- [`calledOnce`](#calledonce)
- [`calledWith`](#calledwith)
- [`CalledOnceWith`](#calledoncewith)
- [`getCall`](#getcall)

+ [Observações](#observacoes)

# <a id="spy">`spy`</a>

O método `spy` é utilizado para **monitorar chamadas a outras funções**. Ele permite verificar como uma função foi chamada, quais argumentos foram passados, quantas vezes foi chamada, entre outros detalhes.

### Sintaxe Básica

```JavaScript
const spy = sinon.spy([obj, ]method);
```

- `obj`**:** o objeto que contém o método a ser espionado. Se não for fornecido, o `spy` será aplicado diretamente à função fornecida
- `method`**:** a função ou método a ser espionado
- **Retorno:** uma função `spy` que pode ser usada para verificar chamadas, argumentos e outros detalhes sobre a função original. **O** `spy` **substitui o método original durante o teste, mas mantém a funcionalidade da função**

## Exemplos

```JavaScript
import sinon from "sinon";

// Função que será espionada.
function myFunction(a, b) {
    return a + b;
}

// - Criando um spy para a função `myFunction`
const spyFunction  = sinon.spy(myFunction);

// Chamando a função espionada.
spyFunction(1, 2);

// Verificando se o spy foi chamado.
console.log(spyFunction.called);         // Output: true
// Verificando o número de vezes em que o spy foi chamado.
console.log(spyFunction.callCount);      // Output: 1
// Verificando os argumentos com os quais o spy foi chamado.
console.log(spyFunction.firstCall.args); // Output: [ 1, 2 ]

// Objeto com método a ser espionado.
const obj          = {
    myMethod(a ,b) {
        return a + b;
    }
};

// - Criando um spy para o método `myMethod`
const spyObjMethod = sinon.spy(obj, "myMethod");

// Chamando o método espionado.
obj.myMethod(2, 3);

// Verificando se o spy foi chamado.
console.log(spyObjMethod.called);         // Output: true
// Verificando o número de vezes em que o spy foi chamado.
console.log(spyObjMethod.callCount);      // Output: 1
// Verificando os argumentos com os quais o spy foi chamado.
console.log(spyObjMethod.firstCall.args); // Output: [ 2, 3 ]

// Restaurar o método original.
spyObjMethod.restore();
```

Fique atento ao fato de que, ao chamarmos a função espionada, utilizamos `spyFunction`, enquanto para chamar o método espionado, utilizamos `obj.myMethod`. Portanto, quando se trata de funções (que não pertencem a um objeto), devemos invocar e inspecionar o espião criado (`spyFunction`). Já quando se trata de métodos (que pertencem a um objeto), devemos invocar o método espionado (`obj.myMethod`) e inspecionar o espião criado (`spyObjMethod`).

Invocar `spyObjMethod` também geraria os mesmos resultados, mas vamos definir como padrão seguir o exemplo acima.

# <a id="stub">`stub`</a>

O método `stub` é utilizado para **criar stubs em funções ou métodos**, permitindo que você controle o comportamento das funções durante os testes. Stubs são usados para substituir o comportamento real de uma função com um comportamento simulado.

### Sintaxe Básica

```JavaScript
const stub = sinon.stub([object [, method]]);
```

- `object`**:** o objeto que contém o método a ser substituído
- `method`**:** o nome do método a ser substituído
- **Retorno:** um objeto Stub

## Exemplo

```JavaScript
import sinon from "sinon";

const myStub = sinon.stub();

myStub.returns("Stubbed value");

console.log(myStub()); // Output: Stubbed value
```

# <a id="createstubinstance">`createStubInstance`</a>

O método `createStubInstance` é utilizado para **criar uma instância substituta de uma classe**, permitindo que você substitua métodos dessa instância por stubs.

### Sintaxe Básica

```JavaScript
const stubInstance = sinon.createStubInstance(Class[, overrides]);
```

- `Class`**:** a classe da qual você deseja criar a instância substituta
- `overrides`**:** um objeto cujas propriedades substituirão os métodos ou propriedades da instância substituta
- **Retorno:** uma instância da classe especificada com os métodos ou propriedades especificados substituídos por stubs

## Exemplo

```JavaScript
import sinon from "sinon";

class MyClass {
    myMethod() {
        return "Original value.";
    }
}

const stubInstance = sinon.createStubInstance(MyClass);

stubInstance.myMethod.returns("Stubbed value");

const output       = stubInstance.myMethod();

console.log(output); // Output: Stubbed value
```

## Observações

Sem utilizar o parâmetro `overrides`, a instância substituta preserva as propriedades da instância original, exatamente como elas são.

# <a id="returns">`returns`</a>

O método `returns` é utilizado para **configurar um stub para retornar um valor específico de maneira síncrona**. Este método é útil quando você deseja substituir uma função que retorna um valor imediatamente (não uma promessa) em seus testes.

### Sintaxe Básica

```JavaScript
stub.returns(value);
```

- `value`**:** o valor que o método substituto deve retornar

# <a id="throws">`throws`</a>

O método `throws` é utilizado para **simular um comportamento onde uma função lança uma exceção**. Isso é útil para testar como seu código lida com erros.

### Sintaxe Básica

```JavaScript
stub.throws(exception);
```

- `exception`**:** a exceção que será lançada quando o método substituído for chamado. Pode ser uma string, um objeto de erro, ou qualquer outro valor

# <a id="resolves">`resolves`</a>

O método `resolves` é utilizado para **especificar que o stub deve retornar uma promessa resolvida com um valor específico**. Este método é especialmente útil para testar funções assíncronas que retornam promessas.

### Sintaxe Básica

```JavaScript
stub.resolves(value);
```

- `value`**:** o valor com o qual a promessa deve ser resolvida. Pode ser qualquer valor, incluindo objetos, strings, números, etc.

# <a id="rejects">`rejects`</a>

O método `rejects` é utilizado para **simular um comportamento onde uma função assíncrona retorna uma promessa que é rejeitada**. Isso é útil para testar como seu código lida com promessas rejeitadas.

### Sintaxe Básica

```JavaScript
stub.rejects(reason);
```

- `reason`**:** a razão pela qual a promessa será rejeitada. Pode ser uma string, um objeto de erro, ou qualquer outro valor

# <a id="callsfake">`callsFake`</a>

O método `callsFake` é utilizado para **substituir uma função com uma implementação simulada personalizada durante os testes**. Ele é particularmente útil quando você deseja controlar o comportamento da função simulada para testar vários cenários.

### Sintaxe Básica

```JavaScript
stub.callsFake(fakeFunc);
```

- `fakeFunc`**:** uma função simulada (fake function) que será usada no lugar do método original. Essa função pode aceitar qualquer número de parâmetros, dependendo do método que está sendo substituído

## Exemplo

```JavaScript
// module.mjs
import axios from "axios";

export async function fetchData(url) {
    const response = await axios.get(url);

    return response.data;
}

// main.mjs
import { expect }    from "chai";
import sinon         from "sinon";

import { fetchData } from "./module.mjs";

describe("fetchData", () {
    it("should return fake data", async function () {
        const fakeResponse = { data: { message: "Hello, world!" } };
        const axiosStub    = sinon.stub(axios, "get").callsFake(async function () {
            return fakeResponse;
        });
        const data         = await fetchData("https://api.example.com/data");

        expect(data).to.be.deep.equal(fakeResponse.data);

        axiosStub.restore();
    });
});
```

# <a id="returnsthis">`returnsThis`</a>

O método `returnsThis` é utilizado **em um stub para fazer com que a função substituta retorne o próprio contexto(**`this`**)**. Isso é útil em situações onde métodos de instância ou chamadas encadeadas dependem do retorno do contexto da função original.

### Sintaxe Básica

```JavaScript
stub.returnThis();
```

## Exemplo

```JavaScript
import sinon from "sinon";

cost obj = {
    setName(name) {
        this.name = name;
        return this;
    },
    getName() {
        return this.name;
    },
};

// Stub do método `setName` para retornar `this`.
const objSetNameStub = sinon.stub(obj, "setName").returnsThis();

// Chamando o método com o stub ativo.
obj.setName("Alice").setName("Bob"); // Encadeamento de chamadas.

console.log(objSetNameStub.callCount); // Output: 2
console.log(obj.getName());            // Output: undefined. O stub não altera o estado real.
```

## Conclusão

O métodos `returnThis` é útil para testar métodos que retornam o contexto (`this`) para permitir encadeamento de métodos. Usando `returnThis`, você pode manter a fluidez das chamadas de métodos em seus testes, garantindo que a lógica de encadeamento funcione conforme esperado.

# <a id="oncall">`onCall`</a>

O método `onCall` é utilizado para **especificar comportamentos diferentes para um stub em chamadas consecutivas**. Ele define o retorno ou comportamento do stub para uma chamada específica, com base no índice da chamada (começando em 0).

### Sintaxe Básica

```JavaScript
stub.onCall(n).returns(value); // Aqui está sendo utilizado o `returns`, mas poderia ser o `rejects`, por exemplo.
```

- `n`**:** um número inteiro representando o índice da chamada (começando em 0)
- `value`**:** o valor a ser retornado na chamada `n`
- **Retorno:** retorna o próprio stub, permitindo encadeamento de métodos. O stub executará comportamentos diferentes nas chamadas subsequentes

## Exemplo

```JavaScript
import sinon from "sinon";

const obj            = {
    getName() {
        return "Default Name";
    },
};
const objGetNameStub = sinon.stub(obj, "getName");

// Configurando comportamentos diferentes para as chamadas.
objGetNameStub.onCall(0).returns("Alice");
objGetNameStub.onCall(1).resolves("Bob");
objGetNameStub.onCall(2).returns("Charlie");

console.log(obj.getName());       // Output: Alice (chamada 0).
console.log(await obj.getName()); // Output: Bob (chamada 1).
console.log(obj.getName());       // Output: Charlie (chamada 2).
console.log(obj.getName());       // Output: undefined (comportamento padrão após as chamadas definidas).
```

# <a id="replace">`replace`</a>

O método `replace` é utilizado para **substituir funções ou propriedades de objetos com stubs ou valores personalizados**, o que é útil para controlar e testar comportamentos específicos durante os testes.

### Sintaxe Básica

```JavaScript
sinon.replace(obj, "method", newFunction);
```

- `obj`**:** o objeto cujo método ou propriedade será substituído
- `method`**:** o nome do método ou propriedade a ser substituído
- `newFunction`**:** a função ou valor que substituirá o método ou propriedade original

## Exemplo

```JavaScript
import sinon from "sinon";

const myObj = {
    myMethod() {
        return "Original function";
    }
};

// Substituindo o método.
sinon.replace(myObj, "myMethod", function() {
    return "Substituted function";
});

console.log(myObj.myMethod()); // Output: Substituted function

// Restaurando o método original.
sinon.restore();

console.log(myObj.myMethod()); // Output: Original function
```

# <a id="restore">`restore`</a>

O método `restore` é utilizado para **restaurar o comportamento original de um stub, spy ou mock** criado pelo Sinon.JS. Isso é útil para garantir que os testes não causem efeitos colaterais em outras partes do código.

### Sintaxe Básica

```JavaScript
A< spy/stub/mock/sinon >.restore();
```

## Benefícios

Porque usar o `restore`:

1. **Limpeza e isolamento:** ao restaurar o método original, você garante que os testes não interfiram uns nos outros. Se você não restaurar o método, os efeitos do stub, por exemplo, podem vazar para outros testes, causando resultados inesperados e falhas difíceis de diagnosticar
2. **Manutenção do comportamento original:** restaurar o método garante que o comportamento original do método seja mantido para outros testes ou **partes do código** que não estejam relacionadas ao stub
3. **Boas práticas:** usar `restore` é uma prática recomendada em testes unitários para manter a integridade e previsibilidade dos testes. Isso torna os testes mais robustos e o código mais fácil de manter

## Observações

`sinon.restore` é utilizado para restaurar todos os stubs, mocks e spys de uma só vez. Este método é especialmente conveniente quando você possui uma grande quantidade de stubs, mocks e spys que precisam ser restaurados após os testes.

# <a id="callcount">`callCount`</a>

A propriedade `callCount` é uma propriedade do spy/stub/mock do Sinon.JS que **acompanha o número de vezes que um spy/stub/mock foi chamado durante um teste**. Ele é útil para garantir que uma função seja executada o número esperado de vezes.

### Sintaxe Básica

```JavaScript
const stub = sinon.stub(obj, "method");

obj.method();

console.log(stub.callCount);
```

- **Retorno:** retorna um número inteiro representando o número de vezes que o spy/stub/mock foi chamado

## Exemplo

```JavaScript
import sinon from "sinon";

const obj    = {
    sayHello() {
        console.log("Hello!");
    }
};

const objSpy = sinon.spy(obj, "sayHello");

obj.sayHello(); // Chamada 1.
obj.sayHello(); // Chamada 2.

console.log(objSpy.callCount); // Output: 2
```

# <a id="firstcall">`firstCall`</a>

A propriedade `firstCall` é uma propriedade do objeto spy/stub do Sinon.JS que **armazena um registro da primeira chamada feita ao spy/stub**.

# <a id="args">`args`</a>

A propriedade `args` é uma propriedade do objeto `firstCall`. Ela é um **array que contém os argumentos passados para a função espiada/substituta durante a chamada**.

## Exemplo

```JavaScript
expect(axiosGetStub.firstCall.args[1].headers.Authorization).to.be.equal("Bearer access-token");
```

# <a id="calledonce">`calledOnce`</a>

A propriedade `calledOnce` é uma propriedade do spy/stub do Sinon.JS que verifica **se o spy/stub foi chamado exatamente uma vez durante a execução do teste**. Esta propriedade é útil para validar que uma função foi invocada uma única vez, garantindo assim que o comportamento esperado ocorreu apenas uma vez.

# <a id="calledwith">`calledWith`</a>

O método `calledWith` é utilizado para **verificar se o spy/stub foi chamado com argumentos específicos durante a execução do teste**. Este método é útil para validar que uma função foi invocada com os parâmetros esperados, garantindo assim que o comportamento ocorreu de maneira prevista.

### Sintaxe Básica

```JavaScript
A< spy/stub >.calledWith(arg1[, arg2[, ...]]);
```

- `arg1, arg2, ...`**:** os argumentos que se espera que tenham sido passados para o spy/stub durante a chamada

# <a id="calledoncewith">`CalledOnceWith`</a>

O método `calledOnceWith` é utilizado para **verificar se o spy/stub foi chamado exatamente uma vez com argumentos específicos durante a execução do teste**. É uma asserção útil do Sinon.JS que ajuda a garantir que suas funções são chamadas conforme esperado, aumentando a confiabilidade dos seus testes.

### Sintaxe Básica

```JavaScript
A< stub/spy >.calledOnceWith(arg1[, arg2[, ...argN]]);
```

- `arg1, arg2, argN`**:** os argumentos que o stub deve ter recebido na única chamada. Você pode passar quantos argumentos forem necessários para verificar se o stub foi chamado com esses valores específicos
- **Retorno:** retorna `true` se o stub tiver sido chamado exatamente uma vez com os argumentos especificados; caso contrário, retorna `false`

# <a id="getcall">`getCall`</a>

O método `getCall` é utilizado para **acessar os detalhes de uma chamada específica de um spy ou stub, com base no índice da chamada**. Ele é útil para inspecionar parâmetros, retornos e o contexto (`this`) de chamadas individuais.

### Sintaxe Básica

```JavaScript
A< spy/stub >.getCall(n);
```

- `n`**:** um número inteiro representando o índice da chamada (começando em 0 para a primeira chamada)
- **Retorno:** retorna um objeto que representa a chamada especificada, contendo detalhes como argumentos, valor de retorno, contexto (`this`) e outros

## Exemplo

```JavaScript
import sinon from "sinon";

const obj         = {
    greet(name) {
        return `Hello, ${name}!`;
    }
};

const objGreetSpy = sinon.spy(obj, "greet");

obj.greet("Alice"); // Chamada 0.
obj.greet("Bob"); // Chamada 1.

// Acessar detalhes da primeira chamada (índice 0).
const firstCall   = objGreetSpy.getCall(0);

console.log(firstCall.args[0]);  // Output: Alice

// Acessar detalhes da segunda chamada (índice 1).
const secondCall  = objGreetSpy.getCall(1);

console.log(secondCall.args[0]); // Output: Bob
```

# <a id="observações">Observacoes</a>

Sempre restaure os stubs após os testes para garantir que o comportamento original seja restaurado e outros testes não seja afetados.

# [[Voltar para: Sinon.JS]](./SinonJS.md)