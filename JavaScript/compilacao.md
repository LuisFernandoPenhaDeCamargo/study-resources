# Compilação

É possível compilar o código-fonte Node.js em um binário executável para ocultar o código-fonte e distribuí-lo de forma mais segura. Existem várias ferramentas disponíveis que permitem fazer isso. Duas das mais populares são:

1. `pkg`

O pkg é uma ferramenta de linha de comando que permite empacotar aplicativos Node.js em binários executáveis independentes. Ele cria executáveis nativos do sistema operacional para Windows, Linux e macOS. Para usá-lo, você instala o pacote `pkg` globalmente através do npm:

```bash
$ npm install -g pkg
```

Em seguida, navegue até o diretório do seu projeto e execute o comando `pkg` com o caminho para o arquivo JavaScript principal do seu aplicativo:

```bash
$ pkg myapp.js
```

Isso gerará um ou mais binários executáveis na mesma pasta onde você está

2. `nexe`

O nexe é outra ferramenta semelhante ao pkg, que também suporta várias plataformas, incluindo Windows, Linux e macOS. Para usá-lo, você instala o pacote `nexe` globalmente através do npm:

```bash
$ npm install -g nexe
```

Em seguida, navegue até o diretório do seu projeto e execute o comando `nexe` com o caminho para o arquivo JavaScript principal do seu aplicativo:

```bash
$ nexe myapp.js
```

Ambas as ferramentas têm opções adicionais que permitem personalizar o processo de empacotamento, como especificar dependências externas, escolher o nome e o local do binário resultante, entre outros.

No entanto, é importante observar que a compilação para binário pode não ser uma solução completa para proteger o código-fonte, pois ainda é possível descompilar o binário e recuperar parte do código original. Além disso, as versões compiladas podem ser mais difícieis de depurar e manter. Portanto, considere cuidadosamente os prós e contras antes de decidir se deseja usar essa abordagem.

Observe que tanto o `pkg` quanto o `nexe` são módulos distribuídos pelo próprio npm e podem ser instalados globalmente para uso em qualquer projeto Node.js.

### Sumário

- [`pkg` x `nexe`](#pkg-x-nexe)
- [Segurança](#seguranca)
- [Arquivo de Serviço e PM2](#arquivo-serviço-e-pm2)
- [Compilando o seu Código-fonte com o `pkg`](#compilando-codigo-fonte-pkg)
    + [Especificação de Target](#compilando-codigo-fonte-pkg-especificacao-target)
- [Compilando o seu Código-fonte com o `nexe`](#compilando-codigo-fonte-nexe)
    + [Observações Importantes](#compilando-codigo-fonte-nexe-observacoes-importantes)

# <a id="pkg-x-nexe"></a>`pkg` x `nexe`

Ambos o `pkg` e o `nexe` têm seus próprios prós e contras, e a escolha entre eles depende das necessidades específicas do seu projeto e das características que são mais importantes para você. Abaixo segue algumas considerações para ajudar a avaliar o custo-benefício de cada um:

`pkg`

**Prós**

- Suporta empacotamento para múltiplas plataformas: Windows, Linux e macOS
- Pode incluir dependências diretamente no executável, tornando o binário autocontido
- Fácil de usar e configurar
- Oferece uma variedade de opções de personalização, incluindo a capacidade de especificar o arquivo de entrada, as plataformas de destino e outras configurações

**Contras**

- Os binários gerados podem ser grandes, especialmente se incluírem muitas dependências
- Pode ser necessário lidar com problemas de compatibilidade ao empacotar certos tipos de dependências
- A compilação pode ser mais lenta, especialmente para grandes projetos

`nexe`

**Prós**

- Menor sobrecarga de tamanho de arquivo em comparação com `pkg`
- Compilação geralmente mais rápida, especialmente para projetos menores
- Boa integração com ferramentas de build e automação de tarefas

**Contras**

- Limitado ao ambiente de compilação (Windows para Windows, Linux para Linux, etc.)
- Pode exigir configuração adicional para incluir dependências, embora ferramentas como `nexe-bundler` possam facilitar isso
- Menos flexibilidade em comparação com `pkg` em termos de opções de configuração e personalização

Ambas as ferramentas compilarão seu código Node.js para um binário executável, que será executado diretamente no sistema operacional alvo, sem a necessidade de ter o Node.js instalado. Isso pode resultar em melhor desempenho e um arquivo executável mais seguro, uma vez que o código-fonte não estará mais disponível em texto claro.

Em última análise, a escolha entre `pkg` e `nexe` dependerá das necessidades e requisitos específicos do seu projeto, bem como das características que são mais importantes por você, como tamanho do binário, desempenho, facilidade de uso e suporte multiplataforma. Recomenda-se experimentar ambas as ferramentas em seu projeto para determinar qual funciona melhor para você.

**Observações Importantes**

Se você incluir scripts dentro do seu executável, eles não serão mais acessíveis como scripts diretamente.

# <a id="seguranca"></a>Segurança

Após compilar seu código-fonte Node.js em um binário usando ferramentas como `pkg` ou `nexe`, o código-fonte original não estará diretamente acessível como um arquivo JavaScript legível. Em vez disso, ele estará incorporado no binário executável gerado.

No entanto, é importante observar que embora o código-fonte não esteja diretamente acessível como um arquivo JavaScript, ainda é possível recuperá-lo com algum esforço usando técnicas de engenharia reversa. Isso pode ennvolver a descompilação do binário ou a análise de seu conteúdo para tentar extrair o código original.

Portanto, ao distribuir um binário compilado, você está protegendo seu código-fonte contra acesso casual, mas ele ainda pode ser ser acessível para alguém com habilidades e ferramentas adequadas para descompilar o binário.

Se a proteção do código-fonte é uma preocupação crítica para o seu projeto, é importante considerar outras medidas de segurança, como a utilização de técnicas de ofuscação de código, controle de acesso restrito ao binário compilado e o uso de soluções de gerenciamento de direitos digitais (DRM), dependendo do nível de segurança necessário.

# <a id="arquivo-serviço-e-pm2"></a>Arquivo de Serviço e PM2

Mesmo após compilar seu aplicativo Node.js em um binário usado `pkg` ou `nexe`, você ainda pode gerenciar o binário usando ferramentas como PM2 e criar um arquivo de serviço para iniciar e gerenciar o processo.

Aqui estão os passos gerais para fazer isso:

1. **Instale o PM2 globalmente:**

```bash
$ npm install -g pm2
```

2. **Inicie o binário com o PM2:**

```bash
pm2 start seu-aplicativo-binario
```

3. **Verifique se o aplicativo está sendo executado corretamente:**

```bash
pm2 list
```

4. **Crie um arquivo de serviço para o PM2:**

Para garantir que o aplicativo seja iniciado automaticamente no boot do sistema e reiniciado em caso de falha, você pode criar um arquivo de serviço para o PM2. O procedimento para fazer isso pode variar dependendo do sistema operacional que você está usando.

- **Linux (systemd)** você pode criar um arquivo de serviço systemd para o PM2. Aqui está um exemplo genérico de como isso pode ser feito:
    + Crie um arquivo chamado **seu-aplicativo.service** em **/etc/systemd/system/** com o seguinte conteúdo:

```makefile
[Unit]
Description=Seu Aplicativo

[Service]
Type=simple
ExecStart=pm2 start seu-aplicativo-binario
Restart=always
User=seu-usuario
Group=seu-grupo

[Install]
WantedBy=multi-user.target
```

+ Substitua `seu-aplicativo-binario`, `seu-usuario` e `seu-grupo` pelos valores apropriados para o seu ambiente
+ Em seguida, habilite e inicie o serviço

```bash
$ sudo systemctl enable seu-aplicativo
$ sudo systemctl start seu-aplicativo
```

- **Windows:** para Windows, você pode criar um serviço usando ferramentas como NSSM (Non-Sucking Service Manager). O procedimento detalhado pode variar, mas o conceito é semelhante

Com o arquivo de serviço configurado, o PM2 será iniciado automaticamente com o sistema e seu aplicativo será gerenciado da maneira que você configurou com o PM2.

Em resumo, mesmo após compilar seu aplicativo Node.js em um binário, você ainda pode usar o PM2 para gerenciá-lo e garantir que seja iniciado e executado de forma confiável.

# <a id="compilando-codigo-fonte-pkg"></a>Compilando o seu Código-fonte com o `pkg`

Para compilar o seu código-fonte Node.js em um binário executável usando a ferramenta `pkg`, você primeiro precisa instalá-lo globalmente em seu sistema. Você pode instalá-lo usando o npm com o seguinte comando:

```bash
$ npm install -g pkg
```

Agora, vamos supor que você tenha um projeto Node.js com a seguinte estrutura de diretórios e arquivos:

```bash
meu-projeto/
├── package.json
├── server.js
└── $< outros-arquivos... >
```

Agora, para compilar seu código-fonte em um binário executável, siga estas etapas:

1. **Certifique-se de que seu arquivo package.json esteja configurado corretamente:** certifique-se de que seu arquivo **package.json** contenha todas as dependências e os scripts de inicialização apropriados

2. **Navegue atéo diretório raiz do seu projeto:**

```bash
$ cd caminho/do/seu/projeto
```

3. **Execute o comando** `pkg` **para compilar o seu código:**

```bash
$ pkg server.js
```

Substitua `server.js` pelo nome do seu arquivo principal, se for diferente. Este comando irá compilar seu arquivo `server.js` e todas as dependências do Node.js em um binário executável

4. **Verifique o binário gerado:** após a conclusão do processo de compilação, o `pkg` deve ter criado um ou mais arquivos executáveis na mesma pasta onde você executou o comando. Esses arquivos serão binários executáveis independentes que você pode distribuir e executar em sistema compatíveis

## <a id="compilando-codigo-fonte-pkg-especificacao-target"></a>Especificação de Target

Quando você usa o `pkg` para compilar seu aplicativo, ele não necessariamente usa a versão do Node.js que está atualmente ativa no seu sistema via nvm ou qualquer outro gerenciador de versões. Em vez disso, o `pkg` utiliza uma versão específica do Node.js que está incorporada dentro dos binários que ele cria, com base nas "targets" (alvos) que você específica ou que são assumidas por padrão.

Aqui está como isso funciona:

- **Especificação de Target:**
quando você compila seu aplicativo com `pkg`, pode especificar uma target de compilação que inclui a versão do Node.js. Por exemplo:

```bash
pkg -t node16-linux-x64 server.js
```

Nesse caso, você está especificando explicitamente que o binário deve usar o Node.js versão 16 para Linux x64. Se você não especificar uma target, o `pkg` usará um default com base na versão mais recente suportada.

- **Versão do Node.js na execução:** após a compilação, quando você executa o binário (`./server-linux`), ele está executando o Node.js na versão embutida no binário, e não a versão que está instalada no seu sistema. Isso significa que independente de qual versão do Node.js você tem instalada via nvm ou instaladores diretos, o seu aplicativo empacotado sempre usará a versão que foi especificada durante a compilação com `pkg`

Portanto, digamos que você esteja usando Node.js 16.20.2 em seu ambiente de desenvolvimento, mas compilou seu aplicativo com um target `node16`, o binário resultante está usando a versão específica do Node.js 16 que o `pkg` tem disponível para essa target, que pode ser diferente da versão 16.20.2.

# <a id="compilando-codigo-fonte-nexe"></a>Compilando o seu Código-fonte com o `nexe`

- Instale o pacote do Nexe globalmente através do npm
- Para compilar o seu projeto, utilize o comando `nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --verbose` no diretório raiz do seu projeto  
    Tenha como contexto a API zoe-game-api. Utilizei a versão 3.3.3 do nexe, foi a versão que eu encontrei que é compatível com o node 8.16.0.
    + `-i`**:** específica o ponto de entrada da aplicação (`server.js`)
    + `-o`**:** caminho para o arquivo de saída. No comando acima, esta opção dá o nome `server` para o arquivo de saída
    + `--resource`**:** específica os recursos que devem ser incluídos na compilação. Neste caso, todos os que se encontram no diretório raíz do projeto
    + `--target`**:** específica o target. Específica a versão do Node.js a ser utilizada, assim como o sistema operacional e a sua arquitetura
    + `--build`**:** esta opção força o Nexe a compilar o Node.js a partir do código-fonte ao invés de usar um binário pré-compilado
    + `--python "$(pyenv which python)"`**:** específica a versão do Python (2.7.18) a ser utilizada. Foi necessário incluir essa opção por conta da zoe-game-api
    + `--verbose`**:** define o modo do log como verbose

Notas importantes.

- **Verificar dependências** certifique-se de que todas as dependências necessárias para a compilação do Node.js estejam presentes no seu sistema, como Python e GCC/Clang
- **Tempo de compilação:** compilar o Node.js a partir do código-fonte pode ser um processo demorado, então tenha paciência
- **Testar o executável:** após a compilação, é crucial testar o executável em seu ambiente pretendido para garantir que todas as funcionalidades estejam operando como esperado

## <a id="compilando-codigo-fonte-nexe-observacoes-importantes"></a>Observações Importantes

Mesmo com a última versão disponível (4.0.0-rc.6), a opção de configuração não funcionou no cenário acima (`--configure`). Eu queria fornecer os seguintes valores a ela (o comando ficaria assim, `nexe -i server.js -o server-executable --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --verbose --configure="--fully-static --without-node-options --without-dtrace --without-etw" --make="CFLAGS='-s' CXXFLAGS='-s'"`):

- `--configure`**:** inclui várias opções de configuração
- `--fully-static`**:** compila o Node.js como um binário totalmente estático, o que significa que todas as bibliotecas são embutidas no executável
- `--without-node-options`**:** remove opções de linha de comando desnecessárias
- `--without-dtrace` **e** `--without-etw`**:** desativa características de debugging que não são necessárias para muitos aplicativos
- `--make="CFLAGS='-s' CXXFLAGS='s'"`**:** instrui o compilador a "strip" (remover símbolos desnecessários) dos arquivos binários durante a compilação. A flag `-s` com os compiladores GCC/Clang remove informações de debug e símbolos desnecessários

O objetivo era garantir que o binário gerado pelo Nexe fosse o mais otimizado possível, sem informações de depuração e que fosse "stripped" (isto é, sem símbolos desnecessários). As flags acima seriam passadas ao script de configuração do Node.js para ajustar como o Node.js e o V8 seriam construídos.

As configurações acima deveriam ajudar a criar um binário mais leve e sem informações desnecessárias de depuração, adequado para distribuição e produção.

---

Outro problema vivenciado foi que o Nexe conseguia manipular arquivos de um diretório, mas outros não, mesmo todos possuindo as mesmas permissões. Por isso agora a opção `--resource` é utilizada, sendo que o seu valor é o diretório do projeto inteiro, para garantir que todos os arquivos serão incluídos no compilado.

---

Quando você tenta diminuir o tamanho do seu binário utilizando o comando `strip` ou `upx`, ele acaba quebrando, e quando executado, imprime a mensagem abaixo:

```bash
$ ./server

_third_party_main.js:6
    throw 'Invalid Nexe binary';
    ^
Invalid Nexe binary
```

isso no Ubuntu 22.04.4 LTS, no Ubuntu 18.04.2 LTS, o seguinte erro é acusado

```bash
Segmentation fault (core dumped)
```

A forma encontrada para diminuir o tamanho do binário é utilizar o `upx` diretamente na runtime do node que será encapsulada junto com o restante do seu projeto, **se atente que isso só funciona para o Nexe 4.0.0-rc**. Para isso você precisa especificar a opção de `--build`, ela irá buildar a engine dentro de `/home/$< usuário >/.nexe/$< versão do Node.js >/out/Release/`.

Por exemplo:

- `nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)"`
- A opção `--build`, considerando a opção `--target`, builda em **/home/$< usuário >/.nexe/** o diretório **/8.16.0/out/Release/**. Dentro dele está o binário **node**
- Especificamos a versão do Python, porque o Node.js 8.16.0 utiliza o Python e não o Python 3
- Você utiliza o comando `upx` no **node** (`upx node`)
- Com isso, como a engine está menor, o seu binário será menor, afinal, dentro do seu binário também vai a engine, além de todas as dependências necessárias para a execução do seu projeto

---

Outro ponto importante a se ressaltar, é que o código fonte se encontra dentro do compilado, ele ainda está lá, então se você utilizar o comando `strings $< binário >`, você consegue visualizá-lo.

---

Considerando ainda o ambiente do servidor (contexto da Orion-games), que utiliza um SO mais antigo (Ubuntu 18.04.2 LTS), o seguinte problema foi encontrado:

```bash
$ ./server
./server: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.29' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./server)
```

Como o SO da minha máquina é mais recente (Ubuntu 22.04.4 LTS) que o SO do servidor, aquele no qual o binário que eu compilei será executado, a GLIBC do meu binário era diferente daquela utilizada no servidor. Para resolver isso, foi utilizada uma VM com o mesmo SO (Ubuntu 18.04.2 LTS), e então, o binário foi compilado neste ambiente.

#

- Tentar utilizar o musl
  + npx --package=node-musl musl-env npx nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --configure=--fully-static --verbose

- Resolver a forma como o binário é tratado pelo pm2

-

```bash
/usr/lib/node_modules/@zoeslots/zoe-game-api/server:1
(function (exports, require, module, __filename, __dirname) { ELF
                                                              ^

SyntaxError: Invalid or unexpected token
    at createScript (vm.js:80:10)
    at Object.runInThisContext (vm.js:139:10)
    at Module._compile (module.js:617:28)
    at Object.Module._extensions..js (module.js:664:10)
    at Module.load (module.js:566:32)
    at tryModuleLoad (module.js:506:12)
    at Function.Module._load (module.js:498:3)
    at Object.<anonymous> (/usr/lib/node_modules/pm2/lib/ProcessContainerFork.js:27:21)
    at Module._compile (module.js:653:30)
    at Object.Module._extensions..js (module.js:664:10)
```

```bash
$ cat /etc/systemd/system/pm2-zoe.service [Unit]
Description=PM2 process manager
Documentation=https://pm2.keymetrics.io/
After=network.target

[Service]
Type=forking
User=zoe
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
Environment=PATH=/usr/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
Environment=PM2_HOME=/home/zoe/.pm2
PIDFile=/home/zoe/.pm2/pm2.pid

ExecStart=/usr/lib/node_modules/pm2/bin/pm2 resurrect
ExecReload=/usr/lib/node_modules/pm2/bin/pm2 reload all
ExecStop=/usr/lib/node_modules/pm2/bin/pm2 kill
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

-

```json
{
  "name": "@zoeslots/zoe-game-api",
  "version": "2.5.0",
  "description": "Game API manages game operations including money in/out, accumulated/jackpot raffle",
  "main": "server.js",
  "author": "Zoe Slots, LLC",
  "bin": {
    "orion-game-server": "./server.js"
  },
  "scripts": {
    "test": "./node_modules/mocha/bin/mocha -R spec tests/api/*",
    "benchmark": "node tests/benchmark/benchmark.js"
  },
  "dependencies": {
    "axios": "^0.19.0",
    "body-parser": "~1.0.1",
    "express": "~4.0.0",
    "log-timestamp": "^0.1.2",
    "moment": "^2.11.1",
    "mysql": "^2.5.4",
    "mysql2": "1.0.0-rc.1",
    "redis": "~2.4.2",
    "request": "^2.81.0",
    "sequelize": "^3.24.3"
  },
  "devDependencies": {
    "chai": "^3.5.0",
    "mocha": "^2.4.5",
    "request": "^2.81.0",
    "supertest": "^1.2.0"
  }
}
```

```json
{
  "name": "@zoeslots/updater",
  "version": "1.7.0",
  "description": "updates some stuff in stand",
  "bin": "./target/x86_64-unknown-linux-musl/release/updater",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/Xunjin/updater.git"
  },
  "author": "Xunjin",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/Xunjin/updater/issues"
  },
  "homepage": "https://github.com/Xunjin/updater#readme",
  "files": [
    "./target/x86_64-unknown-linux-musl/release/updater"
  ]
}
```

- Entender "dependências externas"? No contexto do binário gerado por mim e a execução dele no servidor
- ~/. Contexto: pwd no terminal
- Engine, runtime, ambiente de execução. Contexto: Node.js
- `systemctl daemon-reload`

- deu problema com a versão estática de novo, como eu fiz esse caralho? Faça o processo do zero pra testar

root     21169  8.2  1.4 679972 56592 pts/2    Sl+  10:45   0:05 ./my_server_static_upx

{
  "name": "@zoeslots/zoe-game-api",
  "version": "2.5.3-homolog-node.16.1",
  "description": "Game API manages game operations including money in/out, accumulated/jackpot raffle",
  "main": "server.js",
  "author": "Zoe Slots, LLC",
  "bin": {
    "orion-game-server": "server.js"
  },
  "scripts": {
    "test": "./node_modules/mocha/bin/mocha -R spec tests/api/*",
    "benchmark": "node tests/benchmark/benchmark.js"
  },
  "dependencies": {
    "axios": "^0.19.0",
    "body-parser": "~1.0.1",
    "express": "~4.0.0",
    "log-timestamp": "^0.1.2",
    "moment": "^2.11.1",
    "mysql": "^2.5.4",
    "mysql2": "1.0.0-rc.1",
    "redis": "~2.4.2",
    "request": "^2.81.0",
    "sequelize": "^3.24.3"
  },
  "devDependencies": {
    "chai": "^3.5.0",
    "mocha": "^2.4.5",
    "request": "^2.81.0",
    "supertest": "^1.2.0"
  },
  "pkg": {
    "scripts": [
      "./models/*.js"
    ]
  }
}

chave main sempre é inserida?

{
  "name": "@zoeslots/zoe-game-api",
  "version": "2.5.3-homolog-node.16.2",
  "description": "Game API manages game operations including money in/out, accumulated/jackpot raffle",
  "author": "Zoe Slots, LLC",
  "bin": {
    "orion-game-server": "zoe-game-api"
  },
  "scripts": {
    "test": "./node_modules/mocha/bin/mocha -R spec tests/api/*",
    "benchmark": "node tests/benchmark/benchmark.js"
  },
  "dependencies": {
    "axios": "^0.19.0",
    "body-parser": "~1.0.1",
    "express": "~4.0.0",
    "log-timestamp": "^0.1.2",
    "moment": "^2.11.1",
    "mysql": "^2.5.4",
    "mysql2": "1.0.0-rc.1",
    "redis": "~2.4.2",
    "request": "^2.81.0",
    "sequelize": "^3.24.3"
  },
  "devDependencies": {
    "chai": "^3.5.0",
    "mocha": "^2.4.5",
    "request": "^2.81.0",
    "supertest": "^1.2.0"
  },
  "files": [
    "./zoe-game-api"
  ]
}

pkg server.js -o batata -t node16-linux-x64 --config package.json