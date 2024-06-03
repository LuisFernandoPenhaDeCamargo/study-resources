# Node.js

### Sumário

- [Engine, Runtime e Ambiente de Execução](#engine-runtime-ambiente-execucao)
- [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
- [Ato de Publicação](#ato-publicacao)
- [`npx`](#npx)
- [Node 22.1.0 e a Criação de Executáveis Únicos](#node-22-criacao-executaveis-unicos)
  + [Assets](#node-22-criacao-executaveis-unicos-assets)
  + [Suporte Para o Snapshot de Inicialização](#node-22-criacao-executaveis-unicos-suporte-snapshot-inicializacao)
  + [Suporte Para o Cache de Código V8](#node-22-criacao-executaveis-unicos-suporte-cache-codigo-v8)
  + [No Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado)
    - [`sea.isSea()`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-issea)
    - [`sea.getAsset(key[,encoding])`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getasset)
    - [`sea.getAssetAsBlob(key[, options])`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getassetasblob)
    - [`sea.getRawAsset(key)`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getrawasset)
    - [`require(id)` No Script Principal Injetado Não é Baseado em Arquivo](#node-22-criacao-executaveis-unicos-script-principal-injetado-requireid-script-principal-injetado-nao-eh-baseado-arquivo)
    - [`__filename` e `module.filename` No Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado-filename-module-filename-script-principal-injetado)
    - [`__dirname` no Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado-dirname-script-principal-injetado)
  + [Notas](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-notas)
  + [Testando esta Feature](#node-22-criacao-executaveis-unicos-script-principal-injetado-testando-feature)
  + [Conclusão](#node-22-criacao-executaveis-unicos-script-principal-injetado-conclusao)

# <a id="engine-runtime-ambiente-execucao"></a>Engine, Runtime e Ambiente de Execução

Os termos "engine", "runtime" e "ambiente de execução" são frequentemente usados para descrever diferentes aspectos da infraestrutura que permite a execução de código JavaScript fora de um navegador.

**Engine**

Engine refere-se ao mecanismo que interpreta e executa o código JavaScript. No caso do Node.js, a engine utilizada é o V8, que é desenvolvida pelo Google e também utilizada no navegador Google Chrome.

- **V8:** é uma engine de código aberto escrita em C++. Ela compila o código JavaScript diretamente em código de máquina nativo antes de executá-lo, o que resulta em uma execução muito rápida. O V8 também é conhecido por seu eficiente gerenciamento de memória e otimizações de execução

**Runtime**

Runtime (ou ambiente de execução) se refere ao conjunto de ferramentas e bibliotecas que permitem a execução de código JavaScript no servidor. O runtime inclui a engine JavaScript, mas também adiciona APIs e funcionalidades adicionais que não estão disponíveis no ambiente do navegador.

- **Node.js Runtime:** Node.js estende as capacidades do V8 adicionando várias APIs e bibliotecas que permitem realizar operações de E/S (entrada/saída), manipulação de arquivos, operações de rede, entre outras. O runtime do Node.js inclui:
  + **Módulos de núcleo:** como `fs` para manipulação de sistema de arquivos, `http` para criar servidores web, `path` para manipulação de caminhos de arquivos, etc.
  + **Eventos:** um loop de eventos que permite a execução de operações assíncronas
  + **Gerenciamento de pacotes:** embora separado, o npm é frequentemente usado em conjunto com o Node.js para gerenciar pacotes e dependências

**Ambiente de Execução**

Ambiente de Execução geralmente se refere ao contexto mais amplo no qual o código Node.js está sendo executado. Isso inclui o sistema operacional, as configurações de ambiente, as variáveis de ambiente, e outras dependências externas.

- **Sistema Operacional:** o ambiente onde o Node.js está instalado pode ser Windows, macOS, Linux, etc.
- **Variáveis de ambiente:** variáveis que configuram o comportamento do Node.js e da aplicação, como `NODE_ENV`, que define se a aplicação está em mode de desenvolvimento ou produção
- **Dependências externas:** qualquer outra software ou serviço que a aplicação Node.js pode depender, como bancos de dados, caches, filas de mensagens, etc.

**Resumo**

- **Engine (V8):** mecanismo que interpreta e executa o código JavaScript
- **Runtime (Node.js):** inclui a engine V8 mais APIs e bibliotecas adicionais para permitir operações do lado do servidor
- **Ambiente de execução:** contexto mais amplo onde o Node.js é executado, incluindo sistema operacional, variáveis de ambiente e outras dependências externas

**Exemplos**

# <a id="compatibilidade-nodejs-npm"></a>Compatibilidade Entre o Node.js e o npm

O Node.js e o npm estão relacionados, mas são dois componentes separados. O Node.js é um ambiente de tempo de execução JavaScript que permite executar código JavaScript no servidor, enquanto o npm é um gerenciador de pacotes para JavaScript.

O Node.js é instalado independentemente do npm e vice-versa. No entando, o npm é geralmente instalado automaticamente junto com o Node.js. Isso ocorre porque o npm faz faz parte da instalação padrão do Node.js desde a versão 0.6.3.

A compatibilidade entre as versões do Node.js e do npm não é tão rígida quanto parece. O npm é frequentemente atualizado de forma independente do Node.js para fornecer novos recursos, correções de bug e melhorias de desempenho. No entanto, em geral, é recomendável usar uma versão recente do npm com uma versão recente do Node.js para garantir a melhor experiência de desenvolvimento.

Você pode atualizar o npm para a versão mais recente usando o comando `npm install -g npm`, independente da versão do Node.js que você esteja usando.

# <a id="ato-publicacao"></a>Ato de Publicação

O ato de publicar um pacote, enquanto se utiliza uma versão do Node.js em uma máquina e, em seguida, executar esse pacote em uma máquina com uma versão diferente do Node.js, não deve ser um problema.

O npm é apenas usado para empacotar e distribuir o código-fonte do pacote. Uma vez publicado, o pacote é independente da versão do Node.js usada para publicá-lo (se atentando que quem o publica é o npm). O que importa é a compatibilidade do pacote com a versão do Node.js na máquina onde ele será executado.

Em resumo, desde que o pacote seja compatível com a versão do Node.js na máquina de destino, não deve haver problemas em publicar o pacote em uma versão diferente do Node.js. No entanto, é sempre uma prática recomendada testar o pacote em diferentes versões do Node.js para garantir a compatibilidade e o funcionamento adequado em diferentes ambientes de execução.

# <a id="node-22-criacao-executaveis-unicos"></a>Node 22.1.0 e a Criação de Executáveis Únicos

Código-fonte: **src/node_sea.cc**

Esse recurso permite a distribuição conveniente de uma aplicação Node.js para um sistema que não possui o Node.js instalado.

O Node.js suporta a criação de aplicativos executáveis únicos permitindo a injeção de um blob preparado pelo Node.js, que pode conter um script empacotado, no binário do node. Durante a inicialização, o programa verifica se algo foi injetado. Se o blob for encontrado, ele executa o script contido nele. Caso contrário, o Node.js opera normalmente.

A funcionalidade de aplicativo executável único atualmente suporta apenas a execução de um único script incorporado usando o sistema de módulos CommonJS.

Os usuários podem criar um aplicativo executável único a partir de seu script empacotado com o próprio binário do node e qualquer ferramenta que possa injetar recursos no binário.

Aqui estão os passos para criar um aplicativo executável único usando uma dessas ferramentas, o postject:

1. **Crie um arquivo JavaScript:**

```bash
$ echo 'console.log(`Hello, ${process.argv[2]}!`);' > hello.js
```

Este comando cria um arquivo JavaScript chamado **hello.js** que imprime uma mensagem personalizada no console. Aqui está o que ele faz:

- `echo`**:** é um comando de terminal que simplesmente imprime o texto fornecido como argumento no terminal
- `'console.log(´Hello, ${process.argv[2]}!´);'`**:** é a mensagem que queremos imprimir. Estamos usando uma template string com interpolação de variáveis para inserir o primeiro argumento passado para o script como parte da mensagem. `process.argv[2]` é uma forma de acessar o primeiro argumento passado para o script quando é executado na linha de comando
- `> hello.js`**:** redireciona a saída do comando `echo` para um arquivo chamado `hello.js`. Isso cria ou sobrescreve o arquivo **hello.js** com a mensagem fornecida

Portanto, depois de executar este comando, o arquivo **hello.js** conterá um script JavaScript que imprime "`Olá, $< argumento >!`" no console, onde `argumento` é o primeiro argumento passado para o script quando é executado. Por exemplo, se você executar `node hello.js world`, ele imprimirá "`Hello, world`" no console.

2. **Crie um arquivo de configuração que será utilizado na construção do blob que será gerado para ser injetado em um aplicativo executável único:**

```bash
$ echo '{ "main": "hello.js", "output": "sea-prep.blob" }' > sea-config.json
```

Este comando cria um arquivo de configuração JSON chamado **sea-config.json** que específica os detalhes para criação de um blob de preparação que pode ser injetado em um aplicativo executável único. Aqui está o que ele faz:

- `echo`**:** assim como no comando anterior, este comando imprime o texto fornecido como argumento no terminal
- `'{ "main": "hello.js", "output": "sea-prep.blob" }'`**:** este é o conteúdo do arquivo JSON que estamos criando. Ele específica dois campos
    + `main`**:** o nome do arquivo JavaScript principal que será incluído no blob de preparação. Neste caso, é **hello.js**, o mesmo arquivo JavaScript que criamos anteriormente
    + `output`**:** o nome do arquivo de saída que conterá o blob de preparação. Neste caso, é **sea-prep.blob**
- `> sea-config.json`**:** redireciona a saída do comando `echo` para um arquivo chamado **sea-config.json**, criando ou sobrescrevendo o arquivo com o conteúdo fornecido

Portanto, depois de executar este comando, o arquivo **sea-config.json** conterá as configurações necessárias para gerar o blob de preparação que pode ser injetado em um aplicativo executável único.

3. **Gere o blob que será injetado:**

```bash
$ node --experimental-sea-config sea-config.json
```

Este comando gera o blob de preparação que pode ser injetado em um aplicativo executável único com base nas configurações especificadas no arquivo **sea-config.json**. Aqui está o que ele faz:

- `node`**:** este comando é usado para executar scripts JavaScript no ambiente Node.js
- `--experimental-sea-config sea-config.json`**:** esta parte do comando usa a opção `--experimental-sea-config` para indicar que queremos usar uma funcionalidade experimental do Node.js relacionada à configuração do `sea` (Single Executable Application). O argumento `sea-config.json` específica o arquivo de configuração a ser usado para gerar o blob de preparação

Após executar este comando, o Node.js usará as configurações do arquivo **sea-config.json** para gerar um blob de preparação, que é um arquivo binário que contém o script especificado e pode ser injetado no aplicativo executável único.

4. **Crie a cópia do executável** `node` **e o nomeie de acordo com as suas necessidade (em sistemas que não são Windows):**

```bash
$ cp $(command -v node) hello
```

- `cp`**:** é o comando utilizado para copiar arquivos no terminal
- `$(command -v node)`**:** está parte do comando utiliza a substituição de comando (`$()`) para obter o caminho dos executável Node.js atualmente em uso. O comando `command -v node` retorna o caminho do executável do Node.js
- `hello`**:** este é o nome do arquivo de saída que será criado como cópia do executável do Node.js. Você pode substituir "hello" pelo nome desejado para sua aplicação

Portanto, depois de executar este comando, será criada uma cópia do executável Node.js com o nome especificado, neste caso, "hello". Esta cópia pode ser usada para injetar o blob de preparação e criar um aplicativo executável único.

5. **Injete a blob no binário copiado através da execução do postject com as seguintes opções:**

```bash
$ npx postject hello NODE_SEA_BLOB sea-prep.blob \
    --sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2
```

Este comando injeta o blob criado anteriormente no binário copiado do Node.js usando a ferramenta postject com as opções específicadas. Aqui está o que ele faz:

- `npx postject`**:** executa a ferramenta postject, que é usada para injetar recursos em binários, como o executável Node.js
- `hello`**:** é o nome do binário copiado do Node.js que será modificado para incluir o blob
- `NODE_SEA_BLOB`**:** é o nome do recurso/segmento no binário onde o conteúdo do do blob será armazenado
- `sea-prep.blob`**:** é o nome do blob criado anteriormente, que será injetado no binário
- `--sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2`**:** específica o "sentinela-fuse" usado pelo projeto Node.js para detectar se um arquivo foi injetado. Este é um identificador único que ajuda a garantir a integridade do binário após a injeção do blob

Portanto, após executar este comando, o blob será injetado no binário `hello`, tornando-o um aplicativo executável único que pode ser distribuído e executado em sistemas que não possuem o Node.js instalado.

**Sobre** `fuse` **(Electron Fuses)**

Para um subconjunto de funcionalidade do Electron, faz sentido desabilitar determinados recursos para um aplicativo inteiro. Por exemplo, 99% dos aplicativos não fazem uso de ELECTRON_RUN_AS_NODE, esses aplicativos querem poder enviar um binário que é incapaz de usar esse recurso. Também não queremos que os consumidores do Electron construam o Electron a partir da fonte, pois isso representa um enorme desafio técnico e tem um alto custo de tempo e dinheiro.

Os **fusíveis** são a solução para este problema, em alto nível eles são "bits mágicos" no binário Electron que podem ser invertidos ao empacotar seu aplicativo Electron para ativar/desativar certos recursos/restrições. Como eles são invertidos no momento do pacote antes de você assinar o código do seu aplicativo, o sistema operacional se torna responsável por garantir que esses bits não sejam revertidos por meio da validação de assinatura de código no nível do sistema operacional (Gatekeeper/App Locker).

6. **Execute o binário:**

```bash
$ ./hello world
Hello, world
```

**Gerando blobs de Preparação Que Serão Inseridos em Aplicativos Executáveis Únicos**

Blobs de preparação que serão inseridos em aplicativos executáveis únicos que são injetados no aplicativo podem ser gerados usando a flag `--experimental-sea-config` do binário Node.js que será usado para construir o executável único. É necessário um caminho para um arquivo de configuração no formato JSON. Se o caminho passado não for absoluto, o Node.js usará o caminho relativo ao diretório de trabalho atual.

A configuração lê, atualmente, os seguintes campos de nível superior:

```json
{
  "main": "/path/to/bundled/script.js",
  "output": "/path/to/write/the/generated/blob.blob",
  "disableExperimentalSEAWarning": true, // Default: false
  "useSnapshot": false,  // Default: false
  "useCodeCache": true, // Default: false
  "assets": {  // Optional
    "a.dat": "/path/to/a.dat",
    "b.txt": "/path/to/b.txt"
  }
}
```

Se os caminhos não forem absolutos, o Node.js usará o caminho relativo ao diretório de trabalho atual. **A versão do binário Node.js usado para produzir o blob deve ser a mesma na qual o blob será injetado**.

## <a id="node-22-criacao-de-executaveis-unicos-assets"></a>Assets

Os usuários podem incluir assets (ativos) adicionando um dicionário de chave-caminho à configuração ao campo de `assets`. No momento da construção, o Node.js leria os ativos dos caminhos especificados e os agruparia no blob de preparação. No executável gerado, os usuários podem recuperar os ativos usando as APIs `sea.getAsset()` e `sea.getAssetAsBlob()`.

O aplicativo executável único pode acessar os ativos da seguinte maneira:

```JavaScript
const { getAsset } = require('node:sea');

// Returns a copy of the data in an ArrayBuffer.
const image = getAsset('a.jpg');

// Returns a string decoded from the asset as UTF8.
const text = getAsset('b.txt', 'utf8');

// Returns a Blob containing the asset.
const blob = getAssetAsBlob('a.jpg');

// Returns an ArrayBuffer containing the raw asset without copying.
const raw = getRawAsset('a.jpg');
```

Você pode consultar a documentação das APIs para mais informação.

## <a id="node-22-criacao-de-executaveis-unicos-suporte-snapshot-inicializacao"></a>Suporte Para o Snapshot de Inicialização

O campo `useSnapshot` pode ser usado para ativar o suporte a snapshots. Neste caso, o script principal não estaria presente quando o executável final fosse iniciado. Em vez disso, ele seria executado quando o blob de preparação do executável único fosse buildado. O blob de preparação gerado incluiria então um snapshot, capturando os estados inicializados pelo script principal. O executável final, o qual possui o blob de preparação injetado, iria desserializar o snapshot em tempo de execução.

O padrão típico para um aplicativo usar snapshot em um aplicativo executável único é:

1. No momento da construção, na máquina no qual ele está sendo buildado, o script principal é executado para inicializar o heap em um estado pronto para receber a entrada do usuário. O script também deve configurar uma função principal com `v8.startupSnapshots.setDeserializeMainFunction()`. Esta função será compilada e serializada no snapshot, mas não invocada no momento da construção
2. Em tempo de execução, a função principal será executada na heap desserializada na máquina do usuário para processar a entrada do usuário e gerar a saída

As restrições gerais dos scripts principais também se aplicam ao script do snapshot, quando ele é usado para criar o snapshot para o aplicativo executável único, o script pode usar a API `v8.startupSnapshot` para se adaptar a essas restrições. Você pode consultar a documentação sobre o suporte para snapshots de inicialização em Node.js.

## <a id="node-22-criacao-de-executaveis-unicos-suporte-cache-codigo-v8"></a>Suporte Para o Cache de Código V8

Quando `useCodeCache` é definido como `true` na configuração, durante a geração do blob de preparação do executável único, o Node.js irá compilar o script principal para gerar o cache de código v8. O cache de código gerado faria parte do blob de preparação e seria injetado no executável final. Quando o aplicativo executável único é iniciado, em vez de compilar o script principal do zero, o Node.js usaria o cache de código para acelerar a compilação e, em seguida, executaria o script, o que melhoria o desempenho da inicialização.

**Nota:** `import()` não funciona quando `useCodeCache` é `true`.

## <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado"></a>No Script Principal Injetado

O node:sea integrado permite a interação com o aplicativo executável único a partir do script principal JavaScript incorporado ao executável.

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-issea"></a>`sea.isSea()`

Adicionado em v21.7.0, v20.12.0.

- **Valor de Retorno:** `boolean`. Verifica se este script está sendo executado dentro de um aplicativo executável único

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getasset"></a>`sea.getAsset(key[,encoding])`

Adicionado em v21.7.0, v20.12.0.

Este método pode ser usado para recuperar os assets configurados para serem agrupados no aplicativo executável único no momento da construção. Um erro é gerado quando nenhum asset correspondente pode ser encontrado.

- **Parâmetros:**
  + `key`**:** `string`. A chave para o asset, especificada no dicionário de assets no arquivo de configuração do blob
  + `encoding`**:** `string`. Se especificado, o asset será decodificado como uma string. Qualquer codificação suportada pelo TextDecoder é aceita. Se não for especificado, um ArrayBuffer contendo uma cópia do asset será retornada
- **Valor de Retorno:** `string` | `ArrayBuffer`

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getassetasblob"></a>`sea.getAssetAsBlob(key[, options])`

Adicionado em v21.7.0, v20.12.0.

Similar a `sea.getAsset()`, mas retorna o resultado em um blob. Um erro é gerado quando nenhum asset correspondente pode ser encontrado.

- **Parâmetros:**
  + `key`**:** `string`. A chave para o asset, especificado no dicionário de assets no arquivo de configuração do blob
  + `options`**:** `Object`
    - `type`**:** `string`. Um tipo MIME opcional para o blob
- **Valor de Retorno:** `Blob`

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getrawasset"></a>`sea.getRawAsset(key)`

Adicionado em v21.7.0, v20.12.0.

Este método pode ser usado para recuperar os assets configurados para serem agrupados no aplicativo executável único no momento da construção. Um erro é gerado quando nenhum asset correspondente pode ser encontrado.

Ao contrário de `sea.getAsset()` ou `sea.getAssetAsBlob()`, este método não retorna uma cópia. Em vez disso, ele retona o raw asset (o ativo bruto) agrupado dentro do executável.

Por enquanto, os usuários devem evitar gravar no buffer do array retornado. Se a seção injetada não estiver marcada como gravável ou não estiver alinhada corretamente, as gravações no buffer do array retornado provavelmente resultarão em uma falha.

- **Parâmetros:**
  + `key`**:** `string`. A chave para o asset, especificado no dicionário de assets no arquivo de configuração do blob
- **Valor de Retorno:** `string` | `ArrayBuffer`

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-requireid-script-principal-injetado-nao-eh-baseado-arquivo"></a>`require(id)` no Script Principal Injetado Não é Baseado em Arquivo

`require()` no script principal injetado não é o mesmo que o `require()` disponível para módulos que não são injetados. Ele também não possui nenhuma das propriedades que o `require()` não injetado possui, exceto `require.main`. Ele só pode ser usado para carregar módulos integrados. Tentar carregar um módulo que só pode ser encontrado no sistema de arquivos gerará um erro.

Em vez de depender de um `require()` baseado em arquivo, os usuários podem agrupar seu aplicativo em um arquivo JavaScript independente para injetar no executável. Isso também garante um gráfico de dependência mais determinístico.

No entanto, se um `require()` baseado em arquivo ainda for necessário, isso também poderá ser alcançado:

```bash
const { createRequire } = require('node:module');
require = createRequire(__filename);
```

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-filename-module-filename-script-principal-injetado"></a>`__filename` e `module.filename` no Script Principal Injetado

Os valores de `__filename` e `module.filename` no script principal injetado são iguais a `process.execPath`.

### <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-dirname-script-principal-injetado"></a>`__dirname` no Script Principal Injetado

O valor de `__dirname` no script principal injetado é igual ao nome do diretório de `process.execPath`.

## <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-notas"></a>Notas

Processo de criação do aplicativo executável único.

Uma ferramenta que visa criar um aplicativo executável único Node.js deve injetar o conteúdo do blob preparado com `--experimental-sea-config` em um recurso denominado `NODE_SEA_BLOB` se o binário do `node` for um arquivo PE (portable executable).

Pesquise no binário a string de fusível `NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2:0` e mude o último caractere para 1 para indicar que um recurso foi injetado.

## <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-testando-feature"></a>Testando esta Feature

O diretório **./node22** possui os arquivos utilizados no teste desta feature. A ideia do teste era conseguir utilizar dependências (arquivos **.js**) no nosso script principal injetado, mas como você pode ver pelo log abaixo:

```bash
$ node --experimental-sea-config sea-config.json && cp "$(command -v node)" hello && npx postject hello NODE_SEA_BLOB sea-prep.blob --sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2
Wrote single executable preparation blob to sea-prep.blob
Start injection of NODE_SEA_BLOB in hello...
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
warning: Can't find string offset for section name '.note.100'
💉 Injection done!

$ ./hello 
-----
process.execPath: /home/$< usuário >/study-resources/JavaScript/node22/hello
-----
require: [Function: require] {
  resolve: [Function: resolve] { paths: [Function: paths] },
  main: undefined,
  extensions: [Object: null prototype] {
    '.js': [Function (anonymous)],
    '.json': [Function (anonymous)],
    '.node': [Function (anonymous)]
  },
  cache: [Object: null prototype] {}
}
objetoImportado: {}
-----
getAsset: ArrayBuffer {
  [Uint8Contents]: <6d 6f 64 75 6c 65 2e 65 78 70 6f 72 74 20 3d 20 7b 0a 20 20 20 20 6f 62 6a 65 74 6f 3a 20 7b 0a 20 20 20 20 20 20 20 20 22 63 68 61 76 65 22 3a 20 22 76 61 6c 6f 72 22 2c 0a 20 20 20 20 7d 2c 0a 7d>,
  byteLength: 66
}
getAssetUtf8: module.export = {
    objeto: {
        "chave": "valor",
    },
}
getRawAsset: ArrayBuffer {
  [Uint8Contents]: <6d 6f 64 75 6c 65 2e 65 78 70 6f 72 74 20 3d 20 7b 0a 20 20 20 20 6f 62 6a 65 74 6f 3a 20 7b 0a 20 20 20 20 20 20 20 20 22 63 68 61 76 65 22 3a 20 22 76 61 6c 6f 72 22 2c 0a 20 20 20 20 7d 2c 0a 7d>,
  byteLength: 66
}
getAssetAsBlob: Blob { size: 66, type: '' }
-----
hello.js.
(node:32198) ExperimentalWarning: Single executable application is an experimental feature and might change at any time
(Use `hello --trace-warnings ...` to show where the warning was created)
```

parece que o arquivo **asset.js** está dentro do aplicativo executável único, mas não consigo importar ele no script principal injetado. Há um artigo que mostra as dependências sendo empacotadas em um único arquivo JS, através de uma ferramenta (Esbuild), mas não vi isto a fundo.

## <a id="node-22-criacao-de-executaveis-unicos-script-principal-injetado-conclusao"></a>Conclusão

- Criar aplicativos executáveis únicos está em fase experimental, o código do Node.js (SEA) utilizado para isso ainda está em desenvolvimento (é pontuado fortemente para não utilizar esta feature no ambiente de produção)
  + Há a possibilidade de alterar a forma como ela funciona
- Você tem que utilizar de meios alternativos para adicionar as dependências do seu projeto na aplicação
- Ficou maior que o binário gerado utilizando o Nexe
- Ainda é extremamente fácil realizar a leitura do código-fonte, mesmo com ele dentro do aplicativo executável único
  + Mesmo em um binário criado utilizando Rust, ainda foi possível obter algumas informações do código-fonte (mesmo que mais difícil do que no cenário acima)
- Os recursos para utilizar esta feature se encontram disponíveis na versão do Node.js > v20.13.1, por causa disso, a engine utilizada no binário deve possuir a versão citada anteriormente (não é possível utilizar este recurso com uma versão mais antiga do Node.js)