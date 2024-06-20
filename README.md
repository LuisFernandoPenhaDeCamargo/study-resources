# README

### Sumário

- [./JavaScript/](#javascript)
- [./Diretorio-heterogeneo/](#diretorio-heterogeneo)
- [Template (template.md)](#template)
- [TODO](#todo)

# <a id="javascript">[./JavaScript/](./JavaScript/)</a>

Este diretório trata do ecossistema JavaScript. Abaixo segue um sumário de cada arquivo e uma descrição sobre o que ele discursa, também há outros diretórios, para separar melhor cada conteúdo, gerando assim uma divisão mais específica de temas.

# <a id="diretorio-heterogeneo">[./Diretorio-heterogeneo/](./Diretorio-heterogeneo/)</a>

Este diretório contém vários arquivos que tratam de vários temas relacionados a área de TI. Esta pontuado na seção do arquivo sobre o que ele discursa.

## [Markdown (Markdown.md)](./Diretorio-heterogeneo/Markdown.md)

<!-- Breve descrição do arquivo, além de pontuar de forma resumida o que é Markdown. -->

### Sumário

- [Links de Referência](./Diretorio-heterogeneo/Markdown.md#links-referencia)

# <a id="template">[Template (template.md)](template.md)</a>

Este arquivo trata de como foi formulada a estrutura deste projeto, então é útil entendê-lo para navegar no mesmo. Além de ser um template a se seguir ao adicionar conteúdo.

### Sumário

- [Estrutura dos Arquivos (Formatação do Documento)](template.md#estrutura-arquivos)

# <a id="todo">TODO</a>

- Objeto `proccess`
    + `.env`
    + Estas variáveis são visíveis a nível de SO?
- `require(aws-sdk)`
- `AWS.config`
- `AWS.config.update()`
    + `accessKeyId` (propriedade do objeto passado como parâmetro)
    + `SecretAccessKey` (propriedade do objeto passado como parâmetro)
    + `region` (propriedade do objeto passado como parâmetro)
- AWS STS (Security Token Service)
    + O que é?
    + `new AWS.STS()`
    + `sts.assumeRole()`
        - `RoleArn` (propriedade do objeto passado como parâmetro)
        - `RoleSessionName` (propriedade do objeto passado como parâmetro)
        - `DurationSeconds` (propriedade do objeto passado como parâmetro)
        - `.Credentials` é a `response` (propriedade do objeto retornado)
- AWS IAM
    + O que é?
    + `new AWS.IAM()`
    + `iam.getUser()`
    + `iam.getRole()`
- `request.query` (Express)
    + Como enviar para este servidor uma requisição que possua a query com o Axios?
        - `specificDuration` faz parte da query de requisição
            + Como eu documento isso?
    + Qual é o código de status padrão retornado por um servidor Express?
- orion-data-server -> **server.js** -> **./routes/index.js** -> **./middlewares/token_auth_server.js** -> **./routes/arn.js**
    + `/arn/getTempKey/:server_id GET`
        - `request`/`response`
            + `´Failed to get temporary security credentials: ${error}´` também é a `response`
    + Verificar como cou armazenar as credenciais, em `procces.env` (acho que é visível em nível de SO, devo testar isto) ou não
    + Verificar como eu vou estabelecer o novo fluxo de execução
        - Obtenho as credenciais -> Logo no Banco de Dados Local
    + Migrar para o `aws-sdk` V3
- Leia https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/migrating.html
- Leia https://github.com/aws/aws-sdk-js-v3/blob/main/UPGRADING.md
- Pontuar sobre o **/etc/server-id**
- Pontuar que os servidores "v2" não terão mais conexão via ssh
- Pontuar que o formato do ID do segredo vai ser `server-$< ID do servidor >`
- `git fetch`
- Atualizando as branchs do meu repositório local