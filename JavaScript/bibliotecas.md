# Bibliotecas.

- [`.pending()`;](#pending)
- [`.execute()`;](#execute)
- [`.executed()`;](#executed)
- [`.resolve()`;](#resolve)
- [`.hostname()`;](#hostname)
- [`.cpus()`.](#cpus)

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
        - E o objeto `models`.\
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
Na prática, o `Umzug` pode usar essas configurações para localizar e executar as migrações no diretório especificado, seja ele um caminho relativo ou um caminho absoluto. Ambos os métodos têm seu lugar, dependendo de como você deseja configurar a estrutura de diretórios do seu projeto de migração de banco de dados.
**Tecnicamente falando, não é necessário especificar ambas as propriedades**.

### <a id = "pending"></a>`.pending()`

É usado para listar as migrações pendentes que ainda não foram executadas no bando de dados. Ele retorna uma lista de migrações que estão no diretório de migrações configurado, mas que ainda não foram aplicadas ao banco de dados.\
Você pode acessar informações sobre as migrações, como o nome do arquivo da migração (`migration.file`), para saber quais migrações estão pendentes.

### <a id = "execute"></a>`.execute()`

Método que permite executar migrações específicas de acordo com as configurações fornecidas.

`.execute(objetoDeConfiguracao)`

Principais campos do `objetoDeConfiguracao`:

- `migrations`**:** este campo deve ser um array de nomes de arquivos de migração que você deseja executar. Geralmente é obtido através  de arquivos de migrações pendentes;
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

`chai` é uma biblioteca utilizada para realizar afirmações (assertions) em testes unitários. É frequentemente utilizada em conjunto com frameworks de teste como o Mocha ou o Jasmine para facilitar a criação e execução de testes.

### <a id ="expect"></a>`.expect()`

A função `.expect()` é usada para criar afirmações (assertions) em testes unitários. Ela é usada para expressar o que você espera que aconteça em um teste e, em seguida, verificar se essa expectativa é atendida.

`expect(valor).metodoDeAssercao(valorEsperado)`

- `valor`**:** é o valor ou expressão que você deseja testar;
- `metodoDeAssercao`**:** é um método disponível no `chai` que define a condição que você está testando. Alguns exemplos comuns `.to.equal()`, `.to.be.true`, `.to.be.false`, `.to.be.null`, `.to.be.undefined`, entre outros;
- `valorEsperado`**:** é o valor que você espera que `valor` tenha após a avaliação da asserção.

Alguns exemplos:

```JavaScript
const expect = require('chai').expect;

describe('Exemplo de teste', function() {
    it('Deve verificar se 1 + 1 é igual a 2', function() {
        expect(1 + 1).to.equal(2);
    });

    it('Deve verificar se um valor é verdadeiro', function() {
        expect(true).to.be.true;
    });

    it('Deve verificar se um valor é nulo', function() {
        expect(null).to.be.null;
    });

    it('Deve verificar se uma string é igual a outra', function() {
        expect('hello').to.equal('hello');
    });
});

```

# <a name = "requestpromisenative"></a>`request-promise-native`

Biblioteca utilizada para fazer solicitações HTTP de forma assíncrona no Node.js com suporte a Promises. É uma extensão do módulo request-promise, oferecendo as mesmas funcionalidades, mas com o uso nativo de Promises, o que torna o código mais limpo e legível quando se trata de fazer solicitações HTTP e lidar com respostas.

# JavaScript.

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