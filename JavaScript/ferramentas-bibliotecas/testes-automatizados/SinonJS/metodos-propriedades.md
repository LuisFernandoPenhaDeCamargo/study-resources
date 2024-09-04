# Métodos e Propriedades

### Sumário

- [`spy`](#spy)
- [`throws`](#throws)
- [`rejects`](#rejects)
- [`callsFake`](#callsfake)
- [`createStubInstance`](#createstubinstance)
- [`replace`](#replace)
- [Observações](#observações)

# <a id="spy">`spy`</a>

O método `spy` é utilizado para **monitorar chamadas a outras funções**. Ele permite verificar como uma função foi chamada, quais argumentos foram passados, quantas vezes foi chamada, entre outros detalhes.

### Sintaxe Básica

```JavaScript
const spy = sinon.spy([obj, ]method);
```

- `obj`**:** o objeto que contém o método a ser espionado. Se não for fornecido, o `spy` será aplicado diretamente à função fornecida
- `method`**:** a função ou método a ser espionado
- **Retorno:** uma função `spy` que pode ser usada para verificar chamadas, argumentos e outros detalhes sobre a função original. **O** `spy` **substitui o método original durante o teste, mas mantém a funcionalidade da função**

## Exemplo

```JavaScript
import sinon from "sinon";

// Função que será espionada.
function myFunction(a, b) {
    return a + b;
}

// Criando um spy para a função myFunction.
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

// Criando um spy para o método myMethod.
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

Fique atento ao fato de que, ao chamarmos uma função espionada, utilizamos `spyFunction`, enquanto, ao chamarmos um método espionado, utilizamos `obj.myMethod`. Portanto, quando se trata de funções (que não pertencem a um objeto), devemos invocar e inspecionar o espião criado (`spyFunction`). Já quando se trata de métodos (que pertencem a um objeto), devemos invocar o método espionado (`obj.myMethod`) e inspecionar o espião associado (`spyObjMethod`).

Invocar `spyObjMethod` também geraria os mesmos resultados, mas vamos adotar como padrão o exemplo anterior.

# <a id="throws">`throws`</a>

O método `throws` é utilizado para **simular um comportamento onde uma função lança uma exceção**. Isso é útil para testar como seu código lida com erros.

### Sintaxe Básica

```JavaScript
stub.throws(exception);
```

- `exception`**:** a exceção que será lançada quando o método substituído for chamado. Pode ser uma string, um objeto de erro, ou qualquer outro valor

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

# <a id="observações">Observações</a>

Sempre restaure os stubs após os testes para garantir que o comportamento original seja restaurado e outros testes não seja afetados.

# [[Voltar para: Sinon.JS]](./SinonJS.md)