# Axios (Ok)

Axios é uma biblioteca popular para **fazer requisições HTTP**. Ela pode ser usada tanto no navegador quanto no Node.js, e oferece uma API baseada em promessas, tornando a manipulação de requisições assíncronas mais fácil e limpa.

### Sumário

- [`interceptors`](#interceptors)
- [`.use()`](#use)
- [`.eject()`](#eject)
- [`.get()`](#get)
- [`.post()`](#post)

# <a id="interceptors"></a>`interceptors`

Os `interceptors` no Axios são uma funcionalidade poderosa que **permite interceptar e modificar requisições e respostas antes que elas sejam manipuladas pelo código**. Você pode usar `interceptors` para adicionar headers, logar informações, manipular erros, entre outras funcionalidades.

Existem dois tipos principais de interceptors no Axios:

1. **Request interceptors:** interceptam e modificam requisições antes de serem enviadas ao servidor
2. **Response interceptors:** interceptam e modificam respostas antes de serem entregues ao código que fez a requisição

**Quando Usar**

- **Adicionar headers de autenticação:** adicionar tokens de autenticação ou outras credenciais de forma automática
- **Logar requisições e respostas:** para propósitos de debugging
- **Manipular erros:** para tratar erros globais, como redirecionar para a página de login em caso de respostas 401
- **Transformar dados:** para modificar dados antes de enviar ou após receber, conforme necessário

### Exemplos

```JavaScript
const axios = require("axios");

// Adicionando Request Interceptor.
const meuInterceptador = axios.interceptors.request.use(request => {
    request.headers.Authorization = "Bearer token";

    console.log("Request:", request);

    return request;
});

// Adicionando Response Interceptor.
axios.interceptors.response.use(response => {
    console.log("Reponse:", response);

    return response;
    }, error => {
        if (error.response && error.response.status === 401 ) {
            console.error("Unauthorized!");
        }

        return Promise.reject(error);
    }
);

// Para remover o interceptador.
axios.interceptors.request.eject(meuInterceptador);
```

# <a id="use"></a>`.use()`

É utilizado para **adicionar interceptadores de requisição no Axios**.

**Sintaxe Básica**

```JavaScript
axios.interceptors.request.use(seRealizada[, seRejeitada]);
```

- `seRealizada`**:** uma função que recebe a configuração da requisição e retorna a configuração modificada ou uma `Promise` que resolve para a configuração modificada
- `seRejeitada`**:** uma função que recebe um erro e retorna uma `Promise` que rejeita esse erro

Os interceptadores de requisição são uma ferramenta poderosa para modificar e gerenciar requisições de maneira centralizada e reutilizável. Usando `axios.interceptors.request.use()`, você pode facilmente adicionar lógica para autenticação, logging, manipulação de erros, e outras funcionalidades úteis em todas as suas requisições HTTP.

### Exemplos

```JavaScript
// Adicionando um interceptador de requisição.
axios.interceptors.request.use(configuracoes => {
    // Modificar a configuração da requisição antes de enviá-la.
    configuracoes.headers.Authorization = "Bearer token";

    console.log("Request config:", configuracoes);
    }, error => {
        // Lidar com o erro de requisição.
        console.error("Request Error:", error);

        return Promise.reject(error);
    }
);
```

- `configuracoes`**:** é um objeto que representa a configuração da requisição. Ele inclui informações como URL, headers, método HTTP, dados da requisição, etc. O interceptor pode modificar esse objeto antes que a requisição seja enviada
- `error`**:** é um objeto de erro que representa qualquer erro que ocorreu durante a configuração da requisição. O interceptor pode manipular esse erro, logá-lo, ou tomar outras ações apropriadas

# <a id="eject"></a>`.eject()`

É utilizado **para remover interceptadores que foram previamente adicionados**. Quando você adiciona um interceptador com `axios.interceptors.`(`request`/`response`)`.use()`, ele retorna um identificador. Esse identificador pode ser usado com `.eject()` para remover o interceptador específico.

```JavaScript
axios.interceptor.request.eject(interceptadorId);
```

- `interceptadorId`**:** o identificador do interceptador que você deseja remover. Este identificador é retornado pelo método `axios.interceptors.`(`request`/`response`)`.use()` quando o interceptador é adicionado

**Quando Usar**

- **Remover interceptadores condicionalmente:** pode haver casos em que você deseja adicionar interceptadores apenas por um período de tempo ou sob certas condições, então você pode removê-los com o `.eject()`
- **Gerenciar interceptadores dinamicamente:** em aplicativos complexos, você pode querer adicionar e remover interceptadores em resposta a mudanças de estado ou eventos específicos

# <a id="get"></a>`.get()`

É utilizado para **fazer requisições HTTP GET**, o que significa que você está solicitando dados de um servidor.

```JavaScript
axios.get(url[, configuracao]);
```

- `url`**:** é a URL para a qual você deseja enviar a requisição GET
- `configuracao`**:** o segundo argumento é um objeto de configuração onde você pode definir cabeçalhos, parâmetros de URL, autenticação, entre outros

### Resposta

Quando a requisição é bem-sucedida, o método `.get()` retorna uma `Promise` que resolve com a resposta do servidor. A resposta contém várias propriedades, sendo as mais usadas:

- `data`**:** os dados retornados pelo servidor
- `status`**:** o código de status HTTP da resposta
- `statusText`**:** o texto de status HTTP da resposta
- `headers`**:** os cabeçalhos HTTP da resposta
- `config`**:** a configuração que foi usada para a requisição
- `request`**:** o objeto de requisições HTTP

# <a id="post"></a>`.post()`

É utilizado para **enviar requisições HTTP Post**. A requisição POST é usada para enviar dados ao servidor, geralmente para criar ou atualizar recursos.

**Sintaxe Básica**

```JavaScript
axios.post(url[, dados[, configuracao]]);
```

- `url`**:** a URL para a qual a requisição será enviada
- `dados`**:** os dados que serão enviados ao servidor no corpo da requisição
- `configuracao`**:** configurações adicionais para a requisição, como cabeçalhos personalizados, parâmetros de autenticação. etc

**Configurações Comuns**

- `headers`**:** específica cabeçalhos HTTP personalizados
- `params`**:** específica parâmetros de URL
- `auth`**:** específica credenciais de autenticação
- `timeout`**:** define um tempo limite para a requisição
- `responseType`**:** define o tipo de dados esperado na resposta (`json`, `text`, `blob`, etc.)

### Exemplos

```JavaScript
axios.post("https://api.example.com/data", {
        primeiroNome: "Alice",
        segundoNome: "Doe",
    }, {
        headers: {
            "Content-Type": "application/json",
            Authorization: "Bearer token",
        }
    })
    .then(response => {
        console.log(response.data);
    })
    .catch(error => {
        console.error("There was an error!", error);
    }
);
```