# Axios

### Sumário

- [Métodos](#metodos)

# <a id="metodos"></a>Métodos

### Sumário

- [`axios.post()`](#metodos-axios-post)

## <a id="metodos-axios-post"></a>`axios.post()`

É utilizado para **enviar requisição HTTP POST**. Este método é útil para enviar dados ao servidor, tipicamente em formato JSON, para criar ou atualizar recursos.

- **Sintaxe Básica**

```JavaScript
axios.post(url, data, config);
```

+ **Parâmetros:**
    - `url` **(string):** a URL para a qual a requisição será enviada
    - `data` **(object):** os dados que serão enviados no corpo da requisição. Normalmente, isso é um objeto JavaScript que será convertido em JSON
    - `config` **(object, opcional):** um objeto de configuração para ajustar a requisição. Este objeto pode incluir cabeçalhos adicionais, parâmetros de consulta, tempo limite, etc.