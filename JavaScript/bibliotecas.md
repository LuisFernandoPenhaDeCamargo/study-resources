
---

# Bibliotecas.

# Métodos.

- [`.pending()`;](#pending)
- [`.execute()`;](#execute)
- [`.executed()`;](#executed)
- [`expect()`;](#expect)
- [`describe()`;](#describe)
- [`it()`;](#it)
- [`.promisify()`;](#promisify)
- [`.resolve()`;](#resolve)
- [`.hostname()`;](#hostname)
- [`.cpus()`;](#cpus)
- [`.readdirSync()`;](#readdirsync)
- [`.readFileSync()`;](#readfilesync)
- [`.statSync()`;](#statsync)
- [`.existsSync()`;](#existssync)
- [`.unlinkSync()`;](#unlinksync)
- [`.exec()`.](#exec)

# <a name = "axios"></a>`axios`

Utilizada para fazer requisições HTTP, seja em navegadores ou em Node.js.

### Headers (Cabeçalhos).

No propriedade `'content-type'`, que pode ser acessada ao se utilizar `response.headers['content-type']`, se encontra o valor do formato da resposta.\
Se o valor da chave `'content-type'` for `application/json`, quer dizer que o conteúdo da resposta é no formato JSON.

- `url` **(string):** URL de destino, para onde a solicitação será enviada;
- `corpoDaSolicitacao` **(objeto):** corpo da solicitação que está sendo enviada;
- `configuracoes` **(objeto, opcional):** objeto de configuração opcional que permite personalizar a solicitação. Este objeto pode conter várias opções de configuração, como cabeçalhos personalizados, autenticação, parâmetros de consulta, entre outros.\
  Como por exemplo a { chave: valor }: `{ cancelToken: objetoCancelToken.token }`, que é o token de cancelamento.

### Métodos.

- `.post(url, corpoDaSolicitacao)`;
- `.patch(url, corpoDaSolicitacao, configuracoes)` : atualização parcial;
- [`.CancelToken.source()`.](#canceltoken)

### `.interceptors`

Ao configurar um interceptador global, este será aplicado a todas as solicitações feitas por todas as partes do código que utilizam a mesma instância global do axios (no caso de um interceptador de requisição) ou será aplicado antes de retonar cada resposta ao código (interceptador de resposta).\
Lembrando que ele é **aplicado**, ou seja, ele é **executado** antes de cada requisição ou após cada resposta.

- `.request` : interceptador de solicitação (requisição). Isto permite que você execute código antes que cada solicitação seja enviada. Após realizarmos esta "configuração", todas as solicitações posteriores obedeceram esta configuração;
- `.response` : interceptador de resposta.

`.use()` : registra o interceptador.

```JavaScript
//Response.
axios.interceptors.response.use(response => response, error => {
  return Promise.reject(error);
});
```

- `response => response`: o interceptador de resposta simplesmente passará a reposta sem fazer alterações. Isso é comum quando você deseja apenas fazer algum trabalho adicional com a resposta, como registro, mas não deseja modificar a resposta em si;
- `return Promise.reject(error);`: a promessa com erro é rejeitada. Isso significa que o erro será **propagado** para qualquer código que chamou a solicitação axios original e que lidará com ele lá.

### <a id = "canceltoken"></a>`.CancelToken.source()`

Para que o axios saiba qual token de cancelamento está associado a uma requisição específica, você o passa na configuração da requisição usando a propriedade `cancelToken`. Portanto, `cancelToken: objeto.token` informa ao axios que esta requisição está vinculada ao `objeto` que você criou.\
Então quando você chama `objeto.cancel()`, o axios sabe que deve cancelar qualquer requisição que tenha o `objeto.token` associado a ela.

- `.CancelToken`**:** utilizado para criar um Token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()`**:** cria o objeto `.CancelToken` e seu respectivo método `.cancel()`
- `.cancel(mensagem)` o parâmetro `mensagem` que atribui o valor da chave `.reason.message`. É o **método utilizado para cancelar a requisição**.

Um objeto `.CancelToken` possui um atributo `.token`.

O atributo `.token` é composto por uma `.promise` e uma `.reason`.

A chave `.reason` possui um atributo `.message`.

Exemplo:

```JavaScript
const axios = require("axios");

const source = axios.CancelToken.source();

//Cancela o token com um motivo opcional (aqui, "Motivo do cancelamento." é o motivo).
source.cancel("Motivo do cancelamento.");

console.log(source);
/*Saída:
{ token:
  CancelToken {
    promise: Promise { [Object] },
    reason: Cancel { message: 'Motivo do cancelamento.' } },
  cancel: [Function: cancel] }
*/

console.log("\n--------------------\n");

console.log(source.token);
/*Saída:
CancelToken {
  promise: Promise { Cancel { message: 'Motivo do cancelamento.' } },
  reason: Cancel { message: 'Motivo do cancelamento.' } }
*/

console.log("\n--------------------\n");

console.log(source.token.promise);
//Saída: Promise { Cancel { message: 'Motivo do cancelamento.' } }

console.log("");

console.log(source.token.reason);
//Saída: Cancel { message: 'Motivo do cancelamento.' }

console.log("\n--------------------\n");

console.log(source.token.reason.message);
//Saída: Motivo do cancelamento.

console.log("\n--------------------\n");

//Para acessar o motivo do cancelamento, você pode usar source.token.reason.
console.log("source.token.reason:", source.token.reason);
//Saída: source.token.reason: Cancel { message: 'Motivo do cancelamento.' }
```

# <a name = "umzug"></a>`umzug`

O pacote `umzug` é uma biblioteca para migração de bancos de dados em Node.js. Ele fornece uma maneira fácil de criar e executar migrações de banco de dados, permitindo que você gerencie alterações na estrutura do banco de dados ao longo do tempo, mantendo um histórico de migrações.

Seu método construtor recebe um objeto de configuração como parâmetro e suas principais propriedades serão explicadas se utilizando do exemplo abaixo.

```JavaScript
var umzug = new Umzug({
    storage: 'sequelize', //Tipo de armazenamento para rastrear migrações
    storageOptions: {
        sequelize: models.sequelize //Opções específicas do armazenamento (no caso, Sequelize)
    },
    migrations: {
        path: `${__dirname}/db/migrations/`, //Caminho para o diretório de migrações
        params: [models.sequelize.getQueryInterface(), models.Sequelize, models] //Parâmetros a serem passados para as migrações
    },
    'migrations-path': path.resolve('db', 'migrations') //Caminho absoluto para o diretório de migrações
});

```

- `storage`**:** define o tipo de armazenamento a ser usado pelo `Umzug` para rastrear as migrações. No exemplo, está sendo utilizado o armazenamento do Sequelize.\
    Você está especificando o tipo de armazenamento a ser usado em tempo de código. Nesse contexto, o termo "armazenamento" se refere à maneira como o `Umzug` rastreia e gerencia informações sobre as migrações de banco de dados. Isso geralmente envolve a criação de tabelas no banco de dados para armazenar informações sobre as migrações aplicadas e seus estados;
- `storageOptions`**:** fornece opções específicas para o armazenamento escolhido. Neste caso, as opções estão configuradas para o Sequelize, onde você passa a instância do Sequelize como `sequelize`. A propriedade de storageOptions (`sequelize`) recebe uma instância do Sequelize que será usada pelo `Umzug` para interagir com o banco de dados e executar as migrações;
- `migrations`**:** define as configurações relacionadas às migrações:
    - `path`**:** especifica o caminho para o diretório onde suas migrações estão localizadas;
    - `params`**:** define os parâmetros que serão passados para as migrações quando forem executadas. Neste exemplo, está sendo passado três parâmetros:
        - Um objeto retornado pelo método `.getQueryInterface()`;\
            Este objeto permite que você execute consultas SQL diretamente ou crie migrações para alterar o esquema do banco de dados. Portanto, este primeiro elemento fornece à migração a capacidade de interagir com o banco de dados por meio do objeto retornado por `.getQueryInterface()`.
        - A classe `Sequelize`;\
            Aqui está sendo passada a classe `Sequelize` do Sequelize. Isso pode ser útil para migrações que precisam acessar a funcionalidade **global do Sequelize** ou realizar configurações específicas do Sequelize durante a migração.
        - E o objeto `models`.\
            Este é o objeto que contém os modelos Sequelize **desta aplicação**. Passar `models` como parâmetro permite que as migrações acessem os modelos desta aplicação e realizem operações relacionadas ao banco de dados que envolvem esses modelos.\
            \
            Em resumo, ao definir esses parâmetros no `Umzug`, você está fornecendo às migrações a capacidade de interagir com o banco de dados, acessar modelos Sequelize e realizar operações de migração que podem envolver consultas SQL ou alterações no esquema do banco de dados. Cada elemento do array `params` é uma ferramenta que pode ser usada pelas migrações para realizar seu trabalho.

### `migrations: { path }` x `migrations-path`

`migrations: { path }`

- A propriedade `migrations` é usada para especificar as configurações relacionadas às migrações em si;
- `path` dentro de `migrations` especifica o caminho para o diretório onde suas migrações estão localizadas. Neste caso, você está usando `${__dirname}/db/migrations/` como o caminho para o diretório de migrações. Isso significa que o `Umzug` procurará as migrações nesse diretório quando você executar comandos relacionados a migrações.

`migrations-path`

- `migrations-path` é uma propriedade separada que específica o caminho absoluto para o diretório de migrações;
- Neste código, está sendo usado o `.resolve()` para construir o caminho absoluto para o diretório de migrações. Isso garante que o caminho seja absoluto e independente do diretório de execução do Node.js.

Ambas as configurações estão relacionadas ao diretório de migrações, mas a diferença principal é que `migrations: { path }` é usado para configurar o caminho relativo das migrações, enquanto `migrations-path` é usado para especificar o caminho absoluto das migrações.\
Na prática, o `Umzug` pode usar essas configurações para localizar e executar as migrações no diretório especificado, seja ele um caminho relativo ou um caminho absoluto. Ambos os métodos têm seu lugar, dependendo de como você deseja configurar a estrutura de diretórios do seu projeto de migração de banco de dados.
**Tecnicamente falando, não é necessário especificar ambas as propriedades**.

### <a id = "pending"></a>`.pending()`

É usado para listar as migrações pendentes que ainda não foram executadas no bando de dados. Ele retorna uma lista de migrações que estão no diretório de migrações configurado, mas que ainda não foram aplicadas ao banco de dados.\
Você pode acessar informações sobre as migrações, como o nome do arquivo da migração (`migration.file`), para saber quais migrações estão pendentes.

### <a id = "execute"></a>`.execute()`

Método que permite executar migrações específicas de acordo com as configurações fornecidas.

`.execute(objetoDeConfiguracao)`

Principais campos do `objetoDeConfiguracao`:

- `migrations`**:** este campo deve ser um array de nomes de arquivos de migração que você deseja executar. Geralmente é obtido através  de arquivos de migrações pendentes;
- `method` **(opcional):** este campo especifica o método de migração a ser aplicado, que pode ser "up" (para aplicar migrações) ou "down" (para reverter migrações). Se não for fornecido, o método padrão é "up";
- `options` **(opcional):** um objeto de opções adicionais que você pode fornecer para controlar o processo de migração. Isso pode incluir opções específicas de banco de dados ou configurações adicionais;
- `context` **(opcional):** um contexto opcional que pode ser passado para as migrações. Isso permite que você forneça informações adicionais para as migrações que podem ser úteis durante o processo.

Retorna uma promessa.

### <a id = "executed"></a>`.executed()`

Este método consulta o histórico de migrações executadas anteriormente e retorna informações sobre elas.\
É usado para obter informações sobre as migrações que já foram aplicadas ao banco de dados.

Retorna uma promessa que resolverá com um array de objetos de migração que representam as migrações que foram executadas com sucesso no passado.

Por exemplo, se você tiver um histórico de migrações registradas no banco de dados, o método `.executed()` retornará essas informações para que você possa determinar quais migrações já foram aplicadas anteriormente. A principal utilidade disso é permitir que você saiba quais migrações já foram executadas, ajudando a evitar a execução repetida de migrações que já foram aplicadas.

# <a name = "chai"></a>`chai`

Utilizada para a realização de testes unitários.

`chai` é uma biblioteca utilizada para realizar afirmações (assertions) em testes unitários. É frequentemente utilizada em conjunto com frameworks de teste como o Mocha ou o Jasmine para facilitar a criação e execução de testes.

No caso do mocha:
- Ele deve estar instalado (se estiver, será listado em **node_modules**);
- Ser uma dependência do seu projeto (se for, estará presente em **package.json**);
- Para o teste ser executado deverá ser feito um script. Exemplo:

```JSON
"scripts": {
    "chave": "mocha pathParaOArquivo/arquivo.js"
}
```

Para executar o teste:

```BASH
npm run nomeDaChave
```

### <a id ="expect"></a>`expect()`

Utilizada para criar assertions.

`expect(valor).metodoDeAssercao(valorEsperado)`

- `valor`**:** é o valor ou expressão que você deseja testar;
- `metodoDeAssercao`**:** é um método disponível no `chai` que define a condição que você está testando;
- `valorEsperado`**:** é o valor que você espera que `valor` tenha após a avaliação da asserção.

---

A função `expect()` é usada para criar afirmações (assertions) em testes unitários. Ela é usada para expressar o que você espera que aconteça em um teste e, em seguida, verificar se essa expectativa é atendida.

Exemplos:

```JavaScript
const expect = require("chai").expect;

describe("Exemplo de teste.", function() {
    it("Deve verificar se 1 + 1 é igual a 2.", function() {
        expect(1 + 1).to.equal(2);
    });

    it("Deve verificar se um valor é verdadeiro.", function() {
        expect(true).to.be.true;
    });

    it("Deve verificar se um valor é nulo.", function() {
        expect(null).to.be.null;
    });

    it("Deve verificar se uma string é igual a outra", function() {
        expect("hello").to.equal("hello");
    });
});
```

Nesses exemplos, o método `.expect()` é usado para criar afirmações que testam várias condições. Se a afirmação for verdadeira, o teste passa; caso contrário, o teste falha e uma mensagem de erro é gerada, indicando qual expectativa não foi atendida.

### <a id = "describe"></a>`describe()`

Cria blocos de testes.

```JavaScript
describe("String", function() {
    //Casos de testes relacionados a string de descrição.
});
```

- `String`**:** string que descreve o bloco de teste;
- `function()`**:** função callback que contém os casos de teste.

### <a id = "it"></a>`it()`

Representa um caso de teste.

```JavaScript
it("String", function() {
    //Teste.
});
```

- `String`**:** string que descreve o teste;
- `function()`**:** função callback que contém a lógica do teste.

# <a name = "requestpromisenative"></a>`request-promise-native`

Biblioteca utilizada para fazer solicitações HTTP de forma assíncrona no Node.js com suporte a Promises. É uma extensão do módulo request-promise, oferecendo as mesmas funcionalidades, mas com o uso nativo de Promises, o que torna o código mais limpo e legível quando se trata de fazer solicitações HTTP e lidar com respostas.

# JavaScript.

# Node.js.

`__dirname` é uma variável global no Node.js que representa o diretório atual.

## <a name = "util"></a>`util`

Fornece várias funções utilitárias para ajudar na programação assíncrona e em outros aspectos de desenvolvimento.

### <a id = "promisify"><>`.promisify()`

É usada para converter funções de retorno de chamada (`callback`) em funções que retornam promessas.

`.promisify(callback)`

## <a name = "path"></a>`path`

Fornece utilitários para trabalhar com caminhos de arquivos e diretórios em um sistema de arquivos. Ele é amplamente utilizado para criar caminhos, manipular caminhos relativos e absolutos, extrair informações dos caminhos e realizar operações relacionadas a caminhos.\
É especialmente útil ao lidar com operações de sistema de arquivos e ao contruir caminhos para carregar ou salvar aquivos, pois ele lida com as **diferenças nos separadores de caminhos entre sistemas operacionais**.

### <a id = "resolve"></a>`.resolve()`

É usado para resolver um ou mais caminhos em um único caminho absoluto. Isso é útil quando você deseja obter o caminho absoluto de um arquivo ou diretório com base em caminhos relativos ou absolutos.

```JavaScript
const path = require('path');

const caminhoAbsoluto = path.resolve([...caminhos]);
```

`caminhos` é uma série de caminhos (strings) que você deseja resolver em um único caminho absoluto.

O `.resolve()` começa a **partir do diretório raiz do sistema de arquivos** e percorre cada caminho fornecido na ordem em que eles são especificados, construindo um caminho absoluto à medida que avança. O resultado é o caminho absoluto final, que é **retornado como uma string**. Exemplo:

```JavaScript
const path = require('path');

const diretorioAtual = __dirname;

const caminhoAbsoluto = path.resolve(diretorioAtual);

console.log("Caminho absoluto:", caminhoAbsoluto); ///home/orion/APIs/orion-data-api
```

Outro exemplo que mostra a **importância de se especificar partes do caminho relativo**.

```JavaScript
const path = require('path');

console.log(path.resolve("migrations"));       ///home/orion/APIs/orion-data-api/migrations: este caminho está incorreto.

console.log(path.resolve("db", "migrations")); ///home/orion/APIs/orion-data-api/db/migrations
```

## <a name = "os"></a>`os`

É um módulo que fornece informações e utilitários relacionados ao sistema operacional do servidor em que o código Node.js está sendo executado. Ele permite que você acesse informações sobre o sistema, como informações sobre a CPU, memória, diretórios padrão e muito mais.

### <a id = "hostname"></a>`.hostname()`

É usado para obter o nome do host no qual o código Node.js está sendo executado. O nome do host é geralmente o nome do computador ou dispositivo onde o Node.js está em execução. Retorna uma string.

### <a id ="cpus"></a>`.cpus()`

Retorna um array contendo informações sobre todas as CPUs disponíveis no sistema (um array de objetos).

## <a name = "fs"></a>`fs`

Fornece métodos para interagir com o sistema de arquivos.

**File System** (**Sistema de Arquivos**). Fornece métodos para interagir com o sistema de arquivos do computador, permitindo que você leia, escreva, manipule e gerencie arquivos e diretórios.\
O **"Sync"** no nome das funções, indica que essas funções são **síncronas**.\
`pwd` **(string):** caminho para o arquivo/diretório.

### <a id = "readdirsync"></a>`.readdirSync()`

Usado para ler o conteúdo de um diretório.

`.readdirSync(__dirname, pwd)`

Retorna uma matriz.

Usado para ler o conteúdo de um diretório, ou seja, lista os arquivos e subdiretórios.

### <a id = "readfilesync"></a>`.readFileSync()`

Lê o conteúdo de um arquivo.

`readFileSync(pwd, codificacao)`

`codificacao` **(opcional):** especifica a codificação do arquivo.

Retorna o conteúdo do arquivo em formato de buffer ou em uma condição específica, se especificada.

### <a id = "statsync"></a>`.statSync()`

Obtêm informações sobre um arquivo/diretório especificado.

`.statSync(pwd)`

Retorna um objeto da classe **fs**.

O objeto retornado possui propriedades como `.mtime` , que é a data de modificação (timestamp) do arquivo/diretório.

### <a id = "existssync"></a>`.existsSync()`

Verifica se o arquivo ou diretório existe.

`fs.existsSync(path)`

`path`**:** string que representa o caminho do arquivo/diretório a ser verificado.

Retorna `true` ou `false`.

### <a id = "unlinksync"></a>`.unlinkSync()`

Remove um arquivo do sistema de arquivos.

`fs.unlinkSync(path)`

`path`**:** string que representa o caminho do arquivo/diretório que será excluído.

## <a name = "childprocess"></a>`child_process`

Cria e gerencia processos filhos (subprocessos) a partir de um aplicativo Node.js.

### <a id = "exec"></a>`.exec()`

Executa comandos do sistema operacional em um subprocesso.

`.exec(comando, opcoes, callback)`

- `comando` **(string):** representa o comando a ser executado;
- `opcoes` **(objeto, opcional):** pode conter várias opções para controlar o comportamento da execução do comando;
- `callback` **(opcional):** função de retorno de chamada que será chamada quando a execução do comando for concluída.\
  `(erro, stdout, stderr) => {}`
  - `erro` **(string):** variável que conterá informações sobre qualquer erro que ocorrer durante a execução do comando;
  - `stdout` **(string):** variável que conterá a saída padrão (`stdout`) do comando executado;
  - `stderr` **(string):** variável que conterá a saída de erro (`stderr`) do comando executado.

É usada para executar comandos do sistema operacional em um subprocesso. Ela é uma forma de criar processos filhos para executar comandos shell ou outros programas externos.