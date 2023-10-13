# `sequelize`

# Objeto `Sequelize` x objeto `QueryInterface`.

O objeto Sequelize é uma parte fundamental do Sequelize ORM e é usado para definir e manipular modelos de dados. Ele lida com operações em registros individuais, como criar, ler, atualizar e excluir (CRUD), bem como validações, associações entre modelos e outras operações de dados.\
Por outro lado, a Query Interface é responsável por operações de criação e gerenciamento de tabelas no banco de dados, como criar e excluir tabelas, adicionar ou remover colunas, definir índices e outras operações relacionadas ao esquema do banco de dados.\
Essa divisão de responsabilidades é uma das características do Sequelize que ajuda a manter uma separação clara entre as **operações de esquema** e as **operações de dados**, tornando o código mais organizado e legível.

# Métodos de um objeto model do Sequelize.

- [`.findOne()`](#findone);
- [`.update()`](#update);
- [`.changed()`](#changed);
- [`.save()`](#save);
- [`.query()`](#query);
- [`.getQueryInterface()`](#getqueryinterface).

<a id = "opcoes"></a>`opcoes` é o objeto que define critérios de pesquisa, é um parâmetro opcional. Algumas das suas principais propriedades são:

- `where`**:** define condições de pesquisa. Você pode usar isso para especificar as colunas e valores pelos quais deseja pesquisar;
- `attributes`**:** define quais colunas da tabela você deseja retornar. Por padrão, retornará todas as colunas. Você pode listar as colunas desejadas como um array, por exemplo, `{ attributes: ['name', 'path_name']}`;
- `include`**:** permite incluir associações relacionadas (por exemplo, tabelas associadas) na query;
- `order`**:** define a ordem em que os resultados devem ser retornados;
- `limit`**:** limita o número de registros que serão atualizados.

## <a id = "findone"></a>`.findOne()`

É usado para encontrar um único registro na tabela correspondente ao modelo, com base em um conjunto de critérios de pesquisa.

`.findOne(`[`opcoes`](#opcoes)`)`

Retorna uma promise que resolve em um objeto que representa o registro encontrado na tabela ou `'null'` se nenhum registro corresponder aos critérios de pesquisa.

## <a id = "update"></a>`.update()`

É usado para atualizar registros em uma tabela do banco de dados. Ele permite que você altere os valores das colunas para um ou mais registros com base em um conjunto de critérios de pesquisa.

`.update(valores, `[`opcoes`](#opcoes)`)`

- `valores`**:** este é um objeto que contém os novos valores que você deseja atribuir às colunas. As chaves do objeto representam o nome das colunas que você deseja atualizar, e os valores são os novos valores que você deseja definir;
- `opcoes`**:** mais propriedades que fazem sentido para este método:
    - `returning`**:** especifica se o método deve retornar os registros atualizados.

Retorna um array de duas posições, aonde a primeira posição é a quantidade de registros afetados pela operação de atualização (um número inteiro) e a segunda posição é um objeto que contém informações adicionais sobre a operação (caso `returning: true`).

## <a id = "changed"></a>`.changed()`

Verifica quais atributos foram alterados em um modelo Sequelize.

Retorna um **objeto** contendo as **chaves dos atributos** que foram alterados.

## <a id = "save"></a>`.save()`

Salva o estado atual de um modelo no banco de dados, **sem realizar verificações adicionais**.

Ele simplesmente envia as informações do modelo para o banco de dados e atualiza o registro correspondente com as informações atuais do modelo, substituindo o registro existente, se houver.\
O método `.save()` não executa validações adicionais por padrão. Se você tiver regras de validações definidas em seu modelo Sequelize, elas não serão acionadas automaticamente quando você chamar `.save()`. Portanto, é importante garantir que os dados no modelo **estejam corretos e atendam às regras de validação** antes de chamar `.save()`.

## <a id = "query"></a>`.query()`

É usada para executar comandos SQL personalizados em um banco de dados. Ela oferece maior flexibilidade do que os métodos de comando padrão do Sequelize, permitindo que você escreva queryss SQL completas e complexas conforme necessário.

`sequelize.query(query, `[`opcoes`](#opcoes)`)`

- `query` **(string):** é o comando SQL que você deseja executar;
- `opcoes` **(opcional):** é um objeto de opções que pode conter várias configurações, como parâmetros de substituição, tipo de consulta, etc.
    - `replacements`**:** objeto onde as chaves correspondem aos marcadores de posição na operação SQL e os valores são os valores que você deseja substituir.

Retorna um objeto que representa a operação executada, é necessário acessar os resultados manualmente. Os resultados retornados geralmente são uma matriz de objetos JavaScript.

O Sequelize entende as **interrogações na sua query SQL** como **marcadores de posição** que serão substituídos pelos valores fornecidos no objeto identificado pela chave `replacements` na ordem ordem em que as interrogações aparecem na query.\
O Sequelize substituirá cada interrogação na query pelo valor correspondente no array identificado por `replacements` na ordem em que aparecerem. Por exemplo, a primeira interrogação será substituída pelo primeiro valor do array, a segunda interrogação, pelo segundo valor, e assim por diante.\
O Sequelize garantirá que a substituição seja feita de forma adequada e segura, levando em consideração a formatação correta dos valores para evitar problemas de segurança, como injeção de SQL.

```JavaScript
const query = "REPLACE INTO games (id, name, path_name, mode, status) VALUES (?,?,?,?,?), (?,?,?,?,?), (?,?,?,?,?)";

const values = [ 
    85,
    'Dracula Alpha v000',
    'alpha-dracula-v000',
    'vertical',
    1,
    89,
    'Lucky Fortune Alpha v000',
    'alpha-lucky-fortune-v000',
    'vertical',
    1,
    1,
    'Lucky Halloween s000',
    'halloween',
    'square',
    1 ];

await sequelize.query(query, { replacements: values });
```

Cada interrogação será substituída de acordo com a sua posição em relação ao array `values`.

## <a id = "getqueryinterface"></a>`.getQueryInterface()`

É usado para obter uma instância do objeto `QueryInterface` associado a uma instância Sequelize específica.\
Uma breve explicação do que o `.getQueryInterface()` faz:

- **Instância Sequelize:** primeiro, é necessário ter uma instância do Sequelize configurada no aplicativo. Isso geralmente é feito quando é criada uma instância do Sequelize com as configurações de conexão ao banco de dados;
- **Acesso ao QueryInterface:** depois de ter uma instância do Sequelize, você pode chamar o método `.getQueryInterface()` nessa instância para obter uma instância do objeto `QueryInterface`. O `QueryInterface` é uma parte importante do Sequelize que permite que você execute querys SQL diretamente e execute operações de migração no banco de dados;
- **Uso do** `QueryInterface`**:** com a instância do `QueryInterface`, você pode chamar vários métodos para executar queryss SQL, criar, atualizar ou excluir tabelas, adicionar ou remover colunas, criar índices e realizar outras operações relacionadas ao esquema do banco de dados.

# Métodos do objeto `QueryInterface`.

`QueryInterface` possui a propriedade `.QueryGenerator` que contém métodos para criar operações SQL, como seleção, inserção, atualização e exclusão, com base nos parâmetros e critérios fornecidos. Isso ajuda a abstrair a geração de SQL manualmente e garante que as consultas geradas sejam compatíveis com o banco de dados específico que você está usando.

- [`.createTable`](#createtable);
- [`.dropTable()`](#droptable);
- [`.bulkInsertQuery()`](#bulkinsertquery);
- [`.bulkInsert()`](#bulkinsert);
- [`.addColumn()`](#addcolumn);
- [`.changeColumn()`](#changecolumn);
- [`.removeColumn()`](#removecolumn).

## <a id = "createtable"></a>`.createTable()`

Cria uma nova tabela no banco de dados. Este método permite definir a estrutura da tabela, incluindo o nome das colunas, os tipos de dados das colunas e quaisquer outras restrições desejadas.

`createTable(nome, objeto)`

- `nome`**:** o nome da tabela a ser criada;
- `objeto`**:** objeto que define a estrutura da tabela, incluindo colunas e suas configurações.

Retorna uma promessa que representa a criação da tabela.

## <a id = "droptable"></a>`.dropTable()`

É usado para excluir uma tabela do banco de dados. Ele recebe como argumento o nome da tabela que você deseja excluir e retorna uma promise.

`.dropTable(nome)`

`nome`: nome da tabela que você deseja excluir.

## <a id = "bulkinsertquery"></a>`.bulkInsertQuery()`

É usado para gerar uma operação SQL para inserção em massa de registros em uma tabela. Ela cria a consulta SQL com base no nome da tabela e na lista de registros que você deseja inserir.

`.QueryGenerator.bulkInsertQuery(nome, registros, opcoes)`

- `nome`**:** o nome do modelo Sequelize correspondente à tabela na qual você deseja inserir os registros em massa;
- `registros` **(array):** um array de objetos que representa os registros que você deseja inserir na tabela. Cada objeto de `registros` deve conter pares de chave-valor, onde as chaves correspondem aos nomes das colunas da tabela e os valores são os dados a serem inseridos;
- `opcoes` **(objeto, opcional):** um objeto que pode conter várias opções para controlar o comportamento da operação de inserção em massa. Algumas opções comuns incluem:
    - `transaction`**:** uma transação Sequelize opcional na qual a operação deve ser executada;
    - `ignoreDuplicates` **(booleano):** define se as duplicatas devem ser ignoradas durante a inserção;
    - `updateOnDuplicate`**:** um objeto que define as colunas a serem atualizadas em caso de conflito de chave única.

Retorna uma string contendo a operação SQL de inserção em massa.

## <a id = "bulkinsert"></a>`.bulkInsert()`

Permite inserir múltiplos registros em uma tabela.

`.bulkInsert(nome, registros, opcoes)`

- `nome`**:** o nome do modelo Sequelize correspondente à tabela na qual você deseja inserir os registros em massa;
- `registros` **(array):** um array de objetos que representa os registros que você deseja inserir na tabela. Cada objeto no array deve conter propriedades que correspondam às colunas da tabela;
- `opcoes` **(opcional):** um objeto que pode conter várias opções para controlar o comportamento da operação de inserção em massa. Algumas opções comuns incluem:
    - `transaction`**:** uma transação Sequelize opcional na qual a operação deve ser executada;
    - `ignoreDuplicates` **(booleano):** define se as duplicatas devem ser ignoradas durante a inserção.

## `.bulkInsert()` x `.bulkInsertQuery()`

A principal diferença entre os dois métodos é que `.bulkInsert()` é responsável por executar a inserção em massa automaticamente, enquanto `.bulkInsertQuery()` apenas gera a operação SQL de inserção em massa e deixa a execução da inserção para você.

## <a id = "addcolumn"></a>`.addColumn()`

Adiciona uma nova coluna a uma tabela.

`.addColumn(nomeDaTabela, nomeDaColuna, propriedadesDaColuna)`

- `nomeDaTabela`**:** nome da tabela à qual você deseja adicionar a coluna;
- `nomeDaColuna`**:** nome da nova coluna a ser adicionada;
- `propriedadesDaColuna`**:** objeto que contém informações sobre a coluna.

Retorna uma promise.

## <a id = "changecolumn"></a>`.changeColumn()`

Modifica uma coluna existente.

`.changeColumn(nomeDaTabela, nomeDaColuna, propriedadesDaColuna)`

- `nomeDaTabela`**:** nome da tabela à qual você deseja modificar a coluna;
- `nomeDaColuna`**:** nome da coluna a ser modificada;
- `propriedadesDaColuna`**:** objeto que contém informações sobre a coluna.

Retorna uma promise.

## <a id = "removecolumn"></a>`.removeColumn()`

Remove uma coluna existente de uma tabela no banco de dados.

`.removeColumn(nomeDaTabela, nomeDaColuna)`

- `nomeDaTabela` **(string):** especifica o nome da tabela da qual você deseja remover a coluna;
- `nomeDaColuna` **(string):** especifica o nome da coluna a ser removida da tabela.

Retorna uma promise.