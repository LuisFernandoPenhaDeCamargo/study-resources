# Bibliotecas

### Sumário

- [`util`](#util);
- [`crypto`](#crypto);
- [`http`](#http)
- [`tls`](#tls);
- [`querystring`](#querystring);
- [`child_process`](#child_process);
- [`fs`](#fs);
- [`aws-sdk`](#aws-sdk);
- [`axios`](#axios);
- [`request`](#request)
- [`body-parser`](#body-parser);
- [`mariadb`](#mariadb);
- [`joi`](#joi);
- [`dotenv`](#dotenv);
- [`uuid/v4`](#uuidv4);
- [`log-timestamp`](#log-timestamp).
- [`express-graceful-shutdown`](#express-graceful-shutdown).

# <a id = "util"></a>`util`

A bilbioteca `util` é uma parte do conjunto de módulos padrão do Node.js e não precisa ser instalada separadamente. Portanto, não é uma biblioteca ou framework independente.\
O módulo `util` fornece várias utilidades e funções auxiliares que são úteis em várias situações ao trabalhar com Node.js. Como funções utilitárias para ajudar na programação assíncrona e em outros aspectos de desenvolvimento.
Para utilizar a biblioteca `aws-sdk`, você geralmente precisa configurar as credenciais de acesso à AWS, como a chave de acesso e a chave secreta. Isso é necessário para que o SDK possa autenticar as solicitações à AWS em seu nome.\
Após configurar as credenciais, você pode começar a utilizar os serviços da AWS, como o Amazon S3 para armazenamento de objetos, o Amazon DynamoDB para banco de dados NoSQL, entre outros. O `aws-sdk` fornece uma API rica para interagir com esses serviços, permitindo que você crie, leia, atualize e exclua recursos da AWS.

# <a id = "crypto"></a>`crypto`

`crypto` é um módulo embutido (não precisa ser instalado separadamente) no Node.js. Não é uma biblioteca ou framework, mas sim um conjunto de funcionalidades relacionadas à criptografia disponíveis no ambiente Node.js. Ele faz parte do conjunto de módulos principais do Node.js e está disponível por padrão.\
O módulo `crypto` fornece funcionalidades criptográficas, como hash, cifra, e geração de números aleatórios. Ele é frequentemente usado para implementar segurança em aplicações, como a geração de hashes para senhas, assinaturas digitais, criptografia, etc. Além disso, é uma parte essencial para lidar com conceitos de segurança em ambientes Node.js.

# <a id = "http"></a>`http`

`http` é um módulo HTTP integrado no core do Node.js, ele permite criar servidores HTTP. Ele fornece funcionalidades para manipular solicitações e respostas HTTP.

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

# <a id = "tls"></a>`tls`

`tls` é um módulo integrado no Node.js core, ele faz parte dos módulos principais fornecidos com Node.js.\
Este é o módulo que fornece suporte para o protocolo TLS (Transport Layer Security), que é uma versão mais recente e segura do SSL (Secure Sockets Layer). O módulo `tls` no Node.js permite criar servidores e clientes seguros usando criptografia para proteger a comunicação.\
Ele é usado para criar conexões seguras entre clientes e servidores, geralmente em aplicações que necessitam de segurança na comunicação, como em servidores HTTPS.

```JavaScript
const tls = require("tls");
const fs = require("fs");

const options = {
    key: fs.readFileSync("caminho/para/sua/chave-privada.pem"),
    cert: fs.readFileSync("caminho/para/seu/certificado.oem")
};
const server = tls.createServer(options, (cleartextStream) => {
    console.log("Cliente conectado!");
    cleartextStream.write("Bem-vindo à conexão segura!\n");
    cleartextStream.pipe(cleartextStream);
});

server.listen(8000, () => {
    console.log("Servidor TLS está escutando na porta 8000");
});
```

Neste exemplo, o módulo `tls` é usado para criar um servidor TLS (HTTPS) que escuta na porta 8000. É importante fornecer certificados e chaves privadas válidos para tornar a comunicação segura. Este é apenas um exemplo básico; em uma aplicação real, você pode precisar configurar opções adicionais, como verificação de certificado.

`require('tls').DEFAULT_ECDH_CURVE = 'auto'`

O código acima altera a curva de ECDH padrão (Elliptic Curve Diffie-Hellman) usada pelo módulo `tls` (**Transport Layer Security**) em Node.js. ECDH é um protocolo de troca de chaves usado para estabelecer uma chave de criptografia compartilhada em uma conexão segura.\
`.DEFAULT_ECDH_CURVE` se refere à curva de ECDH padrão usada nas negociações de chaves ECDH, que recebe, neste caso, o valor `'auto'`.\
Ao definir a curva ECDH como `'auto'`, você está configurando o Node.js para escolher automaticamente a curva ECDH mais adequada com base nas capacidades do sistema. Isso é útil quando você deseja que o Node.js selecione a melhor curva ECDH disponível em vez de especificar uma curva específica.\
Em muitos casos, definir a curva ECDH como `'auto'` é uma boa prática, pois permite que o Node.js escolha a melhor opção de acordo com o ambiente de execução. No entanto, em cenários específicos de segurança ou conformidade, você pode optar por definir uma curva ECDH específica em vez de usar `'auto'`.

# <a id = "querystring">`querystring`

`querystring` é um módulo nativo do Node.js, não é uma biblioteca ou framework separado. Isso significa que você não precisa instalá-lo separadamente, pois faz parte da biblioteca padrão do Node.js.z
O módulo `querystring` é usado para manipular e analisar cadeias de consulta (query strings) em URLs. Ele fornece métodos para converter objetos JavaScript em strings de consulta e vice-versa, facilitando o trabalho com parâmetros de consulta em URLs. Query strings são frequentemente usadas em URLs para transmitir parâmetros ou dados em formato de chave-valor.

```JavaScript
const querystring = require("querystring");

// Convertendo um objeto em uma string de consulta.
const params = {
    name: "John",
    age: 30,
    city: "New York"
};
const queryString = querystring.stringify(params);

console.log(querystring);  // Saída: name=John&age=30&city=New%20York

// Convertendo uma string de consulta em um objeto.
const parsedParams = querystring.parse(queryString);

console.log(parsedParams); // Saída: [Object: null prototype] { name: 'John', age: '30', city: 'New York' }
```

O módulo `querystring` é útil ao lidar com URLs em aplicativos Node.js, especialmente ao analisar ou construir URLs que contêm parâmetros de consulta.

# <a id = "child_process"></a>`child_process`

`child_process` é um módulo integrado no core do Node.js, ele fornece funcionalidades para execução de processos secundários (filhos) a partir do seu aplicativo Node.js. Ele permite que você inicie comandos do sistema operacional, interaja com eles e manipule a entrada e saída.\
O módulo `child_process` é usado quando você precisa executar comandos do sistema operacional a partir do seu aplicativo Node.js. Isso pode incluir executar programas externos, scripts ou qualquer outra coisa que possa ser invocada a partir da linha de comando.\
Existem várias funções disponíveis no `child_process`, incluindo `spawn()`, `exec`, `execFile` e `fork`, cada uma com seu propósito específico.

```JavaScript
const { spawn } = require("child_process");

// Executa o comando "ls" para listar os arquivos no diretório atual.
const ls = spawn("ls", ["-l", "-a"]);

// Manipula a saída do comando.
ls.stdout.on("data", (data) => {
    console.log(`Saída do comando: ${data}`);
});

// Manipula eventos de erro e término.
ls.on("error", (error) => {
    console.error("Erro ao executar o comando:: ${error.message}");
});

ls.on("close", (code) => {
    console.log(`O comando foi encerrado com código de saída ${code}`);
});
```

Neste exemplo, o `spawn()` é utilizado para executar o comando "`ls`" com as opções `-l` e `-a`, e os eventos são usados para lidar com a saída, erros e o término do processo filho.

# <a id = "fs"></a>`fs`

`fs` é um módulo da biblioteca padrão do Node.js chamado "File System"  (Sistema de Arquivos). Ele fornece uma API para interagir com o sistema de arquivos no ambiente do Node.js, ele oferece métodos para ler, gravar, atualizar, excluir e manipular arquivos e diretórios.\
O módulo `fs` é utilizado para realizar operações relacionadas a arquivos e diretórios, como leitura e gravação de arquivos, criação e remoção de diretórios, entre outras tarefas de manipulação de arquivos. Aqui estão alguns exemplos de operações comuns que podem ser realizadas com o `fs`:

- Leitura e gravação de arquivos;
- Manipulação de diretórios (criação, exclusão, listagem);
- Verificação da existência de um arquivo ou diretório;
- Obtendo informações sobre um arquivo (tamanho, data de modificação, etc.).

```JavaScript
const fs = require("fs");

fs.readFile("arquivo.txt", "utf8", () => {
    if (err) {
        console.error("Erro ao ler o arquivo:", err);
        return;
    }
    console.log("Conteudo do arquivo:", data);
});
```

Neste exemplo, o `fs` é utilizado para ler o conteúdo de um arquivo chamado "arquivo.txt".

# <a id = "aws-sdk"></a>`aws-sdk`

A biblioteca `aws-sdk` precisa ser instalada, é uma biblioteca para interação com os serviços da AWS na linguagem JavaScript (Node.js), ela facilita a interação programática com os serviços da AWS usando JavaScript/Node.js.\
A biblioteca `aws-sdk` é a biblioteca oficial da Amazon Web Services (AWS) que permite interagir com diversos serviços da ASW, como Amazon S3, Amazon DynamoDB, AWS Lambda e outros.

# <a id = "axios"></a>`axios`

A biblioteca `axios` precisa ser instalada, é uma biblioteca para fazer requisições HTTP no navegador e no Node.js. Não é um framwork independente, mas sim uma biblioteca especializada em facilitar a comunicação via HTTP.\
`axios` é amplamente utilizada para fazer solicitações HTTP, como requisições GET, POST, PUT, DELETE, etc. Ele fornece uma API simples e baseada em Promises para trabalhar com solicitações e respostas HTTP de forma assíncrona. Além disso, ele suporta funcionalidades como interceptadores de requisições, transformadores de dados e muito mais.

```JavaScript
// Importar o axios no ambiente de desenvolvimento no navegador.
// (não é necessário instalar o axios no navegador, pois pode ser carregado de uma CDN).

const axios = require("axios");

// Fazer uma requisição GET.
axios.get("https://api.example.com/data")
    .then(response => {
        console.log(response.data); // Dados da resposta.
    }).catch(error => {
        console.error(error); // Lidar com erros.
    });
```

o exemplo acima é uma versão simplificada. No ambiente do navegador, você pode carregar o `axios` diretamente de uma CDN sem a necessidade de instalação via npm. No ambiente Node.js, você precisa instalá-la usando  npm ou yarn.

### Headers (Cabeçalhos)

Na propriedade `content-type`, que pode ser acessada ao se utilizar `response.headers['content-type']`, se encontra o valor do formato da resposta. Se o valor da chave `content-type` for `application/json`, isso quer dizer que o conteúdo da resposta está no formato JSON.

As chaves `x-real-ip`, `x-fowarded-for` e `remoteAddress` em uma requisição HTTP geralmente se relacionam com informações sobre o endereço IP do cliente que fez a requisição. Elas podem ser usadas para rastrear a origem da requisição, especialmente quando um servidor proxy ou balanceador de carga está envolvido.

- `x-real-ip`**:** esta chave geralmente contém o endereço IP real do cliente que fez a requisição. Em muitos casos, quando um servidor proxy está na frente de um servidor web, o endereço IP do cliente é mascarado e substituído pelo endereço IP do proxy. O cabeçalho `x-real-ip` é usado para recuperar o endereço IP real do cliente, especialmente quando é confiável;
- `x-forwarded-for`**:** este é outro cabeçalho frequentemente usado para obter o endereço IP do cliente quando um servidor proxy está envolvido. O cabeçalho `x-forwarded-for` contém uma lista de endereços IP, onde o primeiro endereço da lista é geralmente o endereço IP real do cliente e os endereços subsequentes são os IPs dos proxies pelos quais a requisição passou. É importante lembrar que esse cabeçalho pode ser falsificado, portanto, deve ser usado com cuidado em ambientes confiáveis;
- `remoteAddress`**:** é baseado no endereço IP do cliente conforme detectado pelo servidor, e isso pode ser afetado pela configuração do servidor e pela presença de proxies.
Em resumo, essas chaves e propriedades são usadas para obter informações sobre o endereço IP do cliente que fez a requisição HTTP. No entanto, é importante ter em mente que, em ambientes com proxies, os endereços IP podem ser mascarados ou falsificados, portanto, é crucial usá-los com cuidado e considerar a confiabilidade das fontes de dados.

### `.interceptors` 

No `axios`, ao configurar um interceptador global (`.interceptors`), este será aplicado a **todas as solicitações feitas por todas as partes do código que utilizam a mesma instância global do axios**  (no caso de um interceptador de requisição) ou será aplicado antes de retornar cada resposta ao código (no caso de um interceptador de resposta).\
Lembrando que ele é **aplicado**, ou seja, ele é **executado** antes de cada requisição ou antes de entregar cada resposta.

- `.request`**:** interceptador de solicitação (requisição). Isto permite que o código seja executado antes que cada solicitação seja enviada. Após realizarmos esta "configuração", todas as solicitações posteriores obedeceram esta configuração;
- `.response`**:** interceptador de resposta. Neste caso, antes de repassarmos a resposta para o código, o código de "configuração" será aplicado;
- `.use()`**:** registra o interceptador.

```JavaScript
// Response.
axios.interceptors.response.use(response => response, error => {
    return Promise.reject(error);
});
```

- `(response) => { response; }`**:** o código foi colocado desta forma neste ponto para facilitar a sua compreensão, o interceptador de resposta simplesmente passará a resposta sem fazer alterações. Isto é comum quando você deseja apenas fazer algum trabalho adicional com a resposta, como registro, mas não deseja modificar a resposta em si;
- `(error) => { return Promise.reject(error); }`**:** o código foi colocado desta forma neste ponto para facilitar a sua compreensão, a promessa com erro é rejeitada. Isto significa que o erro será **propagado** para qualquer código que chamou a solicitação axios original e que lidará com o erro lá.

### Token de Cancelamento

Para que o axios saiba qual é o token de cancelamento que está associado com uma requisição específica, você o passa na configuração da requisição usando a propriedade `cancelToken`. Portanto `cancelToken: objeto.token` informa ao axios que esta requisição está vinculada ao `objeto` que você criou.\
Então, quando você chama `objeto.cancel()`, o axios sabe que deve cancelar qualquer requisição que tenha o `objeto.token` associado a ela.

- `.CancelToken`**:** utilizado para criar um token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()`**:** criar o objeto `.CancelToken` e seu respectivo método `.cancel()`;
- `.cancel(message)`**:** o parâtro `message` que atribui o valor da chave  `reason.message`. É o **método utilizado para cancelar a requisição.**

- Um objeto `.CancelToken` possui uma propriedade `.token`;
- A propriedade `.token` é composta por uma `.promise` e uma `.reason`;
- A chave `.reason` possui um atributo `.message`.

```JavaScript
const axios = require("axios");

const source = axios.CancelToken.source();

source.cancel("Motivo do cancelamento."); // Cancela a requisição. Você pode passar uma mensagem como argumento que explique o motivo do cancelamento.

console.log(source);
/* Saída:
{
    token: CancelToken {
        promise: Promise { [Object] },
        reason: Cancel { message: 'Motivo do cancelamento.' }
    },
    cancel: [Function: cancel]
}*/

console.log(source.token);
/* Saída:
CancelToken {
    promise: Promise { Cancel { message: 'Motivo do cancelamento.' } },
    reason: Cancel { message: 'Motivo do cancelamento.' }
}*/


console.log(source.token.promise);
/* Saída: Promise { Cancel { message: 'Motivo do cancelamento.' } }*/

console.log(source.token.reason);
/* Saída: Cancel { message: 'Motivo do cancelamento.' }*/

console.log(source.token.reason.message);
// Saída: Motivo do cancelamento.
```

```JavaScript
// Criando um token de cancelamento.
const source = axios.CancelToken.source();

// Fazendo uma requisição com o token de cancelamento associado.
axios.get("sua_url", { cancelToken: source.token })
    .then(response => {
        // Manipular a resposta se a requisição for bem-sucedida.
    })
    .catch(error => {
        if (axios.isCancel(error)) {
            console.log("Rquisição cancelada:", error.message);
        } else {
            // Manipular outros erros.
        }
    });

// Cancelando a requisição antes que ela seja concluida.
souce.cancel("Requisição cancelada pelo usuário.");
```

Ao chamar `source.cancel("Requisição cancelada pelo usuário.")`, a requisição será interrompida, e a Promise resultante entrará no estado de rejeição com a mensagem fornecida ("Requisição cancelada pelo usuário." no exemplo).\
Esse recurso é útil em situações em que você precisa cancelar uma requisição, por exemplo, se o usuário navegar para fora de uma página ou executar alguma ação que torne a resposta da requisição desnecessária.

# <a id = "request"></a>`request` (OBSOLETA)

`request` é uma biblioteca simplificada pra fazer solicitações HTTP em Node.js, ela fornece uma interface fácil de usar para interagir com APIs web, fazer requisições a servidores HTTP e manipular dados de respostas.\
O principal propósito do `request` é simplificar a realização de solicitações HTTP em Node.js. Ele oferece uma abordagem fácil para enviar solicitações HTTP, gerenciar cookies, lidar com redirecionamentos e manipular respostas.

```JavaScript
const request = require("request");

const url = "https://api.example.com/data";

request(url, (error, response, body) => {
    if (error){
        console.error("Erro ao fazer a solicitação:", error);
    } else {
        console.log("Corpo da resposta:", body);
    }
});
```

Neste exemplo, `request` é usado para fazer uma solicitação GET para a URL fornecida. O callback é acionado quando a solicitação é concluída, permitindo que você manipule a resposta ou lide com erros.\
Vale observar que a biblioteca `request` está agora obsoleta, e os desenvolvedores são incetivados a considerar o uso de alternativas mais modernas, como `axios` ou o módulo `fetch` integrado no JavaScript. Estas alternativas oferecem funcionalidades similares e são mais amplamente adotadas na comunidade.

# <a id = "body-parser"></a>`body-parser`

`body-parser` é uma biblioteca para Node.js, ele é uma biblioteca que facilita a extração de dados do corpo de uma solicitação HTTP. Ele é frequentemente usado em conjunto com frameworks web, como o Express, para processar dados enviados por meio de solicitações POST e PUT.\
`body-parser` precisa ser instalado se a sua versão for antes da 4.16.0, pois era uma dependência separada, mas agora é parte integrante do próprio Express. Se você estiver usando uma versão mais recente do Express, não será necessário instalar o `body-parser` separadamente.\
O principal propósito do `body-parser` é facilitar o processamento do corpo das solicitações HTTP, especialmente solicitações POST e PUT, onde os dados do formulário ou o corpo JSON podem ser enviados. ele analisa o corpo da solicitação e faz o parsing dos dados, disponibilizando-os no objeto `req.body` para facilitar o acesso no código do seu servidor.
Ele também pode ser descrito como uma extensão de middleware para aplicativos Node.js, que executam servidores HTTP, como aqueles criados com o Express.js. Sua principal função é analisar o corpo das solicitações HTTP para extrair dados, como parâmetros de formulário ou cargas úteis JSON, tornando-os acessíveis aos controladores de rotas ou manipuladores de solicitações.\
O `body-parser` é especialmente útil quando você está construindo aplicativos web ou APIs que lidam com solicitações POST, PUT e DELETE, onde os dados são enviados no corpo da solicitação. Ele oferece suporte a diferentes tipos de dados, incluindo URL-encoded, JSON e dados multipart. Algumas das funcionalidades e características do módulo `body-parser`:

- **Análise de dados:** o `body-parser` permite analisar automaticamente os dados do corpo da solicitação e torná-los acessíveis nas rotas do seu aplicativo;
- **Tipos de dados suportados:** ele suporta diferentes tipos de dados, incluindo:
    - **URL-encoded:** dados de formulário enviados no corpo da solicitação no formato `application/x-www-form-urlencoded`;
    - **JSON:** dados no formato JSON;
    - **Dados multipart:** suporte a upload de arquivos.
- **Configuração flexível:** você pode configurar o `body-parser` para tratar diferentes tipos de solicitações com base no tipo de conteúdo (content-type) ou tamanho do corpo;
- **Integração com Express:** o `body-parser` é frequentemente usado em conjunto com o Express.js para simplificar o processamento de dados nas solicitações.

```JavaScript
const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

//Adiciona o middleware body-parser ao aplicativo.
app.use(bodyParser.json()); // Para parsing de dados JSON.
app.use(bodyParser.urlencoded({ extended: true })); // Para parsing de dados de formulário.

// Manipula uma solicitação POST
app.post("/exemplo", (req, res) => {
    const dados = req.body; // Dados do corpo da solicitação.
    res.json({ mensagem: "Dados recebidos com sucesso!", dados });
});

app.listen(port, () => {
    console.log("Servidor Express está escutando em http://localhost:${port}");
});
```

Neste exemplo, o `body-parser` é usado para analisar o corpo da solicitação e tornar os dados acessíveis através de `req.body`. Isso é útil ao lidar com formulários HTML ou solicitações que enviam dados no formato JSON.

# <a id = "mariadb"></a>`mariadb`

`mariadb` é uma biblioteca Node.js que fornece uma API para interagir com bancos de dados MariaDB a partir de aplicações Node.js. A biblioteca `mariadb` é utilizada para criar conexões com um servidor MariaDB, executar consultas SQL, gerenciar transações e interagir programaticamente com um banco de dados MariaDB em uma aplicação Node.js.

# <a id = "joi"></a>`joi`

`joi` é uma biblioteca que precisa ser instalada, ele é utilizada para validação de objetos em JavaScript e é especialmente útil para validar dados de entrada em aplicativos Node.js.\
`joi` é usada para definir esquemas (schemas) que descrevem a estrutura esperada de um objeto. Ela fornece métodos para validar se um objeto atende aos critérios definidos no esquema.\
Aqui está um exemplo simples de como você pode usar a `joi`:

```JavaScript
const Joi = require("joi");

// Definindo um esquema simples para validar um objeto.
const schema = Joi.object({
    username: Joi.string().alphanum().min(3).max(30).required(),
    email: Joi.string().email().required(),
    age: Joi.number().integer().min(0)
});

// Objeto para validar.
const data = {
    username: "john_doe",
    email: "john@example.com",
    age: 25
};

const result = schema.validate(data);

if (result.error) {
    console.error(result.error.details);
} else {
    console.log("Objeto válido", result.value);
}
```

Neste exemplo, o esquema define que um objeto válido deve ter uma propriedade `username` que é uma string alfanumérica de pelo menos 3 caracteres e no máximo 30 caracteres, uma propriedade `email` que é uma string válida de e-mail e uma propriedade `age` que é um número inteiro não negativo.\
`joi` é bastante flexível e pode ser configurada para validar uma variedade de tipos de dados e critérios. Ela é frequentemente usada em conjunto com servidores Node.js para validar dados de solicitações HTTP, por exemplo.

# <a id = "dotenv"></a>`dotenv`

`dotenv` é uma biblioteca para Node.js, ela facilita o carregamento de variáveis de ambiente de arquivos de configuração, especialmente em ambientes de desenvolvimento. Ele permite que você defina variáveis de ambiente em um arquivo chamado **.env** e as carregue automaticamente em seu aplicativo.\
O principal propósito do `dotenv` é simplificar o gerenciamento de variáveis de ambiente em diferentes ambientes de desenvolvimento. Em vez de definir variáveis de ambiente diretamente no sistema operacional, você pode criar um arquivo **.env** na raiz do seu projeto e definir as variáveis lá.\
Isso também é especialmente útil para manter informações sensíveis, como credenciais de banco de dados ou chaves de API, fora do seu código-fonte e configuráveis por meio de variáveis de ambiente.\
Em um arquivo **.env** você pode definir variáveis de ambiente no formato `VARIAVEL=valor`. Por exemplo:

```plaintext
DB_USER=usuario
DB_PASSWORD=senha
API_KEY=minha_chave_secreta
```

Para acessar as variáveis de ambiente definidas no arquivo **.env**, você pode usar o `process.env`. Por exemplo:

```JavaScript
// No início do seu arquivo de aplicativo.
require("dotenv").config();

// Agora você pode acessar as variáveis de ambiente como process.env.DB_USER.
console.log("Usuário do banco de dados:", process.env.DB_USER);
```

Isso é útil ao desenvolver aplicativos que têm diferentes configurações em abientes de desenvolvimento, teste e produção. O `dotenv` ajuda a evitar a exposição acidental de informações sensíveis, mantendo as configurações de ambiente fora do controle de versão.\
Lembre-se de que as variáveis de ambiente carregadas com `dotenv` são específicas para o ambiente de execução do seu aplicativo. Elas não estarão disponíveis fora do escopo do aplicativo e não serão visíveis para outros processos ou usuários do sistema. Isso também é útil na hora de proteger informações confidenciais.

# <a id = "uuidv4"></a>`uuid/v4`

`uuid/v4` é uma função específica de geração de UUID (Identificador Único Universal) fornecida oeka biblioteca `uuid`. UUIDs são identificadores únicos frequentemente utilizado em desenvolvimento de software para identificar recursos de forma única.\
A biblioteca `uuid` é bastante popular em ecossistemas JavaScript, como Node.js, e oferece métodos para a geração de UUIDs conforme as diferentes versões e variantes. No caso de `uuid/v4`, ele é usado para gerar UUIDs aleatórios na versão 4.\
Esses UUIDs são gerados com base em números pseudoaleatórios, o que torna improvável a colisão de identificadores em usos normais. Os UUIDs na versão 4 geralmente tem o seguinte formato `110ec58a-a0f2-4ac4-8393-c866d813b8d1`.

# <a id = "log-timestamp"></a>`log-timestamp`

`log-timestamp` é uma biblioteca que adiciona timestamps (carimbos de data/hora) a mensagens de log, ele é usado para melhorar a saída do console, adicionando informações de data e hora a cada mensagem de log.\
O propósito principal do `log-timestamp` é melhorar a legibilidade das mensagens de log, fornecendo informações de data e hora junto com o conteúdo da mensagem.

```JavaScript
const logTimestamp = require("log-timestamp");

// Todas as mensagens de log agora terãp timestamps.
console.log()"Esta mensagem terá um timestamp.";
```

Ao usar `log-timestamp`, cada mensagem de log será prefixada com um timestamp indicando a data e a hora em que a mensagem foi registrada.\
Nota: apesar de `log-timestamp` ser uma opção para adicionar timestamps a mensagens de log, muitos desenvolvedores preferem usar bibliotecas mais avançadas e flexíveis para o controle de logs, como `wiston` ou `pino`. Essas bibliotecas oferecem recursos adicionais, como níveis de log, armazenamento em arquivos, e a capacidade de personalizar o formato das mensagens de log.

# <a id = "express-graceful-shutdown"></a>`express-graceful-shutdown`

`express-graceful-shutdown` é uma biblioteca que oferece suporte a encerramento gráfico (graceful shutdown) de servidores Express. Ele é projetado para permitir que seu aplicativo Express encerre conexões ativas antes de desligar o servidor, garantindo que as solicitações em andamento sejam concluídas antes que o servidor seja totalmente encerrado.\
O objetivo principal desta biblioteca é garantir que, ao desligar o servidor Express, as conexões existentes sejam encerradas de maneira segura, permitindo que as solicitações em andamento sejam concluídas antes do encerramento completo do servidor. Isso é especialmente útil em cenários de deploy ou quando você precisa encerrar seu aplicativo de forma controlada.

```JavaScript
const express = require("express");
const gracefulShutdown = require("express-graceful-shutdown");

const app = express();
const port = 3000;

// Definindo rotas e configurações do seu aplicativo Express.

const server = app.listen(port, () => {
    console.log(`Servidor Express está escutando em http://localhost:${port}`);
});

// Configurando o encerramento gráfico.
gracefulShutdown(server, {
    signals: "SIGINT SIGTERM",
    timeout: 30000, // Tempo máximo permitido para encerrar conexões pendentes (em milissegundos).
    forceExit: true // Forãr encerramento se as conexões não encerrarem dentro do tempo limite.
});
```

Neste exemplo, `express-graceful-shutdown` é usado para integrar o encerramento gráfico ao servidor Express. Isso é útil para garantir que o servidor seja encerrado de maneira controlada e que as conexões ativas sejam gerenciadas adequadamente.

# `mariadb` x `mysql`

Aparentemente o método `.query()` do `mariadb` não aceita callbacks, enquanto o do `mysql`, aceita.\
Se você passar um valor numérico (como um inteiro) entre aspas simples em uma consulta SQL usando o método `.query()` do módulo `mysql` em Node.js, geralmente não ocorrerá um erro. Os drivers MySQL para Node.js são projetados para lidar com a formatação adequada dos valores na consulta SQL.

# <a name = "requestpromisenative"></a>--- `request-promise-native`

Biblioteca utilizada para fazer solicitações HTTP de forma assíncrona no Node.js com suporte a Promises. É uma extensão do módulo request-promise, oferecendo as mesmas funcionalidades, mas com o uso nativo de Promises, o que torna o código mais limpo e legível quando se trata de fazer solicitações HTTP e lidar com respostas.

### <a id = "request"></a>`request()`

Faz solicitações HTTP e retorna uma promessa.

`request(opcoes)`

`opcoes` **(objeto):** um objeto que contém as opções da solicitação HTTP. Este objeto pode incluir várias configurações, como a URÇ de destino, os cabeçalhos da solicitação, o método HTTP (por exemplo, GET, POST, etc.), os dados do corpo da solicitação e outras configurações específicas da solicitação.\
O método `request()` retonar uma promessa (Promise) que é resolvida quando a solicitação HTTP é concluída com sucesso ou rejeitada em caso de erro. Isso permite que você trabalhe com o resultado da solicitação de maneira assíncrona usando o modelo de promessas. Exemplo de uso do `request()`:

```JavaScript
const request = require("request-promise-native");

//Exemplo de solicitação GET.
request({
    uri: "https://jsonplaceholder.typicode.com/posts/1",
    method: "GET",
    json: true //Especifica que a reposta deve ser analisada como JSON.
})
    .then(response => {
        console.log("Resposta:", response);
    })
    .catch(error => {
        console.error("Erro na solicitação:", error);
    });
```

Neste exemplo, o método `request()` é usado para fazer uma solicitação GET para uma URL específica. A promessa retornada é então manipulada usando `.then()` para lidar com a resposta bem-sucedida e `.catch()` para lidar com erros na solicitação.

# métodos `mariadb`

### <a id = "createpool"></a>`.createPool()`

Cria e configura um pool de conexões com um banco de dados MariaDB ou MySQL. Retorna um objeto de pool de conexões que **você pode usar para adquirir e liberar conexões do pool**.

`const pool =  mariadb.createPool(configuracoes);`

`configuracoes` **(objeto):** o método `.createPool()` aceita um objeto de configuração como argumento. Esse objeto contém  informações sobre como conectar ao banco de dados, como host, nome de usuário, senha, nome do banco de dados e outras configurações relacionadas à conexão.
    - `connectionLimit`**:** você pode especificar o número máximo de conexões que o pool deve manter abertas simultaneamente. Isso evita que seu aplicativo abra um grande número de conexões ao mesmo tempo, o que pode levar a problemas de desempenho;
    - `acquireTimeout`**:** tempo limite (em milissegundos) para adquirir uma conexão do pool antes de gerar um erro.

Depois de criar um pool de conexões, você pode usar as conexões dele para executar consultas e interações com o banco de dados. Quando você não precisar mais de uma conexão, poderá liberá-la de volta para o pool para que possa ser reutilizada por outras partes do seu aplicativo.\
O uso de um pool de conexões ajuda a gerenciar eficientemente as conexões de banco de dados e é uma prática recomendada em aplicativos Node.js que interagem com bancos de dados.

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

# <a name = "moment"></a>`moment`

Utilizada para manipulação, formatação e análise de datas e horas.

### <a id = "moment"></a>`moment()`

Cria um objeto Moment representando a data e a hora atual.

`const data = moment();`

### <a id = "format"></a>`.format()`

Formata a data no padrão desejado.

`const data = moment().format("DD-MM-YYYY)`

### <a id = "add"></a>`.add()`

Adiciona uma quantidade específica de tempo a um objeto Moment. Retonar um novo objeto moment que é o resultado da adição da quantidade de tempo especificada ao objeto Moment original, o objeto Moment original não é modificado.

`moment.add(quantidade, unidade);`

- `quantidade` **(number):** a quantidade de tempo que você deseja adicionar. O valor deve ser um número inteiro ou decimal. O valor negativo pode ser usado para subtrair tempo;
- `unidade` **(string):** a unidade de tempo que você deseja subtrair. Pode ser uma das seguintes strings:
    - `"years"`,
    - `"months"`,
    - `"weeks"`,
    - `"days"`,
    - `"hours"`,
    - `"minutes"`,
    - `"seconds"`.

### <a id = "subtract"></a>`.subtract()`

Subtrai uma quantidade de tempo específica de um objeto Moment, resultando em um novo objeto Moment. Retorna um novo objeto Moment, o original não é alterado.

`moment.subtract(quantidade, unidade);`

- `quantidade` **(number):** a quantidade de tempo que você deseja subtrair do objeto Moment,
- `unidade` **(string):** a unidade de tempo que você deseja subtrair. Pode ser uma das seguintes strings:
    - `"years"`,
    - `"months"`,
    - `"weeks"`,
    - `"days"`,
    - `"hours"`,
    - `"minutes"`,
    - `"seconds"`.

### <a id = "hour"></a>``

Obtém ou define a hora de um objeto Moment. O objeto Moment original não é modificado.

```JavaScript
moment().hour();       //Obtém a hora.
moment().hour(numero); //Define a hora.
```

`numero` **(number, opcional):** se fornecido, é um número inteiro que representa a nova hora que você deseja definir no objeto Moment. Esse número deve estar no intervalo de 0 a 23, representando as 24 horas do dia.

# <a name = "nodemailer"></a>`nodemailer`

O `nodemailer` é uma biblioteca de terceiros muito popular para o Node.js que facilita o envio de e-mails a partir de aplicativos Node.js. Ele fornece uma API simples e poderosa para configurar e enviar e-mails, suportando diversos serviços de e-mail, como SMTP, SMTP seguro (SSL/TLS), além de possibilitar o envio de e-mails diretamente do aplicativo.

### <a id = "createtransport"></a>`.createTransport()`

Cria um objeto de transporte que define como o Nodemailer enviará e-mails. Retorna um **objeto de transporte do** `nodemailer`**, que você pode usar para enviar e-mails usando as configurações especificadas no objeto de opções**.

`const transporter = nodemailer.createTransport(opcoes);`

`opcoes` **(objeto):** objeto de configuração, suas principais propriedades são:
    - `service` **(string):** o serviço de e-mail a ser usado. Pode ser um serviço predefinido, como "Gmail" ou "Outlook", ou você pode configurar os detalhes de um serviço personalizado. Exemplo: `service: "Gmail"`;
    - `host` **(string):** o host do servidor de e-mail SMTP. Isso é necessário se você não estiver usando um serviço predefinido. Exemplo: `host: "smtp.example.com"`;
    - `port` **(number):** a porta do servidor SMTP. Geralmente, a porta **465** é usada para SMTP seguro (SSL/TLS) e a porta 587 para SMTP padrão;
    - `secure` **(boolean):** define se a conexão deve ser segura. Geralmente, é `true` para SMTP seguro (SSL/TLS) e `false` para SMTP padrão;
    - `auth` **(objeto):** um objeto que contém as credenciais de autenticação, incluindo `user` (seu endereço de e-mail) e `pass` (sua senha). Exemplo:

```JavaScript
auth: {
    user: "seu_email@example.com",
    pass: "sua_senha"
}
```

### <a id = "sendmail"></a>`.sendMail()`

Envia e-mails.

`transporter.sendMail(opces, callback);`

`opcoes` **(objeto):** objeto de configuração, suas principais propriedades são:
    - `from` **(string):** o endereço de e-mail do remetente. Deve ser uma string no formato `"nome <email>"`. Exemplo: `from: "John Doe <johndoe@example.com>"`;
    - `to` **(string ou array de strings):** o(s) endereço(s) de e-mail do(s) destinatário(s). Pode ser uma única string ou um array de strings se você deseja enviar o e-mail para múltiplos destinatários. Exemplo:

```JavaScript
to: "destinatario@example.com"

//ou

to: ["destinatario1@example.com", "destinatario2@example.com"]
```

- `subject` **(string):** o assunto do e-mail. Exemplo: `subject: "Assunto de E-mail".`;
- `text` **(string):** o conteúdo do e-mail no formato de texto simples. Este é o corpo do e-mail que será exibido se o cliente de e-mail não suportar HTML. Exemplo: `text: "Conteúdo do E-mail em Texto Puro."`;
- `html` **(string):** o conteúdo do e-mail no formato HTML. Este é o corpo do e-mail que será exibido se o cliente de e-mail suportar HTML. Exemplo: `html: "<h1>Conteúdo do E-mail em HTML</h1>`;
- `attachments` **(array de objetos):** anexos que você deseja incluir no e-mail. Cada objeto deve ter informações sobre o anexo, como nome do arquivo, conteúdo e tipo MIME. Exemplo:

```JavaScript
attachments: [
    {
        filename: "anexo.txt",
        content: "Conteúdo do anexo",
        contentType: "text/plain"
    }
]
```

- `cc` **(string ou array de strings):** cópias carbono (CC) do e-mail. Pode ser uma única string ou um array de strings para múltiplos destinatários. Exemplo:

```JavaScript
cc: "copia@example.com"

//ou

cc: ["copia1@example.com", "copia2@example.com"]
```

- `bcc` **(string ou array de strings):** cópias carbono ocultas (BCC) do e-mail. Pode ser uma única string ou um array de strings para múltiplos destinatários. Exemplo:

```JavaScript
bcc: "copia_oculta@example.com"

//ou

bcc: ["copia_oculta1@example.com", "copia_oculta2@example.com"]
```

`callback`**:** a função de retorno de chamada é chamada quando o e-mail é enviado ou se ocorrer um erro durante o processo de envio. O callback é chamado com dois argumentos, o primeiro é um possível erro e o segundo é um objeto de infomações sobre o envio do e-mail (`error, info`).\
`info` tem as chaves `response` e `messageId`.

# Node.js.

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

## métodos `fs`

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

## métodos `child_process`

`.exec()`

Executa comandos do sistema operacional em um subprocesso. Ele é uma forma de criar processos filhos para executar comandos shell ou outros programas externos.

`.exec(comando, opcoes, callback)`

- `comando` **(string):** representa o comando a ser executado;
- `opcoes` **(objeto, opcional):** pode conter várias opções para controlar o comportamento da execução do comando;
- `callback` **(opcional):** função de retorno de chamada que será chamada quando a execução do comando for concluída.\
  `(erro, stdout, stderr) => {}`
  - `erro` **(string):** variável que conterá informações sobre qualquer erro que ocorrer durante a execução do comando;
  - `stdout` **(string):** variável que conterá a saída padrão (`stdout`) do comando executado;
  - `stderr` **(string):** variável que conterá a saída de erro (`stderr`) do comando executado.