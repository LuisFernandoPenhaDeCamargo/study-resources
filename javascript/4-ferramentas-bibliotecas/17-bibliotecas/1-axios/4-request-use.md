# `axios.interceptors.request.use`

O método `use` é utilizado para **adicionar interceptadores de requisição no Axios**, permitindo que você modifique ou inspecione as requisições antes de elas serem enviadas para o servidor. Ele aceita duas funções como argumentos:

### Sintaxe Baśica

```JavaScript
axios.interceptors.request.use(fulfilledCallback[, rejectCallback]);
```

### `fulfilledCallback(config)`

- É uma função chamada **antes** que a requisição seja enviada
- Recebe o objeto de configuração (`config`) da requisição como argumento, permitindo que você modifique os detalhes da requisição, como headers, URL, ou outros parâmetros
- Deve retornar o objeto `config`, que será usado para a requisição final

### `rejectCallback(error)`

- Função chamada se houver um erro antes que a requisição seja enviada
- Recebe o erro como argumento, e pode lidar com ele ou repassá-lo adiante
- Deve retornar a rejeição da promessa, geralmente com `Promise.reject(error)`

### Retorno

Retorna um identificador que pode ser usado para remover o interceptador posteriormente com `eject`.

# Exemplos

```JavaScript
// Exemplo não executável.

axios.interceptors.request.use(
    config => {
        // Modifica a requisição antes de enviá-la.
        config.headers.Authorization = 'Bearer yourAccessToken';

        console.log('Request config:', config);

        return config;
    },
    error => {
        // Lida com erros antes de enviar a requisição.
        console.error('Request error:', error);

        return Promise.reject(error);
    }
);
```

Essa flexibilidade torna o `axios.interceptors.request.use` uma ferramenta poderosa para aplicar lógica global às requisições em um aplicativo.

# [[Voltar para: `axios`]](./1-axios.md)