# Mocha

### Sumário

- [Criando Testes para uma Função](#criando-testes-funcao)

# <a id="criando-testes-funcao">Criando Testes para uma Função</a>

Tome como exemplo a função abaixo, iremos criar testes para ela:

```JavaScript
const si = require("systeminformation");
const axios = require("axios");

const os = require("os");
const fs = require("fs");
const crypto = require("crypto");

module.exports = class SensitiveDataGetters {
    // Responsável por obter o token de acesso.
    static async getAccessToken() {
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
}
```

Para testar a função `getAccessToken` com o Mocha, Chai e o Sinon, você pode seguir os seguintes passos:

### 1. Instale o Mocha, Chai e Sinon

```Bash
$ npm install --save-dev mocha chai sinon
```

### 2. Crie um arquivo de teste

```JavaScript
// Por exemplo: ./test/getAccessToken.test.js.

const { expect } = require('chai');
const sinon = require('sinon');
const axios = require('axios');
const { getAccessToken } = require('../services/sensitive_data_getters'); // Ajuste o caminho conforme necessário

describe('getAccessToken', () => {
  let postStub;

  beforeEach(() => {
    postStub = sinon.stub(axios, 'post');
  });

  afterEach(() => {
    postStub.restore();
  });

  it('should return an access token when the request is successful', async () => {
    const fakeResponse = { data: { access_token: 'fake_access_token' } };
    postStub.resolves(fakeResponse);

    const token = await getAccessToken();

    expect(token).to.equal('fake_access_token');
    expect(postStub.calledOnce).to.be.true;
    expect(postStub.calledWith(`https://api.orionapps.net:443/v2/servers/${process.env.SERVER_ID}/auth`)).to.be.true;
  });

  it('should log an error message when the request fails', async () => {
    const consoleErrorStub = sinon.stub(console, 'error');
    const fakeError = new Error('Request failed');
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
    "scripts:" {
        "test": "mocha"
    }
```

### 4. Execute os testes

```Bash
$ npm test
```

## Nome do Diretório

Considerando o exemplo acima, se atente que o nome do diretório não precisa ser obrigatoriamente "./test/". É uma convenção comum usar "test" ou "tests" para armazenar arquivos de teste, mas você pode nomear o diretório como quiser, o importante é que o Mocha saiba onde encontrar os arquivos de teste.

### Exemplo

Vamos supor que você tenha a seguinte estrutura abaixo:

```Bash
/my-project
    /src
        /services
            sensitive_data_getters.js
        /custom-tests
            getAccessToken.test.js
        index.js
        package.json
```

Neste exemplo, os testes estão no diretório "custom-tests".