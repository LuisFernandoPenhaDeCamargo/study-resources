# fs

É o módulo de sistema de arquivos (filesystem) que é nativo no ambiente Node.js. Este módulo permite interagir com o sistema de arquivos, permitindo operações de leitura, escrita, remoção e manipulação de arquivos e diretórios.

### Sumário

- [.readFileSync()](#readfilesync)

# <a id="readfilesync">`.readFileSync()`</a>

É utilizado para **ler o conteúdo de um arquivo de forma síncrona**. Isso significa que a execução do programa será bloqueada até que o arquivo tenha sido completamente lido, o que pode ser útil em scripts simples ou em situações onde o código deve ser executado de maneira sequencial e o tempo de bloqueio e aceitável.

### Sintaxe Básica

```JavaScript
fs.readFileSync(path[, options]);
```

- `path`**:** caminho do arquivo a ser lido. Pode ser uma string, um objeto Buffer, um URL ou um objeto `fs.promises.FileHandle`
- `options`**:** um objeto ou string que especifica o encoding e/ou o modo de leitura
    + `encoding`**:** especifica o encoding do arquivo. Se não for fornecido, um objeto Buffer será retornado
    + `flag`**:** um valor de string que pode ser usado para especificar o modo em que o arquivo deve ser aberto

### Exemplos

```JavaScript
const fs = require("fs");

const options = { encoding: "utf8", flag: "r" };

try {
    const data = fs.readFileSync("caminho/para/arquivo.txt", options);

    console.log("Conteúdo do arquivo:", data);
} catch (error) {
    console.error("Erro ao ler o arquivo:", error);
}
```