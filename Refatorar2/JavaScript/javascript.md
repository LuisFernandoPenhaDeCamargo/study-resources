# JavaScript



# ETag (Amazon S3) e md5sum (Ubuntu)

A ETag no Amazon S3 e o md5sum no Ubuntu são conceitos diferentes, embora ambos estejam relacionados a verificar a integridade dos dados.

- **ETag no Amazon S3:** a ETag (Entity Tag) no Amazon S3 é uma string que representa a identidade única de um objeto (um arquivo, por exemplo). Pode ser uma cadeia de caracteres gerada pelo próprio S3, ou pode ser um valor MD5 do conteúdo do arquivo, dependendo de como o objeto foi criado ou carregado no S3
- **md5sum no Ubuntu:** `md5sum` é um utilitáio no Ubuntu (e em sistemas Linux em geral) que calcula e exibe o valor do hash MD5 de um arquivo. O MD5 é um algoritmo de hash que produz um valor de hash (checksum) baseado no conteúdo do arquivo

Ambos são usados para verificar a integridade dos dados, mas eles operam de maneiras distintas:

- A ETag no S3 pode ser uma entidade mais geral, não restrita ao algoritmo MD5. O S3 pode gerar ETags usando diferentes métodos, dependendo de como o objeto foi carregado
- `md5sum` no Ubuntu sempre usa o algoritmo MD5 para calcular o hash do conteúdo de um arquivo

Se você deseja comparar um ETag específico no S3 com um valor MD5 calculado localmente usando o `md5sum`, é importante garantir que ambos estejam usando o mesmo método de geração de hash (por exemplo, ambos baseados em MD5) para que sejam comparáveis.

# `replace()` e Expressões Regulares

`.replace(/['"]+/g, ``)`

A expressão regular `/['"]+/g` procura por uma ou mais ocorrências (o `+` após `['"]` indica uma ou mais ocorrências) de aspas simples (`'`) ou aspas duplas (`"`) em uma string JavaScript. O `g` no final da expressão regular significa que a busca deve ser global, ou seja, em toda a string.

A substituição está sendo feita por duas aspas graves vazias (`\`\``). Isso efetivamente remove todas as aspas simples e aspas duplas da string.

Então, se você tiver uma string como `"Olá, mundo!"` ou `'Outro exemplo'`, a expressão regular irá encontrá-las e substituí-las por uma string vazia, deixando apenas o texto entre as aspas.

**Por exemplo:**

- `"Olá, mundo!"` após a substituição se tornaria `Olá, mundo!`
- `'Outro exemplo'` após a substituição se tornaria `Outro exemplo`

Observe que a ordem dentro dos colchetes não importa, você está removendo os dois caracteres, eles estando juntos ou não.

# `.json()`

Considere o seguinte cenário:

- Você possui o retorno de uma query feita com o método `.query` do módulo `mysql`
- Você vai enviar este array como uma resposta utilizando o `.json()`
- `res.json(retorno_da_query)`
- O método `.query()` inclui em seu retorno metadados, que não são enumeráveis e também **não são incluídos no corpo da resposta**
- Você pode imprimir a saída de `JSON.stringfy(retorno_da_query)` para verificar isso

# `cluster`

O módulo cluster no Node.js é uma maneira de criar aplicativos escaláveis, aproveitando melhor os recursos de hardware disponíveis. Ele permite que você crie múltiplos processos do Node.js, conhecidos como "workers", que compartilham o mesmo servidor. Cada worker tem sua própria instância do interpretador do Node.js, permitindo a execução concorrente de código.

A principal finalidade do módulo cluster é aproveitar melhor os sistemas multi-core, onde cada core do processador pode executar um worker separado, distribuindo assim a carga de trabalho e melhorando o desempenho global do aplicativo.

Aqui estão alguns conceitos chaves associados ao módulo cluster:

1. **Master process:** é o processo principal que coordena e gerencia os workers, ele não lida diretamente com as solicitações dos clientes, mas cria workers para fazer isso
2. **Worker process:** são instâncias do seu aplicativo que lidam diretamente com as solicitações dos clientes. Cada worker é um processo separado que executa o mesmo código do aplicativo
3. **Balanceamento de carga:** o módulo cluster facilita a distribuição de solicitações entre os workers. Ele pode ser configurado para usar várias estratégias de balanceamento de carga para garantir que cada worker tenha uma carga de trabalho semelhante
4. **Comunicação entre processos:** os workers podem se comunicar entre si e com o processo mestre usando o mecanismo de mensagens integrado no módulo cluster. Isso é útil para coordenar atividades entre os diferentes processos

## `cluster.isMaster`

`cluster.isMaster` é uma propriedade no módulo cluster do Node.js que é utilizada para verificar se o código está sendo executado no processo mestre ou em um worker. Essa propriedade retorna `true` se o processo atual for o processo mestre e `false` se for um worker.

## `cluster.fork()`

`cluster.fork()` é um método no módulo cluster do Node.js que é usado para criar um novo worker. Quando você chama `cluster.fork()`, ele cria uma cópia do processo atual (que será um worker) e executa o mesmo código do aplicativo.

**Assinatura do Método**

```JavaScript
cluster.fork();
```

## `cluster.on()`

O método `cluster.on()` é usado para registrar manipuladores de eventos no objeto `cluster`. Ele permite que você ouça eventos específicos relacionados à execução do cluster, como a criação de novos workers ou a finalização de workers.

**Assinatura do Método**

```JavaScript
cluster.on(event, listener);
```

- `event`**:** uma string que especifica o nome do evento que você deseja ouvir
- `listener`**:** uma função que será chamada sempre que o evento ocorrer

## Exemplo

```JavaScript
const cluster = require("cluster");
const numberCPUs = require("os").cpus().length;
const http = require("http");

if (cluster.isMaster) {
    // Código para o processo mestre.
    console.log(`Master ${process.pid} is running`);

    // Fork workers.
    for (let i = 0; i < numberCPUs; i++) {
        cluster.fork();
    }

    cluster.on("fork", (worker) => {
        console.log(`Novo worker criado: ${worker.id}`);
    });

    cluster.on("online", (worker) => {
        console.log(`Worker online: ${worker.id}`);
    });

    cluster.on("exit", (worker, code, signal) => {
        console.log(`Worker ${worker.process.pid} died`);
    });
} else {
    // Código para os workers. Quando um novo worker é criado usando `cluster.fork()`, ele executa o mesmo arquivo do código Node.js, mas a propriedade `cluster.isMaster` será `false` no contexto dos workers. Portanto, o código dentro do `else` é o que será executado pelos workers.
    console.log(`Worker ${process.pid} started`);

    // Criar um servidor HTTP simples.
    http.createServer((req, res) => {
        res.writeHead(200);
        res.end("Hello World\n");
    }).listen(8000);
}
```