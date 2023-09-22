# Métodos.

## `.chaged()`

Verifica quais atributos foram alterados em um modelo Sequelize.

Retorna um **objeto** contendo as **chaves dos atributos** que foram alterados.

## `.save()`

Salva o estado atual de um modelo no banco de dados, **sem realizar verificações adicionais**.

Ele simplesmente envia as informações do modelo para o banco de dados e atualiza o registro correspondente com as informações atuais do modelo, substituindo o registro existente, se houver.\
O método `.save()` não executa validações adicionais por padrão. Se você tiver regras de validações definidas em seu modelo Sequelize, elas não serão acionadas automaticamente quando você chamar `.save()`. Portanto, é importante garantir que os dados no modelo **estejam corretos e atendam às regras de validação** antes de chamar `.save()`.

## `.update()`

É usado para atualizar registros existentes no banco de dados. Ele permite que você faça atualizações em um ou mais registros de uma tabela com base em um critério de pesquisa.

`.update(objeto1, objeto2)`

- `objeto1`: especifica os novos valores a serem atribuídos aos campos;\
    Exemplo: `{ chave: novo valor, ...}`.
- `objeto2`: é o objeto que contém o critério de pesquisa para determinar quais registros devem ser atualizados.

Retorna um objeto (um array) de tamanho único (com um elemento) que contém o número de registros afetados pela operação de atualização.

## `.query()`

O Sequelize entende as **interrogações na sua consulta SQL** como **marcadores de posição** que serão substituídos pelos valores fornecidos no objeto