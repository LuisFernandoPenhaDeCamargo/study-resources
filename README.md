# README <--

O objetivo deste repositório é pontuar conceitos e ferramentas que são importantes para um desenvolvedor. Abaixo, teremos um sumário dos diretórios (ou arquivos) que se encontram no nível superior deste repositório, também iremos fornecer um breve resumo do que cada um trata.

Observe que dentro de cada diretório que se encontra no nível superior, também existirá outro arquivo README pontuando o sumário daquele diretório. A ordem dos itens nos sumários, normalmente, tem significado, seja uma sugestão em relação a ordem de estudo por conta do aumento de complexidade, a até mesmo, um conteúdo que eu uso com mais frequência na minha vida profissional.

Tenha em mente que se o sumário, seja deste documento README ou qualquer outro, não possuir links ativos para o diretório, tópico ou subtópico, quer dizer que o item em questão ainda não foi adicionado.

### Sumário

- [JavaScript](./JavaScript/)
- Rust
- Python
- [Diretório Heterogêneo](./diretorio-heterogeneo/)
- [Brainstorming](./brainstorming.md)
- [Template](./template.md)

### JavaScript

Este diretório contém informações sobre o ecosssitema JavaScript, sejam conceitos, bibliotecas, frameworks ou até mesmo ferramentas (pacotes).

### Diretório Heterogêneo

Este diretório contém vários documentos que tratam dos mais variados assuntos relacionados a tecnologia.

### Brainstorming

Este documento contém um apanhado de ideias, o propósito dele é ajudar a me organizar como irei estruturar o conteúdo dentro deste repositório.

### Template

Este arquivo específica as regras para formatar os documentos (arquivos) deste repositório, ele é útil na hora de padronizar novos conteúdos que serão adicionados a este repositório.

# Estudar

Abaixo temos uma lista de tópicos que eu irei estudar.

### 1. JavaScript

- Me explique cada detalhe do log abaixo:

```Bash
<ref *1> [AsyncFunction: getTemporaryCredentials] {
  default: [Circular *1],
  getDatabasePassword: [AsyncFunction: getDatabasePassword],
  esmkTreeId: 'file:///home/luis/APIs/zoe-game-api/services/sensitive_data_getters.mjs?esmk=1'
}
```

- O que significa o "`_`" no exemplo:
    + Qual é o nome deste símbolo?

```JavaScript
const _ = require("lodash");
```

- `interface`

### 2. AWS

- AWS STS (Security Token Service)
- AWS IAM

### 3. Variados

- O que deduzimos sobre a tabela users
- O que deduzimos sobre a tabela remote_queries
- O que deduzimos sobre a tabela remote_commands
- Docker
    + Utilizando Docker para implementar CI/CD
- Funções x Métodos?
- Parâmetros x Argumentos?
- Módulos x Bibliotecas x Frameworks?
- Diretório x Pasta
- Terminal x Prompt de Comando
- JSON
- API Gateway
- "RESTful"
- Shebang (Linux)

---

Arquivos abertos no repositório zoe-game-api:

- **getAccessToken.teste.mjs**
- **send_error.js**
- **debug.js**
- **package.json**
- **server.js**
- **prize.js**
- **raffle_prizes.js**
- **raffle_accumulated_prize.sql**
- **raffle_jackpot.prize.sql**