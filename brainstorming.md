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

```Bash
# Comando utilizado em um teste.
curl http://localhost:8080/game/bigwinner  -X POST \
-H "Content-Type: application/json" -d '{"machine_id": 101}'
```

-> ES6
-> constructor

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create

https://developer.mozilla.org/pt-BR/docs/Web/JavaScript

https://github.com/sinonjs/sinon/issues/2578

Revisão ortográfica (aceita sugestões de alteração na estrutura do texto):

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
*/

---

Vamos esclarecer alguns conceitos sobre os módulos ECMAScript (ESM), particularmente em relação às exportações nomeadas e exportações padrão.

Carregamento de Módulos ESM
Os módulos ESM são carregados de forma estática. Isso significa que as dependências e exportações de um módulo são resolvidas no momento em que o módulo é carregado, antes de qualquer código ser executado. Esse carregamento estático permite que as ferramentas de desenvolvimento e os motores JavaScript façam otimizações, como "tree shaking" (remoção de código não utilizado).

Exportações Nomeadas vs. Exportação Padrão
Exportações Nomeadas:

Imutabilidade: Quando você exporta uma função, classe, ou variável com uma exportação nomeada (export { foo, bar }), cada exportação é "vinculada" de forma imutável ao módulo exportador. Isso significa que, depois que o módulo é carregado, essas exportações não podem ser modificadas no módulo importador.
Carregamento Estático: As exportações nomeadas são resolvidas estaticamente, permitindo que o código do módulo importador seja otimizado de acordo com as dependências exatas que ele utiliza.
Exportação Padrão:

Um Único Valor: Um módulo pode ter uma única exportação padrão (export default foo), que pode ser qualquer valor: uma função, uma classe, um objeto, etc.
Diferença na Importação: A exportação padrão pode ser importada com qualquer nome de sua escolha no módulo importador (import foo from './module'), o que a torna um pouco diferente em termos de sintaxe em comparação com as exportações nomeadas.
Carregamento Estático: Assim como as exportações nomeadas, a exportação padrão também é resolvida estaticamente. No entanto, o comportamento da exportação padrão pode dar a impressão de ser mais "flexível" por causa da forma como é importada.
Resumindo
Exportações Nomeadas: São vinculadas estaticamente e não podem ser modificadas no módulo importador. O módulo que exporta não precisa ter uma exportação padrão.
Exportação Padrão: Pode ser qualquer valor único exportado pelo módulo, e é resolvida estaticamente. Um módulo pode ter tanto exportações nomeadas quanto uma exportação padrão, mas apenas uma exportação padrão por módulo.
Carregamento Dinâmico
Embora ESM seja carregado estaticamente no sentido de que as exportações são resolvidas no momento do carregamento, é possível carregar módulos dinamicamente usando import(). Isso permite carregar um módulo apenas quando necessário, mas mesmo assim, uma vez carregado, as exportações são resolvidas estaticamente.

Essa diferenciação entre carregamento estático e dinâmico pode ser confusa, mas o ponto principal é que as exportações, uma vez resolvidas, são imutáveis.

o calledWith guarda informações de quais chamadas? Todas?

---

A razão pela qual você precisa utilizar uma arrow function para testar se a função `hasRequiredKeys` lança uma exceção é que você quer verificar se a exceção é lançada durante a execução da função. Se você chamasse `hasRequiredKeys` diretamente dentro de `expect`, a exceção seria lançada imediatamente e não seria capturada pelo `expect`, resultando em um erro na execução do teste.

Quando você usa uma arrow function dentro de `expect`, você está atrasando a execução da função até o momento em que `expect` esteja pronto para capturar e verificar a exceção.

Aqui está a diferença:

### Chamando a função diretamente (não funciona como esperado):
```javascript
// Isso vai lançar a exceção imediatamente e não permitirá que `expect` a capture corretamente
expect(hasRequiredKeys(fakeKeys, fakeValidationArray)).to.throw("There are no keys.");
```

Neste caso, a exceção é lançada antes que `expect` possa processá-la, e o teste falha de forma inesperada.

### Usando uma arrow function (correto):
```javascript
// Isso atrasa a execução de `hasRequiredKeys` até que `expect` esteja pronto para capturar a exceção
expect(() => hasRequiredKeys(fakeKeys, fakeValidationArray)).to.throw("There are no keys.");
```

Neste caso, a função `hasRequiredKeys` é executada dentro da arrow function, permitindo que `expect` capture e verifique a exceção corretamente.

Não é especificamente sobre o funcionamento das arrow functions, mas sim sobre como exceções são capturadas em JavaScript e como o framework de testes (como Chai) trabalha para verificar se uma função lança uma exceção.

Aqui está o que acontece:

### Lançamento de Exceções em JavaScript:
- Quando uma função é chamada diretamente e ela lança uma exceção, essa exceção interrompe imediatamente o fluxo de execução.
- Se você tentar verificar uma exceção usando `expect` em Chai sem encapsular a chamada da função, a exceção será lançada antes de `expect` ter a chance de verificá-la, resultando em uma falha inesperada no teste.

### Uso de Funções (Incluindo Arrow Functions) para Capturar Exceções:
- Para que o framework de teste consiga capturar e verificar a exceção, a execução da função deve ser atrasada até o momento em que o `expect` esteja pronto para fazer a verificação.
- Isso é feito passando a função que lança a exceção como argumento para `expect`. Quando `expect` recebe uma função como argumento, ele executa essa função dentro de seu próprio contexto e verifica se a exceção é lançada.

### Arrow Functions vs. Funções Regulares:
- Tanto arrow functions quanto funções regulares podem ser usadas para encapsular a chamada da função que lança a exceção.
- A arrow function é apenas uma maneira concisa de escrever essa função anônima. O mesmo comportamento pode ser obtido com uma função regular.

### Exemplos:

**Arrow Function:**
```javascript
expect(() => hasRequiredKeys(fakeKeys, fakeValidationArray)).to.throw("There are no keys.");
```

**Função Regular:**
```javascript
expect(function() { hasRequiredKeys(fakeKeys, fakeValidationArray); }).to.throw("There are no keys.");
```

Ambas as abordagens funcionam da mesma maneira nesse contexto. O importante é encapsular a chamada para que `expect` possa capturar a exceção.

before é chamado antes do beforeEach?

Exception during run: TypeError: ES Modules cannot be spied

---

- Utilizar a suíte para documentar qual é a responsabilidade do código
- Documentar as querys e as curls utilizadas nos testes manuais
- Verificar o número de vezes em que os métodos (ou funções) são chamados
- Verificar o caso de sucesso, se o retorno está de acordo com o que você espera
- Verificar o caso de falha, utilizar este caso para documentar os possíveis erros
  + Caso em que o arquivo não existe
  + Caso em que você não tem permissão para ler o arquivo
  + Caso em que há a "ocorrência" de propriedades `undefined`
  + Caso em que a requisição falha
  + Basicamente é algo lançando um erro, você envolvendo a função em um `try`/`catch` já cuida de todos os cenários possíveis (tecnicamente)

// sinon.match.hasAllKeys
callCount

// var app  = express();
// var router = express.Router();
// app.use('/game', router);
// app.listen
// calledOnceWith ordem importa
// o que é middleware
// machinesData (controlador) x TokenAuthMiddleware (middleware), tudo que é passado para o router não é considerado um middleware?
// mock x stub - simulação x substituição

calledOnceWith não é adequado para comparar arrays aninhados <-- documentar o método
secretsManagerClientInstanceStub.send.reset();

---

ao att algo no SO, o driver de vídeo apresentou mal funcionamento
considerar que se você tem uma placa de vídeo, você pode estar usando o driver errado (estava usando o do SO ao invés do da NVIDIA, próprio)

---

mas nos outros casos, a gente também importava o módulo antes da substituição. É que este módulo exporta um objeto, isso difere de testes para módulos que exportam uma função e depois são executados?
O ChatGPT disse:
ChatGPT
Memória atualizada
Sim, há uma diferença importante entre testar módulos que exportam objetos e aqueles que exportam funções. Quando você exporta um objeto, as propriedades e métodos desse objeto são avaliados no momento em que o módulo é carregado. Isso significa que, ao importar o módulo, o objeto já foi criado e os métodos já foram atribuídos.

Aqui estão algumas considerações:

Avaliação antecipada: Quando um módulo exporta um objeto, esse objeto é criado imediatamente quando o módulo é importado. Isso inclui a execução de qualquer código relacionado à configuração do objeto, como a criação de clientes Redis, no seu caso. Portanto, se você quiser substituir ou stubar um método (como createClient), precisa garantir que isso seja feito antes que o módulo que o utiliza seja importado.

Stub em funções vs. objetos: Quando você stuba uma função, está substituindo uma referência a essa função antes que ela seja utilizada. No caso de objetos, especialmente aqueles já instanciados ou configurados na importação, o stub precisa ser aplicado de forma que afete o objeto já criado.

Com funções: Você pode stubar diretamente após a importação do módulo.
Com objetos: Se o objeto já foi instanciado na importação, o stub pode não funcionar conforme esperado, porque a instância já foi criada com os métodos originais.
Solução:

Uso de esmock: Se você estiver usando esmock, ele é projetado para mockar o módulo antes da importação, então você deve garantir que ele mocka o método ou a propriedade do objeto que deseja testar.
Redesign do código: Outra abordagem é repensar o design do código, permitindo que a criação do objeto seja mais controlada, talvez exportando uma função que retorne o objeto em vez de exportar o objeto diretamente.
Esses pontos podem explicar por que seu stub no método createClient não está funcionando como esperado.

Boa GPT, era a questão entre importar um obj x importar funções

---

game-api server.js linha 98
//setInterval(tasks.offline_machines(models), config.tasks.offline_machines); <F Não quero que as minhas slots sejam marcadas como offlines.

- Módulo x Biblioteca x Framework <--
- `util` (Biblioteca?)
- `Array` (Object)
  + `prototype`
  + `slice`
  + `call()`
- `forEach()`
- `Array.isArray`
- `typeof`
- `push`
- `util.inspect`
- `replace`
  + `/\s\s/g`
- `join`
  + `/\n\g`
- `request.path`

+ `redis`
+ `createClient()`
+ `on`
+ `auth`
+ `config`

- `sinon.match`
  + `sinon.match(func => typeof func === "function")`
- `property()`
- `instanceof()` (asserção do Chai)

---

"build": "babel . --out-dir dist --config-file ./babel.config.json",

{
    "presets": [
        ["@babel/preset-env", {
            "targets": {
                "node": "18.20.3"
            },
            "modules": "commonjs" // Isso converte os módulos ES para CommonJS.
        }]
    ],
    "plugins": [
        "@babel/plugin-syntax-import-meta",
        "@babel/plugin-transform-modules-commonjs"
    ],
    "ignore": [
        "node_modules/**"
    ]
}

---

- pkg
"pkg": {
  "scripts": [
    "./models/*.js"
  ]
}

TypeError: Invalid host defined options
pkg/prelude/bootstrap.js:1926
      return wrapper.apply(this.exports, args);

- Babel
babel pwdIn --out-dir pwdOut

- O Babel automaticamente detecta o arquivo de configuração quando você executa seus comandos. Se você tiver um **babel.config.json** ou **.babelrc** na raíz do projeto, não precisará passar o arquivo de configuração explicitamente ao executar o Babel
- Transpilar o **node_modules** gera um erro
- 

Por padrão, o Babel só processa e **copia** arquivos que ele transpila, ou seja, arquivos com extensões que ele reconhece, como **.js**, **.mjs**, etc. Isso significa que arquivos como **package.json**, **README.md**, ou outros arquivos que não são transpilados pelo Babel, não serão incluídos no diretório de saída, a menos que você faça isso explicitamente.

Além disso, se um diretório não contiver nenhum arquivo que o Babel transpile, ele também não será criado no diretório de saída.

## Como Incluir Arquivos Adicionais no Diretórito de Saída

Se você precisar copiar arquivos como **package.json**, **README.md**, ou outros, arquivos/diretórios não processados pelo Babel, você pode utilizar uma ferramenta de cópia separada.

Você pode usar uma ferramenta como copyfiles para copiar arquivos e diretórios adicionais. Use a flag `--copy-files` ao rodar o Babel. Essa flag faz com que o Babel copie todos os arquivos que não são transpilados, mas que estão presentes no diretório de entrada, para o diretório de saída.

## Considerações

- **Arquivos ignorados:** mesmo com a flag `--copy-files`, se o Babel estiver ignorando certos arquivos (como especificado pela opção `ignore`), eles não serão copiados
  + Eles são copiados, só não são transpilados
- **Diretórios vazios:** diretórios que não contêm arquivos relevantes para o Babel não serão copiados ou criados no diretório de saída
  + Serão copiados sim

- O Babel não renomeou as strings de importação para remover a extensão **.mjs**

- A flag --copy-files é do Babel
  + A chave ignore faz os itens listados não serem transpilados, mas como eu específico que eu não quero que certos itens sejam copiados?

const require = createRequire(import.meta.url); -> const _require = (0, _module.createRequire)(import.meta.url);

o que é o algoritmo de compressão Brotli?
testes unitários para meu script?
Webpack e Babel são ferramentas que utilizam do código, se está lá, como você espera remover depois?

> pkg@5.8.1
compression:  Brotli
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/-- oriongames_dev.cyber_access_token def.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/authorization_tokens.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/big_winners.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/cashier.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/games.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/lanhouse_log.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/machines.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/raffle_accumulated_prize.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/raffle_jackpot_prize.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/remote_queries.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/settings.sql
> Warning Non-javascript file is specified in 'scripts'.
  Pkg will probably fail to parse. Specify *.js in glob.
  /home/luis/APIs/orion-game-api/db/dumps/wichmann_hill_rand.sql
> Warning Babel parse has failed: Missing semicolon. (1:36)
> Warning Babel parse has failed: Missing semicolon. (1:32)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:14)
> Warning Babel parse has failed: Missing semicolon. (1:14)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:6)
> Warning Babel parse has failed: Missing semicolon. (1:14)
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/-- oriongames_dev.cyber_access_token def.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/authorization_tokens.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/big_winners.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/cashier.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/games.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/lanhouse_log.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/machines.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/raffle_accumulated_prize.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/raffle_jackpot_prize.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/remote_queries.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/settings.sql
> Warning Failed to make bytecode node16-x64 for file /snapshot/orion-game-api/db/dumps/wichmann_hill_rand.sql

Sim, o `pkg` tem um mecanismo de otimização para minimizar o tamanho do executável gerado, o que inclui a remoção de arquivos não utilizados. 

### Como Funciona a Otimização no `pkg`

1. **Análise de Código**: O `pkg` analisa o código do seu projeto e os módulos que são utilizados diretamente no código de entrada. Ele tenta incluir apenas os arquivos e dependências que são explicitamente requeridos ou utilizados.

2. **Incluir/Excluir Arquivos**:
   - **Incluindo Arquivos**: O `pkg` inclui arquivos que são explicitamente referenciados ou necessários para a execução do código. Isso é feito através das configurações no arquivo `pkg.config.json`, onde você pode especificar quais arquivos e diretórios incluir ou excluir.
   - **Excluindo Arquivos**: Arquivos que não são utilizados diretamente e não são referenciados pelo código de entrada geralmente são excluídos do binário final.

3. **Configurações de Inclusão e Exclusão**: Você pode controlar quais arquivos e pastas são incluídos ou excluídos usando as chaves `assets`, `scripts`, e `targets` no arquivo de configuração do `pkg`:

   ```json
   {
     "pkg": {
       "assets": [
         "public/**/*"
       ],
       "scripts": [
         "src/**/*.js"
       ],
       "targets": [
         "node14-linux-x64"
       ]
     }
   }
   ```

   Se você quiser excluir arquivos ou diretórios específicos, você pode usar o parâmetro `--exclude` diretamente no comando `pkg` ou configurar isso no seu arquivo de configuração.

### Exemplo de Configuração de Exclusão

Se você tem um arquivo `pkg.config.json` e deseja excluir arquivos específicos, você pode configurar isso assim:

```json
{
  "pkg": {
    "assets": [
      "src/**/*"
    ],
    "targets": [
      "node14-linux-x64"
    ],
    "exclude": [
      "old-tests/**/*"
    ]
  }
}
```

Neste exemplo, qualquer arquivo dentro do diretório `old-tests` será excluído do binário gerado.

### Verificação de Inclusão

Se você não tem certeza se um arquivo está sendo incluído ou não, você pode usar a opção `--debug` com o `pkg` para obter mais informações sobre o que está sendo incluído no binário:

```bash
pkg . --config pkg.config.json --debug
```

Isso exibirá informações detalhadas sobre os arquivos que o `pkg` está considerando para inclusão.

// curl http://localhost:8080/game/machines/101 -X GET -H "Content-Type: application/json"
// curl http://localhost:8080/game/ping -X GET
// 49191128 - Brotli
// strings server | grep -o old-tests/play.json
// fazer testes unitários

- documentar toda essa merda
- testar a publicação do SEA em um servidor
- publicar o minor fix

ls ~/.nvm/versions/node/v8.16.0/lib/node_modules/@zoeslots/zoe-game-api/

Postman