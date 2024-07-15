# Criando Testes para uma Função

Tome como exemplo a função abaixo, iremos criar testes para ela:

```JavaScript
import si from "systeminformation";
import axios from "axios";

import os from "os";
import fs from "fs";
import crypto from "crypto";

// Responsável por obter o token de acesso.
export async function getAccessToken() {
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

import { getAccessToken } from "../services/sensitive_data_getters.mjs";

describe("getAccessToken", () => {
  let postStub;

  beforeEach(() => {
    postStub = sinon.stub(axios, "post");
  });

  afterEach(() => {
    postStub.restore();
  });

  it("deve retornar um token de acesso quando a solicitação for bem-sucedida", async () => {
    const fakeResponse = { data: { access_token: "fake_access_token" } };
    postStub.resolves(fakeResponse);

    const token = await getAccessToken();

    expect(token).to.be.equal("fake_access_token");
    expect(postStub.calledOnce).to.be.true;
    expect(postStub.calledWith(`https://example.net:443/v2/servers/${process.env.SERVER_ID}/auth`)).to.be.true;
  });

  it("deve registrar uma mensagem de erro quando a solicitação falhar", async () => {
    const consoleErrorStub = sinon.stub(console, "error");
    const fakeError = new Error("Request failed");
    postStub.rejects(fakeError);

    const token = await getAccessToken();

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

Por exemplo, se você está usando o Mocha e tem um arquivo **getAccessToken.test.mjs**, o Mocha pode ser configurado para encontrar e executar todos os arquivos que terminam com **.test.mjs**:

```JSON
{
    "scripts": {
        "test": "mocha '**/*.test.mjs'"
    }
}
```

Isso instruirá o Mocha a procurar por arquivos que terminam com **.test.mjs** em qualquer diretório e subdiretório e executá-lo como parte da suíte de testes.

Observe que não há um padrão obrigatório para o nome dos arquivos de teste, mas há convenções comuns que muitos desenvolvedores e projetos seguem. Uma dessas convenções é nomear os arquivos de teste de forma que seja fácil identificar o que está sendo testado. Isso facilita a manutenção e a compreensão do código.

Aqui estão algumas convenções populares:

### 1. Nome da função

Se você tem uma função chamada `getAccessToken`, o arquivo de teste pode ser nomeado como **getAccessToken.test.mjs**.

### 2. Nome do módulo

Se você tem um módulo chamado **auth**, o arquivo de teste pode ser nomeado como **auth.test.mjs**.

### 3. Uso de subdiretórios para organizar testes por funcionalidade ou módulo

Considerando as situações acima, você pode ter uma estrutura de diretórios como:

```Bash
test/
└── auth/
    └── getAccessToken.test.js
```

Essas convenções ajudam a manter os testes organizados e facilmente identificáveis.