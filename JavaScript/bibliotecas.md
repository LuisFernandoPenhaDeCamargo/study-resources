# Bibliotecas.

### Métodos.

- [`.post()`](#post);
- [`.patch()`](#patch);
- [`.createPool()`](#createpool);
- [`.query()`](#query);
- [`.update()`](#update);
- [`.IAM()`](#iam);
- [`.S3()`](#s3);
- [`.pending()`](#pending);
- [`.execute()`](#execute);
- [`.executed()`](#executed);
- [`expect()`](#expect);
- [`describe()`](#describe);
- [`it()`](#it);
- [`.config()`](#config);
- [`.resolve()`](#resolve);
- [`.readdirSync()`](#readdirsync);
- [`.readFileSync()`](#readfilesync);
- [`.statSync()`](#statsync);
- [`.existsSync()`](#existssync);
- [`.unlinkSync()`](#unlinksync);
- [`.hostname()`](#hostname);
- [`.cpus()`](#cpus);
- [`.exec()`](#exec);
- [`.promisify()`](#promisify).

# <a name = "axios"></a>`axios`

Utilizada para fazer requisições HTTP, seja em navegadores ou em Node.js.

## Headers (Cabeçalhos).

No propriedade `'content-type'`, que pode ser acessada ao se utilizar `response.headers['content-type']`, se encontra o valor do formato da resposta.\
Se o valor da chave `'content-type'` for `application/json`, quer dizer que o conteúdo da resposta é no formato JSON.

## `.interceptors`

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

## <a id = "canceltoken"></a>`.CancelToken.source()`

Para que o axios saiba qual token de cancelamento está associado a uma requisição específica, você o passa na configuração da requisição usando a propriedade `cancelToken`. Portanto, `cancelToken: objeto.token` informa ao axios que esta requisição está vinculada ao `objeto` que você criou.\
Então quando você chama `objeto.cancel()`, o axios sabe que deve cancelar qualquer requisição que tenha o `objeto.token` associado a ela.

- `.CancelToken`**:** utilizado para criar um Token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()`**:** cria o objeto `.CancelToken` e seu respectivo método `.cancel()`
- `.cancel(mensagem)` o parâmetro `mensagem` que atribui o valor da chave `.reason.message`. É o **método utilizado para cancelar a requisição**.

- Um objeto `.CancelToken` possui um atributo `.token`;
- O atributo `.token` é composto por uma `.promise` e uma `.reason`;
- A chave `.reason` possui um atributo `.message`.

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

console.log(source.token);
/*Saída:
CancelToken {
  promise: Promise { Cancel { message: 'Motivo do cancelamento.' } },
  reason: Cancel { message: 'Motivo do cancelamento.' } }
*/

console.log(source.token.promise);
//Saída: Promise { Cancel { message: 'Motivo do cancelamento.' } }

console.log(source.token.reason);
//Saída: Cancel { message: 'Motivo do cancelamento.' }

console.log(source.token.reason.message);
//Saída: Motivo do cancelamento.

//Para acessar o motivo do cancelamento, você pode usar source.token.reason.
console.log("source.token.reason:", source.token.reason);
//Saída: source.token.reason: Cancel { message: 'Motivo do cancelamento.' }
```

## Métodos.

- `url` **(string):** URL de destino, para onde a solicitação será enviada;
- `corpoDaSolicitacao` **(objeto):** corpo da solicitação que está sendo enviada;
- `configuracoes` **(objeto, opcional):** objeto de configuração opcional que permite personalizar a solicitação. Este objeto pode conter várias opções de configuração, como cabeçalhos personalizados, autenticação, parâmetros de consulta, entre outros.\
  Como por exemplo a { chave: valor }: `{ cancelToken: objetoCancelToken.token }`, que é o token de cancelamento.

- <a id = "post"></a>`.post(url, corpoDaSolicitacao)`;
- <a id = "patch"></a>`.patch(url, corpoDaSolicitacao, configuracoes)` : atualização parcial.

# <a name = "requestpromisenative"></a>`request-promise-native`

Biblioteca utilizada para fazer solicitações HTTP de forma assíncrona no Node.js com suporte a Promises. É uma extensão do módulo request-promise, oferecendo as mesmas funcionalidades, mas com o uso nativo de Promises, o que torna o código mais limpo e legível quando se trata de fazer solicitações HTTP e lidar com respostas.

# <a name = "bodyparser"></a>`body-parser`

O módulo `body-parser` é uma extensão de middleware para aplicativos Node.js que executam servidores HTTP, como aqueles criados com o Express.js. Sua principal função é analisar o corpo das solicitações HTTP para extrair dados, como parâmetros de formulário ou cargas úteis JSON, tornando-os acessíveis aos controladores de rotas ou manipuladores de solicitações.\
O `body-parser` é especialmente útil quando você está construindo aplicativos web ou APIs que lidam com solicitações POST, PUT e DELETE, onde os dados são enviados no corpo da solicitação. Ele oferece suporte a diferentes tipos de dados, incluindo URL-encoded, JSON e dados multipart. Algumas das funcionalidades e características do módulo `body-parser`:

- **Análise de dados:** o `body-parser` permite analisar automaticamente os dados do corpo da solicitação e torná-los acessíveis nas rotas do seu aplicativo;
- **Tipos de dados suportados:** ele suporta diferentes tipos de dados, incluindo:
    - **URL-encoded:** dados de formulário enviados no corpo da solicitação no formato `application/x-www-form-urlencoded`;
    - **JSON:** dados no formato JSON;
    - **Dados multipart:** suporte a upload de arquivos.
- **Configuração flexível:** você pode configurar o `body-parser` para tratar diferentes tipos de solicitações com base no tipo de conteúdo (content-type) ou tamanho do corpo;
- **Integração com Express:** o `body-parser` é frequentemente usado em conjunto com o Express.js para simplificar o processamento de dados nas solicitações.

Aqui está um exemplo de como você pode usar o `body-parser` em um <a name = "servidor"></a>aplicativo Express para analisar dados de formulário URL-encoded:

```JavaScript
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

//Adiciona o middleware bodyParser para analisar dados URL-encoded.
app.use(bodyParser.urlencoded({ extended: false }));

app.post("/processar-dados", (req, res) => {
    //Dados do formulário são acessíveis em req.body.
    console.log(req.body);
    res.send("Dados recebidos e processados com sucesso!");
});

app.listen(3000, () => {
    console.log("Servidor em execução na porta 3000.");
});
```

Neste exemplo, o `body-parser` é usado para analisar os dados do corpo da solicitação e torná-los acessíveis em `req.body` para posterior processamento.\
O `body-parser` facilita o tratamento de dados nas solicitações HTTP em aplicativos Node.js e Express, economizando tempo e simplificando o código necessário para processar informações vindas do cliente.

Você pode fazer uma requisição ao servidor acima utilizando o seguinte [comando](../Bash.md#comando).

# <a name = "mariadb"></a>`mariadb`

O MariaDB Connector/Node.js é uma biblioteca que permite que seu aplicativo Node.js se conecte e interaja com um banco de dados MariaDB/MySQL. Ele não inclui o pŕoprio servidor de banco de dados.

### <a id = "createpool"></a>`.createPool()`

Cria e configura um pool de conexões com um banco de dados MariaDB ou MySQL. Retorna um objeto de pool de conexões que **você pode usar para adquirir e liberar conexões do pool**.

`const pool =  mariadb.createPool(configuracoes);`

`configuracoes` **(objeto):** o método `.createPool()` aceita um objeto de configuração como argumento. Esse objeto contém  informações sobre como conectar ao banco de dados, como host, nome de usuário, senha, nome do banco de dados e outras configurações relacionadas à conexão.
    - `connectionLimit`**:** você pode especificar o número máximo de conexões que o pool deve manter abertas simultaneamente. Isso evita que seu aplicativo abra um grande número de conexões ao mesmo tempo, o que pode levar a problemas de desempenho;
    - `acquireTimeout`**:** tempo limite (em milissegundos) para adquirir uma conexão do pool antes de gerar um erro.

Depois de criar um pool de conexões, você pode usar as conexões dele para executar consultas e interações com o banco de dados. Quando você não precisar mais de uma conexão, poderá liberá-la de volta para o pool para que possa ser reutilizada por outras partes do seu aplicativo.\
O uso de um pool de conexões ajuda a gerenciar eficientemente as conexões de banco de dados e é uma prática recomendada em aplicativos Node.js que interagem com bancos de dados.

### <a id = "query"></a>`.query()`

Executa querys SQL.

`pool.query(sql, values)`

O método `.query()` é um dos métodos principais em uma pool de conexões MariaDB no Node.js. Ele é usado para executar querys SQL no banco de dados MariaDB por meio da conexão que está disponível na pool. A função `.query()` é usada para enviar uma query SQL ao banco de dados e recuperar os resultados, se houver.

- `sql` **(string):** contém a query SQL que você deseja executar. Pode incluir espaços reservados que serão substituídos pelos valores reais quando a query for executada. Por exemplo, você pode usar placeholders como `?` ou nomeá-los com `:nome` ou `?name` e fornecer os valores correspondentes no array `values`;
- `values` **(array, opcional):** contém os valores a serem inseridos nos espaços reservados da query SQL. Isso é útil para evitar ataques de injeção SQL e para passar dados dinâmicos para a query. Se você não precisar de valores dinâmicos, pode deixar este parâmetro em branco.

O retorno do método `pool.query()` pode variar com base na natureza da query SQL que você está executando e nos resultados da consulta. Em geral, o retorno depende se a query é uma query de seleção (SELECT) ou uma query de modificação (INSERT, UPDATE, DELETE) e se a consulta foi bem-sucedida.\

- Se a query for uma query de seleção e for bem-sucedida, **o retorno será um array que possui um objeto com os registros retornados, entre outros objetos**;
- Se a query for uma query de inserção e for bem-sucedida, o retorno será um objeto `{ affectedRows: valor1, insertedId: valor2, warningStatus: valor3 }`;
- Se a query for uma query de atualização e for bem-sucedida, o retorno será um objeto `{ affectedRows: valor1, insertedId: valor2, warningStatus: valor3 }` (aparentemente este não é o formato padrão do objeto, deve estar assim por conta de alguma configuração).

# <a name = "awssdk"></a>`aws-sdk`

A biblioteca `aws-sdk` é a biblioteca oficial da Amazon Web Services (AWS) que permite interagir com diversos serviços da ASW, como Amazon S3, Amazon DynamoDB, AWS Lambda e outros.

Para utilizar a biblioteca `aws-sdk`, você geralmente precisa configurar as credenciais de acesso à AWS, como a chave de acesso e a chave secreta. Isso é necessário para que o SDK possa autenticar as solicitações à AWS em seu nome.\
Após configurar as credenciais, você pode começar a utilizar os serviços da AWS, como o Amazon S3 para armazenamento de objetos, o Amazon DynamoDB para banco de dados NoSQL, entre outros. O `aws-sdk` fornece uma API rica para interagir com esses serviços, permitindo que você crie, leia, atualize e exclua recursos da AWS.

### <a id = "update"></a>`.update()`

Atualiza a configuração atual do AWS SDK após a inicialização. Não retorna nenhum valor (retorna `undefined`).

`AWS.config.update(configuracao)`

- `AWS.config`**:** objeto AWS que possui a propriedade `.config`;
- `configuracao` **(objeto):** um objeto contendo as opções de configuração que você deseja atualizar. Isso inclue as seguintes opções:
    - `accessKeyId` **(string):** a chave de acesso da AWS;
    - `secretAccessKey` **(string):** a chave secreta de acesso da AWS;
    - `region` **(string):** a região da AWS na qual você deseja que as solicitações sejam feitas;
    - `logger`**:** define o destino de saída de logs.

### <a id = "iam"></a>`.IAM()`

Cria uma instância do serviço AWS **Identity and Access Management** (**IAM**). A instância do IAM é criada com a configuração da versão da API especificada.\
Retorna uma instância do serviço.

`const iam = new AWS.IAM(configuracao);`

`configuracao` **(objeto):** objeto de configuração.\
    `apiVersion`**:** especifica a versão da API que você deseja usar para as chamadas do serviço IAM.

O `.IAM()` não é um método do objeto `AWS`, mas sim uma forma de criar uma instância do serviço AWS Identity and Access Management por meio do objeto `AWS`. O objeto `AWS` é um namespace que fornece acesso a vários serviços da Amazon Web Services por meio da biblioteca `aws-sdk` em Node.js.\
Não é necessário especificar parâmetros ao criar uma instância do serviço IAM usando o construtor. **As configurações, como credenciais e região, são definidas globalmente no objeto** `AWS` por meio do método `.update()`.\
O objeto `iam` que você cria pode ser usado para fazer chamadas às operações do IAM, como criar usuários, gerenciar grupos, políticas e assim por diante. O retorno dessas chamadas à API depende da operação específica e pode incluir informações ou erros relacionados à operação realizada.

### <a id = "s3"></a>`.S3()`

Cria uma instância do serviço **Amazon Simple Storage Service** (**Amazon S3**). Retorna uma instância do serviço Amazon S3 configurada de acordo com as configurações fornecidas.

`const s3 = new AWS.S3(configuracao);`

`configuracao` **(objeto):** objeto de configuração que permite que você configure vários aspectos do comportamento da instância.\
    - `endpoint`**(opcional):** o ponto de extremidade (URL) personalizado para o serviço S3. Se você estiver usando um serviço de armazenamento de objetos compatível com o protocolo S3, pode especificar o ponto de extremidade personalizado aqui.

Você pode usar essa instância para interagir com o Amazon S3 e realizar operações como criar, listar, baixar ou excluir objetos, gerenciar buckets e configurar permissões.

### <a id = "endpoint"></a></a>`.Endpoint()`

Cria uma instância do objeto `AWS.Endpoint` que é projetado para configurar pontos de extremidade personalizados.

`const spacesEndpoint = new DIGITAL_OCEAN.Endpoint(process.env.SPACES_ENDPOINT);`

Isso é típico ao usar a biblioteca `aws-sdk` da AWS para interagir com serviços da AWS, como o Amazon S3 ou o Amazon Elastic Compute Cloud (EC2).\
O objeto `AWS.Endpoint` é usado para representar o ponto de extremidade (URL) de um serviço da AWS. Ao criar uma instância desse objeto, você pode especificar a URL do ponto de extremidade do serviço que deseja acessar.

### AWS x DigitalOcean.

`sdk`**: SDKs** (**Software Development Kits**) normamlmente são específicos de cada provedor de serviços em nuvem, como a AWS e a DigitalOcean. Os SDKs são projetados para fornecer acesso e funcionalidades específicas aos serviços do seu provedor.\
**Você pode usar o SDK da AWS para realizar operações em um ponto de extremidade da DigitalOcean Spaces**, ao fazer isso, você está fazendo uma integração entre serviços de armazenamento de objetos de diferentes provedores.\
O Amazon S3 é o serviço de armazenamento de objetos da AWS, e a DigitalOcean Spaces é o serviço de armazenamento de objetos da DigitalOcean. Ambos os serviços têm APIs compatíveis com o protocolo S3, o que significa que você pode usar um SDK S3 (como o SDK da AWS) oara acessar e manipular objetos em ambas as plataformas, desde que a configuração seja feita corretamente.z
Isso é possível porque a DigitalOcean Spaces implementa um conjunto de APIs compatíveis com o protocolo S3, o que permite que aplicativos e SDKs projetados para o Amazon S3 sejam usados para acessar os recursos do Spaces.

# <a name = "umzug"></a>`umzung`

O pacote `umzug` é uma biblioteca para migração de bancos de dados em Node.js. Ele fornece uma maneira fácil de criar e executar migrações de banco de dados, permitindo que você gerencie alterações na estrutura do banco de dados ao longo do tempo, mantendo um histórico de migrações.

Seu método construtor recebe um objeto de configuração como parâmetro e suas principais propriedades serão explicadas se utilizando do exemplo abaixo.

```JavaScript
var umzug = new Umzug({
    storage: 'sequelize', //Tipo de armazenamento para rastrear migrações.
    storageOptions: {
        sequelize: models.sequelize //Opções específicas do armazenamento (no caso, Sequelize).
    },
    migrations: {
        path: `${__dirname}/db/migrations/`, //Caminho para o diretório de migrações.
        params: [models.sequelize.getQueryInterface(), models.Sequelize, models] //Parâmetros a serem passados para as migrações.
    },
    'migrations-path': path.resolve('db', 'migrations') //Caminho absoluto para o diretório de migrações.
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
        - O objeto `models`.\
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
Na prática, o `Umzug` pode usar essas configurações para localizar e executar as migrações no diretório especificado, seja ele um caminho relativo ou um caminho absoluto. Ambos os métodos têm seu lugar, dependendo de como você deseja configurar a estrutura de diretórios do seu projeto de migração de banco de dados.\
**Tecnicamente falando, não é necessário especificar ambas as propriedades**.

### <a id = "pending"></a>`.pending()`

É usado para listar as migrações pendentes que ainda não foram executadas no bando de dados. Ele retorna uma lista de migrações que estão no diretório de migrações configurado, mas que ainda não foram aplicadas ao banco de dados.\
Você pode acessar informações sobre as migrações, como o nome do arquivo da migração (`migration.file`), para saber quais migrações estão pendentes.

### <a id = "execute"></a>`.execute()`

Método que permite executar migrações específicas de acordo com as configurações fornecidas.

`.execute(objetoDeConfiguracao)`

Principais campos do `objetoDeConfiguracao`:

- `migrations`**:** este campo deve ser um array de nomes de arquivos de migração que você deseja executar. Geralmente é obtido através de arquivos de migrações pendentes;
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

`chai` é uma biblioteca utilizada para realizar afirmações (assertions) em testes unitários. É frequentemente utilizada em conjunto com frameworks de teste como o Mocha ou o Jasmine para facilitar a criação e execução de testes. No caso do mocha:

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

A função `expect()` é usada para criar afirmações (assertions) em testes unitários. Ela é usada para expressar o que você espera que aconteça em um teste e, em seguida, verificar se essa expectativa é atendida. Exemplos:

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

# <a name = "dotenv"></a>`dotenv`

`dotenv` é uma biblioteca usada para carregar **variáveis de ambiente** a partir de um arquivo **.env** em seu projeto. Isso é especialmente útil para manter informações sensíveis, como credenciais de banco de dados ou chaves de API, fora do seu código-fonte e **configuráveis por meio de variáveis de ambiente**.\
Em um arquivo **.env** você pode definir variáveis de ambiente no formato `VARIAVEL=valor`. Por exemplo:

```plaintext
DB_USER=usuario
DB_PASSWORD=senha
API_KEY=minha_chave_secreta
```

Para acessar as variáveis de ambiente definidas no arquivo **.env**, você pode usar o `process.env`. Por exemplo:

```JavaScript
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;
const apiKey = process.env.API_KEY;
```

Isso permite que você acesse valores configuráveis em seu código sem expor informações sensíveis diretamente no código-fonte.\
Lembre-se de que as variáveis de ambiente carregadas com `dotenv` são específicas para o ambiente de execução do seu aplicativo. Elas não estarão disponíveis fora do escopo do aplicativo e não serão visíveis para outros processos ou usuários do sistema. Isso é útil para proteger informações confidenciais e facilita a configuração de diferentes ambientes (como desenvolvimento, teste e produção) usando diferentes arquivos **.env**.

### <a id = "config"></a>`.config()`

Configura e carrega variáveis de ambiente a partir de um arquivo **.env**. Retorna um objeto de configuração.

`require('dotenv').config();`

- **Chamada no início do aplicativo:** é uma boa prática chamar o método `.config()` no início do seu aplicativo, antes de qualquer outra operação que dependa das variáveis de ambiente definidas no arquivo **.env**;
- **Automatiza o carregamento:** o método `.config()` automatiza o processo de leitura do arquivo **.env** e o carregamento de todas as variáveis de ambiente definidas nele;
- **Retorna um objeto de configuração:** embora o método `.config()` não retorne explicitamente um valor, ele modifica o objeto `process.env` no ambiente Node.js para incluir todas as variáveis de ambiente definidas no arquivo **.env**;
- **Gestão de erros:** o método `.config()` também pode gerar exceções se houver problemas ao ler ou analisar o arquivo **.env**, como um formato inválido.

**As variáveis de ambiente são acessíveis em todo o escopo do seu aplicativo Node.js** e são usadas para configurar diferentes aspectos do aplicativo, como credenciais de banco de dados, chaves de API e outras configurações específicas do ambiente.

# Node.js.

## <a name = "tls"></a>`tls`

O módulo `tls` é usado para criar conexões seguras em Node.js.

`require('tls').DEFAULT_ECDH_CURVE = 'auto'`

O código acima altera a curva de ECDH padrão (Elliptic Curve Diffie-Hellman) usada pelo módulo `tls` (**Transport Layer Security**) em Node.js. ECDH é um protocolo de troca de chaves usado para estabelecer uma chave de criptografia compartilhada em uma conexão segura.\
`..DEFAULT_ECDH_CURVE` se refere à curva de ECDH padrão usada nas negociações de chaves ECDH, que recebe, neste caso, o valor `'auto'`.\
Ao definir a curva ECDH como `'auto'`, você está configurando o Node.js para escolher automaticamente a curva ECDH mais adequada com base nas capacidades do sistema. Isso é útil quando você deseja que o Node.js selecione a melhor curva ECDH disponível em vez de especificar uma curva específica.\
Em muitos casos, definir a curva ECDH como `'auto'` é uma boa prática, pois permite que o Node.js escolha a melhor opção de acordo com o ambiente de execução. No entanto, em cenários específicos de segurança ou conformidade, você pode optar por definir uma curva ECDH específica em vez de usar `'auto'`.

## <a name = "http"></a>`http`

O módulo `http` é um módulo principal do Node.js que fornece funcionalidades para criar servidores HTTP e interagir com solicitações e respostas HTTP. Com o módulo `http`, você pode criar aplicativos web, APIs, servidores e muito mais. Ele é uma parte essencial da plataforma Node.js para comunicação na web.

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

console.log("Caminho absoluto:", caminhoAbsoluto); //Saída: /home/orion/APIs/orion-data-api
```

Outro exemplo que mostra a **importância de se especificar partes do caminho relativo**.

```JavaScript
const path = require('path');

console.log(path.resolve("migrations"));       //Saída: /home/orion/APIs/orion-data-api/migrations: este caminho está incorreto.

console.log(path.resolve("db", "migrations")); //Saída: /home/orion/APIs/orion-data-api/db/migrations
```

## <a name = "fs"></a>`fs`

**File System** (**Sistema de Arquivos**). Fornece métodos para interagir com o sistema de arquivos do computador, permitindo que você leia, escreva, manipule e gerencie arquivos e diretórios.\
O **"Sync"** no nome das funções, indica que essas funções são **síncronas**.\
`path` **(string):** caminho para o arquivo/diretório.

### <a id = "readdirsync"></a>`.readdirSync()`

Usado para ler o conteúdo de um diretório, ou seja, lista os arquivos e subdiretórios.

`.readdirSync(__dirname, path)`

Retorna uma matriz.

### <a id = "readfilesync"></a>`.readFileSync()`

Lê o conteúdo de um arquivo.

`readFileSync(path, codificacao)`

`codificacao` **(opcional):** especifica a codificação do arquivo.

Retorna o conteúdo do arquivo em formato de buffer ou em uma condição específica, se especificada.

### <a id = "statsync"></a>`.statSync()`

Obtêm informações sobre um arquivo/diretório especificado.

`.statSync(path)`

Retorna um objeto da classe **fs**.\
O objeto retornado possui propriedades como `.mtime` , que é a data de modificação (timestamp) do arquivo/diretório.

### <a id = "existssync"></a>`.existsSync()`

Verifica se o arquivo ou diretório existe.

`fs.existsSync(path)`

Retorna `true` ou `false`.

### <a id = "unlinksync"></a>`.unlinkSync()`

Remove um arquivo do sistema de arquivos.

`fs.unlinkSync(path)`

## <a name = "os"></a>`os`

É um módulo que fornece informações e utilitários relacionados ao sistema operacional do servidor em que o código Node.js está sendo executado. Ele permite que você acesse informações sobre o sistema, como informações sobre a CPU, memória, diretórios padrão e muito mais.

### <a id = "hostname"></a>`.hostname()`

É usado para obter o nome do host no qual o código Node.js está sendo executado. O nome do host é geralmente o nome do computador ou dispositivo onde o Node.js está em execução. Retorna uma string.

### <a id ="cpus"></a>`.cpus()`

Retorna um array contendo informações sobre todas as CPUs disponíveis no sistema (um array de objetos).

## <a name = "childprocess"></a>`child_process`

Cria e gerencia processos filhos (subprocessos) a partir de um aplicativo Node.js.

### <a id = "exec"></a>`.exec()`

Executa comandos do sistema operacional em um subprocesso. Ele é uma forma de criar processos filhos para executar comandos shell ou outros programas externos.

`.exec(comando, opcoes, callback)`

- `comando` **(string):** representa o comando a ser executado;
- `opcoes` **(objeto, opcional):** pode conter várias opções para controlar o comportamento da execução do comando;
- `callback` **(opcional):** função de retorno de chamada que será chamada quando a execução do comando for concluída.\
  `(erro, stdout, stderr) => {}`
  - `erro` **(string):** variável que conterá informações sobre qualquer erro que ocorrer durante a execução do comando;
  - `stdout` **(string):** variável que conterá a saída padrão (`stdout`) do comando executado;
  - `stderr` **(string):** variável que conterá a saída de erro (`stderr`) do comando executado.

## <a name = "util"></a>`util`

Fornece várias funções utilitárias para ajudar na programação assíncrona e em outros aspectos de desenvolvimento.

### <a id = "promisify"><>`.promisify()`

É usada para converter funções de retorno de chamada (`callback`) em funções que retornam promessas.

`.promisify(callback)`