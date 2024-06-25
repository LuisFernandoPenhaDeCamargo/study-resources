# Objetos

<!-- - Pontuar o que são objetos -->

### Sumário

- [`String`](#string)
    + [`.trim()`](#string-trim)
- [`JSON`](#json)
    + [`.parse()`](#json-parse)
- [`process`](#process)
    + [`.env`](#process-env)
    + [`.exit()`](#process-exit)

# <a id="string">`String`</a>

### Sumário

- [`.trim()`](#string-trim)

## <a id="string-trim">`.trim()`</a>

É utilizado para **remover espaços em branco do início e do fim de uma string**, isso inclui espaços, tabs, quebras de linha e outros caracteres de espaço em branco. Este método não modifica a string original, mas retorna uma nova string sem os espaços em branco nas extremidades.

### Sintaxe Básica

```JavaScript
string.trim()
```

# <a id="json">`JSON`</a>

### Sumário

- [`.parse()`](json-parse)

## <a id="json-parse">`.parse()`</a>

É utilizado para **converter uma string no formato JSON em um objeto JavaScript**.

### Sintaxe Básica

```JavaScript
JSON.parse(json);
```

- `json`**:** é a string JSON que você deseja converter em um objeto JavaScript

# <a id="process">`process`</a>

O objeto `process` em **Node.js** é um **objeto global que fornece informações e controle sobre o processo Node.js em execução**. Ele pode ser usado para interagir com o ambiente de execução, como acessar variáveis de ambiente, lidar com eventos do processo e controlar o ciclo de vida do processo.

### Sumário

- [`.env`](#process-env)
- [`.exit()`](#process-exit)

## <a id="process-env">`.env`</a>

A propriedade `process.env` contém as variáveis de ambiente do processo onde o Node.js está sendo executado. Essas variáveis de ambiente são utilizadas para configurar aspectos do comportamento do aplicativo e fornecer informações sobre o ambiente de execução, como caminho de diretórios, configurações de banco de dados, chaves de API, entre outros.

Você pode acessas as variáveis de ambiente diretamente através do objeto `process.env`, por exemplo:

```JavaScript
const port = process.env.PORT || 3000;

console.log(`O servidor está sendo executado na porta: ${port}.`);
```

### Observações Importantes

Quando você atribui um valor a `proccess.env` em tempo de execução no seu código Node.js, essas variáveis de ambiente são **visíveis apenas dentro do contexto do processo Node.js que está sendo executado. Elas não são refletidas globalmente no sistema operacional e, portanto, não serão listadas por comandos de terminal** como `printenv` ou `env`.

As variáveis definidas com `proccess.env` dentro de um processo Node.js só são **visíveis para aquele processo e seus filhos**. Elas não afetam o ambiente do shell ou o SO.

**Cada processo do SO tem seu próprio conjunto de variáveis de ambiente, que não é compartilhado com outros processos, a menos que explicitamente definido antes da criação dos processos**.

### Conclusão

A definição de variáveis de ambiente em tempo de execução usando `process.env` no Node.js é limitada ao escopo do processo que está executando o código. Essas variáveis não são exportadas para o ambiente do sistema operacional e, portanto, não serão listadas por comandos de terminal como `printenv`. Este comportamento é importante para manter a segurança e o isolamento dos processos, especialmente quando lidamos com informações sensíveis como segredos ou tokens de API.

## <a id="process-exit">`.exit()`</a>

É utilizado para **encerrar o processo Node.js em execução**. Você pode especificar um código de saída opcional que indica o motivo do encerramento do processo. O padrão é `0`, que geralmente indica uma saída bem-sucedida.

### Sintaxe Básica

```JavaScript
process.exit([codigo]);
```

- `codigo`**:** um número inteiro que representa o código de saída do processo. Se não for especificado, o padrão é `0`

### Observações

Eventos `exit` e `beforeExit`:

- O evento `exit` é emitido quando o processo está prestes a terminar
- O evento `beforeExit` é emitido quando o Node.js limpa o loop de eventos, mas ainda há trabalhos pendentes, permitindo a execução de código assíncrono adicional

+ `.exit()` **força o encerramento do processo sem aguardar a conclusão das operações pendentes**, como callbacks ou timers assíncronos. Isso pode resultar em perda de dados ou operações incompletas