# <a id="express"></a>Express

### Sumário

- [Métodos](#metodos)
    + [app.listen()](#metodos-app-listen)
    + [`router.post()`](#metodos-router-post)
    + [`response.status()`](#metodos-reponse-status)
    + [`response.json()`](#metodos-reponse-json)

# <a id="metodos"></a>Métodos

### Sumário

- [`app.listen()`](#metodos-app-listen)
- [`router.post()`](#metodos-router-post)
- [`response.status()`](#metodos-reponse-status)
- [`response.json()`](#metodos-reponse-json)

# <a id="metodos-app-listen"></a>`app.listen()`

É utilizado para **iniciar um servidor HTTP e começar a escutar por conexões em uma determinada porta**.

**Sintaxe Básica**

```JavaScript
const express = require("express");

const app = express();
const port = 3000;            // Porta em que o servidor vai escutar.
const hostname = "localhost"; // Nome do host.

app.listen(port, hostname, () => {
    console.log(`Servidor Express está escutando na porta ${port}`);
});
```

- **Parâmetros:**
    + `port`**:** o número da porta em que o servidor vai escutar por conexões HTTP
    + `hostname` **(opcional):** você pode passar um endereço IP ou nome do host. Isso é útil se você quiser especificar um endereço IP específico ou um nome de host para o servidor escutar, em vez de escutar todas as interfaces de rede
    + `callback` **(opcional):** uma função opcional que será executada assim que o servidor for iniciado e começar a escutar por conexões. Este callback geralmente é usado para registrar uma mensagem de log indicando que o servidor está escutando e em qual porta

Ao chamar `.listen()`, o Express cria um servidor HTTP e começa a ouvir por conexões nesse servidor na porta especificada. Quando uma solicitação HTTP é recebida, o Express encaminha essa solicitação para a função de middleware apropriada com base no caminho da URL e no método HTTP da solicitação.

Neste exemplo, o servidor Express estará escutando apenas em conexões feitas para `localhost` na porta especificada. Isso significa que ele não estará acessível a partir de outros hosts na rede.

Se você omitir o segundo argumento, o Express irá escutar em todas as interfaces de rede disponíveis no sistema. Isso é equivalente a passar `null` ou não passar o segundo argumento.

É importante notar que o método `.listen()` é assíncrono e retorna uma instância de servidor HTTP, mas na maioria dos casos você não precisa armazenar essa instância em uma variável, já que o Express cuida disso internamente.

Se você quiser começar a escutar em uma porta específica, basta chamar `.listen()` passando o número da porta como primeiro argumento. Depois de chamar `.listen()`, seu servidor Express estará pronto para receber solicitações HTTP na porta especificada.

**Observações Interessantes**

No JavaScript, a função `app.listen()` do Express é capaz de identificar os argumentos que você passou com base em sua quantidade e tipo, graças a sobrecargas de função internamente. Basicamente, a implementação verifica os argumentos fornecidos e ajusta o comportamento com base nisso (identifica quais são).

Esta abordagem permite que o Express flexibilize a maneira como os desenvolvedores podem configurar o servidor, tornando a API mais amigável e adaptável às necessidades do projeto.

# <a id="metodos-router-post"></a>`router.post()`



# <a id="metodos-reponse-status"></a>`response.status()`

É utilizado para **definir o código de status HTTP da resposta que será enviada ao cliente**.

**Sintaxe Básica**

```JavaScript
response.status(statusCode);
```

- **Parâmetros:**
    + `statusCode`**:** um número representando o código de status HTTP que você deseja definir na resposta. Exemplos:
        - `200`**:** OK
        - `201`**:** Created
        - `400`**:** Bad Request
        - `401`**:** Unauthorized
        - `403`**:** Forbidden
        - `404`**:** Not Found
        - `500`**:** Internal Server Error

**Exemplos**

- **Enviando uma resposta com um código de status:**

```JavaScript
app.get("/success", (request, response) => {
    response.status(200).send("Success"); // Envia uma reposta com o código de status 200.
});

app.get("/error", (request, response) => {
    response.status(500).send("Internal Server Error"); // Envia uma resposta com o código de status 500.
});
```

- **Encadeando métodos**

O método `.status()` retorna o objeto de resposta (`response`), permitindo o encadeamento de outros métodos, como `.json()` ou `.send()`:

```JavaScript
app.get("/json". (request, response) => { 
    response.status(200).json({ message: "This is a JSON response" }); // Define o status e envia um objeto JSON.
});
app.get("/text". (request, response) => { 
    response.status(404).send("This page was not found"); // Define o status e envia uma mensagem de texto.
});
```

# <a id="metodos-reponse-json"></a>`response.json()`

É utilizado para **enviar respostas JSON ao cliente**. Ele é frequentemente usado em conjunto com o método `.status()` para definir o código de status da resposta e enviar dados em formato JSON.

**Sintaxe Básica**

```JavaScript
response.json(body);
```

- **Parâmetros:**
    + `body`**:** o objeto, array ou valor que você deseja converter em JSON e enviar como resposta

**Exemplos**

```JavaScript
const express =  require("express");

const app =  express();

app.get("/user", (request, response) => {
    const user = {
        id: 1,
        name: "Alice",
        email: "alice@example.com",
    };

    response.json(user); // Envia o objeto `user` como resposta JSON.
});

app.listen(3000, () => {
    console.log("Server is running on port 3000");
});
```

**Usos Comuns**

- **Resposta a solicitações API:** ao desenvolver APIs RESTful, as respostas geralmente são enviadas em formato JSON
- **Erros de validação:** enviar mensagens de erro detalhadas em formato JSON
- **Dados de aplicação:** enviar dados dinâmicos de aplicalções para o frontend em formato JSON