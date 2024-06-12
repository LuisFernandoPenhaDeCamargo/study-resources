# `fs` (Ok)

O módulo `fs` em Node.js é um dos módulos principais e está incluído na instalação padrão do Node.js. Ele fornece uma API para interagir com o sistema de arquivos do seu computador. Você pode usá-lo para ler, escrever, atualizar, deletar arquivos e diretórios.

### Sumário

- [`.readFileSync()`](#readfilesync)

# <a id="readfilesync"></>`.readFileSync()`

É utilizada para **ler o conteúdo de um arquivo de forma síncrona**. Isso significa que a execução do programa é bloqueada até que a leitura do arquivo esteja completa. Esta função é útil quando você precisa garantir que o arquivo foi completamente lido antes de prosseguir com a execução do código.

**Sintaxe Básica**

```JavaScript
fs.readFileSync(caminho[, opcoes]);
```

- `caminho`**:** o caminho para o arquivo que você deseja ler
- `opcoes`**:**
    + Pode ser uma string que específica a codificação, como `utf8`
    + Pode ser um objeto com as seguintes propriedades:
        - `enconding`**:** a codificação da string resultante. Se não for especificada, um `Buffer` será retornado
        - `flag`**:** o modo de arquivo. O valor padrão é `r`

**Observações Importantes**

- **Bloqueio:** como `.readFileAsync()` é uma operação síncrona, ela bloqueia o loop de eventos até que a operação esteja concluída. Isso pode ser problemático em um servidor que precisa lidar com muitas conexões simultâneas. Para operações de leitura de arquivos em servidores de produção, a versão assíncrona (`.readFile()`) é geralmente preferível
- **Erros:** você deve sempre envolver `.readFileSync()` em um bloco `try...catch` para lidar com possíveis erros, como arquivos não encontrados ou permissões insuficientes

### Exemplos

```JavaScript
const fs = require("fs");

const conteudo1 = fs.readFileSync("./meu_arquivo.txt");
const conteudo1 = fs.readFileSync("./meu_arquivo.txt", "utf8");

console.log(conteudo1); // Exibirá o buffer. Exemplo: <Buffer 64 63 3a 37 31 3a 39 36 3a 66 30 3a 37 62 3a 31 62 0a>
console.log(conteudo2); // Exibirá a string
```