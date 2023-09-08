# JavaScript.
Up to date: 08/09/2023.
- [Nativo do JavaScript;](#nativojavascript)
- [Bibliotecas;](#bibliotecas)
- [Frameworks.](#frameworks)

# <a id = "nativojavascript"></a>Nativo do JavaScript.
- [Operadores de igualdade;](#operadoresigualdade)
- [Callback;](#callback)
- [`setTimeout(<callback>, <delay>)`](#settimeout)

## <a id = "operadoresigualdade"></a>Operadores de igualdade.
- `===` : operador de igualdade estrita;

Compara o **valor** e o **tipo de dado**.
- `==` : operador de igualdade.

Compara o **valor** e **converte o tipo de dado**, se necessário.

## <a id = "callback"></a>Callback.
Uma Callback (ou função de retorno) refere-se a uma **função** que é **passada como argumento para outra função** e é executada após a **conclusão** de uma operação assíncrona ou em reposta a um evento específico.
São uma parte fundamental da programação assíncrona em JavaScript e são amplamente utilizadas em situações em que você precisa controlar o fluxo de código após uma conclusão de uma operação demorada.
[Exemplo.](#exemplocallback)

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

# <a id = "bibliotecas"></a>Bibliotecas.
- [Axios;](#axios)

## <a id = "axios"></a>Axios.
Utilizada para fazer requisições HTTP, seja em navegadores ou em Node.js
- `<url>` : URL de destino, para onde a solicitação será enviada;
- `<corpo da solicitação>` : corpo da solicitação que está sendo enviada.

### Métodos.
- `.post(<url>, <corpo da solicitação>)`
- `.patch(<url>, <corpo da solicitação>)` : atualização parcial;
- [`.interceptors`](#interceptors)
- [`.CancelToken.source()`](#canceltoken)

### <a id = "interceptors"></a> `.interceptors`

---

Interceptadores.

- `.request` : interceptador de solicitação (requisição). Isto permite que você execute código antes que cada solicitação seja enviada. Após realizarmos esta "configuração, todas as solicitações posteriores obedeceram esta configuração;
- `.response` : interceptador de resposta;
- `.use()` : registra o interceptador.

### <a id = "canceltoken"></a>`.CancelToken.source()`

---

- `.CancelToken` : utilizado para criar um Token de cancelamento que pode ser usado para cancelar uma solicitação HTTP que está em andamento;
- `.source()` : cria o objeto `.CancelToken` e seu respectivo método `.cancel(<mensagem sobre o cancelamento>)`