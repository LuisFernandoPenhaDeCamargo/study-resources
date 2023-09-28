# Bibliotecas.

# <a name = "umzug"></a>`umzug`

O pacote `umzug` é uma biblioteca para migração de bancos de dados em Node.js. Ele fornece uma maneira fácil de criar e executar migrações de banco de dados, permitindo que você gerencie alterações na estrutura do banco de dados ao longo do tempo, mantendo um histórico de migrações.

Seu método construtor recebe um objeto de configuração como parâmetro e suas principais propriedades serão explicadas se utilizando do exemplo abaixo.

```JavaScript
var umzug = new Umzug({
    storage: 'sequelize', //Tipo de armazenamento para rastrear migrações
    storageOptions: {
        sequelize: models.sequelize //Opções específicas do armazenamento (no caso, Sequelize)
    },
    migrations: {
        path: `${__dirname}/db/migrations/`, //Caminho para o diretório de migrações
        params: [models.sequelize.getQueryInterface(), models.Sequelize, models] //Parâmetros a serem passados para as migrações
    },
    'migrations-path': path.resolve('db', 'migrations') //Caminho absoluto para o diretório de migrações
});

```

- `storage`: define o tipo de armazenamento a ser usado pelo `Umzug` para rastrear as migrações. No exemplo, está sendo utilizado o armazenamento do Sequelize.\
    Você está especificando o tipo de armazenamento a ser usado em tempo de código. Nesse contexto, o termo "armazenamento" se refere à maneira como o `Umzug` rastreia e gerencia informações sobre as migrações de banco de dados. Isso geralmente envolve a criação de tabelas no banco de dados para armazenar informações sobre as migrações aplicadas e seus estados;
- `storageOptions`: fornece opções específicas para o armazenamento escolhido. Neste caso, as opções estão configuradas para o Sequelize, onde você passa a instância do Sequelize como `sequelize`. A propriedade de storageOptions (`sequelize`) recebe uma instância do Sequelize que será usada pelo `Umzug` para interagir com o banco de dados e executar as migrações;
- `migrations`: define as configurações relacionadas às migrações:
    - `path`: especifica o caminho para o diretório onde suas migrações estão localizadas;
    - `params`: define os parâmetros que serão passados para as migrações quando forem executadas. Neste exemplo, está sendo passado três parâmetros:
        - Um objeto retornado pelo método `.getQueryInterface()`;\
            Este objeto permite que você execute consultas SQL diretamente ou crie migrações para alterar o esquema do banco de dados. Portanto, este primeiro elemento fornece à migração a capacidade de interagir com o banco de dados por meio do objeto retornado por `.getQueryInterface()`.
        - A classe `Sequelize`;\
            Aqui está sendo passada a classe `Sequelize` do Sequelize. Isso pode ser útil para migrações que precisam acessar a funcionalidade **global do Sequelize** ou realizar configurações específicas do Sequelize durante a migração.
        - E o objeto `models`.\
            Este é o objeto que contém os modelos Sequelize **desta aplicação**. Passar `models` como parâmetro permite que as migrações acessem os modelos desta aplicação e realizem operações relacionadas ao banco de dados que envolvem esses modelos.
    Em resumo, ao definir esses parâmetros no `Umzug`, você está fornecendo às migrações a capacidade de interagir com o banco de dados, acessar modelos Sequelize e realizar operações de migração que podem envolver consultas SQL ou alterações no esquema do banco de dados. Cada elemento do array `params` é uma ferramenta que pode ser usada pelas migrações para realizar seu trabalho.


# <a name = "requestpromisenative"></a>`request-promise-native`

Biblioteca utilizada para fazer solicitações HTTP de forma assíncrona no Node.js com suporte a Promises. É uma extensão do módulo request-promise, oferecendo as mesmas funcionalidades, mas com o uso nativo de Promises, o que torna o código mais limpo e legível quando se trata de fazer solicitações HTTP e lidar com respostas.

# JavaScript.

# Node.js

- [`.resolve()`;](#resolve)
- [`.hostname()`;](#hostname)
- [`.cpus()`.](#cpus)

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

console.log("Caminho absoluto:", caminhoAbsoluto); ///home/orion/APIs/orion-data-api
```

Outro exemplo que mostra a **importância de se especificar partes do caminho relativo**.

```JavaScript
const path = require('path');

console.log(path.resolve("migrations"));       ///home/orion/APIs/orion-data-api/migrations: este caminho está incorreto.

console.log(path.resolve("db", "migrations")); ///home/orion/APIs/orion-data-api/db/migrations
```

## <a name = "os"></a>`os`

É um módulo que fornece informações e utilitários relacionados ao sistema operacional do servidor em que o código Node.js está sendo executado. Ele permite que você acesse informações sobre o sistema, como informações sobre a CPU, memória, diretórios padrão e muito mais.

### <a id = "hostname"></a>`.hostname()`

É usado para obter o nome do host no qual o código Node.js está sendo executado. O nome do host é geralmente o nome do computador ou dispositivo onde o Node.js está em execução. Retorna uma string.

### <a id ="cpus"></a>`.cpus()`

Retorna um array contendo informações sobre todas as CPUs disponíveis no sistema (um array de objetos).