# Métodos e Propriedades

### Sumário

- [`spy`](#spy)
- [`callsFake`](#callsfake)

# <a id="spy">`spy`</a>

O método `spy` é utilizado para **monitorar chamadas a outras funções**. Ele permite verificar como uma função foi chamada, quais argumentos foram passados, quantas vezes foi chamada, entre outros detalhes.

### Sintaxe Básica

```JavaScript
const spy = sinon.spy([object, ]method);
```

- `object`**:** o objeto que contém o método a ser espionado. Se não for fornecdio, o `spy` será aplicado diretamente à função fornecida
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
const spyFunction = sinon.spy(myFunction);

// Chamando a função espionada.
spyFunction(1, 2);

// Verificando se o spy foi chamado.
console.log(spyFunction.called);         // Output: true
// Verificando o número de vezes em que o spy foi chamado.
console.log(spyFunction.callCount);      // Output: 1
// Verificando os argumentos com os quais o spy foi chamado.
console.log(spyFunction.firstCall.args); // Output: [ 1, 2 ]

// Objeto com método a ser espionado.
const obj = {
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

Fique atento ao fato de que, ao chamarmos a função espionada, utilizamos `spyFunction`, enquanto para chamar o método espionado, utilizamos `obj.myMethod`. Portanto, quando se trata de funções (que não pertencem a um objeto), devemos invocar e inspecionar o espião criado (`spyFunction`). Já quando se trata de métodos (que pertencem a um objeto), devemos invocar o método espionado (`obj.myMethod`) e inspecionar o espião criado (`spyObjMethod`).

Invocar `spyObjMethod` também geraria os mesmos resultados, mas vamos definir como padrão seguir o exemplo acima.

# <a id="callsfake">`callsFake`</a>

O método `callsFake` é utilizado para **substituir uma função com uma implementação simulada personalizada durante os testes**. Ele é particularmente útil quando você deseja controlar o comportamento da função simulada para testar vários cenários.

### Sintaxe Básica

```JavaScript
sinon.stub(obj, "method").callsFake(fakeFunc);
```

- `fakeFunc`**:** uma função simulada (fake function) que será usada no lugar do método original. Essa função pode aceitar qualquer número de parâmetros, dependendo do método que está sendo stubado

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

---

# [[Próximo Tópico: Desenvolvendo Testes para Funções]](../desenvolvendo-testes-funcoes.md)