# Sumário

- [`aws-sdk`](#aws-sdk);
- [`util`](#util).

# <a id = "aws-sdk"></a>`aws-sdk`

### Sumário

- [`.update()`](#update);
- [`.IAM()`](#iam);
- [`.listAccessKeys()`](#listaccesskeys);
- []();
- []();
- []();
- [`.S3()`](#s3);
- [`.Endpoint()`](#endpoint).

## <a id = "update"></a>`.update()`

O método `.update()` atualiza a configuração do AWS SDK, incluindo configurações como credenciais de acesso, região. etc.

`AWS.Config.update(options);`

`options` **(object):** um objeto contendo as opções de configuração que você deseja atualizar.
    - `accessKeyId` **(string):** a chave de acesso da AWS;
    - `secretAccessKey` **(string):** a chave secreta de acesso da AWS;
    - `region` **(string):** a região da AWS na qual você deseja que as solicitações sejam feitas;
    - `logger`**:** define o destino de saída de logs.

Não há um valor de retorno específico. O método atualiza a configuração diretamente.\
Não retorna nenhum valor (retorna `undefined`).

```JavaScript
const AWS = require("aws-sdk");

// Configurar as crecenciais e região.
AWS.config.update({
    accessKeyId: "SUA_ACCESS_KEY",
    secretAccessKey: "SUA_SECRET_KEY",
    region: "SUA_REGIAO"
});

// Agora a AWS SDK usará essas configuraçoes ao interagir com os serviços da AWS.
```

Neste exemplo, `AWS.config.update()` é usado para configurar as credenciais de acesso e a região para o AWS SDK. Depois de chamar esse método, o SDK usará essas configurações ao interagir com os serviços da AWS.

## <a id = "iam"></a>`.IAM()`

**Não é um método**, é uma forma de configurar permissões **IAM** (**Identity and Access Management**) para um usuário ou recurso específico, você normalmente interage com o serviço IAM usando as classes e métodos fornecidos pelo SDK.\
Com ele você cria uma instância do serviço. A instância é criada com a configuração da versão da API especificada.

`const iam = new AWS.IAM(options);`

`options` **(object):** objeto de configuração.\
    `apiVersion`**:** especifica a versão da API que você deseja usar para as chamadas do serviço IAM.

Retorna uma instância do serviço.

```JavaScript
const AWS = require("aws-sdk");

// Criar uma instância do serviço IAM.
const iam = new AWS.IAM();

// Exemplo de listagem de usuários IAM.
iam.listUsers({}, (err, data) => {
    if (err){
        console.error("Erro ao listar usuários IAM:", err);
    } else {
        console.log("Usuários IAM:", data.Users);
    }
});
```

No exemplo acima, `new AWS.IAM()` cria uma instância do serviço IAM, e `iam.listUsers()` é um exemplo de método que lista os usuários IAM existentes. Este é apenas um exemplo, e há muitos outros métodos disponíveis no serviço IAM, dependendo do que você precisa realizar.

O `.IAM()` não é um método do objeto `AWS`, mas sim uma forma de criar uma instância do serviço AWS Identity and Access Management por meio do objeto `AWS`. O objeto `AWS` é um namespace que fornece acesso a vários serviços da Amazon Web Services por meio da biblioteca `aws-sdk` em Node.js.\
Não é necessário especificar parâmetros ao criar uma instância do serviço IAM usando o construtor. **As configurações, como credenciais e região, são definidas globalmente no objeto** `AWS` por meio do método `.update()`.\
O objeto `iam` que você cria pode ser usado para fazer chamadas às operações do IAM, como criar usuários, gerenciar grupos, políticas e assim por diante. O retorno dessas chamadas à API depende da operação específica e pode incluir informações ou erros relacionados à operação realizada.

## <a id = "listaccesskeys"></a>`.listAccessKeys()`

`.listAccessKeys()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele retorna uma lista das chaves de acessos associadas a um usuário IAM.

`iam.listAccessKeys(params, callback);`

- `params`**(object):** um objeto contendo parâmetros para a operação, como o nome do usuário (`UserName`);
- `callback` **(opcional):** uma função de retorno de chamada que será chamada com os resultados da operação.

O método não retorna um valor diretamente. Em vez disso, os resultados são passados para a função de retorno de chamada.

```JavaScript
const AWS = require("aws-sdk");

// Criar uma instância do serviço IAM.
const iam = new AWS.IAM();

// Parâmetros para listar as chaves de acesso de um usuário específico.
const params = {
    UserName: "nome-do-usuario"
};

// Listar as chaves de acesso e lidar com os resultados usando uma função de callback.
iam.listAccessKeys(params, (err, data) => {
    if (err) {
        console.error("Erro ao listar chaves de acesso:", err);
    } else {
        console.log("Chaves de acesso:", data.AccessKeyMetadata);
    }
})
```

Neste exemplo, `iam.listAccessKeys` é usado para listar as chaves de acesso associadas a um usuário específico no IAM. A função de retorno de chamada lida com os resultados da operação.

##

##

##

## <a id = "s3"></a>`.S3()`

**Não é um método**, mas sim uma construção de uma instância do serviço Amazon S3 (Simple Storage Service) no AWS SDK para JavaScript/Node.js.\
Ele cria uma instância do serviço Amazon S3 que pode ser usada para interagir com o armazenamento de objetos da Amazon.

`new AWS.S3([options]);`

`options` **(opcional):** um objeto contendo opções de configuração para a instância do serviço S3.
    `endpoint` **(opcional):** o ponto de extremidade (URL) personalizado para o serviço S3. Se você estiver usando um serviço de armazenamento de objetos compatível com o protocolo S3, pode especificar o ponto de extremidade personalizado aqui.

Retorna uma instância do serviço S3 configurada de acordo com as configurações fornecidas que pode ser usada para interagir com os recursos da Amazon S3.

```JavaScript
const AWS = require("aws_sdk");

// Criar uma instância do serviço S3.
const s3 = new AWS.S3();

// Exemplo de upload de um objeto para um bucket no S3.
const params = {
    Bucket: "NOME_DO_SEU_BUCKET",
    Key: "nome-do-arquivo.txt",
    Body: "Conteúdo do arquivo"
};

s3.upload(params, (err, data) => {
    if (err) {
        console.error("Erro ao fazer upload:", err);
    } else {
        console.log("Upload bem-sucedido. Detalhes:", data);
    }
});
```

No exemplo acima, `new AWS.S3()` cria uma instância do serviço S3, e a instância resultante (`s3`) pode ser usada para realizar operações no Amazon S3, como upload de objetos. Essa construção de instância é um padrão comum ao trabalhar com os serviços da AWS no AWS SDK para Node.js.\
Você pode usar essa instância para interagir com o Amazon S3 e realizar operações como criar, listar, baixar ou excluir objetos, gerenciar buckets e configurar permissões.

## <a id = "endpoint"></a>`.Endpoint()`

**É uma classe**, representa um objeto de ponto de extremidade (endpoint) para interação com os serviços da AWS (também serve para a DIGITAL_OCEAN, por exemplo).\
Cria uma instância do objeto `AWS.Endpoint` que é projetado para configurar pontos de extremidade personalizados.

`new AWS.Endpoint(endpoint);`

`endpoint`**(string):** uma string que representa o URL do endpoint que você deseja configurar.

Retorna uma instância do objeto `AWS.Endpoint`.

```JavaScript
const AWS = require("aws-sdk");

const customEndpoint = new AWS.Endpoint("https://seu-endpoint-customizado.com");

const s3 = new AWS.S3({
    endpoint: customEndpoint,
    accessKeyId: "SUA_ACCESS_KEY",
    secretAccessKey: "SUA_SECRET_KEY"
});
```

Neste exemplo, `AWS.Endpoint` é usado para criar uma instância de um objeto de ponto de extremidade. Esta instância pode ser então utilizada para configurar a opção `endpoint` de serviços AWS que suportam tal configuração, como o Amazon S3.\
Essa funcionalidade pode ser útil quando você precisa interagir com serviços compatíveis com a AWS, mas que estão hospedados em um ambiente com um endpoint personalizado, como por exemplo, em implementações locais ou ambientes de desenvolvimento.

# <a id = "util"></a>`util`

### Sumário

[.promisify()](#promisify)

## <a id = "promisify"></a>`promisify()`

`.promisify()` é uma função que converte funções assíncronas que usam callbacks para uma forma que retorna Promises, permitindo que você trabalhe com código assíncrono usando Promises em vez de callbacks.

`util.promisify(original);`

`original` **(function):** a função original que usa callbacks.

Retorna uma versão da função `original` que retorna uma Promise.

```JavaScript
const util = require("util");
const fs = require("fs");

const readFileAsync = util.promisify(fs.ReadFile);

// Agora você pode usar readFileAsync como uma função que retorna uma Promise.
readFileAsync("arquivo.txt", "utf8")
    .then(data => console.log(data))
    .catch(err => console.log(err));
```