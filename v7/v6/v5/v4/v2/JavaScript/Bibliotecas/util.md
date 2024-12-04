# `util`

É um módulo Node.js que fornece utilitários úteis para operações comuns em JavaScript, como funcionalidades para operações assíncronas.

### Sumário

- [`.promisify()`](#promisify)

# <a id="promisify"></a>`.promisify()`

É utilizado para transformar funções de estilo de callback em funções que retornam Promises. Isso facilita o uso de funções assíncronas, permitindo o uso de `async`/`await` e simplificando o gerenciamento de código assíncrono.

**Sintaxe Básica**

```JavaScript
util.promisify(funcaoCallback);
```

**Parâmetros**

- `funcaoCallback`**:** uma função de callback padrão Node.js `(error, result)`

**Retorno**

- Uma nova função é retornada, que executa a função original e resolve ou rejeita uma Promise com base no callback `error` ou `result`

**Benefícios**

- **Simplificação de código assíncrono:** facilita a escrita e leitura de código assíncrono usando `async`/`await`
- **Integração com Promises:** permite a integração com outras funções e bibliotecas que utilizam Promises
- **Erro manuseio melhorado:** Promises fornecem um modo mais elegante de tratar erros, utilizando `try`/`catch`

**Considerações**

- **Compatibilidade:** funciona apenas com funções que seguem a convenção de callback de Node.js `(error, result)`
- **Desempenho:** pode introduzir uma pequena sobrecarga, mas geralmente não é perceptível e vale a pena pelos benefícios de simplificação do código

`.promifisy()` permite a modernização de APIs antigas baseadas em callbacks para um estilo mais contemporâneo e manejável com Promises.

### Exemplos

- Promisificando `fs.readFile()`

```JavaScript
const fs = require("fs");
const util = require("util");

// Considere a função `fs.readFile()`, a qual utiliza callbacks.
fs.readFile("file.txt", "utf8", (error, dado) => {
    if (error) {
        console.error(error);
        return;
    }

    console.log(dado);
});

// Para transformar `fs.readFile()` em uma função que retorna uma Promise, você pode usar `.promisify()`.
const readFileAsync = util.promisify(fs.readFile);

// Agora você pode ysar a função com Promises.
readFileAsync("file.txt", "utf8")
    .then(dado => {
        console.log(dado);
    })
    .catch(error => {
        console.error(error);
    });

// Ou ainda mais simples com `async`/`await`.
async function readFile() {
    try {
        const dado = await readFileAsync("file.txt", "utf8");

        console.log(dado);
    } catch (error) {
        console.error(error);
    }
}

readFile();
```

- Promisificando `setTimeout()`

```JavaScript
const util = require("util");

const repousar = util.promisify(setTimeout);

async function demo() {
    console.log("Waiting...");

    await sleep(2000);

    console.log("Done!");
}

demo();
```

- Promisificando uma função personalizada

```JavaScript
const util = require("util");

function minhaFuncaoCallback(argumentos, callback) {
    if (argumentos) {
        callback(null, "Success");
    } else {
        callback("Error");
    }
}

const minhaFuncaoPromisificada = util.promisify(minhaFuncaoCallback);

minhaFuncaoPromisificada(true)
    .then(result => console.log(result))
    .catch(error => console.error(error));
```