# README

### Sumário

- [./JavaScript/](#javascript)
- [./Diretorio-heterogeneo/](#diretorio-heterogeneo)
- [Template (template.md)](#template)
- [TODO](#todo)

# <a id="javascript">[./JavaScript/](./JavaScript/)</a>

Este diretório trata do ecossistema JavaScript. Abaixo segue um sumário de cada arquivo e uma descrição sobre o que ele discursa, também há outros diretórios, para separar melhor cada conteúdo, gerando assim uma divisão mais específica de temas.

### Sumário

- [Objetos](./JavaScript/objetos.md)
- [Node.js](./JavaScript/Nodejs.md)

# <a id="diretorio-heterogeneo">[./Diretorio-heterogeneo/](./Diretorio-heterogeneo/)</a>

Este diretório contém vários arquivos que tratam de vários temas relacionados a área de TI. Esta pontuado na seção do arquivo sobre o que ele discursa.

### Sumário

- [Markdown (Markdown.md)](#diretorio-heterogeneo-markdown)
- [Termos Utilizados na Área de TI (termos-TI.md)](#diretorio-heterogeneo-termos-area-ti)

## <a id="diretorio-heterogeneo-markdown">[Markdown (Markdown.md)](./Diretorio-heterogeneo/Markdown.md)</a>

Este arquivo trata da linguagem de marcação Markdown, conceitos e pontos importantes.

### Sumário

- [Links de Referência](./Diretorio-heterogeneo/Markdown.md#links-referencia)

## <a id="diretorio-heterogeneo-termos-area-ti">[Termos Utilizados na Área de TI (termos-TI.md)](./Diretorio-heterogeneo/termos-TI.md)</a>

Este arquivo pontua o significado de termos e abreviações usados com frequência na área.

### Sumário

- [Abreviações (Siglas e Acrônimos)](./Diretorio-heterogeneo/termos-TI.md#abreviacoes)

# <a id="template">[Template (template.md)](template.md)</a>

Este arquivo trata de como foi formulada a estrutura deste projeto, então é útil entendê-lo para navegar no mesmo. Além de ser um template a se seguir ao adicionar conteúdo.

### Sumário

- [Estrutura dos Arquivos (Formatação do Documento)](template.md#estrutura-arquivos)

# <a id="todo">TODO</a>

A publicação dos pacotes foi realizada na segunda (17/06/2024), mas já havia servidores em RC com eles em execução, então iremos basear a nossa busca na coluna `is_forced`.

- Caso `is_forced` seja `NULL`, o servidor não estava com a nova feat em execução, então iremos desconsiderar estes registros
- A data mais antiga que obedece essa condição é do dia 05/06/2024, de um servidor RC que nós já estavamos monitorando
- Não estamos considerando o servidor de ID 2276, pois ele é o meu servidor pessoal
- Caso a coluna `prize_name` seja `NULL`, isso significa que não é um dos grandes prêmios que possuem nome (`ACCUMULATED` e `JACKPOT`)
- Agora iremos desconsiderar os prêmios que não são forçados e iremos agrupar cada prêmio por servidor

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
            + Pontuar que ele não é obrigatório, pois possue um default
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
- Utilizar o `npm outdated` e `npm audit` para verificar como eles funcionam
- Utilizar o GitHub Actions para criar um pipeline de CI
- `npm fund`
- Desinstalar uma versão do Node.js instalada pelo NVM