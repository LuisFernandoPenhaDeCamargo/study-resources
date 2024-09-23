# Express

### Sumário

- [`request.path`](#request-path)

# <a id="request-path"></a>`request.path`

`request.path` é uma propriedade do objeto `request` que fornece o caminho da URL da solicitação. Esta propriedade **retorna uma string que representa a parte da URL após o host, sem a query string e sem o fragmento (hash)**.

### Exemplos

```JavaScript
app.get("/usuarios/:id", (request, response) => {
    console.log(request.path); // Exemplo: /usuarios/123

    response.send(`Caminho solicitado: ${request.path}`);
});
```

Se um usuário acessar "`http://localhost:3000/usuarios/123`", o valor de `request.path` será `/usuarios/123`.