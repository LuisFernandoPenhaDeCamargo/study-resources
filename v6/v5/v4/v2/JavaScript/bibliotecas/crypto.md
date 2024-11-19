# `crypto` (Ok)

- O módulo `os` em Node.js está incluído na instalação padrão do Node.js
- Ele fornece **criptografia para implementar várias funções de segurança**, como hashing, criptografia e geração de chaves

### Sumário

- [`.createHash()`](#createhash)
- [`.update()`](#update)
- [`.digest()`](#digest)

# <a id="createhash"></a>`.createHash()`

É utilizado para **criar um objeto de hash que pode ser usado para gerar um hash criptográfico**. Um hash é uma função que transforma dados de entrada (de qualquer tamanho) em uma saída de comprimento fixo. Isso é útil para várias aplicações de segurança, como verificação de integridade de dados e armazenamento seguro de senhas.

**Sintaxe Básica**

```JavaScript
crypto.createHash(algoritmo);
```

- `algoritmo`**:** uma string representando o algoritmo hash a ser usado, como `sha256`, `md5`, `sha512`, entre outros

# <a id="update"></a>`.update()`

É utilizado para **adicionar dados ao objeto de hash que você criou com** `.createHash()`.

**Sintaxe Básica**

```JavaScript
hash.update(dado[, codificacaoEntrada]);
```

- `dado`**:** os dados que você deseja adicionar ao hash. Pode ser uma string, um buffer, um TypedArray ou uma DataView
- `codificacaoEntrada`**:** a codificação do dado se ele for uma string. Os valores possíveis incluem `utf8`, `ascii`, `latin1`, entre outros. O padrão é `utf8`

**Observações Importantes**

Você pode chamar `.update()` várias vezes com diferentes partes dos dados. Quando todos os dados tiverem sido adicionados, você pode chamar `.digest()` para obter o hash final.

# <a id="digest"></a>`.digest()`

Ele é utilizado para **finalizar o cálculo do hash e retorna o valor resultante**. Após chamar `.digest()`, o objeto de hash não pode mais ser usado para adicionar mais dados.

**Sintaxe Básico**

```JavaScript
hash.digest([codificacao]);
```

- `codificacao`**:** a codificação em que o hash deve ser retornado. Os valores possíveis incluem `hex`, `base64`, `latin1`, entre outros. Se nenhum for fornecido, um `Buffer` é retornado