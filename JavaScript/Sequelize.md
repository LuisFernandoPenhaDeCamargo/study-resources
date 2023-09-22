# <a name = "sequelize"></a>Sequelize.

# Métodos.

- [`.changed()`;](#changed)
- [`.save()`;](#save)
- [`.update()`;](#update)
- [`.query()`;](#query)

## <a id = "changed"></a>`.changed()`

Verifica quais atributos foram alterados em um modelo Sequelize.

Retorna um **objeto** contendo as **chaves dos atributos** que foram alterados.

## <a id = "save"></a>`.save()`

Salva o estado atual de um modelo no banco de dados, **sem realizar verificações adicionais**.

Ele simplesmente envia as informações do modelo para o banco de dados e atualiza o registro correspondente com as informações atuais do modelo, substituindo o registro existente, se houver.\
O método `.save()` não executa validações adicionais por padrão. Se você tiver regras de validações definidas em seu modelo Sequelize, elas não serão acionadas automaticamente quando você chamar `.save()`. Portanto, é importante garantir que os dados no modelo **estejam corretos e atendam às regras de validação** antes de chamar `.save()`.

## <a id = "update"></a>`.update()`

É usado para atualizar registros existentes no banco de dados. Ele permite que você faça atualizações em um ou mais registros de uma tabela com base em um critério de pesquisa.

`.update(objeto1, objeto2)`

- `objeto1`: especifica os novos valores a serem atribuídos aos campos;\
    Exemplo: `{ chave: novo valor, ...}`.
- `objeto2`: é o objeto que contém o critério de pesquisa para determinar quais registros devem ser atualizados.

Retorna um objeto (um array) de tamanho único (com um elemento) que contém o número de registros afetados pela operação de atualização.

## <a id = "query"></a>`.query()`

É usada para executar comandos SQL personalizados em um banco de dados. Ela oferece maior flexibilidade do que os métodos de comando padrão do Sequelize, permitindo que você escreva consultas SQL completas e complexas conforme necessário.

`sequelize.query(query, options)`

- `query`: é o comando SQL que você deseja executar como uma string;
- `options` (opcional): é um objeto de opções que pode conter várias configurações, como parâmetros de substituição, tipo de consulta, etc.
    - `replacements`: objeto onde as chaves correspondem aos marcadores de posição na operação SQL e os valores são os valores que você deseja substituir.

O Sequelize entende as **interrogações na sua consulta SQL** como **marcadores de posição** que serão substituídos pelos valores fornecidos no objeto identificado pela chave `replacements` na ordem ordem em que as interrogações aparecem na consulta.\
O Sequelize substituirá cada interrogação na consulta pelo valor correspondente no array identificado por `replacements` na ordem em que aparecerem. Por exemplo, a primeira interrogação será substituída pelo primeiro valor do array, a segunda interrogação, pelo segundo valor, e assim por diante.\
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