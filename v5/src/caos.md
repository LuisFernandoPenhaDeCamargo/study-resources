# ---

- a rota do data-server do big_winners não válida o array, mó cagada, se eu meter um array `['teste']`, eu recebo a resposta de sucesso, mas caga com o data-server

- Template: "O construtor `new A< construtor >` **...**"
- Termo parse
- Termo fetch
- npm-shrinkwrap.json
- Se eu fizer uma requisição dentro do `axios.interceptors.request.use`, aparentemente, um loop infinito ocorre
- erro: getaddrinfo EAI_AGAIN api.orionapps.net

+ `redis-cli -a crypt0ch1ps ping`

- settings_export.js, remote_query_service.js

## String

## `split`

O método `split` é utilizado para **dividir uma string em um array de substrings com base em um separador fornecido**. Esse separador pode ser uma string ou uma expressão regular. Se o separador não for encontrado ou não for especificado, a string será retornada como um único elemento no array.

### Sintaxe Básica

```JavaScript
string.split([separator[, limit]]);
```

- `separator`**:** especifica o ponto onde cada divisão deve acontecer. Pode ser uma string ou uma expressão regular
- `limit`**:** um número inteiro que especifica o número máximo de substrings a serem retornadas no array. Se definido, a string será dividida no máximo esse número de vezes
- **Retorno:** retonar um array contendo as substrings obtidas após a divisão da string

## Exemplos

```JavaScript
// - Exemplo simples
let text            = "apple,banana,orange";
let fruits          = text.split(",");

console.log(fruits);        // Output: [ 'apple', 'banana', 'orange' ]

// - Exemplo com `limit`
text                = "apple,banana,orange,grape";

const limitedFruits = text.split(",", 2);

console.log(limitedFruits); // Output: [ 'apple', 'banana' ]

// - Exemplo com expressão regular
text                = "apple1banana2orange3grape";
fruits              = text.split(/\d/); // Divide onde houver um número.

console.log(fruits);        // Output: [ 'apple', 'banana', 'orange', 'grape' ]

// - Exemplo sem separador
text                = "apple banana orange";
fruits              = text.split();

console.log(fruits);        // Output: [ 'apple banana orange' ]
```

## `path`

## `dirname`

O método `dirname` retorna o diretório pai (diretório que contém) de um caminho de arquivo.

### Sintaxe Básica

```JavaScript
path.dirname(path);
```

- `path` **(string):** o caminho de arquivo ou diretório cujo diretório pai será retornado
- **Retorno:** retorna uma string com o caminho do diretório pai do caminho fornecido

## Observações

- `dirname`**:** funciona tanto com caminhos absolutos quanto relativos
- Ele simplesmente remove o último segmento do caminho, retornando o diretório que contém o arquivo ou diretório passado como argumento

## Exemplos

```JavaScript
import path from "path";

// - Exemplo com um caminho de arquivo
const filePath     = "/foo/bar/baz/file.txt";

console.log(path.dirname(filePath));     // Output: /foo/bar/baz

// - Exemplo com um caminho de diretório
const dirPath      = "/foo/bar/baz/";

console.log(path.dirname(dirPath));      // Output: /foo/bar

// - Exemplo com caminho relativo
const relativePath = "foo/bar/file.txt";

console.log(path.dirname(relativePath)); // Output: foo/bar
```

## `resolve`

O método `resolve` é utilizado para resolver uma sequência de caminhos ou segmentos de caminho em um caminho absoluto. Ele processa o caminho da direita para a esquerda e constrói um caminho absoluto a partir do que encontrar. Se nenhum dos segmentos de caminho fornecer um caminho absoluto, o caminho atual de trabalho será utilizado.

### Sintaxe Básica

```JavaScript
path.resolve([...paths]);
```

- `...paths` **(string):** uma sequência de segmentos de caminho
- **Retorno:** retorna uma string que representa o caminho absoluto resultante

## Observações

- `resolve` junta os caminhos da direita para a esquerda até obter um caminho absoluto. Se algum dos caminhos for absoluto, esse caminho será o ponto de partida para a resolução
- Se nenhum caminho fornecido for absoluto, o caminho do diretório atual (`process.cwd()`) será utilizado
- Qualquer segmento de caminho que contenha `..` ou `.` será corretamente resolvido
- `resolve` não verifica se o caminho realmente existe, ele apenas constrói um caminho absoluto a partir dos segmentos fornecidos
- Se o caminho absoluto já existir em um dos argumentos, o restante dos segmentos à sua esquerda será ignorado

## Exemplos

```JavaScript
import path from "path";

console.log(path.resolve("/foo/bar", "./baz"));                               // Output: /foo/bar/baz
console.log(path.resolve("/foo/bar", "/tmp/file"));                           // Output: /tmp/file. Como /tmp/file é absoluto, ele ignora /foo/bar.
console.log(path.resolve("wwwroot", "static_files/png/", "../gif/image.gif"));
/*
Output:
/current/working/directory/wwwroot/static_files/gif/image.gif
Se o diretório de trabalho atual for /current/working/directory
*/
```

## Umzug

## `new Umzug();`

O construtor `new Umzug()` **cria uma nova instância da biblioteca Umzug**, que é usada para gerenciar migrações de banco de dados. O Umzug é frequentemente utilizado com o Sequelize para aplicar e desfazer migrações em banco de dados SQL. Aqui está a visão geral sobre como o Umzug funciona:

### Sintaxe Básica

```JavaScript
import { createRequire } from "module";
const require = createRequire(import.meta.url);

import { Umzug, SequelizeStorage } from "umzug";
import { Sequelize }               from "sequelize";

const sequelize = new Sequelize("database", "username", "password", { dialect: "mysql", });
const umzug     = new Umzug({
    migrations: {
        glob:    "path/to/migrations/*.js",
        resolve: ({ name, path, context }) => {
            const migration = require(path);

            return {
                name,
                up:   async () => migration.up(context),
                down: async () => migration.down(context),
            };
        },
    },
    context:    sequelize.getQueryInterface(),
    storage:    new SequelizeStorage({ sequelize }),
    logger:     console,
});
```

- `migrations`**:** configuração das migrações
    + `glob`**:** um padrão glob para localizar arquivos de migração. Exemplo: `"./migrations/*.js"`
    + `resolve`**:** função que define como resolver uma migração, recebendo o caminho do arquivo
- `context`**:** um objeto que pode ser passado para as migrações, como o `queryInterface`
- `storage`**:** o mecanismo de armazenamento onde as migrações executadas são rastreadas
- `logger`**:** um método de log, geralmente usado para customizar a saída de logs
- **Retorno:** retorna uma nova instância de Umzug, que pode ser usada para gerenciar as migrações

## Observações

A propriedade `logger` pode ser usada para definir uma função de registro (logging) customizada que você pode passar para personalizar como as mensagens de log de migração são tratadas. Ela permite que você capture ou redirecione logs de operações de migração, como aplicar ou desfazer migrações.

### Estrutura do logger

O objeto `logger` deve implementar pelo menos os seguintes métodos:

- `info(message: string)`**:** usado para informações gerais de log, como quando uma migração foi aplicada
- `warn(message: string)`**:** usado para avisos durante o processo de migração
- `error(message: string)`**:** usado para capturar e logar erros que acontecem durante as migrações

### Exemplo

```JavaScript
import { Umzug, SequelizeStorage } from "umzug";
import { Sequelize }               from "sequelize";

const sequelize    = new Sequelize("database", "username", "password", { dialect: "mysql", });
// Exemplo de um logger customizado.
const customLogger = {
    info:  (message) => console.log(`[ INFO ]: ${message}`);
    warn:  (message) => console.warn(`[ WARN ]: ${message}`);
    error: (message) => console.error(`[ ERROR ]: ${message}`);
};
// Configurando o Umzug com o logger customizado.
const umzug        = new Umzug({
    migrations: { glob: "./migrations/*.js", },
    context:    sequelize.getQueryInterface(),
    storage:    new SequelizeStorage({ sequelize }),
    logger:     customLogger,
});

await umzug.up();
```

## `pending`

O método `pending` é utilizado para **listar todas as migrações pendentes** (aquelas que ainda não foram aplicadas).

### Sintaxe Básica

```JavaScript
umzug.pending();
```

- **Retorno:** retonar uma promessa que resolve para uma lista de migrações que ainda não foram executadas (pendentes)

## Exemplo

```JavaScript
import { Umzug, SequelizeStorage } from "umzug";
import { Sequelize }               from "sequelize";

const sequelize = new Sequelize("database", "username", "password", { dialect: "mysql", });
const umzug     = new Umzug({
    migrations: { glob: "./migrations/*.js", },
    context:    sequelize.getQueryInterface(),
    storage:    new SequelizeStorage({ sequelize }),
});

umzug.pending().then((migrations) => {
    console.log("Pending migrations:", migrations);
});
```

## `up`

O método `up` é utilizado para **executar migrações pendentes**. Ele faz parte do fluxo principal do Umzug para gerenciar migrações de banco de dados.

### Sintaxe Básica

```JavaScript
await umzug.up();
```

- **Retorno:** retorna uma promessa que, ao ser resolvida, contém uma lista das migrações que foram aplicadas. Se nenhuma migração for aplicada, a lista estará vazia
    + O retorno é um array de objetos representando as migrações que foram aplicadas
    + Cada objeto no array contém uma propriedade `name` que indica o nome do arquivo de migração ou o nome da migração aplicada

## `executed`

O método `executed` é utilizado para **obter todas as migrações que já foram aplicadas com sucesso**.

### Sintaxe Básica

```JavaScript
umzug.executed();
```

- **Retorno:** o método retorna uma promessa que resolve com um array de migrações que foram executadas. Cada item no array representa uma migração que já foi aplicada

## Exemplo

```JavaScript
import { Umzug, SequelizeStorage } from "umzug";
import { Sequelize }               from "sequelize";

const sequelize = new Sequelize("database", "username", "password", { dialect: "mysql", });
const umzug     = new Umzug({
    migrations: { glob: "./migrations/*.js", },
    context:    sequelize.getQueryInterface().
    storage:    new SequelizeStorage({ sequelize }),
});

umzug.executed().then((migrations) => {
    console.log("Executed migrations:", migrations);
}).catch((error) => {
    console.error("Error fetching executed migrations:", error);
});
```

## `parseInt`

A função `parseInt` é utilizada para **converter uma string em um número inteiro**. Ela interpreta a string fornecida e tenta extrair um número inteiro com base no sistema númerico especificado (base ou radix).

### Sintaxe Básica

```JavaScript
parseInt(string[, radix]);
```

- `string`**:** a string a ser convertida. O método tentará analisar o valor inicial da string para um número inteiro
- `radix`**:** um número inteiro entre 2 e 36 que representa a base númerica usada na conversão. Se não especificado, a base padrão é 10 (decimal). Se a string começar com "0x" ou "0X", a base padrão será 16 (hexadecimal)
- **Retorno:** retorna um número inteiro correspondente ao valor da string, ou `NaN` (Not-a-Number) se a conversão falhar

## Exemplos

```JavaScript
// - Exemplo simples: convertendo uma string decimal para inteiro
const num       = parseInt("42");

console.log(num);       // Output: 42

// - Exemplo com radix: convertendo uma string hexadecimal (base 16) para inteiro
const hex       = parseInt("0x1F, 16");

console.log(hex);       // Output: 31

// - Exemplo com radix: convertendo uma string binária (base 2) para inteiro
const binary    = parseInt("1010", 2);

console.log(binary);    // Output: 10

// - Exemplo com string inválida: quando a string não pode ser interpretada como um número, o retorno será `NaN`
const invalid   = parseInt("hello");

console.log(invalid);   // Output: NaN

// - Ignorando caracteres não númericos: o `parseInt` só considera os caracteres iniciais até que encontre algo que não possa ser parte de um número válido
const mixed     = parseInt("123abc");

console.log(mixed);     // Output: 123

// - Cuidado com valores de radix: se a base (radix)  for muito alta ou baixa, ou se não for um número válido, o retorno pode ser inesperado
const wrongBase = parseInt("10", 37); // Radix inválido.

console.log(wrongBase); // Output: NaN
```

## Prático

```SQL
DELETE FROM SequelizeMeta WHERE name = '20240828170000-fix-jackpot-procedure.js' OR name = '20240828170000-fix-wichmann_hill_rand.js';
SELECT * FROM SequelizeMeta;
CALL raffle_jackpot_prize;
SHOW CREATE PROCEDURE raffle_accumulated_prize;
```

// Porque eu uso um stub no console.log ao invés de um spy?
// remover a classe de dentro do beforeEach
// Preciso lançar uma migração para adicionar a db_version, aparentemente
// Eu preciso att todas as migrações por estar usando uma nova versão do Umzug
// ex de tratamento de callbacks x promessas (promessas com await)
// log de gravação do servidor vai pra onde?

### 4. **Teste de Tratamento de Erros**
   Garantir que o erro é capturado corretamente e a mensagem de erro apropriada é exibida no console.

   **Exemplo de Teste:**
   ```javascript
   it('should handle errors and log the error message', async () => {
       const consoleErrorStub = sinon.stub(console, 'error');
       const umzugStub = sinon.stub(Umzug.prototype, 'up').throws(new Error('Test error'));

       await yourMigrationFunction('up');

       expect(consoleErrorStub.calledWith('[ migrate.mjs Error ], Test error')).to.be.true;
   });
   ```

Esses testes cobrem as principais funcionalidades, como a execução de migrações, o armazenamento no banco de dados, e o tratamento de erros.

## ---

Eu agrupo os blocos de código em importações, declarações, expressões e impressões, separando as importações em: <F

- Bloco utilizado para criar o require mais as importações dos módulos legados
- Dependências externas
- Módulos nativos
- Módulos próprios

Quando eu me refiro a blocos, quer dizer que eu pulo uma linha entre esses "tipos" de bloco. Eu também pulo uma linha entre declarações de classe e funções.

As importações e as declarações aparecem na ordem em que são utilizadas. Sendo que as importações devem estar todas no começo do módulo.

Dependendo da quantidade de elementos em um array ou propriedades de um objeto, eu as distribuo em várias linhas e alinho os seus valores (no caso dos objetos), considerando a coluna da direita. Também alinho atribuições.

Eu sempre pontuo uma vírgula na última propriedade do objeto, para facilitar a adição de novas propriedades.

Vou declarar constantes antes de let, pois para inicializar constantes você precisa atribuir valores a elas, com isso, declarações com let que iram receber valores na inicialização, devem vir depois das declarações let sem valores na inicialização

testes:

should call these methods n times per function call
quando a ação é realizada com sucesso
    verifique args
    retorno
    thisValue
    se o objeto é uma instância de
        de acordo com o que fizer sentido
should handle the errors below

Obs

métodos que leem arquivos, ou informam caminhos no sistema hierárquico costumam dar dor de cabeça na hora de prever o comportamento

- path.dir
- array.forEach
- ex para documentação: // array.forEach também realiza ações não relacionadas a src/migrate.js neste teste.

Regra de négocio:

Define settings.db_version, que é a maior data de uma migração aplicada. Isso depende do nome do arquivo da migração, pois, se você criar uma nova migração e 
colocar uma data menor, settings.db_version não será atualizada.

verificar se filenumber é incluido no sea

-> dificuldade de testes: delete require.cache[require.resolve("../fix_transpiled_files")];

---

o Sequelize precisa da dependência mysql para funcionar?

Sim, o Sequelize precisa da dependência específica do banco de dados que você está utilizando. Se estiver usando o MySQL, será necessário instalar o pacote `mysql2` para o Sequelize se conectar ao banco. O pacote `mysql2` é mais moderno e recomendado para uso com o Sequelize.

Para instalar o `mysql2`, você pode usar o seguinte comando:

```bash
npm install mysql2
```

O Sequelize funciona com outros bancos de dados também (PostgreSQL, SQLite, MSSQL, etc.), mas para cada um, é necessário instalar a respectiva dependência.

---

todo ORM funciona assim?

A maioria dos ORM (Object-Relational Mapping) funciona de maneira semelhante, exigindo uma dependência específica do banco de dados para se conectar e realizar operações. Aqui estão algumas características comuns entre ORMs populares:

1. **Dependência do Banco de Dados**: Cada ORM geralmente requer uma biblioteca ou driver específico para o banco de dados que você está utilizando. Por exemplo:
   - **Sequelize**: Para MySQL, você precisa do `mysql2`; para PostgreSQL, do `pg` e `pg-hstore`.
   - **TypeORM**: Para MySQL, também requer `mysql`, enquanto para PostgreSQL, precisa de `pg`.
   - **Django ORM**: Para usar com MySQL, você precisa instalar `mysqlclient`.

2. **Abstração de Consultas**: Os ORMs abstraem as operações de consulta, permitindo que os desenvolvedores interajam com o banco de dados usando a linguagem de programação (como JavaScript, Python, etc.) em vez de escrever SQL diretamente. Isso melhora a legibilidade e a manutenção do código.

3. **Modelos e Mapeamento**: ORMs usam modelos para representar tabelas do banco de dados. Cada modelo é geralmente uma classe que representa uma tabela, e as instâncias dessa classe representam linhas dessa tabela.

4. **Migrações**: A maioria dos ORMs oferece suporte a migrações, que são usadas para modificar a estrutura do banco de dados de forma controlada, permitindo adicionar ou remover tabelas e colunas ao longo do tempo.

5. **Funcionalidade de Relacionamento**: ORMs geralmente oferecem suporte a relacionamentos entre modelos, permitindo que você defina associações como um-para-um, um-para-muitos e muitos-para-muitos.

6. **Suporte a Vários Bancos de Dados**: Muitos ORMs têm suporte a múltiplos bancos de dados, o que permite que os desenvolvedores mudem de um banco de dados para outro sem ter que reescrever todo o código.

Embora a maioria dos ORMs compartilhe essas características, a implementação específica e os recursos podem variar de um ORM para outro. Por isso, é importante consultar a documentação de cada ORM para entender suas particularidades e requisitos.

---

hasOwnProperty('0') em um array verifica o que?

Quando você usa `hasOwnProperty('0')` em um array, o que está sendo verificado é se o **índice `0`** é uma propriedade **própria** do array, ou seja, se há um elemento na posição `0` do array.

Em JavaScript, os arrays são objetos especiais onde os índices são tratados como propriedades numéricas. O método `hasOwnProperty()` verifica se um array tem uma propriedade (ou índice) específica.

### Exemplo:
```javascript
const arr = [10, 20, 30];

console.log(arr.hasOwnProperty('0')); // true, porque existe um elemento no índice 0
console.log(arr.hasOwnProperty('1')); // true, porque existe um elemento no índice 1
console.log(arr.hasOwnProperty('3')); // false, porque o array não tem um elemento no índice 3
```

### Como funciona:
- O método verifica se o índice **`0`** (que é uma propriedade) existe como uma propriedade própria do array.
- No caso do array `arr = [10, 20, 30]`, o índice `0` contém o valor `10`, portanto, `hasOwnProperty('0')` retorna `true`.

### Importante:
- O método espera uma **string** que representa o nome da propriedade (mesmo para índices numéricos). Por isso, `hasOwnProperty(0)` é equivalente a `hasOwnProperty('0')`, pois os índices numéricos de um array são convertidos internamente para strings.
  
  ```javascript
  console.log(arr.hasOwnProperty(0));  // true
  console.log(arr.hasOwnProperty('0'));  // true
  ```

### Exemplos adicionais:

1. **Array vazio**:
   ```javascript
   const emptyArr = [];
   console.log(emptyArr.hasOwnProperty('0')); // false, o array está vazio e não tem o índice 0
   ```

2. **Array com buracos (elementos ausentes)**:
   ```javascript
   const sparseArr = [10, , 30];  // Elemento no índice 1 está ausente (buraco)
   console.log(sparseArr.hasOwnProperty('0')); // true
   console.log(sparseArr.hasOwnProperty('1')); // false, o índice 1 está vazio
   console.log(sparseArr.hasOwnProperty('2')); // true
   ```

### Resumo:
- `hasOwnProperty('0')` em um array verifica se o índice `0` tem um valor definido (ou seja, se o índice `0` é uma propriedade própria do array).
- O método retorna `true` se o índice for uma propriedade do array e contém um valor (mesmo que seja `undefined` explicitamente definido), e `false` se o índice não estiver definido.

---

quando eu uso o interceptors do axio e adiciona a

config.headers.Authorization = Bearer                         ;

o espaço em branco é removido?

Sim, quando você adiciona um cabeçalho `Authorization` usando um espaço em branco, o Axios (ou qualquer outra biblioteca que manipule cabeçalhos HTTP) pode remover os espaços em branco excessivos. No entanto, isso depende de como o cabeçalho é tratado e como os valores são formatados.

### Exemplos de Comportamento

1. **Adicionando o Cabeçalho com Espaços:**
   Se você fizer algo como:

   ```javascript
   axios.interceptors.request.use(config => {
       config.headers.Authorization = `Bearer                         `;
       return config;
   });
   ```

   É possível que a maioria dos servidores ignore os espaços em branco adicionais ao processar o cabeçalho `Authorization`. No entanto, a **forma correta** de usar o cabeçalho de autorização seria sem espaços em branco extras.

2. **Comportamento do Servidor:**
   Quando você envia uma requisição com um cabeçalho `Authorization` que contém espaços em branco, o servidor que recebe essa requisição pode:
   - Ignorar os espaços e tratar o valor como se fosse apenas `Bearer` (ou seja, ele pode não reconhecer o token).
   - Retornar um erro de autenticação porque o valor esperado não está formatado corretamente.

### Boas Práticas
Para garantir que o cabeçalho `Authorization` seja corretamente processado, evite adicionar espaços em branco extras. O valor deve ser algo como:

```javascript
axios.interceptors.request.use(config => {
    const token = 'seu_token_aqui';
    config.headers.Authorization = `Bearer ${token}`;
    return config;
});
```

### Conclusão
Os espaços em branco adicionais podem ser problemáticos ao lidar com tokens de autenticação. Para evitar possíveis problemas, sempre formate os cabeçalhos de maneira adequada, sem espaços em branco desnecessários. Se você já tiver um token, use-o diretamente sem concatenar espaços.

O AXIOS REMOVEEEE, NO DATA-SERVER VAI "Bearer" (comprimento 6)

logo a verificação de se o token tem comprimento 0 é meio merda, porque esse caso nunca vai rolar (se você usar esta verificação antes `!header.startsWith('Bearer ')`)

---

sobre o data, quando enviamos um objeto:

{ big_winners: bigWinners }

onde bigWinners é um array de objetos, para quais tipos ele é transformado?

assim, cada posição do array é um objeto que é composto por [Object Number], [Object String], [Object Null]?

Quando você envia um objeto no corpo de uma requisição usando `axios.post`, o objeto é convertido para JSON, que é o formato de dados aceito pela maioria das APIs. Portanto, o array de objetos que você está enviando é serializado para JSON, e cada elemento do array mantém o tipo original de seus valores (números, strings, nulos, etc.), com base nas regras do JSON.

### Exemplo:
Quando você envia:

```javascript
const bigWinners = [
  { name: 'Alice', score: 100 },
  { name: 'Bob', score: 90 },
  { name: 'Carol', score: null }
];

axios.post('https://api.example.com/winners', { big_winners: bigWinners });
```

Isso será transformado em:

```json
{
  "big_winners": [
    { "name": "Alice", "score": 100 },
    { "name": "Bob", "score": 90 },
    { "name": "Carol", "score": null }
  ]
}
```

### Como os tipos são tratados

Em JSON, os valores no array mantêm seus tipos nativos de JavaScript, que são convertidos para tipos válidos no JSON:

- **Números (`Number`)**: Mantêm-se como números no JSON (não existem objetos específicos como `[Object Number]` no JSON). Exemplo: `100` permanece como `100`.
- **Strings (`String`)**: Permanecem como strings no JSON. Exemplo: `"Alice"` permanece como `"Alice"`.
- **Nulos (`Null`)**: São convertidos para `null` no JSON. Exemplo: `null` permanece `null`.
- **Objetos**: Cada objeto dentro do array será representado como um objeto JSON, com suas propriedades e valores correspondentes.

### Tipos de Dados em JSON

O JSON suporta os seguintes tipos de dados:

1. **Números** (`Number`): Representados diretamente, como `100`, `3.14`.
2. **Strings** (`String`): Representadas como texto entre aspas, como `"Alice"`.
3. **Booleanos** (`Boolean`): Valores `true` ou `false`.
4. **Nulos** (`Null`): Representados como `null`.
5. **Arrays** (`Array`): Representados como listas ordenadas de valores entre colchetes.
6. **Objetos** (`Object`): Representados como coleções de pares chave-valor entre chaves.

### Resumo

Quando você envia o objeto `bigWinners`, onde cada elemento do array é um objeto contendo valores como números, strings e nulos, esses valores são convertidos para seus equivalentes em JSON:

- **Número** -> permanece como número.
- **String** -> permanece como string.
- **Null** -> permanece como `null`.
- **Array** -> é convertido para um array JSON.
- **Objeto** -> é convertido para um objeto JSON.

Não há conversão para "tipos de objeto" como `[Object Number]` ou `[Object String]`, pois esses não são conceitos válidos no formato JSON. O Axios serializa o objeto para um formato JSON simples.

---

enums (banco de dados) mantém o tipo respectivo? Por exemplo, se o enum for enum(1, 2, 3), serão números e se for enum('a', 'b'), será strings?

Em bancos de dados, o tipo **ENUM** (ou **enumeração**) é usado para definir uma lista de valores possíveis para uma coluna. A maneira como os valores são armazenados e tratados pode variar de acordo com o banco de dados, mas, em geral, os valores no `ENUM` são armazenados como **strings**, independentemente de serem numéricos ou não.

### Como os valores `ENUM` funcionam:

1. **Valores numéricos no `ENUM`:**
   - Mesmo que você defina o `ENUM` com valores numéricos, como `ENUM(1, 2, 3)`, esses números serão tratados internamente como **strings**.
   - Ao armazenar esses valores, o banco de dados os mantém como strings (ou internamente como inteiros correspondentes à posição do valor na enumeração), mas ao realizar consultas, eles são retornados como strings.

   Exemplo:
   ```sql
   CREATE TABLE example (
       status ENUM(1, 2, 3)
   );

   INSERT INTO example (status) VALUES (1);
   SELECT status FROM example; -- Retorna '1', que é tratado como string.
   ```

2. **Valores de texto no `ENUM`:**
   - Quando você usa strings, como `ENUM('a', 'b', 'c')`, esses valores são claramente tratados como strings e armazenados dessa forma.

   Exemplo:
   ```sql
   CREATE TABLE example (
       status ENUM('a', 'b', 'c')
   );

   INSERT INTO example (status) VALUES ('a');
   SELECT status FROM example; -- Retorna 'a'.
   ```

### Funcionamento Interno

Internamente, muitos bancos de dados (como MySQL) armazenam os valores de `ENUM` como **índices numéricos**, onde cada valor da enumeração tem um índice começando em 1. Então, mesmo que o valor seja tratado como string em consultas e manipulações, ele pode ser representado por números em segundo plano.

Por exemplo:
- Para `ENUM('a', 'b', 'c')`, internamente:
  - `'a'` pode ser armazenado como `1`,
  - `'b'` como `2`,
  - `'c'` como `3`.

Mesmo que internamente seja um número, as operações de leitura ou gravação consideram os valores como strings.

### Resumo:

- **ENUM com números**, como `ENUM(1, 2, 3)`, **será tratado como strings**, e os valores serão retornados como strings (`'1'`, `'2'`, `'3'`), apesar de serem armazenados como índices internamente.
- **ENUM com strings**, como `ENUM('a', 'b', 'c')`, manterá os valores como strings e será retornado dessa forma.

Se você deseja manipular números diretamente (como realizar operações matemáticas), é melhor usar outro tipo de dado, como `INT`, pois o `ENUM` não é adequado para operações numéricas, uma vez que trata seus valores como strings.

---

sobre JSON e datas?

Quando se trata de **datas no JSON**, o formato padrão usado é uma **string** com um valor de data em conformidade com o formato ISO 8601. O JSON não tem um tipo de dado específico para **datas** (como "Date" em JavaScript), então as datas são representadas como strings.

### Formato Padrão para Datas no JSON

O formato mais comum para representar datas no JSON é o **ISO 8601**, que se parece com isso:

```json
"2024-10-07T14:48:00.000Z"
```

Este formato segue a convenção:
- `YYYY-MM-DD` (Ano-Mês-Dia)
- `T` para separar a data e a hora.
- `HH:MM:SS.sssZ` (Hora:Minuto:Segundo.Milissegundos e o indicador de fuso horário, `Z` para UTC).

Exemplo completo:
```json
{
  "eventDate": "2024-10-07T14:48:00.000Z"
}
```

### Como JSON Lida com Datas

- **String ISO 8601**: Datas são sempre tratadas como strings. O formato padrão é ISO 8601, que é amplamente aceito e facilita a manipulação em várias linguagens e plataformas.
- **Sem suporte nativo para `Date`**: JSON não tem um tipo específico para datas, por isso todas as datas devem ser representadas como strings, ao contrário de linguagens como JavaScript que possuem um objeto `Date`.

### Lidando com Datas no JSON

1. **Enviando Datas em JSON**: 
   Quando você precisa enviar uma data em uma requisição JSON, deve serializar a data para uma string. Em JavaScript, por exemplo, você pode usar o método `toISOString()` para converter um objeto `Date` para o formato ISO 8601:
   
   ```javascript
   const date = new Date();
   const json = JSON.stringify({ eventDate: date.toISOString() });
   console.log(json); // {"eventDate":"2024-10-07T14:48:00.000Z"}
   ```

2. **Recebendo Datas em JSON**:
   Quando você recebe um JSON que contém datas, elas chegam como strings. Você precisará convertê-las de volta para objetos de data na linguagem que está usando. Em JavaScript, por exemplo, você pode usar o construtor `Date`:
   
   ```javascript
   const json = '{"eventDate":"2024-10-07T14:48:00.000Z"}';
   const obj = JSON.parse(json);
   const eventDate = new Date(obj.eventDate);
   console.log(eventDate); // Mon Oct 07 2024 14:48:00 GMT+0000 (UTC)
   ```

### Considerações:

- **Fuso Horário**: O formato ISO 8601 inclui o indicador de fuso horário (`Z` significa UTC). Se não estiver presente, a data será interpretada como no horário local, o que pode causar problemas de sincronização entre diferentes fusos horários.
- **Precisão**: A precisão pode incluir até milissegundos, o que é útil em sistemas que precisam de alta precisão temporal.

### Alternativas para Armazenar Datas no JSON

Além do formato ISO 8601, algumas abordagens comuns para representar datas em JSON incluem:

1. **Timestamp Unix (Epoch Time)**:
   - Representa a data como o número de **segundos ou milissegundos** desde 1º de janeiro de 1970 (também chamado de **Unix Time**).
   - Exemplo de data em **milissegundos** desde 1970:
     ```json
     {
       "eventDate": 1726502880000
     }
     ```

   Você pode usar o timestamp em JavaScript assim:
   ```javascript
   const timestamp = Date.now(); // Retorna o número de milissegundos desde 1º de janeiro de 1970
   const date = new Date(timestamp); // Converte de volta para uma data
   ```

2. **Strings personalizadas**:
   - Algumas APIs podem usar formatos de string personalizados para datas (como `DD/MM/YYYY` ou `MM-DD-YYYY`). Embora seja possível, é menos padronizado e pode causar problemas de compatibilidade.

### Resumo

- **JSON não tem suporte nativo para datas**, então as datas são enviadas e recebidas como strings.
- O formato mais comum é o **ISO 8601**, que é uma string padronizada com informações completas de data, hora e fuso horário.
- Alternativas incluem timestamps Unix, mas o formato ISO 8601 é geralmente preferido por ser mais legível e amplamente aceito.

---

bigWinners.forEach(({ id, ...register }, index) => {
            IDs[index]       = id;
            register.created = formatDate(register.created);
            registers[index] = register;
            console.log('register:', register);
        });

esse é o operador de propagação? Como ele entende que na desestruturação a gente quer todas as propriedades do objeto com excessão de id?

Sim, o código que você mostrou está usando o **operador de propagação** (`...`), também chamado de **rest operator** no contexto da desestruturação. Esse operador permite coletar todas as propriedades restantes de um objeto, exceto as que foram explicitamente desestruturadas.

### Como o operador de desestruturação com `rest` funciona:

No seu exemplo:

```javascript
bigWinners.forEach(({ id, ...register }, index) => {
    IDs[index] = id;
    register.created = formatDate(register.created);
    registers[index] = register;
    console.log('register:', register);
});
```

Aqui está o que está acontecendo:

1. **Desestruturação de `id`**:
   - `{ id, ...register }` é uma desestruturação de objetos.
   - Ao usar `{ id, ...register }`, você está dizendo explicitamente: *"Quero pegar a propriedade `id` e armazená-la em uma variável chamada `id`."*

2. **Operador `rest` (`...register`)**:
   - Depois de "extrair" a propriedade `id`, o operador `rest` (`...register`) coleta **todas as outras propriedades restantes** do objeto e as armazena em um novo objeto chamado `register`.
   - Isso significa que todas as propriedades do objeto original, exceto `id`, são copiadas para `register`.

### Exemplo mais simples:

Imagine que você tenha um objeto `bigWinner` assim:

```javascript
const bigWinner = {
  id: 1,
  machine: 'M1',
  game: 'G1',
  prize: 100,
  bet: 10,
  line: 20,
  created: '2024-10-07',
  prize_name: 'Gold',
  is_forced: false
};
```

Agora, se você fizer:

```javascript
const { id, ...rest } = bigWinner;
```

O que está acontecendo é:

- `id` vai armazenar o valor `1`.
- `...rest` vai coletar todas as outras propriedades e criar um novo objeto que contém:

```javascript
{
  machine: 'M1',
  game: 'G1',
  prize: 100,
  bet: 10,
  line: 20,
  created: '2024-10-07',
  prize_name: 'Gold',
  is_forced: false
}
```

### Resumo:

- **Desestruturação**: `{ id, ...register }` extrai a propriedade `id` do objeto original.
- **Rest operator** (`...register`): Coleta todas as outras propriedades do objeto original, com exceção de `id`, e as coloca em um novo objeto chamado `register`.
- Isso é útil quando você quer manipular um subconjunto das propriedades de um objeto, sem precisar listar explicitamente todas elas.

Essa técnica facilita a manipulação de objetos de forma mais clara e concisa, especialmente quando você sabe que deseja excluir apenas uma ou algumas propriedades.

---

se não estipularmos um status na resposta o express retorna por default 200?

Sim, no **Express**, se você não definir explicitamente um código de status na resposta, o servidor retorna o **código de status 200** por padrão, o que indica que a solicitação foi bem-sucedida.

### Exemplo sem definir status:
```javascript
app.get('/example', (req, res) => {
  res.send('Resposta sem definir o status');
});
```

Nesse caso, o Express retornará uma resposta com o código de status **200 OK**.

### Definindo explicitamente o status:
Se você quiser definir outro código de status, pode usar o método `res.status()`:

```javascript
app.get('/example', (req, res) => {
  res.status(404).send('Recurso não encontrado');
});
```

Aqui, a resposta terá o código de status **404**.

### Conclusão:
Se nenhum código de status for explicitamente definido, o **Express retorna 200** por padrão, o que indica que a operação foi bem-sucedida.

---

# v5

- ;(async () => {}); O que o ponto e vírgula nessa estrutura significa?
- Regex: o que são grupos de captura? (`()`)
- Regex: definindo conjunto de caracteres (`[]`)
- Regex: o que é um conjunto negado (exemplo: `[^/]`)
- Regex: `+`
- O papel de `^` em expressões regulares

## 

# Testes Unitários

- **fix_transpiled_files.js**
- **migrate.mjs**
- **helpers/format_date.mjs**
- **helpers/v1_get_server_id.mjs**
- **services/sensitive_data_getters.mjs:**
    + generateAccessToken     passa para api                       -> getTemporaryCredentials passa para api
    + generateAccessToken     falha para api e passa para api-test -> getTemporaryCredentials passa para api-test
    + generateAccessToken     falha para api e falha para api-test
    + generateAccessToken     passa para api                       -> getTemporaryCredentials falha para api
    + generateAccessToken     falha para api e passa para api-test -> getTemporaryCredentials falha para api-test

# Anotações

- **2495:** 836ac6f94c93b1de1e176424ca6a7c9d956b19da4a511199b61aeebf2b2d3348db6181d11c0da0d4ed0657668a2af775a404618af65f57f1b9926a193a618b59
- **2276:** fee5d4acdd915f9032b7d6a850f262deedef8532debf24a8cfbb836d3836c52323033d426437df25191a2e6192e330aa41c1a69772575362b7e7201277ae367d
- **SQL**
    + DELETE FROM SequelizeMeta WHERE name = '20240828170000-fix-jackpot-procedure.js' OR name = '20240828170000-fix-wichmann_hill_rand.js';
    + UPDATE big_winners SET exported = 0;

// talvez seja o dump do banco?
// ver os cron?
// 2620
// 2639
// 14h

Você pode definir uma propriedade customizada no header, mas definir o valor dela como `undefined` pode causar problemas, dependendo de como o Axios (ou o servidor) processa esse valor.

No caso específico do Axios, se você definir uma propriedade do header com `undefined`, ela poderá ser ignorada ou, em algumas implementações, pode até causar erros. Uma prática comum seria verificar se o valor está `undefined` antes de atribuir:

```javascript
const customValue = someValue !== undefined ? someValue : 'default-value';
axios.post(url, data, {
  headers: {
    'X-Custom-Header': customValue
  }
});
```

Assim, você evita passar `undefined` diretamente. Se o objetivo é não definir a propriedade, você poderia simplesmente não incluí-la no header caso o valor esteja `undefined`.

// <F ARRUME AS MIGRAÇÕES, FAÇA OS TESTES UNITÁRIOS E AI TENTE COMPACTAR AS MIGRAÇÕES SADGE

- helpers/configuring_interceptors
- helpers/format_date.mjs
- helpers/response_error.mjs
- helpers/validate_server_id.mjs
- services/ sensitive_data_getters.mjs
- tasks/authenticate.mjs
- tasks/bigwinners_export.mjs
- tasks/index.mjs
- src/fix_transpiled_files.js
- src/migrate.mjs

---

o fix não arrumou o client e o migrate <FFFFFFFFFFFFFFffff

qual a difença entre "./db/migrations/**/*.js" e "./db/migrations/*.js"?

validação do ID do servidor, você tem uma variável de ambiente com o valor, mas obtém ele normalmente do banco
- se o cara trocar o valor no banco, ele pode exportar valores para outro servidor, não tratamos isso
- se um erro ocorrer na função e o valor do server ficar como undefined, não tratamos isso também
- a gente usa o primeiro hash pra tudo, ele só varia no servição de autenticação
- o generateserverhash usa o algoritmo sha-512
- o authenticate usa o algoritmo sha3-512

- Padrão de formatação do código fonte
- Padrão de formatação para as anotações do meu repositório pessoal