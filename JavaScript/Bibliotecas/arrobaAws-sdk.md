# @aws-sdk

O AWS SDK V3 introduziu várias mudanças significativas em comparação a versão 2 (`aws-sdk`), incluindo um design modular quer permite importar apenas os pacotes necessários, reduzindo o tamanho do pacote na sua aplicação. Na V3, **cada serviço da AWS é fornecido como um pacote separado**.

### Exemplos

Para instalar o SDK de um serviço específico, como o AWS Secrets Manager, através do npm:

```Bash
$ npm install @aws-sdk/client-secrets-manager
```

e aqui está um exemplo básico de como usar o v3 para acessar o AWS Secrets Manager:

```JavaScript
// Importando o cliente do AWS Secrets Manager.
const { SecretsManagerClient, GetSecretValueCommand } = require("@aws-sdk/client-secrets-manager");

// Configuração do cliente.
const cliente = new SecretsManagerClient({
    region: "us-east-2",
    credentials: {
        accessKeyId: "YOUR_ACCESS_KEY_ID",
        secretAccessKey: "YOUR_SECRET_ACCESS_KEY",
        sessionToken: "YOUR_SESSION_TOEKN",
    }
});

// Função para obter o valor do segredo.
const getSecret = async (secretName) {
    const command = new GetSecretValueCommand({ SecretId: secretName });
    try {
        const data = await client.send(command);

        return data.SecretString;
    } catch (error) {
        console.error("Erro ao obter o segredo:", error);
    }
}/

// Uso da função para obter um segredo.
getSecret("server-2495")
    .then(secret => {
        console.log("Segredo:", secret);
    });
```

### Principais Mudanças na V3

- **Modularidade:** cada serviço é importado como um pacote separado, o que ajuda a reduzir o tamanho do pacote na sua aplicação
- **Middleware:** a V3 utiliza uma camada de middleware que permite adicionar funcionalidade personalizada durante a solicitação e a resposta
- **Promises:** a V3 utiliza Promises e `async`/`await`, facilitando a escrita de código assíncrono
- **Tree Shaking:** a modularidade da V3 permite melhores otimizações de tree shaking com bundlers como Webpack e Rollup

### Benefícios

- **Redução de tamanho de bundle:** ao importar apenas os pacotes necessários, você reduz o tamanho do bundle da sua aplicação
- **Performance:** a modularidade e a capacidade de adicionar middlewares podem levar a melhorias de performance
- **Modernização:** usa nativo de Promises e `async`/`await` torna o código mais moderno e fácil de manter

### Resumo

O V3 é uma atualização significativa que melhora a modularidade, a performance e a usabilidade, facilitando a integração com os serviços da AWS de uma maneira mais eficiente e moderna.

### Sumário

- [new SecretsManagerClient()](#new-secretsmanagerclient)
- [new GetSecretValueCommand()](#new-getsecretvaluecommand)
- [`.send()`](#send)

# <a id="new-secretsmanagerclient">`new SecretsManagerClient()`</a>

É uma função construtora que cria **uma nova instância do cliente AWS Secrets Manager**. Este cliente é utilizado para interagir com o serviço do Secrets Manager e realizar operações como obter, criar, atualizar e excluir segredos.

```JavaScript
const { SecretsManagerClient } = require("@aws-sdk/client-secrets-manager");

const cliente = new SecretsManagerClient([options]);
```

- `options`**:** um objeto de configuração
    - `region`**:** específica a região AWS, é altamente recomendável fornecê-la, pois sem essa configuração, você pode enfrentar problemas de conexão com o serviço
    - `credentials`**:** um objeto que contêm os campos abaixo, caso você não os forneça, o SDK tentará usar as credenciais padrão configuradas no ambiente, através de variáveis de ambiente, perfil de credenciais AWS configurado localmente, etc. (**podem ser omitidas se estiverem configuradas de outra forma, é necessário se autenticar**)
        + `accessKeyId`**:** ID da chave de acesso
        + `secretAccessKey`**:** chave de acesso secreta
        + `sessionToken`**:** token de sessão
    - `endpoint`**:** personaliza o endpoint do serviço
    - `retryStrategy`**:** específica a estratégia de repetição para solicitações falhadas
    - `logger`**:** adicionar um logger para depuração
    - `maxAttempts`**:** define o número máximo de tentativas para uma solicitação

# <a id="new-getsecretvaluecommand">`new GetSecretValueCommand()`</a>

É uma **classe que cria um comando para obter o valor de um segredo armazenado no AWS Secrets Manager**. Quando você cria uma instância de `GetSecretValueCommand()`, você está configurando os parâmetros necessários para a solicitação de obtenção do segredo. Esse comando é então enviado ao Secrets Manager através do cliente para recuperar o valor do segredo.

```JavaScript
const { GetSecretValueCommand } = require("@aws-sdk/client-secrets-manager");

const command = new GetSecretValueCommand({ SecretId });
```

- `SecretId`**:** o ID do segredo que você deseja obter. Pode ser o nome amigável ou o ARN completo do segredo

# <a id="send">`.send()`</a>

É utilizado para **enviar um comando ao serviço AWS correspondente**. Este método é assíncrono e retorna uma promise que resolve com a resposta do serviço.

Quando você cria um comando usando uma classe de comando (como `GetSecretValueCommand` para o Secrets Manager) e o envia usando `client.send()`, o SDK gerencia a comunicação com o serviço AWS. Isso inclui autenticação, serialização da solicitação, envio da solicitação HTTP e desserialização da resposta.

### Sintaxe Básica

```JavaScript
const data = await client.send(command);
```

- `command`**:** um comando criado através de uma classe de comando

### Observações Importantes

Tenha em mente que você utiliza o cliente criado e configurado para o serviço AWS correspondente, ou seja, se você vai enviar um comando para o serviço Secrets Manager, por exemplo, você cria e configura um cliente especificamente para este serviço, o comando é criado através de uma classe de comando deste serviço e então, enviado através do `.send()`.