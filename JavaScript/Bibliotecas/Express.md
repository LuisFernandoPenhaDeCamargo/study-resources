# <a id="express"></a>Express

### Sumário

- [Métodos](#metodos)
    + [app.listen()](#metodos-app-listen)

# <a id="metodos"></a>Métodos

### Sumário

- [app.listen()](#metodos-app-listen)

# <a id="metodos-app-listen"></a>`app.listen()`

É utilizado para **iniciar um servidor HTTP e começar a escutar por conexões em uma determinada porta**.

**Sintaxe Básica**

```JavaScript
const express = require("express");

const app = express();
const port = 3000;            // Porta em que o servidor vai escutar.
const hostname = "localhost"; // Nome do host.

app.listen(port, hostname, () => {
    console.log(`Servidor Express está escutando na porta ${port}`);
});
```

- **Parâmetros:**
    + `port`**:** o número da porta em que o servidor vai escutar por conexões HTTP
    + `hostname` **(opcional):** você pode passar um endereço IP ou nome do host. Isso é útil se você quiser especificar um endereço IP específico ou um nome de host para o servidor escutar, em vez de escutar todas as interfaces de rede
    + `callback` **(opcional):** uma função opcional que será executada assim que o servidor for iniciado e começar a escutar por conexões. Este callback geralmente é usado para registrar uma mensagem de log indicando que o servidor está escutando e em qual porta

Ao chamar `.listen()`, o Express cria um servidor HTTP e começa a ouvir por conexões nesse servidor na porta especificada. Quando uma solicitação HTTP é recebida, o Express encaminha essa solicitação para a função de middleware apropriada com base no caminho da URL e no método HTTP da solicitação.

Neste exemplo, o servidor Express estará escutando apenas em conexões feitas para `localhost` na porta especificada. Isso significa que ele não estará acessível a partir de outros hosts na rede.

Se você omitir o segundo argumento, o Express irá escutar em todas as interfaces de rede disponíveis no sistema. Isso é equivalente a passar `null` ou não passar o segundo argumento.

É importante notar que o método `.listen()` é assíncrono e retorna uma instância de servidor HTTP, mas na maioria dos casos você não precisa armazenar essa instância em uma variável, já que o Express cuida disso internamente.

Se você quiser começar a escutar em uma porta específica, basta chamar `.listen()` passando o número da porta como primeiro argumento. Depois de chamar `.listen()`, seu servidor Express estará pronto para receber solicitações HTTP na porta especificada.

**Observações Interessantes**

No JavaScript, a função `app.listen()` do Express é capaz de identificar os argumentos que você passou com base em sua quantidade e tipo, graças a sobrecargas de função internamente. Basicamente, a implementação verifica os argumentos fornecidos e ajusta o comportamento com base nisso (identifica quais são).

Esta abordagem permite que o Express flexibilize a maneira como os desenvolvedores podem configurar o servidor, tornando a API mais amigável e adaptável às necessidades do projeto.