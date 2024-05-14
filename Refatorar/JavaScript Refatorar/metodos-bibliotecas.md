# Sumário

- [`util`](#util);
- [`crypto`](#crypto);
- [`http`](#http)
- [`querystring`](#querystring);
- [`child_process`](#child_process);
- [`aws-sdk`](#aws-sdk);
- [`axios`](#axios);
- [`body-parser`](#body-parser);
- [`mariadb`](#mariadb);
- [`joi`](#joi);
- [`dotenv`](#dotenv);
- [`uuid/v4`](#uuidv4);
- [`express-graceful-shutdown`](#express-graceful-shutdown).

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

# <a id = "http"></a>`http`

### Sumário

- [`.createServer()`](#createserver);
- [`.listen()`](#http-listen).

## <a id = "createserver"></a>`.createServer()`

`.createServer()` é um método para criar um servidor HTTP em Node.js, ele cria uma instância do servidor HTTP. Este método é uma parte integrante do módulo `http` em Node.js e é usado para criar servidores web HTTP para manipular solicitações e respostas.

`http.createServer([options][, requestListener]);`

`option` **(opcional):** um objeto de opções que pode ser usado para configurar o comportamento do servidor;
`requestListener` **(opcional):** uma função que será chamada para cada solicitação ao servidor. Se não fornecida, as solicitações serão tratadas pelo evento "request".

Retorna uma instância do servidor HTTP.

```JavaScript
const http = require("http");

const server = http.createServer((req, res) => {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Hello, World!\n");
});
const port = 3000;

server.listen(port, () => {
    console.log(`Servidor HTTP está escutando em http://localhost:${port}`);
});
```

Neste exemplo, `.createServer()` é usado para criar um servidor HTTP simples. A função de retorno de chamada fornece o tratamento para cada solicitação, neste caso, respondendo com "`Hello, World!`" para qualquer solicitação recebida. O servidor é então configurado para escutar na porta 3000.

## <a id = "http-listen"></a>`.listen()`

`.listen()` é um método utilizado em **instâncias do servidor HTTP** no Node.js, como as criadas por `.createServer()` ou por **frameworks como o Express.js**, ele inicia o servidor, fazendo com que ele comece a escutar em uma porta específica e, opcionalmente, em um host.

`server.listen([port[, host[, backlog]]][, callback]);`

- `port` **(opcional):** o número da porta em que o servidor deve escutar. Se não fornecido, o sistema operacional escolherá uma porta disponível automaticamente;
- `host` **(opcional):** o nome do host em que o servidor deve escutar. Pode ser um endereço IP ou o nome de host. Se não fornecido, o servidor escutará em todas as interfaces de rede;
- `backlog` **(opcional):** o número máximo de conexões pendentes permitidas. Se não fornecido, um valor padrão do sistema operacional será usado;
- `callback` **(opcional):** uma função de retorno de chamada que será executada uma vez que o servidor estiver escutando.

O método `.listen()` não retorna um valor específico.

```JavaScript
const http = require("http");
const express = require("express");

const app = express();
const port = 3000;
const server = http.createServer(app);

server.listen(port, () => {
    console.log(`Servidor está escutando em http://localhost:${port}`);
});
```

Neste exemplo, `server.liste()` é usado para iniciar o servidor criado com `.createServer()`. O servidor estará escutando na porta 3000, e o callback será acionado assim que o servidor estiver pronto para aceitar conexões.

# `http` x `express`

Considere o bloco de código abaixo:

```JavaScript
const express = require("express");
const http = requre("http");

const app = express();
const server = http.createServer(app);
const port = 3000;

server.listen(port, () => {
    console.log(`Listening on port: ${port}`);
});
```

Na linha `const server = http.createServer(app);` você está utilizando uma instância do Express como um manipulardor de requisições (request handler) para o servidor HTTP criado por `http.createServer()`.\
A assinatura do método `.createServer()` aceita um argumento opcional chamado `requestListener`, que é **uma função que será chamada para cada requisição recebida pelo servidor**. Essa função, quando utilizada com o Express, é frequentemente o próprio aplicativo Express, que **age como um middleware para manipular as requisições HTTP**.\
Então, ao fazer `const server = http.createServer(app);`, você está dizendo ao Node.js para criar um servidor HTTP e utilizar o aplicativo Express (`app`) como o manipulador de requisições para esse servidor. Isso significa que o Express será responsável por lidar com todas as solicitações HTTP recebidas pelo servidor.\
Essa abordagem permite integrar facilmente o Express com a API de servidor HTTP nativa do Node.js, aproveitando as funcionalidades poderosas do Express para roteamento, middlewares, e manipulação de requisições, enquanto ainda mantém a flexibidade da API HTTP nativa.

Considerando ainda o bloco de código acima e a linha de código abaixo:

`app.listen();`

Em muitos casos, especialmente em aplicações construídas com o Express, você pode usar diretamente `app.listen()` para iniciar o servidor sem a necessidade de criar uma instância separada de `http.createServer()`. O Express encapsula essa funcionalidade para facilitar o uso.\
Então quando você chama o método `.listen()` diretamente em uma instância do aplicativo Express, internamente, o Express usa `http.createServer()` por trás dos panos. A chamada `app.listen()` basicamente configura o servidor usando `http.createServer()` e, em seguida, chama o método `.listen()` na instância do servidor criado.\
A escolha entre usar `app.listen()` e `http.createServer()` depende da preferência e do nível de controle que você deseja ter. Usar `app.listen()` é mais conveniente e simplificado, enquanto `http.createServer()` oferece mais flexibilidade se você precisar de manipulação mais granular do servidor HTTP.\
Portanto, para a maioria dos casos, especialmente em aplicações Express mais simples, usar `app.listen()` é uma prática comum e eficaz.

Considerando o conteúdo abordado acima, podemos perceber que quando você utiliza o Express, ele importa a biblioteca `http` automaticamente por trás dos panos. O Express é construído em cima do módulo `http` do Node.js para lidar com a camada de servidor Web\
Ao instalar e usar o Express em seu projeto, você não precisa se preocupar em importar explicitamente o módulo `http`. O próprio Express faz isso internamente. Se você examinar o código-fonte do Express, verá que ele inclui o `http` conforme necessário para criar um servidor HTTP.\
Um exemplo simplificado de como isso pode ser feito internamente no código-fonte do Express seria algo assim:

```JavaScript
const htttp = require("http");

function createApplication() {
    const app = function (req, res) {
        // ...lógica do aplicativo.
    };

    // Criação do servidor usando http.createServer()
    const server = http.createServer(app);

    // Adiciona o método .listen() ao aplicativo.
    app.listen = function (...args) {
        server.listen(...args);
    }

    return app;
}

module.exports = createApplication;
```

Esta é uma simplificação do código real, mas ilustra como o Express pode usar `http.createServer()` para criar um servidor e, em seguida, expor o método  `.listen()` no próprio aplicativo.\
Portanto, ao usar o Express, você pode se concentrar em definir rotas, middlewares e manipular solicitações sem se preocupar explicitamente com a criação do servidor, pois o Express cuida disso nos bastidores.\
<a name = "express-listen"></a>Isso também nos ajuda a perceber que "`server.listen()`" e "[`app.listen()`](#http-listen)", tecnicamente, são o mesmo método.

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

# <a id = "child_process"></a>`child_process`

### Sumário

[`.execFile()`](#execfile).

## <a id = "execfile"></a>`.execFile()`

`.execFile()` é um método usado para executar um arquivo binário (por exemplo, um executável) com argumentos fornecidos como uma matriz.

`child_process.execFile(file[, args][, options][, callback]);`

- `file` **(string):** o caminho para o arquivo binário a ser executado;
- `args` **(array, opcional):** uma matriz de argumentos a serem passados para o arquivo binário;
- `options` **(object, opcional):** opções de configuração, como o diretório de trabalho, ambiente, etc;
- `callback` **(function, opcional):** uma função de retorno de chamada que será chamada com a saída do processo e o código de saída.

Retorna um objeto `ChildProcess`, que é um objeto EventEmitter que representa um processo filho.

```JavaScript
const { execFile } = require("child_process");

const filePath = "/path/to/executable";
const args = ["arg1", "arg2"];

execFile(filePath, args, (error, stdout, stderr) => {
    if (error) {
        console.error("Erro:", error);
        return;
    }

    console.log("Saída padrão:", stdout);
    console.log("Saída de erro:", stderr);
});
```

Neste exemplo, `.execFile()` é usado para executar um arquivo binário localizado em `filePath` com os argumentos fornecidos em `args`. A função de retorno de chamada recebe a saída padrão, a saíde de erro e possíveis erros durante a execução do processo.

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
- [`.getSignedUrl()`](#getsignedurl);
- [`.headObject()`](#headobject);
- [`.listObjects()`](#listobjects);
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

## <a id = "getsignedurl"></a>`.getSignedUrl()`

`.getSignedUrl()` é um método utilizado para gerar uma URL assinada para acesso a um recurso protegido da AWS, como um objeto no Amazon S3. A URL gerada inclui uma assinatura que autoriza temporariamente o acesso ao recurso.

`.getSignedUrl(operation, params, callback)`

- `operation` **(string)** a operação para a qual você deseja gerar a URL assinada, por exemplo "getObject" para acesso a um objeto no S3;
- `params` **(object)** um objeto contendo os parâmetros necessários para a operação específica, por exemplo, o nome do balde e a chave do objeto;
- `callback` **(opcional)** uma função de retorno de chamada que será chamada com a URL assinada ou um erro. Se não fornecido, o método retorna a URL assinada diretamente.\
    `(err: Error, url: string) => void): string | void`

O método retorna a URL assinada se o callback não for fornecido. Se o callback for fornecido, a URL será passada para a função de retorno de chamada.

```JavaScript
const AWS = require("aws-sdk");

const s3 = new AWS.S3();

const params = {
    Bucket: "my-bucket",
    Key: "my-object-key",
    Expires: 60 // Tempo de validade da URL em segundos.
};
const signedUrl = s3.getSignedUrl("getObject", params);

console.log("URL assinada:", signedUrl);
```

Neste exemplo, `.getSignedUrl()` é usado para gerar uma URL assinada para a operação "getObject" no Amazon S3. O resultado é uma URL que permite temporariamente o acesso ao objeto especificado.

## <a id = "headobject"></a>`.headObject()`

`.headObject()` é um método utilizado para recuperar metadados de um objeto no Amazon S3 sem recuperar o corpo (conteúdo) do objeto em si.

`s3.headObjects(params, callback);`

- `params` **(AWS.SE.HeadObjectRequest):** um objeto contendo parâmetros como o nome do balde (`Bucket`) e a chave do objeto (`Key`);
- `callback` **(opcional):** uma função de retorno de chamada que será chamada com possíveis erros ou os metadados do objeto.\
    `(err: AWS.AWSError, data: AWS.S3.HeadObjectOutput) => void): AWS.Request`

Retorna um objeto `AWS.Request` que representa a requisição para o serviço da AWS. Este objeto pode ser usado para monitorar o progresso ou cancelar a operação.

```JavaScript
const AWS = require("aws-sdk");

const s3 = new AWS.S3();

const params = {
    Bucket: "nome-do-seu-bucket",
    Key: "caminho/do/seu/projeto"
};

s3.headObject(params, (err, data) => {
    if (err) {
        console.error("Erro ao obter metadados:", err);
        return;
    }

    console.log("Metadados do objeto:", data);
});
```

Neste exemplo, `.headObject()` é usado para obter metadados (informações sobre o objeto) de um objeto no Amazon S3. Os metadados são retornados na função de retorno de chamada, e nenhum conteúdo real do objeto é recuperado.\
Um exemplo interessante:

```JavaScript
    try {
        // Check if file exists.
        await headObject({ // const headObject = util.promisify(s3.headObject.bind(s3));
            Bucket: "orion-bkps",
            Key: `${hostname}-full.sql.gz`
        });

        let dump_url = await getSignedUrl("getObject", { // const getSignedUrl = util.promisify(s3.getSignedUrl.bind(s3));
            Bucket: "orion-bpks",
            Key: `${hostname}-full.sql.gz`,
            Expires: SIXTY_MINUTES
        });

        res,json({ status: "OK", dump_url });
    } catch {
        console.error("Failed to retrieve dump file", err.code);
        res.status(500).json({ status: "ERROR "});
    }
```

O método `.headObject()` é utilizado para verificar se o objeto existe, caso o objeto não exista, você irá entrar no bloco `catch`.

## <a id = "listobjects"></a>`.listObjects()`

`.listObjects()` é um método utilizado para listar os objetos em um balde (bucket) do Amazon S3.

`s3.listObjects(params, callback);`

- `params` **(AWS.S3.ListObjectsV2Request):** um objeto contendo parâmetros como o nome do balde (`Bucket`);
- `callback` **(opcional):** uma função de retorno de chamada que será chamada com possíveis erros ou detalhes da lista de objetos.\
    `(err: AWS.AWSError, data: AWS.S3.ListObjectsV2Output) => void)`

Retorna um objeto `AWS.Request` que representa a requisição para o serviço da AWS. Este objeto pode ser usado para monitorar o progresso ou cancelar a operação.

```JavaScript
const AWS = require("aws-sdk");

const s3 = new AWS.S3();
const params = {
    Bucket: "nome-do-seu-bucket"
};

s3.listObjects(params, (err, data) => {
    if (err) {
        console.error("Erro ao listar objetos:", err);
        return;
    }

    console.log("Lista de objetos:", data.Contents);
});
```

Neste exemplo, `.listObjects()` é usado para listar os objetos no balde do Amazon S3 especificado pelos parâmetros. A lista de objetos é retornada na função de retorno de chamada, e você pode acessar os detalhes dos objetos na propriedade `Contents` do objeto retornado.

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

- [`axios()`](#funcao-axios);
- [`.post()`](#post);
- [`.patch()`](#patch);
- [`.delete()`](#delete).

## <a id = "funcao-axios"></a>`axios()`

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

## <a id = "post"></a>`.post()`

`.post()` é um método que realiza uma requisição HTTP POST.

`axios.post(url [, data [, config]]);`

- `url` **(string):** a URL para a qual a requisição POST será feita;
- `data` **(object, opcional):** os dados a serem enviados no corpo da requisição;
- `config` **(object, opcional):** configurações adicionais da requisição.

Retorna uma Promise que resolve com a resposta da requisição.

```JavaScript
const axios = require("axios");

const postData = {
    username: "exampleUser",
    password: "examplePassword"
};

axios.post("https://api.example.com/login", postData)
    .then(response => {
        console.log("Resposta da requisição:", response.data);
    })
    .catch(error => {
        console.error("Erro na requisição:", error);
    });
```

Neste exemplo, `.post()` é usado para fazer uma requisição POST para a URL "https://api.example.com/login" com os dados do usuário. O método retorna uma Promise que é tratada usando `.then()` para lidar com a reposta bem-sucedida e `.catch()` para lidar com erros.

## <a id = "patch"></a>`.patch()`

`.patch()` é um método que realiza uma requisição HTTP PATCH.

`axios.patch(url [, data [, config]]);`

- `url` **(string):** a url para qual a requisição PATCH será feita;
- `data` **(object, opcional):** os dados a serem enviados no corpo da requisição;
- `config` **(object, opcional):** configurações adicionais da requisição.

Retorna uma Promise que resolver com a resposta da requisição.

```JavaScript
const axios = require("axios");

const patchData = {
    updatedField: "new value"
};

axios.patch("https://api.example.com/resource/123", patchData)
    .then(response => {
        console.log("Resposta da requisição:", response.data);
    })
    .catch(error => {
        console.error("Error na requisição:", error);
    });
```

Neste exemplo, `.patch()` é usado para fazer uma requisição PATCH para a URL "https://api.example/resource/123" com os dados a serem atualizados. O método retorna uma Promise que é tratada usando `.then` para lidar com a resposta bem-sucedida e `.catch()` para lidar com erros.

## <a id = "delete"></a>`.delete()`

`.delete()` é um método que realiza uma requisição HTTP DELETE.

`axios.delete(url[, config]);`

- `url` **(string):** a URL para a qual a requisição DELETE será feita;
- `config` **(object, opcional):** configurações adicionais da requisição.

Retorna uma Promise que resolve com a resposta da requisição.

```JavaScript
const axios = require("axios");

axios.delete("https://api.example.com/resource/123")
    .then(response => {
        console.log("Resposta da requisição:", response.data);
    })
    .catch(error => {
        console.error("Erro na requisição:", error);
    });
```

Neste exemplo, `.delete()` é usado para fazer uma requisição DELETE para a URL "https://api.example.com/resource/123". O método retorna uma Promise que é tratada usando `.then()` para lidar com a resposta bem-sucedida e `.catch()` para lidar com erros.

# <a id = "body-parser"></a>`body-parser`

### Sumário

- [`.urlencoded()`](#urlencoded)
- [`.json()`](#json)

## <a id = "urlencoded"></a>`.urlencoded()`

A partir da versão 4.16.0 do Express, o módulo `body-parser` foi incorporado por ele, sendo assim, `parser.urlencoded()` e `express.urlenconded()` são essencialmente o mesmo método. Por isso veremos a definição deste método em [`express`, `.urlencoded()`](metodos-frameworks#urlencoded).

## <a id = "json"></a>`.json()`

A partir da versão 4.16.0 do Express, o módulo `body-parser` foi incorporado por ele, sendo assim, `parser.json()` e `express.json()` são essencialmente o mesmo método. Por isso veremos a definição deste método em [`express`, `.json()`](metodos-frameworks#json).

# <a id = "mariadb"></a>`mariadb`

### Sumário

[`.query()`](#query).

## <a id = "query"></a>`.query()`

`.query()` é um método usado para executar uma consulta SQL no banco de dados MariaDB.

`connection.query(sql, values);`

- `sql` **(string):** a consulta SQL a ser executada. Pode incluir espaços reservados que serão substituídos pelos valores reais quando a query for executada. Por exemplo, você pode usar placeholders como `?` ou nomeá-los com `:nome` ou `?name` e fornecer os valores correspondetes no array `values`;
- `values` **(array, opcional):** um array de valores para substituir marcadores de posição na consulta SQL, se houver. Pode ser omitido se a consulta não tiver marcadores de posição. Utilizar um array de valores é útil para evitar ataques de injeção SQL e para passar dados dinâmicos para a query.\
    Quando há mais valores que espaços reservados isso quer dizer que você vai inserir mais de um registro de uma vez.\
    É importante observar que dependendo da versão da biblioteca, ela pode ser flexível o suficiente para você poder passar valores únicos fora de um array para este método.\
    Há uma versão que tratou inclusive a existência de uma vírgula após este parâmetro.

O método `.query()` retorna uma Promise que resolve para os resultados da consulta:

- Se a query for uma query de seleção e for bem-sucedida, **o retorno será um array que possui um objeto com os registros retornados, entre outros objetos**;
- Se a query for uma query de inserção e for bem-sucedida, o retorno será um objeto `{ affectedRows: valor1, insertedId: valor2, warningStatus: valor3 }`;
- Se a query for uma query de atualização e for bem-sucedida, o retorno será um objeto `{ affectedRows: valor1, insertedId: valor2, warningStatus: valor3 }` (aparentemente este não é o formato padrão do objeto, deve estar assim por conta de alguma configuração).

```JavaScript
const mariadb = require("mariadb");

const pool = mariadb.createPool({
    host: "localhost",
    user: "root",
    password: "senha",
    database: "nome_do_banco"
});

pool.query("SELECT * FROM tabela")
    .then(rows => {
        console.log(rows); // Resultados da consulta.
    })
    .catch(err => {
        console.error(err); // Tratar erro, se houver.
    })
    .finally(() => {
        pool.end(); // Encerrar a pool de conexões quando terminar.
    });
```

# <a id = "joi"></a>`joi`

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

# <a id = "dotenv"></a>`dotenv`

### Sumário

[`.config()`](#config).

## <a id = "config"></a>`.config()`

`.config()` é um método utilizado para carregar variáveis de ambiente de um arquivo **.env** para o objeto `process.env`. Ele é parte integrante da funcionalidade principal do `dotenv`, que é facilitar o carregamento dessas variáveis de ambiente.

`dotenv.config(options);`

`options` **(opcional):** um objeto de opções que pode ser usado para configurar o comportamento do `dotenv`.

O método `.config()` não retorna um valor específico. Ele apenas modifica o objeto `process.env` com base nas variáveis definidas no arquivo **.env**.

```JavaScript
const dotenv = require("dotenv");

// Carrega variáveis de ambiente no arquivo .env.
dotenv.config();

// Agora você pode acessar as variáveis de ambiente como process.env.VAR_NAME.
console.log("Valor da variável de ambiente:", process.env.VAR_NAME);
```

No exemplo acima, `.config()` é chamado para carregar as variáveis de ambiente do arquivo **.env**. Após a chamada, você pode acessar essas variáveis usando `process.env`. O arquivo `.env` pode conter várias linhas no formato `CHAVE=valor`, onde cada linha representa uma variável de ambiente.


- **Chamada no início do aplicativo:** é uma boa prática chamar o método `.config()` no início do seu aplicativo, antes de qualquer outra operação que dependa das variáveis de ambiente definidas no arquivo **.env**;
- **Automatiza o carregamento:** o método `.config()` automatiza o processo de leitura do arquivo **.env** e o carregamento de todas as variáveis de ambiente definidas nele;
- **Retorna um objeto de configuração:** embora o método `.config()` não retorne explicitamente um valor, ele modifica o objeto `process.env` no ambiente Node.js para incluir todas as variáveis de ambiente definidas no arquivo **.env**;
- **Gestão de erros:** o método `.config()` também pode gerar exceções se houver problemas ao ler ou analisar o arquivo **.env**, como um formato inválido.

**As variáveis de ambiente são acessíveis em todo o escopo do seu aplicativo Node.js** e são usadas para configurar diferentes aspectos do aplicativo, como credenciais de banco de dados, chaves de API e outras configurações específicas do ambiente.

# <a id = "express-graceful-shutdown"></a>`express-graceful-shutdown`

### Sumário

[`shutdown()`](#shutdown).

## <a id = "shutdown"></a>`shutdown()`

`express-graceful-shutdown` fornece uma função, e você a utiliza da seguinte maneira:

```JavaScript
const express = require("express");
const shutdown = require("express-graceful-shutdown");

const app = express();

// Configuração e definição de rotas.

const server = app.listen(3000, () => {
    console.log("Servidor iniciado na porta 3000.");
});

// Uso da função shutdown para encerrar o servidor de maneira graciosa.
shutdown(server);
```

`shutdown()` permite encerrar o servidor Express de maneira graciosa, garantindo que todas as conexões existentes sejam concluídas antes do encerramento.

`shutdown(server, [option], [callback]);`

- `server` **:** a instância do servidor Express que você deseja encerrar;
- `options` **(opcional):** um objeto com opções de configuração;
- `callback` **(opcional):** uma função de retorno de chamada a ser executada após o encerramento ser concluído.

Não há um valor de retorno específico.

O bloco de código acima utiliza a função `shutdown()` para encerrar o servidor de forma segura quando necessário.