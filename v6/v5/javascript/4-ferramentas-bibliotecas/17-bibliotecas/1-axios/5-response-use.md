# `axios.interceptors.response.use`

O método `use` é utilizado para **adicionar interceptadores que manipulam as respostas das requisições feitas com Axios**. Esses interceptadores permitem modificar, lidar com erros ou manipular a resposta antes que ela seja passada ao código que chamou a requisição.

### Sintaxe Básica

```JavaScript
axios.interceptors.response.use([onFulfilled[, onRejected]]);
```

- `onFulfilled`**:** função que é chamada quando a resposta da requisição for bem-sucedida. Recebe a resposta como argumento e deve retornar a resposta diretamente ou modificada
- `onRejected`**:** função chamada quando ocorre um erro na requisição. Recebe o erro como argumento e pode lançar o erro novamente ou tratá-lo
- **Retorno:** um identificador que pode ser usado para remover o interceptador mais tarde, se necessário

# Exemplo

```JavaScript
// Exemplo não executável.

axios.interceptors.response.use(
    response => {
        // Manipular a resposta com sucesso.
        console.log('Response received:', response);

        return response;
    },
    error => {
        // Manipular erros de resposta.
        console.error('Error in response:', error);

        return Promise.reject(error);
    }
);
```

Este exemplo mostra como interceptar e manipular tanto as respostas bem-sucedidas quanto os erros de resposta.

# Observações Importantes

Passar `null` como o primeiro argumento para `use` não afeta o funcionamento das respostas, desde que você **forneça um segundo argumento válido** (função de callback para erros). Isso porque o primeiro argumento (`onFulfilled`) é opcional. Se `null` ou `undefined` for passado, o interceptador simplesmentes ignorará a manipulação da resposta bem-sucedida e deixará a resposta passar **inalterada**.

Por exemplo, o seguinte código não altera o comportamento das respostas, mas ainda lida com os erros:

```JavaScript
// Exemplo não executável.

axios.interceptors.response.use(null, error => {
    console.error('Error in response:', error);

    return Promise.reject();
});
```

Neste caso, as respostas bem-sucedidas não serão interceptadas nem modificadas, mas os erros serão tratados pelo segundo argumento.

# [[Voltar para: `axios`]](./1-axios.md)