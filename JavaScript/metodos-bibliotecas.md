# Sumário

- [`util`](#util);
- [`crypto`](#crypto);
- [`querystring`](#querystring);
- [`aws-sdk`](#aws-sdk);
- [`axios`](#axios);
- [`joi`](#joi).

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

# <a id = "crypto"></a>`crypto`

### Sumário

- [`createHmac()`](#createhmac);
- [`.update()`](#crypto-update);
- [`.digest()`](#digest);
- [`.randomInt()`](#randomint).

## <a id = "createhmac"></a>`createHmac()`

`createHmac()` é usado para criar um objeto **Hmac** (**Hash-based Message Authentication Code**) para fins de autenticação baseada em hash.

`crypto.createHmac(algorithm, key, [options]);`

- `algorithm` **(string):** string indicando o algoritmo de hash a ser usado (por exemplo, "sha256", "sha512", etc.);
- `key` **(string):** buffer ou string contendo a chave para o HMAC;
- `options` **(opcional):** um objeto com opções adicionais.

Retorna um objeto Hmac.

```JavaScript
const crypto = require("crypto");

const secretKey = "mySecretKey";
const hmac = crypto.createHmac("sha256", secretKey);
const data = "Hello, World.";

hmac.update(data);

const hash = hmac.digest("hex");
console.log(hash);
```

Neste exemplo, é criado um objeto Hmac usando o algoritmo SHA-256 e uma chave secreta. O objeto Hmac é então atualizado com os dados (no caso, a string "Hello, World.") e, finalmente, é gerado o hash.

## <a id = "crypto-update"></a>`.update()`

`.update()` é um método do objeto Hmac no módulo `crypto` do Node.js, ele é usado para alimentar dado para o objeto Hmac, que são usados para calcular o hash,

`hmac.update(data, [inputEncoding]);`

- `data`**:** os dados a serem alimentados para o Hmac, pode ser uma string ou um Buffer;
- `inputEncoding` **(opcional):** a codificação dos dados de entrada (por exemplo, "utf8", "hex", "base64", etc.).

Retorna o próprio objeto Hmac, permitindo chamadas encadeadas.

```JavaScript
const crypto = require("crypto");
const secretKey = "mySecretKey";
const hmac = crypto.createHmac("sha256", secretKey);
const data = "Hello, World.";

hmac.update(data);

const hash = hmac.digest("hex");

console.log(hash);
```

Neste exemplo, o método `.update()` é usado para alimentar a string "Hello, World." para o objeto Hmac antes de calcular o hash final.

## <a id = "digest"></a>`.digest()`

`.digest()` é um método do objeto Hmac no módulo `crypto` do Node.js, ele é usado para finalizar o cálculo do hash e obter o resultado.

`hash.digest([enconding]);`

`enconding` **(opcional):** a codificação do resultado (por exemplo, "hex", "base64", "binary", etc.).

Retorna a representação do hash como uma string ou Buffer, dependendo da codificação especificada ou do padrão.

```JavaScript
const crypto = require("crypto");
const hash = crypto.createHash("sha256");
const data = "Hello, World.";

hash.update(data);

const hashResult = hash.digest("hex");

console.log(hashResult);
```

Neste exemplo, o método `.digest()` é usado para obter o hash final no formato hexadecimal.

## <a id =  "randomint"></a>`.randomInt()`

`.randomInt()` é usado para gerar um número inteiro aleatório entre `min` (inclusivo) e `max` (exclusivo).

`crypto.randomInt();`

- `min`**(opcional):** valor mínimo (inclusivo) do intervalo. Se não fornecido, o default é zero;
- `max`**:** valor máximo (exclusivo )do intervalo.

Retorna um número inteiro aleatório no intervalo [min, max).

```JavaScript
const crypto = require("crypto");

const randomNum = crypto.randomInt(1, 100);

console.log(randomNum);
```

Este exemplo gerará um número aleatório entre 1 (inclusivo) e 100 (exclusivo) e o imprimirá no console.

# <a id = "querystring"></a>`querystring`

### Sumário

[`.stringify()`](#stringify).

## <a id = ""></a>`.stringify()`

O método `.stringify()` é usado para serializar objetos JavaScript em uma string de consulta (query string). Ele converte um objeto em uma string no formato "`chave1=valor1&chave2=valor2`", que é comumente usado em URLs para enviar parâmetros.

`querystring.stringify(object[, separator[, KeyValuePairSeparator[, options]]]);`

- `object`**:** o objeto a ser serializado;
- `separator` **(string, opcional):** o separador para as partes da string de consulta, o padrão é "`&`";
- `KeyValueSeparator` **(string, opcional):** o separador para chaves e valores, o padrõa é "`=`";
- `options` **(object, opcional):** um objeto que pode conter uma propriedade `encondedURIComponent` para personalizar a codificação. Outras propriedade:
    - `separator` **(string):** especifica o separador a ser usado na string de consulta. Este parâmetro substitui o separador global;
    - `equals` **(string):** especifica o caracter a ser usado para separar chaves e valores. Este parâmetro substitui o atributo global.

Retorna uma string que representa a versão serializada do objeto.

```JavaScript
const querystring = require("querystring");

const object = {
    name: "John",
    age: 25,
    city: "ExampleCity"
};
const queryString = querystring.stringify(object);

console.log(querysString); // Saída: name=John&age=25&city=ExampleCity
```

Neste exemplo, o objeto é transformado em uma string de consulta. Os valores são codificados para serem seguros em URLs, e o resultado pode ser anexado a uma URL para envio de parâmetros.

# <a id = "aws-sdk"></a>`aws-sdk`

### Sumário

- [`.update()`](#aws-sdk-update);
- [`.IAM()`](#iam);
- [`.createUser()`](#createuser);
- [`.getUser()`](#getuser);
- [`.addUserToGroup()`](#addusertogroup);
- [`.createPolicy()`](#createpolicy);
- [`.getPolicy()`](#getpolicy);
- [`.attachUserPolicy()`](#attachuserpolicy);
- [`.createPolicyVersion()`](#createpolicyversion);
- [`.getPolicyVersion()`](#getpolicyversion);
- [`.deletePolicyVersion()`](#deletepolicyversion);
- [`.listAccessKeys()`](#listaccesskeys);
- [`.deleteAccessKey()`](#deleteaccesskey);
- [`.createAccessKey()`](#createaccesskey);
- [`.S3()`](#s3);
- [`.Endpoint()`](#endpoint).

## <a id = "aws-sdk-update"></a>`.update()`

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

## <a id = "createuser"></a>`.createUser()`

`.createUser()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para criar um novo usuário no AWS IAM.

- A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `UserName` (nome do usuário);
- Os parâmetros podem incluir informações específicas do usuário, como `UserName` e opções adicionais, como `Path` (caminho no IAM para o usuário);
-  O retorno geralmente inclui informações sobre o usuário recém-criado, como o ARN do usuário, credenciais de acesso e assim por diante.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const createUserParams = {
    if (err) {
        console.error("Erro ao criar o usuário:", err);
    } else {
        console.log("Usuário criado com sucesso:", data.User);
    }
};
```

## <a id = "getuser"></a>`.getUser()`

`.getUser()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para obter informações sobre um usuário específico no AWS IAM.

- A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `UserName` (nome do usuário) ou nenhum parâmetro, pois ele opera no contexto do usuário autenticado;
- O parâmetro pode incluir `UserName` (opcional) para especificar o usuário sobre o qual deseja obter informações;
- O retorno inclui informações detalhadas sobre o usuário consultado, como o ARN do usuário, as políticas associadas e outras informações.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const getUserParams = {
    // UserName: "NomeUsuarioOpcional", // O nome de usuário é opcional.
};

iam.getUser(getUserParams, (err, data) => {
    if (err) {
        console.error("Erro ao obter informações do usuário:", err);
    } else {
        console.log("Informações do usuário:", data.User);
    }
});
```

## <a id = "addusertogroup"></a>`.addUserToGroup()`

`.addUserToGroup()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para adicionar um usuário a um grupo específico no IAM.

A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `GroupName` (nome do grupo) e `UserName` (nome do usuário).

- `GroupName`**:** o nome do grupo ao qual o usuário será adicionado;
- `UserName`**:** o nome do usuário que será adicionado ao grupo.

Este método geralmente não retorna dados significativos, apenas confirmações sobre a operação bem-sucedida.

```JavaScript
const AWS = require("aws-sdk");
const iam =  new AWS.IAM();
const addUserToGroupParams = {
    GroupName: "NomeDoGrupo",
    UserName: "NomeDoUsuario"
};

iam.addUserToGroup(addUserToGroupParams, (err, data) => {
    if (err) {
        console.error("Erro ao adicionar usuário ao grupo:", err);
    } else {
        console.log("Usuário adicionado ao grupo com sucesso:", data);
    }
});
```

## <a id = "createpolicy"></a>`.createPolicy()`

`.createPolicy()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para criar uma nova política de acesso no AWS IAM. Ele define as permissões associadas a essa política.

- A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros com informações sobre a política a ser criada;
- Os parâmentros podem incluir detalhes sobre a política a ser criada, como o `PolicyName`, `PolicyDocument` (um documento JSON que define as permissões) e outros detalhes relevantes;
- O retorno geralmente inclui informações sobre a política recém-criada, como o ARN (Amazon Resource Name) da política.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const policyParams = {
    PolicyName: "MyPolicy",
    PolicyDocument: JSON.stringify({
        // Definição das permissões da política.
    })
};

iam.createPolicy(policyParams, (err, data) => {
    if (err) {
        console.error("Erro ao criar a política:", err);
    } else {
        console.log("Política criada com sucesso:", data);
    }
});
```

## <a id = "getpolicy"></a>`.getPolicy()`

`.getPolicy()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para obter informações sobre uma política específica no AWS IAM.

A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `PolicyArn` (Amazon Resouce Name da política).

`PolicyArn`**:** o amazon resource name (ARN) da política da qual você deseja obter informações.

Este método geralmente retorna um objeto com informações detalhadas sobre a política consultada.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const getPolicyParams = {
    PolicyArn: "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
};

iam.getPolicy(getPolicyParams, (err, data) => {
    if (err) {
        console.error("Erro ao obter informações da política:", err);
    } else {
        console.log("Informações da política:", data.Policy);
    }
});
```

## <a id = "attachuserpolicy"></a>`.attachUserPolicy()`

`.attachUserPolicy()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para associar uma política existente a um usuário específico no AWS IAM.

- A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `UserName` e `PolicyArn` (ARN da política a ser associada);
- Os parâmetros podem incluir informações específicas do usuário, como `UserName`, e a política a ser associada, identifica por `PolicyArn`;
- O retorno geralmente inclui informações sobre a associação bem-sucedida, mas pode variar.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const attachPolicyParams = {
    UserName: "NomeDoUsuario",
    PolicyArn: "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
};

iam.attachUserPolicy(attachUserPolicy, (err, data) => {
    if (err) {
        console.error("Erro ao associar a política ao usuário:", err);
    } else {
        console.log("Política associada ao usuário com sucesso:", data);
    }
});
```

## <a id = "createpolicyversion"></a>`.createPolicyVersion()`

`.createPolicyVersion()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para criar uma nova versão de uma política existente no AWS IAM.

A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `PolicyArn` (Amazon Resource Name da política) e `PolicyDocument` (documento JSON que define a política).

- `PolicyArn`**:** o Amazon Resource Name (ARN) da política para a qual você deseja criar uma nova versão;
- `PolicyDocument`**:** o documento JSON que define a nova versão da política.

Este método geralmente retorna informações sobre a nova versão da política.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const createPolicyVersionParams = {
    PolicyArn: "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    PolicyDocument: `{
        "Version": "2012-10-17",
        "Statement": [{
            "Effect:" "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn.aws.s3:::*"
        }]}`
};

iam.createPolicyVersion(createPolicyVersionsParams, (err, data) => {
    if (err) {
        console.error("Erro ao criar nova versão política:", err);
    } else {
        console.log("Nova versão da política criada:", data.PolicyVersion);
    }
});
```

## <a id = "getpolicyversion"></a>`.getPolicyVersion()`

`.getPolicyVersion()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para recuperar informações sobre uma versão específica de uma política no AWS IAM.

A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `PolicyArn` (Amazon Resource Name da política) e `VersionId` (identificador da versão da política).

- `PolicyArn`**:** o Amazon Resource Name (ARN) da política para a qual você deseja obter informações sobre uma versão;
- `VersionId`**:** o identificador da versão específica da política.

Este método geralmente retorna informações detalhadas sobre a versão da política solicitada.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const getPolicyVersionParams = {
    PolicyArn: "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    VersionId: "v1" // Substitua com a versão específica que você deseja recuperar.
};

iam.getPolicyVersion(getPolicyVersionsParams, (err, data) => {
    if (err) {
        console.error("Erro ao obter informações da versão da política:", err);
    } else {
        console.log("Informações da versão da política:", data.PolicyVersion);
    }
});
```

## <a id = "deletepolicyversion"></a>`.deletePolicyVersion()`

`.deletePolicyVersion()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele é usado para excluir uma versão específica de uma política no AWS IAM.

A assinatura exata pode variar, mas geralmente envolve um objeto de parâmetros, incluindo `PolicyArn` (Amazon Resource Name da política) e `VersionId` (identificador da versão da política).

- `PolicyArn`**:** o Amazon Resource Name (ARN) da política para a qual você deseja excluir uma versão;
- `VersionId`**:** o identificador da versão específica da política que você deseja excluir.

Este método geralmente não possui um retorno significativo, ou o retorno pode incluir informações sobre a operação de exclusão.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const deletePolicyVersionParams = {
    PolicyArn: "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    VersionId: "v1" // Substitua com a versão específica que você deseja excluir.
};

iam.deletePolicyVersion(deletePolicyVersionsParams, (err, data) => {
    if (err) {
        console.error("Erro ao excluir a versão da política:", err);
    } else {
        console.log("Versão da política excluída com sucesso:", data);
    }
});
```

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
    UserName: "nome_do_usuario"
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

## <a id = "deleteaccesskey"></a>`.deleteAccessKey()`

`.deleteAccessKey()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele exclui uma chave de acesso associada a um usuário IAM.

`iam.deleteAccessKey(params, callback);`

- `params` **(object):** um objeto contendo informações sobre a chave de acesso a ser excluída;
- `callback` **(function):** uma função de retorno de chamada para lidar com o resultado da operação.

Não há um valor de retorno significativo para essa operação. A resposta pode ser tratada na função de retorno de chamada.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const params = {
    UserName: "nome_do_usuario", // Nome do usário IAM.
    AccessKeyId: "ID_DA_CHAVE_SER_EXCLUIDA" // ID da chave de acesso a ser excluída.
};

iam.deleteAcessKey(params, function(err, data) {
    if (err) console.log(err, err.stack);
    else console.log("Chave de acesso excluída com sucesso:", data);
});
```
Este exemplo assume que você já configurou suas credenciais AWS e inicializou o objeto `IAM`. O método `.deleteAccessKey()` é usada para excluir uma chave de acesso associada a um usuário específico.

## <a id = "createaccesskey"></a>`.createAccessKey()`

`.createAccessKey()` é um método do serviço AWS Identity and Access Management (IAM) no AWS SDK para JavaScript (Node.js), ele cria uma nova chave de acesso (access key) para um usuário IAM.

`iam.createAcessKey(params, callback);`

- `params` **(object):** um objeto contendo informações sobre o usuário IAM para o qual a chave de acesso será criada;
- `callback` **(function):** uma função de retorno de chamada para lidar com o resultado da operação.

O resultado da operação geralmente retorna informações sobre a nova chave de acesso criada.

```JavaScript
const AWS = require("aws-sdk");
const iam = new AWS.IAM();
const params = {
    UserName: "nome_do_usuario" // Nome do usuário IAM para o qual a chave de acesso será criada.
};

iam.createAccessKay(params, function (err, data) => {
    if (err) console.log(err, err.stack);
    else console.log("Nova chave de acesso criada:", data);
});
```

Este exemplo assume que você já configurou suas credenciais AWS e inicializou o objeto `IAM`. A função `.createAccessKey()` é usada para criar uma nova chave de acesso para um usário específico.

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

# <a id = "axios"></a>`axios`

### Sumário

[`axios()`](#funcaoaxios).

## <a id = "funcaoaxios"></a>`axios()`

`axios()` é uma função, ela cria uma instância do cliente Axios que permite fazer requisições HTTP. Essas instâncias podem ser personalizadas com configurações específicas, como baseURL, headers, interceptadores, entre outros.

`axios([config]);`

`config` **(object, opcional)** um objeto de configuração que define as opções para a requisição, como método, URL, parâmetros, headers, etc.
    - `method` **(string):** o método HTTP da solicitação (por exemplo, "GET", "POST", "PUT", "DELETE", etc.). **O valor padrão é "GET"**;
    - `url` **(string):** a URL para qual a solicitação será enviada;
    - `params` **(object):** parâmetros de consulta qie são anexados à URL da solicitação. Normalmente, isso é usada para solicitações GET;
    - `headers` **(object):** um objeto contendo os cabeçalhos da solicitação;
    - `data` **(object, string ou FormData):** os dados a serem enviados no corpo da solicitação. Isso pode ser um objeto JavaScript, uma string ou um objeto FormData.

Retorna uma Promise que se resolve com a resposta da requisição.

```JavaScript
// Importando o Axios.
const axios = require("axios");

// Fazendo uma requisição GET.
axios({
    method: "get",
    url: "https://api.example.com/data",
    params: {
        Key: "valor"
    }
})
.then(response => {
    // Manipular a resposta se a requisição for bem-sucedida.
    console.log(response.data);
})
.catch(error = > {
    // Manipular erros.
    console.error(error);
});
```

Neste exemplo, uma instância do cliente Axios é usada para fazer uma requisição GET para uma URL específica com parâmetros. A resposta ou erro resultante é manipulado na Promise.

Se você passar somente uma URL como argumento para o método `axios()` e essa URL incluir parâmetros de consulta, isso significa que você está fazendo uma solicitação HTTP **GET** com parâmetros de consulta codificados na própria URL.\
O Axios é inteligente o suficiente para reconhecer que a URL fornecida inclui parâmetros de consulta e os envia como parte da solicitação. Assim, o resultado é o mesmo que se você tivesse definido os parâmetros de consulta separadamente na configuração da solicitação.\
Essa é uma maneira conveniente de fazer solicitações GET com parâmetros de consulta diretamente na URL, especialmente quando você precisa construir dinamicamente a URL com base em um objeto de parâmetros. O Axios simplifica o processo de envio dessas solicitações HTTP.

# <a id = ""></a>`joi`

### Sumário

- [`.object`](#object);
- [`.validate()`](#validate);
- [`.number()`](#number);
- [`.integer()`](#integer);
- [`.positive()`](#positive);
- [`.required()`](#required);
- [`.allow()`](#allow).

## <a id = "object"></a>`.object()`

`.object()` é um método do `joi` que é usado para definir um esquema para objetos JavaScript, ele define um esquema para validar objetos.

`Joi.object([schema]);`

`schema` **(opcional):** um objeto que define o esquema para os objetos. Se não fornecido, o método `object` apenas verifica se o valor é um objeto.

Retona um esquema `joi` que pode ser usado para validar objetos.

## <a id = "validate"></a>`.validate()`

`.validate()` é um método do `joi` que é usado para validar valores em relação a um esquema definido.

`validate(value, [schema], [options], [callback]);`

- `value`**:** o valor a ser validado;
- `schema` **(opcional):** o esquema `joi` usado para validar o valor;
- `options` **(opcional):** opções de validação;
- `callback` **(function, opcional):** uma função de retorno de chamada que será chamada com o resultado da validação.

Retorna um objeto com informações sobre o resultado da validação. Normalmente. possui propriedades como `error` (se houve erros de validação) e `value` (o valor validado).

```JavaScript
const Joi = require("joi");

// Definindo um esquema para validar uma string.
const stringSchema = Joi.string()min(3).max(30).required();

// Valor a ser validado.
const stringValue = "Hello";

// Validando o valor em relação ao esquema.
const result = Joi.validate(stringValue, stringSchema);

if (result.error) {
    console.error(result.error.details);
} else {
    console.log("Valor válido:", resulte.value);
}
```

Neste exemplo, `Joi.validate()` é usado para validar a string `stringValue` em relação ao esquema `stringSchema`. O resultado da validação é então verificado para determinar se há erros ou se o valor é válido.

## <a id = "number"></a>`.number()`

`.number()` é um método usado para validar se um valor é do tipo número.

Ele é parte de uma expressão de validação em cadeia e não retorna um valor significativo por conta própria. A expressão de validação como um todo retornará um objeto Joi que pode ser utilizado para validar dados.

```JavaScript
const Joi = require("joi");

const schema = Joi.object({
    age: Joi.number().integer().min(18)
});
const result = schema.validate({ age: 25});
// result.error contém informações de erro se a validação falhar.
```

Neste exemplo, `.number()` é usado para especificar que o valor associado à chave `age` deve ser um número.

## <a id = "integer"></a>`.integer()`

`.integer()` é um método usado para validar se um valor é um número inteiro.

Ele é parte de uma expressão de validação em cadeia e não retorna um valor significativo por conta própria. A expressão de validação como um todo retornará um objeto Joi que pode ser utilizado para validar dados.

```JavaScript
const Joi = require("joi");

const schema = Joi.object({
    age: Joi.number().integer().min(18)
});
const result = schema.validate({ age: 25});
// result.error contém informações de erro se a validação falhar.
```

Neste exemplo, `.integer()` é usado para especificar que o valor associado à chave `age` deve ser um número inteiro.

## <a id = "positive"></a>`.positive()`

`.positive()` é um método usado para validar se um número é positivo (maior que zero).

Ele é parte de uma expressão de validação em cadeia e não retorna um valor significativo por conta própria. A expressão de validação como um todo retornará um objeto Joi que pode ser utilizado para validar dados.

```JavaScript
const Joi = require("joi");

const schema = Joi.object({
    price: Joi.number().positive()
});
const result = schema.validate({ price: 42.99 });
// result.error contém informações de erro se a validação falhar.
```

Neste exemplo, `.positive()` é usado para garantir que o valor associado à chave `price` seja um número positivo.

## <a id = "required"></a>`.required()`

`.required()` é um método usado para especificar que um campo é obrigatório. Ele impõe que o valor associado a um determinado campo em um objeto deve estar presente.

Ele é parte de uma expressão de validação em cadeia e não retorna um valor significativo por conta própria. A expressão de validação como um todo retornará um objeto Joi que pode ser utilizado para validar dados.

```JavaScript
const Joi = require("joi");

const schema = Joi.object({
    username: Joi.string().required(),
    password: Joi.string().required()
});
const result = schema.validate({ username: "john_doe", passwdor: "s3cr3t" })
// result.error contém informações de erro se a validação falhar.
```

Neste exemplo, `.required()` é usado para indicar que tento `username` quanto `password` são campos obrigatórios no objeto a ser validado.

## <a id = "allow"></a>`.allow()`

`.allow()` é um método usado para especificar valores permitidos para um campo durante a validação. Ou seja, você pode usar `.allow()` para indicar quais valores são válidos para um campo específico.

`.allow(value);`

`value`**:** o valor permitido para o campo.

Ele é parte de uma expressão de validação em cadeia e não retorna um valor significativo por conta própria. A expressão de validação como um todo retornará um objeto Joi que pode ser utilizado para validar dados.

```JavaScript
const Joi = require("joi");

const schema = Joi.object({
    gender: Joi.string().allow("male", "female", "other").required(),
    age: Joi.number().integer().min(18).required()
});
const result = schema.validate({ gender: "male", age: 25 });
// result.error contém informações de erro se a validação falhar.
```

Neste caso `.allow("male", "female", "other")` é usado para indicar que o campo `gender` só aceita os valores "male", "female" e "other".