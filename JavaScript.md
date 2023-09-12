# JavaScript.

É uma **linguagem de programação** que é **síncrona** e **single-threaded**, o que significa que ele é executado em uma única thread de execução, e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript pode lidar com operações **assíncronas** e **não bloqueantes** usando recursos como **callbacks**, **Promises** e **async/await**.

- [Nativo do JavaScript;](#nativojavascript)
- [Bibliotecas;](#bibliotecas)
- [Frameworks.](#frameworks)

# <a id = "nativojavascript"></a>Nativo do JavaScript.

- [Operadores de igualdade;](#operadoresigualdade)
- [Template Literals (Template Strings)](#templateliterals) <--
- [Spread properties](#spreadproperties) <--
- [Callback;](#callback)
- [Funções para se aplicar sobre arrays](#funcoesarrays) <--
- [`setTimeout(<callback>, <delay>)`](#settimeout)

---

## <a id = "operadoresigualdade"></a>Operadores de igualdade.

- `===` : operador de igualdade estrita;

Compara o **valor** e o **tipo de dado**.
- `==` : operador de igualdade.

Compara o **valor** e **converte o tipo de dado**, se necessário.

## <a id = "templateliterals"></a>Template Literals.

## <a id = "spreadproperties"></a>Spread Properties.

O operador de propagação (`...`) é usado para copiar todas as propriedades enumeráveis de um objeto para outro objeto literal ou objeto existente.

## <a id = "callback"></a>Callback.

Uma Callback (ou função de retorno) refere-se a uma **função** que é **passada como argumento para outra função** e é executada após a **conclusão** de uma operação assíncrona ou em reposta a um evento específico.
São uma parte fundamental da programação assíncrona em JavaScript e são amplamente utilizadas em situações em que você precisa controlar o fluxo de código após uma conclusão de uma operação demorada.
[Exemplo.](#exemplocallback)

## <a id = "funcoesarrays"></a>Funções para se aplicar sobre arrays.

- [`.forEach()`](#foreach) <--

---

### <a id = "foreach"></a>`.forEach()` <--

---

## <a id = "settimeout"></a>`setTimeout(<callback>, <delay>)`

Função que agenda a execução de uma [`<callback>`](#callback) após um período de tempo especificado em milissegundos (`<delay>`).
<a id = "exemplocallback"></a>[Exemplo:](fazer_algo_async.js)

```JavaScript
function fazerAlgoAsync(callback) {
  setTimeout(function () {
    console.log("A operação assíncrona está concluída.");
    callback(); //Chamando a função de callback após a conclusão da operação.
  }, 2000);     //Espera 2 segundos antes de executar.
}

function minhaCallback() {
  console.log("A callback foi acionada.");
}

fazerAlgoAsync(minhaCallback);
```
`fazerAlgoAsync(callback)` é uma função que recebe uma função callback como argumento.
Dentro de `fazerAlgoAsync(callback)` há uma operação assíncrona simulada usando o `setTimeout(<callback>, <delay>)` , que espera 2 segundos antes de executar.
Após a conclusão da operação assíncrona, a função callback é chamada. Neste caso, `minhaCallBack()` é passada como função callback, e ela será executada após a conclusão da operação.

### `clearTimeout(<identificador>)`

Função usada para cancelar um temporizador (timeout) configurado anteriormente com a função `setTimeout(<callback>, <delay>)` . Ela permite interromper a execução de uma função ou bloco de código que foi agendado para ser executado após um determinado período de tempo.
`<identificador>` : é o identificador único retornado quando você configurou o temporizador usando `setTimeout(<callback>, <delay>)`
Exemplo:

```JavaScript
const identificador = setTimeout(() => {
  console.log("Temporizador expirou."); //Esta função será executada após 3s.
  },
  3000);

  //Cancela o temporizador antes que ele expire (por exemplo, se necessário).
  clearTimeout(identificador);
```

# <a id = "bibliotecas"></a>Bibliotecas.

### JavaScript

- [Axios;](#axios)

### Node.js

- [fs;](#fs)

- [util;](#util) <--
- [child_process;](#childprocess) <--

## <a id = "axios"></a>Axios.

Utilizada para fazer requisições HTTP, seja em navegadores ou em Node.js

- `<url>` (string): URL de destino, para onde a solicitação será enviada;
- `<corpo da solicitação>` (objetct): corpo da solicitação que está sendo enviada;
- `<configurações>` (object, opcional): objeto de configuração opcional que permite personalizar a solicitação. Este objeto pode conter várias opções de configuração, como cabeçalhos personalizados, autenticação, parâmetros de consulta, entre outros.

### Métodos.
- `.post(<url>, <corpo da solicitação>)`
- `.patch(<url>, <corpo da solicitação>, <configurações>)` : atualização parcial;
- [`.interceptors`](#interceptors)
- [`.CancelToken.source()`](#canceltoken)

## <a id = "interceptors"></a> `.interceptors`

Interceptadores.

- `.request` : interceptador de solicitação (requisição). Isto permite que você execute código antes que cada solicitação seja enviada. Após realizarmos esta "configuração, todas as solicitações posteriores obedeceram esta configuração;
- `.response` : interceptador de resposta;
- `.use()` : registra o interceptador.

## <a id = "canceltoken"></a>`.CancelToken.source()`

- `.CancelToken` : utilizado para criar um Token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()` : cria o objeto `.CancelToken` e seu respectivo método `.cancel(<mensagem sobre o cancelamento>)`
- `.cancel(<mensagem sobre o cancelamento>)` o parâmetro `<mensagem sobre o cancelamento>` que atribui o valor da chave `.reason.message`

Um objeto `.CancelToken` possui um atributo `.token`
O atributo `.token` é composto por uma `.promise` e uma `.reason`
A chave `.reason` possui um atributo `.message`
[Exemplo.](axios_cancel_token.js)

## <a id = "fs"></a>fs

**File System** (**Sistema de Arquivos**). Fornece métodos para interagir com o sistema de arquivos do computador, permitindo que você leia, escreva, manipule e gerencie arquivos e diretórios.

### `.readdirSync(<__dirname, caminho para o diretório>)`

Usado para ler o conteúdo de um diretório de forma síncrona, ou seja, lista os arquivos e subdiretórios.

**__dirname** é uma variável global no Node.js que representa o diretório atual.

Retorna uma lista de strings.

### `readFileSync(<caminho para o arquivo>, <opcional, especifica a codificação do arquivo>)`

Lê o conteúdo de um arquivo de forma síncrona.

Retorna o conteúdo do arquivo como uma string.