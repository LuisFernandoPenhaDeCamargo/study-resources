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

`value` **(opcional:)**