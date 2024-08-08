### 1. JavaScript

JS x quantidade de memória alocada
elseif x if seguido de if

- `include`
- `reset`
- `getMonth`
- `getDate`
- `getHours`
- `getMinutes`
- `getSeconds`
- A "real interação" do `constructor` e o JavaScript
- `new`
- `new` em funções. Exemplo: `new exampleFunction()`
- `have` (provavelmente uma cadeia de asserção)
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
- Verificar o caso de falha, se o tratamento de erro está de acordo com o que você quer
  + Caso em que o arquivo não existe
  + Caso em que você não tem permissão para ler o arquivo
  + Caso em que há a "ocorrência" de propriedades `undefined`
  + Caso em que a requisição falha
  + Basicamente é algo lançando um erro, você envolvendo a função em um `try`/`catch` já cuida de todos os cenários possíveis (tecnicamente)

-> ES6
-> constructor

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create

https://developer.mozilla.org/pt-BR/docs/Web/JavaScript

https://github.com/sinonjs/sinon/issues/2578

Revisão ortográfica (aceita sugestões de alteração na estrutura do texto):

Quando eu uso o esmock em um módulo, ele deixa de ser readonly? ELE DEIXA MANO, A VIDA É AMAZING

Now I see that constructor is a syntax sugar and it's nothing to do with Function.prototype.constructor, therefore stubbing it has no effect.

O que seria sandbox no contexto do JS

npm reload, como ele interaje com um executável?
considerando que ele é um executável escrito em JS e compilado com o pkg

pm2 reload -> sinais de término -> src code -> graceful shutdown
           -> já inicia um novo processo

listar os erros que eu encontrei ao utilizar o sinon

-> aparentemente você não pode manipular o valor de variáveis do módulo que está sendo testado

`import` -> "An import declaration can only be used at the top level of a module." -> solution: esmock no beforeEach

---

SinonJS

- `stub.args`
  + `console.log(stub.args)`
  + `console.log(stub.args[0])`
  + `console.log(stub.args[0][0])`
- `stub.getCall()`
- `callCount`

---

`new Obj` x `new Obj()`

---

- Se o módulo não exporta, não dá pra manipular na suíte de teste

---

Date
- `new Date()` cria um objeto Date no formato ISO 8601

# Padrão ISO 8601

1. **Data:**
  - **Ano:** `YYYY` (quatro dígitos)
  - **Mês:** `MM` (dois dígitos)
  - **Dia:** `DD` (dois dígitos)
2. **Hora:**
  - **Horas:** `hh` (dois dígitos)
  - **Minutos:** `mm` (dois dígitos)
  - **Segundos:** `ss` (dois dígitos)
  - **Milissegundos:** `SSS` (três dígitos)
3. **Separadores:**
  - `T` entre data e hora
  - `.` entre segundos e milissegundos. A "," não é suportada pelo JavaScript
4. **Fuso horário:**
  - `Z` para indicar UTC (Tempo Universal Coordenado). O `z` é suportado pelo JavaScript
  - `±hh:mm` para deslocamentos específicos do UTC

## Exemplos

- 2024-08-02T15:10:00.000 (YYYY-MM-DDThh:mm:ss.SSS)

---

ES6 x Pkg --> O Pkg não é compatível com o ES6 => Transpilar o código
    └──> **Tecnicamente** isso não afetará o funcionamento da aplicação

+ Erro encontrado:
  - `code: 'BABEL_PARSE_ERROR', reasonCode: 'IllegalReturn',` (transpilando os arquivos em **node_modules**)
  - `code: 'BABEL_PARSE_ERROR', reasonCode: 'UnsupportedImport',`

npm update @babel/core @babel/cli @babel/preset-env

.babelrc: Usado para configuração local específica para um diretório. Se você tiver múltiplos diretórios com diferentes configurações Babel, pode usar .babelrc em cada um para definir regras específicas.
babel.config.json: Usado para configurações globais que afetam todo o projeto. Este é o arquivo recomendado se você deseja uma configuração única para o projeto inteiro.

---

teste -> transpile -> compile -> pm2

{
  "name": "@zoeslots/orion-game-api",
  "version": "1.0.0-homolog.1",
  "description": "Game API manages game operations including money in/out, accumulated/jackpot raffle",
  "author": "Zoe Slots, LLC",
  "bin": {
    "orion-game-server": "server"
  },
  "files": [
    "./server"
  ]
}

ssh zoe@192.168.1.137 -p 1337 -i ~/Downloads/my-certificate.pem

publicar na nova conta do npm -> tem que dar logout -> altere o .npmrc

scp luis@192.168.1.115:/home/luis/teste/@zoeslots/zoe-game-api .

https://github.com/LuisFernandoPenhaDeCamargo/study-resources/blob/main/v2/Refatorar/Refatorar2/npm.md
https://github.com/LuisFernandoPenhaDeCamargo/study-resources/blob/main/v2/JavaScript/Pacotes/PM2.md
https://github.com/LuisFernandoPenhaDeCamargo/study-resources/blob/main/v2/JavaScript/Pacotes/pkg.md

curl http://localhost:8080/game/ping -X GET

curl http://localhost:8080/game/bigwinner -X POST \
-H "Content-Type: application/json" -d @data2.json

curl http://localhost:8080/game/ping -X POST \
-H "Content-Type: application/json" -d @data2.json

---

- SO: remover todos os arquivos/diretórios protegidos contra escrita de uma só vez

```
eu quero remover um diretório e a mensagem: rm -r *

rm: remover arquivo comum 'objects/fe/d85f28323b804ec0a042ed2188053051adae63' protegido contra escrita?

como eu faço para não ter que ficar dando permissão?
```

- Realizei o push de um arquivo que tinha um segredo nele e o GitHub bloqueou. Como eu resolvo isso:
  + https://docs.github.com/code-security/secret-scanning/pushing-a-branch-blocked-by-push-protection
  + https://github.com/newren/git-filter-repo/

```
remote: error: GH013: Repository rule violations found for refs/heads/main.
remote: 
remote: - GITHUB PUSH PROTECTION
remote:   —————————————————————————————————————————
remote:     Resolve the following violations before pushing again
remote: 
remote:     - Push cannot contain secrets
remote: 
remote:     
remote:      (?) Learn how to resolve a blocked push
remote:      https://docs.github.com/code-security/secret-scanning/pushing-a-branch-blocked-by-push-protection
remote:     
remote:     
remote:       —— npm Access Token ——————————————————————————————————
remote:        locations:
remote:          - commit: d7291366a9d5d66df118ea5092cfc2720d9417cc
remote:            path: brainstorming.md:193
remote:     
remote:        (?) To push, remove secret from commit(s) or follow this URL to allow the secret.
remote:        https://github.com/LuisFernandoPenhaDeCamargo/study-resources/security/secret-scanning/unblock-secret/2kHqGRquU2BSmxMX5Gelks3M9wL
remote:     
remote: 
remote: 
To https://github.com/LuisFernandoPenhaDeCamargo/study-resources
 ! [remote rejected] main -> main (push declined due to repository rule violations)
error: failed to push some refs to 'https://github.com/LuisFernandoPenhaDeCamargo/study-resources'`
```

---

- Planilha ODF (.ods) <-- Deu certo

[ getTemporaryCredentials Error ], Request failed with status code 403
*/