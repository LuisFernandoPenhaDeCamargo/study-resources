# Sumário.

[Express.js](#expressjs).

# <a id = "expressjs"></a>Express.js

### Sumário

- [`.header()`](#header);
- [`next()`](#next)

## <a id = "header"></a>`.header()`

O método `.header()` é usado para acessar o valor de um cabeçalho específico na solicitação HTTP.

`req.header(headerName)`

`headerName` **(string):** representa o nome do cabeçalho que você deseja acessar.

Retorna o valor do cabeçalho especificado. Se o cabeçalho não existir, retorna `undefined`.

```JavaScript
const authorizationHeader = req.header("Authorization");
```

## <a id = "next"></a>`next()`

O método `next()` é usado para avançar para a próxima iteração em uma execução assíncrona, seja em middlewares ou em funções geradoras.

`next(value)`

`value` **(value, opcional:)** um valor para ser passado para a próxima iteração. Esse valor será o resultado da última instrução `yield` em uma função geradora.

Retorna um objeto com duas propriedades:

- `value`**:** o valor retornado pela última instrução `yield`;
- `done` **(boolean):** um booleano indicando se a função geradora foi concluida (retornando `true`).

Exemplo de uso:

- Usando em um middleware de servidor Express:

```JavaScript
function middleware(req, res, next) {
    // Alguma lógica assíncrona ou processamento.

    // Avançar pra o próximo middleware.
    next();
}
```
O `next()` não só avança para o próximo middleware na cadeia, mas também é usado para indicar ao Express que deve continuar a execução do pipeline de middleware. Se você não chamar `next()`, o middleware atual pode interromper o pipeline e impedir que os middlewares subsequentes sejam executados.

- Usando uma função geradora:

```JavaScript
function* minhaFuncaoGeradora() {
    console.log("Inicialização do iterador. A primeira chamada a next() vem até aqui, até a primeira instrução yield.")
    const resultado1 = yield "Passo 1.";
    console.log(resultado1); // Saida: Resultado 1.
  
    const resultado2 = yield "Passo 2.";
    console.log(resultado2); // Saida: Resultado 2.
  
    const resultado3 = yield "Passo 3.";
    console.log(resultado3); // Saida: Resultado 3.
}
  
const iterador = minhaFuncaoGeradora();
  
const inicializador = iterador.next();
const passo1 = iterador.next("Resultado 1.");
const passo2 = iterador.next("Resultado 2.");
const passo3 = iterador.next("Resultado 3.");  
```

- O escopo alcançado pelo primeiro `next()` é o da linha 57;
- O escopo alcançado pelo segundo `next()` é o da linha 59 e 60;
- O escopo alcançado pelo segundo `next()` é o da linha 62 e 63;
- O escopo alcançado pelo segundo `next()` é o da linha 65.

A primeira chamada a `next()` inicializa o iterador e avança até a primeira instrução `yield`. Nesse ponto, a execução é pausada, e o valor passado para essa primeira chamada de `next()` não é usado para atribuir a variável na primeira instrução `yield`.\
As chamadas subsequentes de `next()` são responsáveis por retomar a execução após cada instrução `yield`, e essas chamadas podem incluir valores que serão atribuídos às variáveis nas instruções `yield` correspondentes. Cada chamada de `next()` avança a execução até a próxima instrução `yield` ou até o final da função geradora, se não houver mais instruções `yield`.