### ETag (Amazon S3) e md5sum (Ubuntu)

A ETag no Amazon S3 e o md5sum no Ubuntu são conceitos diferentes, embora ambos estejam relacionados a verificar a integridade dos dados.

- **ETag no Amazon S3:** a ETag (Entity Tag) no Amazon S3 é uma string que representa a identidade única de um objeto (um arquivo, por exemplo). Pode ser uma cadeia de caracteres gerada pelo próprio S3, ou pode ser um valor MD5 do conteúdo do arquivo, dependendo de como o objeto foi criado ou carregado no S3
- **md5sum no Ubuntu:** `md5sum` é um utilitáio no Ubuntu (e em sistemas Linux em geral) que calcula e exibe o valor do hash MD5 de um arquivo. O MD5 é um algoritmo de hash que produz um valor de hash (checksum) baseado no conteúdo do arquivo

Ambos são usados para verificar a integridade dos dados, mas eles operam de maneiras distintas:

- A ETag no S3 pode ser uma entidade mais geral, não restrita ao algoritmo MD5. O S3 pode gerar ETags usando diferentes métodos, dependendo de como o objeto foi carregado
- `md5sum` no Ubuntu sempre usa o algoritmo MD5 para calcular o hash do conteúdo de um arquivo

Se você deseja comparar um ETag específico no S3 com um valor MD5 calculado localmente usando o `md5sum`, é importante garantir que ambos estejam usando o mesmo método de geração de hash (por exemplo, ambos baseados em MD5) para que sejam comparáveis.

### `replace()` e Expressões Regulares

`.replace(/['"]+/g, ``)`

A expressão regular `/['"]+/g` procura por uma ou mais ocorrências (o `+` após `['"]` indica uma ou mais ocorrências) de aspas simples (`'`) ou aspas duplas (`"`) em uma string JavaScript. O `g` no final da expressão regular significa que a busca deve ser global, ou seja, em toda a string.

A substituição está sendo feita por duas aspas graves vazias (`\`\``). Isso efetivamente remove todas as aspas simples e aspas duplas da string.

Então, se você tiver uma string como `"Olá, mundo!"` ou `'Outro exemplo'`, a expressão regular irá encontrá-las e substituí-las por uma string vazia, deixando apenas o texto entre as aspas.

**Por exemplo:**

- `"Olá, mundo!"` após a substituição se tornaria `Olá, mundo!`
- `'Outro exemplo'` após a substituição se tornaria `Outro exemplo`

Observe que a ordem dentro dos colchetes não importa, você está removendo os dois caracteres, eles estando juntos ou não.

### `.json()`

Considere o seguinte cenário:

- Você possui o retorno de uma query feita com o método `.query` do módulo `mysql`
- Você vai enviar este array como uma resposta utilizando o `.json()`
- `res.json(retorno_da_query)`
- O método `.query()` inclui em seu retorno metadados, que não são enumeráveis e também **não são incluídos no corpo da resposta**
- Você pode imprimir a saída de `JSON.stringfy(retorno_da_query)` para verificar isso