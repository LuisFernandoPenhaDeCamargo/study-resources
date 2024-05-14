# Sumário.

[`express`](#frameworkexpress).

# <a id = "frameworkexpress"></a>`express`

### Sumário

- [`express()`](#funcaoexpress);
- [`.listen()`](#listen);
- [`.header()`](#header);
- [`next()`](#next);
- [`.disable()`](#disable);
- [`.use()`](#use);
- [`.urlencoded()`](#urlencoded);
- [`express-.json()`](#express-json);
- [`.Router()`](#router);
- [`.patch()`](#patch);
- [`.status`](#status);
- [`res-.json()`](#res-json);
- [`.send()`](#send);
- [`.end()`](#end).

## <a id = "funcaoexpress"></a>`express()`

`express()` é uma função que cria uma instância do framework Express.js. Essa instância representa o aplicativo web ou API que você está desenvolvendo.

`express()`

Não há parâmetros obrigatórios para a função `express()`. No entanto, você pode passar várias opções de configuração como argumentos opcionais.

```JavaScript
const express = require("express");

const app = express(
    {
        option1: "value1",
        option2: "value2"
    });
```

Retorna uma instância do aplicativo Express.js que pode ser utilizada para configurar rotas, middlewares e iniciar um servidor.

```JavaScript
const express = require("express");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
    res.send("Hello, World!");
});

app.listen(port, () => {
    console.log(`Servidor Express está escutando em http://localhost:${port}`);
});
```

Neste exemplo, `express()` é usado para criar uma instância do aplicativo Express.js. A instância `app` é então utilizada para definir rotas e iniciar um servidor HTTP na porta especificada.

## <a id = "listen"></a>`.listen()`

[`Observação importante antes de seguir para a definição do método`](metodos-bibliotecas.md#express-listen).

## <a id = "header"></a>`.header()`

O método `.header()` é usado para acessar o valor de um cabeçalho específico na solicitação HTTP.

`req.header(headerName)`

`headerName` **(string):** representa o nome do cabeçalho que você deseja acessar.

Retorna o valor do cabeçalho especificado. Se o cabeçalho não existir, retorna `undefined`.

```JavaScript
const authorizationHeader = req.header("Authorization");
```

## <a id = "next"></a>`next()`

O método `next()` é usado para avançar para a próxima iteração em uma execução assíncrona, seja em middlewares ou em funções geradoras.

`next(value)`

`value` **(value, opcional:)** um valor para ser passado para a próxima iteração. Esse valor será o resultado da última instrução `yield` em uma função geradora.

Retorna um objeto com duas propriedades:

- `value`**:** o valor retornado pela última instrução `yield`;
- `done` **(boolean):** um booleano indicando se a função geradora foi concluida (retornando `true`).

Exemplo de uso:

- Usando em um middleware de servidor Express:

```JavaScript
function middleware(req, res, next) {
    // Alguma lógica assíncrona ou processamento.

    // Avançar pra o próximo middleware.
    next();
}
```
O `next()` não só avança para o próximo middleware na cadeia, mas também é usado para indicar ao Express que deve continuar a execução do pipeline de middleware. Se você não chamar `next()`, o middleware atual pode interromper o pipeline e impedir que os middlewares subsequentes sejam executados.\
No caso de middlewares fornecidos por bibliotecas populares, eles normalmente tratam de chamar o next() internamente.

- Usando uma função geradora:

```JavaScript
function* minhaFuncaoGeradora() {
    console.log("Inicialização do iterador. A primeira chamada a next() vem até aqui, até a primeira instrução yield.")
    const resultado1 = yield "Passo 1.";
    console.log(resultado1); // Saida: Resultado 1.
  
    const resultado2 = yield "Passo 2.";
    console.log(resultado2); // Saida: Resultado 2.
  
    const resultado3 = yield "Passo 3.";
    console.log(resultado3); // Saida: Resultado 3.
}
  
const iterador = minhaFuncaoGeradora();
  
const inicializador = iterador.next();
const passo1 = iterador.next("Resultado 1.");
const passo2 = iterador.next("Resultado 2.");
const passo3 = iterador.next("Resultado 3.");  
```

- O escopo alcançado pelo primeiro `next()` é o da linha 57;
- O escopo alcançado pelo segundo `next()` é o da linha 59 e 60;
- O escopo alcançado pelo segundo `next()` é o da linha 62 e 63;
- O escopo alcançado pelo segundo `next()` é o da linha 65.

A primeira chamada a `next()` inicializa o iterador e avança até a primeira instrução `yield`. Nesse ponto, a execução é pausada, e o valor passado para essa primeira chamada de `next()` não é usado para atribuir a variável na primeira instrução `yield`.\
As chamadas subsequentes de `next()` são responsáveis por retomar a execução após cada instrução `yield`, e essas chamadas podem incluir valores que serão atribuídos às variáveis nas instruções `yield` correspondentes. Cada chamada de `next()` avança a execução até a próxima instrução `yield` ou até o final da função geradora, se não houver mais instruções `yield`.

## <a id = "disable"></a>`.disable()`

`.disable()` é um método usado para desativar uma configuração específica do aplicativo Express.

`app.disable(name: string): Express.Application;`

`name` **(string):** uma string que representa o nome da configuração que deve ser desativada.

Retorna `Express.Application`, a instância do aplicativo Express para encadeamento de métodos.

```JavaScript
const express = require("express");

const app = express();

// Desativa a renderização de "x-powered-by" no cabeçalho.
app.disable("x-powered-by");

// Mais configurações e roteamentos podem seguir.
```

Neste exemplo, o método `.disable()` é usado para desativar a configuração `"x-powered-by"`, que remove o cabeçalho "X-Powered-By" padrão do Express. Este cabeçalho geralmente informa a versão do Express em uso e, em alguns casos, pode ser desejável removê-lo por razões de segurança.

## <a id = "use"></a>`.use()`

`.use()` é um método usado para montar middlewares no pipeline de requisição, ele adiciona middleware ao pipeline de manipulação de requisições.

`app.use([path], callback [, callback...]);`

- `path` **(string, opcional):** uma string que representa o caminho ou padrão de caminho no qual o middleware será aplicado. Se não for especificado, o middleware será aplicado a todas as requisições;
- `callback`**:** função ou middleware a ser executado quando a rota corresponder.

Retona `Express.Application`, a instância do aplicativo Express para encadeamento de métodos.

```JavaScript
const express = require("express");

const app = express();

// Middleware para log de requisições.

app.use((req, res, next) => {
    console.log(`Recebida requisição em: ${req.url}`);
    next(); // Chama o próximo middleware na pilha.
});

// Rota padrão.
app.get("/", (req, res) => {
    res.send("Hello, World!");
});

// Inicia o servidor na porta 3000.
app.listen(3000, () => {
    console.log("Servidor Express iniciado na porta 3000.");
});
```

Neste exemplo, `use()` é usado para adicionar o middleware de log que registra cada requisição e, em seguida, chama `next()` para passar o controle para o próximo middleware ou rota na pilha.

## <a name = "urlencoded"></a>`.urlencoded()`

`.urlencoded()` é um método utilizado para analisar os corpos das solicitações que contêm dados codificados como formulário (`application/x-www-form-urlencoded`). ele popula `req.body` com os dados provenientes do formulário.

`express.urlencoded([options]);`

- `options` **(opcional):** um objeto de opções que pode conter propriedades como `extended` para configurar o comportamento da análise. O parâmetro `extended` é um booleano que indica se deve analisar objetos complexos (com valor `true`) ou não (valor `false`).

**Retorno:** função middleware é uma função que recebe os objetos `req`, `res` e `next` e manipula a solicitação antes de passá-la para o próximo middleware.

```JavaScript
const express = require("express");

const app = express();

// Utilizando express.urlencoded() como middleware.
app.use(express.urlencoded({ extended: true }));

// Rota que trata dados de formulário.
app.post("/form", (req, res) => {
    console.log(req.body); // Dados do formulário disponíves em req.body.
});

app.listen(3000, () => {
    console.log("Servidor Express iniciado na porta 3000.");
});
```

Neste exemplo, `express.urlencoded()` é utilizado como middleware para analisar dados de formulário. Certifique-se de que sua versão do Express seja 4.16.0 ou superior para usar esse método diretamente sem a necessidade do `body-parser`.

## <a name = "express-json"></a>`express-.json()`

`.json()` é um método utilizado para analisar o corpo de solicitações como JSON, ele popula `req.body` com os dados JSON da solicitação.

`express.json([options]);`

`options` **(opcional)** um objeto de opções que pode conter propriedades para configurar o comportamento da análise. As opções comuns incluem `reviver`, `limit`, `strict`, entre outras.

**Retorno:** função middleware que recebe os objetos `req`, `res` e `next` e manipula a solicitação antes de passá-la para o próximo middleware.

```JavaScript
const express = require("express");

const app = express();

// Utilizando express.json() como middleware.
app.use(express.json());

// Rota que trata addos JSON.
app.post("/json", (req, res) => {
    console.log(req.body); // Dados JSON disponíveis em req.body.
    res.send("Dados JSON recebidos com sucesso!");
});

app.listen(3000, () => {
    console.log("Servidor Express iniciado na porta 3000.");
});
```

Neste exemplo, `express.json()` é utilizado como middleware para analisar dados JSON. Assim como o `urlencoded()`, é uma parte essencial do Express para lidar com diferentes formatos de dados nas solicitações.

## <a id = "router"></a>`.Router()`

`.Router()` é um método, ele é usado para criar uma nova instância do objeto Router no Express.js. Essa instância pode ser usada para definir rotas e middlewares.

`express.Router([opções]);`

`opções` **(opcional):** um objeto de opções para configurar o comportamento do Router.

Retorna uma nova instância do objeto Router.

```JavaScript
const express = require("express");

const app = express();

// Criando uma instância de Router.
const router = express.Router();

// Definindo uma rota no objeto Router.
router.get("/", (req, res) => {
    res.send("Rota no objeto Router.");
});

// Usando o objeto Router como middleware.
app.use("/prefixo", router);

// Iniciando o servidor.
app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.")
});
```

Neste exemplo, o `Router()` é usado para criar um objeto Router, que por sua vez é usado para definir uma rota. Este objeto Router é então incorporado ao aplicativo Express usando o método `.use()`, permitindo que todas as rotas definidas no objeto Router tenham um prefixo específico (`"/prefixo"` neste caso). Isso é especialmente útil para modularizar e organizar seu código em diferentes arquivos ou componentes.\
Você pode usar o objeto `Router` para definir rotas específicas, middleware e manipuladores de solicitação para esse grupo de rotas.

## <a id = "patch`"></a>`.patch()`

`.patch()` é um método utilizado para associar um manipulador de rota (ou middleware) a requisições HTTP com o método PATCH. Ele é usado para tratar atualizações parciais de recursos.

`app.patch(path, callback [, callback...]);`

- `path`**:** o caminho da URL para qual o middleware será aplicado;
- `callback`**:** função ou funções de middleware que serão executadas quando a rota for correspondida.

Retorna o objeto `app` para encadeamento de métodos.

```JavaScript
const express = require("express");

const app = express();

// Middleware para lidar com atualizações parciais.
app.patch("/atualizar-recurso", (req, res) => {
    // Lógica para processar a atualização parcial.
    res.send("Recurso parcialmente atualizado.");
});

app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.");
});
```

Neste exemplo, o middleware associado ao caminho `"/atualizar-recurso"` será executando quando houver uma requisição PATCH para esse caminho. Você pode incluir a lógica necessária para processar a atualização parcial dentro desse middleware.

## <a id = "status"></a>`.status`

`.status` é um método do objeto de resposta (`res`) no Express, ele define o código de status HTTP da resposta.

`res.status(code);`

`code` **(Number):** o código de status HTTP desejado, isso deve ser um número inteiro representando um código de status HTTP válido. O default do Express é `200`.

Retorna a própria instância do objeto de resposta (`res`), o que permite encadear outros métodos.

`res.status(200).send("OK");`

Neste exemplo. `.status()` define o código de status HTTP como 200 (OK), e `.send("OK")` envia o corpo da resposta como "OK". É comum encadear esses métodos para configurar o código de status e enviar a resposta em uma única linha de código.

## <a id = "res-json)"></a>`res-.json()`

`res.json()` é um método do objeto de resposta no Express, ele envia uma resposta JSON.

`res.json([body]);`

`body` **(opcional):** o corpo da resposta, que será serializado como JSON, pode ser qualquer objeto JavaScript válido, o método `.json()` converte automaticamente este objeto em uma resposta JSON e define o cabeçalho `Content-Type` para `application/json.

Retorna a própria instância do objeto de resposta (`res`), o que permite encadear outros métodos.

```JavaScript
const responseData = { key: "value" };

// Envia uma resposta JSON com o código de status 200 por padrão.
res.json(responseData);
```

Se não for especificado um código de status, o Express assumirá implicitamente que é uma resposta bem-sucedida (código de status 200). Assim como com `res.status()`, você pode encadear métodos, permitindo a configuração do código de status e o envio da resposta em uma única linha de código.

## <a id = "send"></a>`.send()`

`.send()` é um método no Express.js, ele é usado para enviar uma resposta ao cliente como parte do ciclo de solicitação-resposta no Express.js.

`res.send([body]);`

`body` **(opcional):** o conteúdo a ser enviado como resposta. Pode ser de vários tipos, como um objeto JavaScript, um buffer, ou até mesmo HTML.

```JavaScript
const express = require("express");

const app = express();

app.get("/", (req, res) => {
    // Enviando uma resposta simples (um texto simples) com .send().
    res.send("Hello, World!");
});

app.get("/json", (req, res) => {
    // Enviando uma resposta JSON com .send().
    const jsonData = { key: "value" };
    res.send(jsonData);
});

app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.");
});
```

Neste exemplo, `.send("Hello, World!")` envia uma string `Hello, World!` como resposta para a rota principal (`"/"`). Além disso, `.send(jsonData)` envia um objeto JSON como resposta para a rota `"/json"`. O método `.send()` é versátil e pode ser usado para enviar diferentes tipos de conteúdo, ele tenta inferir o tipo de contepudo com base no que você passa para ele.\
Se você passar um objeto JavaScript, ela automaticamente definirá o cabeçalho `Content-type` como `application/json` e converterá o objeto para uma representação JSON.

## <a id = "end"></a>`.end()`

`.end()` é um método do objeto de resposta (response) no Express.js, ele é usado para finalizar o processo de resposta, enviando a resposta ao cliente.

`res.end([data], [, enconding][, callback]);`

- `data` **(opcional)** os dados que serão enviados como parte do corpo da resposta. Pode ser uma string ou um Buffer;
- `encoding` **(opcional)** a codificação a ser usada ao enviar dados como string;
- `callback` **(opcional)** uma função de retorno de chamada que será chamada quando a resposta for enviada. Esta função não recebe argumentos.

Este método não retorna nada.

```JavaScript
const express = require("express");

const app = express();

app.get("/", (req, res) => {
    // Enviando uma resposta simples com .end().
    res.end("Hello, World!");
});

app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.");
});
```

Neste exemplo, quando a rota raiz (`"/"`) é acessada, a resposta é enviada ao cliente com o texto `"Hello, World!"` usando o método `.end()`. Este método é frequentemente utilizado quando você deseja enviar uma resposta simples e não precisa enviar um corpo de resposta mais complexo.

## app x router

A diferença fundamental entre tratar uma rota diretamente na instância do aplicativo Express ou utilizar um objeto `Router` está na organização e modularidade do código, ambas as abordagens usam a instância do aplicativo Express e compartilham a mesma estrutura subjacente.

- **Objeto** `Router`**:**
    - Cada instância do `Router` mantém seu próprio estado de configuração separado;
    - Isso é útil quando você deseja organizar e modularizar suas rotas, mantendo as configurações de cada rota isoladas;
    - Mudanças nas configurações de um `Router` não afetam diretamente os outros.
- **Instância do Aplicativo Express:**
    - Todas as rotas compartilham o mesmo estado de configuração da instância principal do aplicativo;
    - Mudanças nas configurações da instância do aplicativo afetam todas as rotas definidas nessa instância.

Ambas as abordagens têm seu lugar e são escolhidas com base nos requisitos específicos do projeto. Se você está desenvolvendo uma aplicação menor e a modularidade extrema não é necessária, a instância do aplicativo Express diretamente pode ser mais direta. Se você está construindo uma aplicação maior ou modular, ou se deseja organizar suas configurações de rota de maneira independente, o uso de objetos `Router` pode ser mais apropriado. Essa escolha depende do tamanho e da complexidade do seu projeto, bem como das preferências de organização de código da equipe de desenvolvimento.

## Passando o objeto `Router` para o método `.use()`

Quando você passar um objeto `Router` para o método `.use()` no Express.js, você está incorporando as rotas definidas nesse objeto ao fluxo principal de roteamento da sua aplicação. Isso é útil quando você deseja modularizar suas rotas em diferentes arquivos ou componentes. Aqui está um exemplo de como você pode fazer isso:\
Suponha que você tenha um arquivo chamado `routes.js` onde você define algumas rotas usando o Router do Express:

```JavaScript
// routes.js
const express = require("express");

const router = express.Router();

router.get("/", (req, res) => {
    res.send("Rota principal.");
});

router.get("/outro", (req, res) => {
    res.send("Outra rota.");
});

module.exports = router;
```

Agora, em seu arquivo principal, onde você configura a aplicação Express, você pode incorporar essas rotas usando o método `.use()`:

```JavaScript
const express = require("express");

const app = express();

// Importando o objeto router do arquivo routes.js.
const routes = require("./routes");

// Usando as rotas definidas no objeto router.
app.use("/", routes);

// Iniciando o servidor.
app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.");
});
```

No exemplo acima, todas as rotas definidas no arquivo **routes.js** serão acessíveis a partir do caminho `"/"` no aplicativo principal. Se você acessar `"/outro"`, a rota definida no arquivo **routes.js** para `"/outro"` também será correspondida.\
Essa abordagem é útil para organizar e dividir o seu código em módulos, tornado-o mais fácil de entender e manter, especialmente em aplicações maiores.

Tenha em mente que a função `.use()` do Express.js é bastante flexível e aceita tanto middlewares quanto instâncias do objeto `Router`. Essa flexibilidade permite uma modularização eficaz do código.\
Quando você passa um objeto `Router` para o método `.use()`, você está basicamente montando um conjunto de rotas em um determinado caminho. Esse objeto `Router` pode conter várias rotas e até mesmo outros middlewares. Isso é útil para organizar seu código de maneira modular e manter a estrutura da aplicação.\
Ao usar um objeto `Router` **como middleware**, você está delegando o controle de um conjunto específico de rotas para esse objeto. Isso é particularmente útil em grandes aplicações onde você pode ter diferentes módulos ou componentes, cada um responsável por suas próprias rotas. Por exemplo, considere o seguinte:

```JavaScript
// routes.js
const express = require("express");

const router = express.Router();

router.get("/", (req, res) => {
    res.send("Rota principal.");
});

router.get("/outro", (req, res) => {
    res.send("Outra rota.");
});

module.exports = router;
```

e no arquivo principal:

```JavaScript
const express = require("express");

const app = express();

// Importando o objeto router do arquivo routes.js.
const routes = require("./routes");

// Usando o objeto router como middleware.
app.use("/prefixo", routes);

// Iniciando o servidor.
app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000.");
});
```

Aqui, todas as rotas definidas no arquivo `routes.js` serão montadas sobre o prefixo `"/prefixo"`. Essa abordagem facilita a organização e manutenção de grandes projetos, pois você pode dividir a lógica de roteamento em diferentes módulos ou arquivos.