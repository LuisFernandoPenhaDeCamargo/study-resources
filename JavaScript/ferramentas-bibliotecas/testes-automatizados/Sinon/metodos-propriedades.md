# Métodos e Propriedades

### Sumário

- [`spy`](#spy)
- [`callsFake`](#callsfake)

# <a id="spy">`spy`</a>

O método `spy` é utilizado para **monitorar chamadas a outras funções**. Ele permite verificar como uma função foi chamada, quais argumentos foram passados, quantas vezes foi chamada, entre outros detalhes.

### Sintaxe Básica

```JavaScript
```

# <a id="callsfake">`callsFake`</a>

O método `callsFake` é utilizado para **substituir a implementação de uma função stubada por uma função falsa (fake function) que você define**. Isso é útil quando você deseja simular o comportamento de uma função com lógica personalizada durante os testes.

### Sintaxe Básica

```JavaScript
stub.callsFake(fakeFunction);
```

- `fakeFunction`**:** a função que você deseja usar como a implementação falsa

## Exemplo

```JavaScript
// fetchData.mjs
import axios from "axios";

export async function fetchData(url) {
    const response = await axios.get(url);

    return response.data;
}

// main.mjs
import { expect }    from "chai";
import sinon         from "sinon";

import { fetchData } from "./fetchData.mjs";

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

[Criando Testes para uma Função -->](../criando-testes-funcao.md)