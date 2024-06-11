# `aws-sdk` (Ok)

É a SDK oficial fornecida pela AWS para facilitar a interação com diversos serviços da AWS a partir de aplicações Node.js. Esta biblioteca permite que os desenvolvedores acessem e gerenciem serviços como Amazon S3, DynamoDB, Lambda, EC2, SQS, entre muitos outros, diretamente do seu código Node.js.

### Principais Funcionalidades e Características

1. **Interação com serviços AWS:** a biblioteca `aws-sdk` fornece uma API unificada para acessar todos os serviços da AWS, incluindo armazenamento, computação, banco de dados, rede, segurança e muitos mais
2. **Autenticação e configuração:** a SDK facilita a autenticação com a AWS através de credenciais de acesso. Ela suporta diferentes formas de configuração e autenticação, incluindo perfis de configuração, variáveis de ambiente, e papéis do IAM
3. **Gerenciamento de recursos:** com a `aws-sdk`, é possível criar, ler, atualizar e excluir recursos nos serviços da AWS. Por exemplo, você pode gerenciar objetos no S3, lançar instâncias no EC2, e interagir com tabelas no DynamoDB
4. **Assincronismo:** a biblioteca faz uso intensivo de promessas e callbacks, tornando-a adequada para operações assíncronas comuns em aplicações Node.js
5. **Facilidade de uso:** a biblioteca é projetada para ser intuitiva e fácil de usar, com documentação abrangente e exemplos de código para ajudar os desenvolvedores a começarem rapidamente

### Sumário

- [Autenticação](#autenticacao)
- [`AWS.config`](#aws-config)
- [`AWS.config.update()`](#aws-config-update)
- [chave `apiVersion`](#chave-apiversion)
- [`new AWS.IAM()`](#new-aws-iam)
- [Atributos das Declarações](#atributos-declaracoes)
- [`new AWS.S3()`](#new-aws-s3)
- [`new AWS.ENDPOINT()`](#new-aws-endpoint)

# <a id="autenticacao"></a>Autenticação

Você pode definir as suas credenciais de acesso e a região das seguintes maneiras:

- Configurando o objeto `AWS.config`
- Usando um arquivo de configuração
- Usando variáveis de ambiente
- Usando IAM Roles

### Usando Arquivo de Configuração

O AWS SDK também pode ler as credenciais e a configuração da região a partir de um arquivo de configuração, geralmente localizado em **~/.aws/config** e **~/.aws/credentials**.

**~/.aws/config**

```bash
[default]
region = us-west-2
output= json
```

**~/.aws/credentials**

```bash
[default]
aws_access_key_id = your-access-key-id
aws_secret_access_key = your-secret-access-key
```

Com esses arquivos em lugar, você não precisa definir as credenciais e a regição diretamente no código, o SDK irá automaticamente ler esses valores.

### Usando Variáveis de ambiente

Você também pode configurar o SDK usando variáveis de ambiente.

```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
export AWS_REGION=us-west-2
```

### Usando o IAM Roles

Se você está executando o seu código em uma instância EC2 ou em um contêiner ECS que tenha um IAM Role associado, o SDK pode usar automaticamente as credenciais do role.

# <a id="aws-config"></a>`AWS.config`

É um objeto que permite configurar globalmente os parâmetros de autenticação, região e outros ajustes necessários para interagir com os serviços da AWS. Esta configuração é aplicada a todas as instâncias dos serviços AWS que você criar depois de configurá-la.

# <a id="aws-config-update"></a>`AWS.config.update()`

É utilizado para **atualizar a configuração global do AWS SDK com novas credenciais, região ou outros parâmetros**. Isso permite definir ou alterar as configurações de autenticação e região que o SDK usará para fazer chamadas aos serviços da AWS.

**Sintaxe Básica**

```JavaScript
AWS.config.update(configObject);
```

- `configObject`**:** objeto de configuração  
    Chaves comuns:
    + `accessKeyId`**:** a chave de acesso da AWS
    + `secretAccessKey`**:** a chave secreta da AWS
    + `region`**:** a região onde os serviços da AWS serão utilizados
    + `sessionToken` **(opcional):** token de sessão para credenciais temporárias
    + `maxRetries` **(opcional):** número máximo de tentativas em caso de falhas
    + `httpOptions` **(opcional):** opções HTTP, como `timeout`

### Exemplos

```JavaScript
const AWS = require("aws-sdk");

// Atualizando a configuração global.
AWS.config.update({
    accessKeyId: "your-access-key-id",
    secretAccessKey: "your-secret-access-key",
    region: "us-west-2",
});
```

# <a id="chave-apiversion"></a>chave `apiVersion`

É utilizada para **especificar a versão da API do serviço AWS que você deseja usar**. Isso é útil porque as APIs da AWS podem ter várias versões, e você pode querer garantir que seu código use uma versão específica da API para garantir compatibilidade e estabilidade.

**Sintaxe Básica**

```JavaScript
const service = new AWS.ServiceName({
    apiVersion: "version-string",
});
```

- `apiVersion`**:** o valor default é a versão mais recente disponível da API do serviço

Usar a chave `apiVersion` é uma prática recomendada para garantir que seu código esteja usando uma versão específica da API, evitando assim mudanças inesperadas quando a AWS lança novas versões de suas APIs. Isso é especialmente importante em ambientes de produção onde a estabilidade e a compatibilidade são críticas.

# <a id="new-aws-iam"></a>`new AWS.IAM()`

É utilizado para **criar uma nova instância do serviço AWS IAM**. Com o SDK você pode programaticamente criar, ler, atualizar e excluir recursos IAM, como usários, grupos, políticas e funções.

**Sintaxe Básica**

```JavaScript
const iam = new AWS.IAM();
```

# <a id="atributos-declaracoes"></a>Atributos das Declarações

No AWS IAM, as **políticas são usadas para definir permissões**. Elas podem incluir várias declarações (statements), e cada declaração pode ter os seguintes atributos:

**Sid (Statement ID)**  
    - **Significado:** é um identificador opcional exclusivo para a declaração. Ele facilita a identificação de declarações específicas em uma política, especialmente em políticas complexas com muitas declarações
    - **Exemplo:** `"Sid": "Stmt1"`
**Action**  
    - **Significado:** especifica
    - **Exemplo:**
**Effect**  
    - **Significado:**
    - **Exemplo:**
**Resource**  
    - **Significado:**
    - **Exemplo:**

# <a id="new-aws-s3"></a>`new AWS.S3()`

É utilizado para **criar uma nova instância do serviço AWS S3**. Com o SDK você pode manipular buckets e objetos no S3, como criar, listar, deletar ou fazer upload de arquivos.

**Sintaxe Básica**

```JavaScript
const s3 = new AWS.S3();
```

# <a id="new-aws-endpoint"></a>`new AWS.ENDPOINT()`

É utilizado para **criar um objeto que representa um endpoint de serviço AWS**. Um endpoint é uma URL que é o ponto de entrada para um serviço AWS, permitindo que o cliente faça chamadas para esse serviço.

Geralmente, você não precisa criar explicitamente um endpoint a menos que esteja usando um endpoint personalizado, ou um endpoint de um serviço específico não padrão. Normalmente, os endpoints são configurados automaticamente com base na região e no serviço que você está usando.

**Sintaxe Básica**

```JavaScript
const endpoint = new AWS.ENDPOINT("https://my-custom-endpoint.com");
```

**Quando Usar**

- **Serviços AWS locais:** quando estiver usando serviços locais da AWS, como o LocalStack, que simula serviços da AWS para desenvolvimento e teste
- **Serviços AWS em zonas privadas:** quando estiver acessando endpoints específicos em uma zona privada, que não estão disponíveis publicamente
- **Serviços de terceiros:** quando um serviço de terceiros que implementa uma API compatível (com S3, por exemplo) precisa ser usado

### Exemplos

```JavaScript
const AWS = require("aws-sdk");

const endpoint = new AWS.ENDPOINT("https://my-custom-endpoint.com");

const s3 = new AWS.S3({
    accessKeyId: "your-access-key-id",
    secretAccessKey: "your-secret-access-key",
    endpoint: enpoint,
    s3ForcePathStyle: true, // Necessário para alguns endpoints personalizados.
});
```