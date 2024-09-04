# README

### Sumário

- [./JavaScript/](#javascript)
- [./Diretorio-heterogeneo/](#diretorio-heterogeneo)
- [TODO](#todo)

# <a id="javascript">[./JavaScript/](./JavaScript/)</a>

Este diretório trata do ecossistema JavaScript. Abaixo segue um sumário com cada arquivo e no arquivo há uma descrição sobre o que ele discursa, também há outros diretórios dentro deste, para separar melhor cada conteúdo, gerando assim uma divisão mais específica de temas.

### Sumário

- [JavaScript](./JavaScript/JavaScript.md)
- [Objetos](./JavaScript/objetos.md)
- [Node.js](./JavaScript/Nodejs.md)
- [Segurança](./JavaScript/seguranca.md)
- [Bibliotecas](./JavaScript/Bibliotecas/)
    + [`fs`](./JavaScript/Bibliotecas/fs.md)
    + [`@aws-sdk`](./JavaScript/Bibliotecas/arrobaAws-sdk.md)
- [CI-CD](./JavaScript/CI-CD/)
    + [Testes Unitários](./JavaScript/CI-CD/testes-unitarios.md)

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

# <a id="todo">TODO</a>

Estudar sobre:

### JavaScript

- `request.query` (Express)
    + Como enviar para este servidor uma requisição que possua a query com o Axios?
    + Qual é o código de status padrão retornado por um servidor Express?

### NPM

- `npm outdated`
- `npm audit`
- `npm fund`

### NVM

- Desinstalar uma versão do Node.js instalada pelo NVM

### Bash

- Listando as variáveis de ambiente pelo terminal

### Git

- `git fetch`
- Atualizar as branchs do meu repositório local

### CI/CD

- Utilizar o GitHub Actions para criar um pipeline de CI

### MariaDB

- É possível gerar o dump de um banco dando "skip" nas permissões de autenticação?
    + Conversei isso com o Fernando
    + O ponto é conseguir obter dados do banco desta forma
    + Verificar se existe essa falha de segurança

### Orion

- **orion-data-server:**
    + `/arn/getTempKey/:server_id GET`
        - Documentar esta rota
            + `request`**:**
                - Pontuar que `specificDuration` faz parte da query de requisição, mas não é obrigatório, pois possue um valor default (como eu documento isso?)
        - `response`**:**
            + Retorno do `sts.assumeRole()`
            + `´Failed to get temporary security credentials: ${error}´`
            + O status é o default para ambos os casos acima   
    + Migrar para o V3 do AWS SDK
        - Leia https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/migrating.html
        - Leia https://github.com/aws/aws-sdk-js-v3/blob/main/UPGRADING.md
- **zoe-game-api:**
    + Talvez eu torne as URLs dinâmicas, considerando o valor que se encontra no banco de dados
    + **V3:**
        - Testar o retorno do **./helpers/get_server_id.js** `function()`
        - Testar o retorno do **./services/get_access_token.js** `function()`
        - Testar o retorno do **./services/get_temporary_key.js** `function()`

# <a id="pessoal">Pessoal</a>

- **AWS STS:**
    + O formato do ID do segredo é `server-$< ID do servidor >`
- **orion-data-server:**
    + **Fluxo de execução para a rota que retorna a senha do Banco Local:server.js** -> **./routes/index.js** -> **./middlewares/token_auth_server.js** -> **./routes/arn.js**
- **zoe-game-api:**
    + Para conseguir possuir compatibilidade com o V3 da AWS-SDK e com o pkg, iremos dar upgrade na versão do Node.js para a 18.20.3
    + **Bibliotecas:**
        - mocha@10.2.0: utilizada em testes unitários
            + `npm warn deprecated glob@7.2.0`
            + mocha@10.4.0: utiliza o inflight@1.0.6 e é altamente recomendável não utilizá-lo
        - chai@5.1.1: utilizada em testes unitários
    + **Fluxo de execução para se conectar ao banco: server.js** -> **./helpers/get_server_id.js** -> **./services/access_token_service.js** -> **./services/get_temporary_key.js** -> **./models/index.js**
    + Os dados sensíveis serão armazenados em `process.env`
- **Servidores:**
    + V2 é a nova versão dos servidores
    + **V2:** não possuíram conexão via ssh, a única forma de acessá-los será através do orion-terminal
    + **V2: /etc/server-id**, possui como conteúdo o ID do servidor, por exemplo, "2278"
    + **V2:** não iremos mais possuir, inicialmente, conectividade com o Banco de Dados Local, então teremos que obter o ID do servidor do arquivo **/etc/server-id**
- **Minha máquina:**
    + Criei o arquivo **/etc/server-id**