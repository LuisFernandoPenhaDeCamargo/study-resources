O objetivo deste repositório é pontuar conceitos e ferramentas que são importantes para um desenvolvedor. Abaixo, teremos um sumário dos diretórios (ou arquivos) que se encontram no nível superior deste repositório, também iremos fornecer um breve resumo do que cada um trata.

Observe que dentro de cada diretório que se encontra no nível superior, também existirá outro arquivo README pontuando o sumário daquele diretório. A ordem dos itens nos sumários, normalmente, tem significado, seja uma sugestão em relação a ordem de estudo por conta do aumento de complexidade, a até mesmo, um conteúdo que eu uso com mais frequência na minha vida profissional.

Tenha em mente que se o sumário, seja deste documento README ou qualquer outro, não possuir links ativos para o diretório, tópico ou subtópico, quer dizer que o item em questão ainda não foi adicionado.

### Sumário

- [Conceitos Introdutórios para Programação](./conceitos-introdutorios-programacao/README.md)
- [JavaScript](./JavaScript/)
- Rust
- Python
- [Diretório Heterogêneo](./diretorio-heterogeneo/)
- [Template](./template/README.md)

## Conceitos Introdutórios para Programação

## JavaScript

Este diretório contém informações sobre o ecosssitema JavaScript, sejam conceitos, bibliotecas, frameworks ou até mesmo ferramentas (pacotes).

## Diretório Heterogêneo

Este diretório contém vários documentos que tratam dos mais variados assuntos relacionados a tecnologia.

## Template

Este arquivo específica as regras para formatar os documentos (arquivos) deste repositório, ele é útil na hora de padronizar novos conteúdos que serão adicionados a este repositório.

# Estudar

Abaixo temos uma lista de tópicos que eu irei estudar.

### 1. JavaScript

- `stub.throws()`
- `typeof`
- `process`
- `process.env`
- util
- `arguments`
- `isArray`
- `push`
- `slice`
- `forEach`
- `inspect`
- `replace`
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

- "/\s\s/g" (expressão regular)
- "/\n/g" (expressão regular)
- .mjs habilita o strict mode por padrão?
- `delete` de valores cujo tipo de dado é primitivo em ESM
- `interface`

### 2. AWS

- AWS STS (Security Token Service)
- AWS IAM

### 3. Variados

- Anotar o que deduzimos sobre a tabela users
- Anotar o que deduzimos sobre a tabela remote_queries
- Anotar o que deduzimos sobre a tabela remote_commands
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

# Prático

Arquivos abertos no repositório zoe-game-api:

- **services.test.mjs**
- **send_error.js**
- **debug.js**
- **package.json**
- **server.js**
- **prize.js**
- **raffle_prizes.js**
- **raffle_accumulated_prize.sql**
- **raffle_jackpot_prize.sql**

```Bash
# Comando utilizado em um teste.
curl http://localhost:8080/game/bigwinner  -X POST \
-H "Content-Type: application/json" -d '{"machine_id": 101}'
```

- Verificar o número de vezes em que os métodos (ou funções) são chamados
- Verificar o caso de sucesso, se o retorno está de acordo com o que você espera
- Verificar o caso de falha, se o tratamento de erro está de acordo com o que você quer. Exemplos relacionados a arquivos:
  + Caso em que o arquivo não existe
  + Caso em que você não tem permissão para ler o arquivo