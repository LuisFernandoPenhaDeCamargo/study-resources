Now I see that constructor is a syntax sugar and it's nothing to do with Function.prototype.constructor, therefore stubbing it has no effect.

O que seria sandbox no contexto do JS

npm reload, como ele interaje com um executável?
considerando que ele é um executável escrito em JS e compilado com o pkg

pm2 reload -> sinais de término -> src code -> graceful shutdown
           -> já inicia um novo processo

-> aparentemente você não pode manipular o valor de variáveis do módulo que está sendo testado

`import` -> "An import declaration can only be used at the top level of a module." -> solution: esmock no beforeEach

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

- Planilha ODF (.ods) Deu certo <F
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

calledOnceWith não é adequado para comparar arrays aninhados documentar o método <F
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

no meu banco eu entrei como root, após mudar para o usuário root no SO

ALTER USER 'root'@'localhost' IDENTIFIED BY 'nova_senha';

+ Quanto de dinheiro eu vou guardar para o que?

- Definir um tempo para refatorar conhecimento
  + Só do repositório ou do browser também?
  + Quais partes do repositório eu começarei refatorando?
  + Posso utilizar todo o limite do GPT de manhã
- Quantas vezes no dia eu vou verificar se um servidor possui o erro e corrigí-lo

- Quando você executa a migração, o usuário utilizado na conexão fica como o `DEFINER` das procedures e da função

---

Para verificar se a palavra "mysql" está presente em algum arquivo ou subdiretório no diretório atual (diretório `x`), você pode usar o comando `grep` com a opção `-r` para buscar recursivamente. Aqui está o comando:

```bash
grep -r "mysql" .
```

### Descrição:
- **`grep`**: Comando de busca em arquivos.
- **`-r`**: Faz a busca de forma recursiva em todos os subdiretórios.
- **`"mysql"`**: A palavra que você está buscando.
- **`.`**: Indica que a busca deve começar no diretório atual.

Este comando irá listar todas as ocorrências da palavra "mysql" em arquivos dentro do diretório atual e seus subdiretórios.

---

Sim, a mensagem `Binary file ./rootfs/usr/local/bin/ZoeCashier matches` indica que o comando `grep` encontrou a palavra "mysql" dentro do arquivo binário `ZoeCashier`.

O `grep` detectou que o binário contém a string "mysql", mas como o arquivo é binário, ele não exibe diretamente a linha onde a palavra foi encontrada, apenas informa que a correspondência existe.

grep -r "source" .

contexto de gravação parece ser diferente do contexto da regravação que parece ser diferente do contexto do zoe-updater
a cada servidor novo verificar se o force_jackpot está como 104 e se o pacote orion-cashier-updater está instalado
acho que o problema que está dando com a cashier é por causa do HD utilizado na gravação, como a cashier já existiu nele, um erro está acontecendo

# ---

MainWindow::writeServer(): ParÃ¢metros da gravaÃ§Ã£o do server island:  
("/dev/sdb", "3861", "3861-Teste-Cachoeira") 
483+1 records in
483+1 records out
32432455680 bytes (32 GB) copied, 1142.86 s, 28.4 MB/s
mkdir: cannot create directory ‘/mnt/test1’: File exists
 Mount /dev/mapper
 Mount /dev/sdb
Disk /dev/mapper/lvmdsw doesn't contain a valid partition table
Disk /dev/mapper/gruposw-swap doesn't contain a valid partition table
Disk /dev/mapper/gruposw-root doesn't contain a valid partition table
Disk /dev/mapper/lvmdd doesn't contain a valid partition table
Disk /dev/mapper/dadossw-conteudo doesn't contain a valid partition table

WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk doesn't support GPT. Use GNU Parted.

Disk /dev/mapper/sda5_crypt doesn't contain a valid partition table
Disk /dev/mapper/lubuntu--vg-root doesn't contain a valid partition table
Disk /dev/mapper/lubuntu--vg-swap_1 doesn't contain a valid partition table
63344640

WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk doesn't support GPT. Use GNU Parted.


Command (m for help): Partition type:
   p   primary (2 primary, 1 extended, 1 free)
   l   logical (numbered from 5)
Select (default p): Selected partition 4
First sector (1499136-234441647, default 1499136): Value out of range.
First sector (1499136-234441647, default 1499136): Sector 63344640 is already allocated
First sector (231116800-234441647, default 231116800): Value out of range.
First sector (231116800-234441647, default 231116800): First sector (231116800-234441647, default 231116800): First sector (231116800-234441647, default 231116800): 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    63  100    15  100    48     22     73 --:--:-- --:--:-- --:--:--    73
{"status":"OK"}Can't do passphrase verification on non-tty inputs.
Command successful.
Writing Zeros
Formating partition
mke2fs 1.42.9 (4-Feb-2014)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
5242880 inodes, 20971008 blocks
1048550 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=4294967296
640 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624, 11239424, 20480000

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done   

device-mapper: remove ioctl on data failed: Device or resource busy
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    47  100    47    0     0     70      0 --:--:-- --:--:-- --:--:--    70
Processing boot partition
  Creating boot partition backup...
  Creating access...
  Formating unit...
  Opening unit...
  Creating physical volume...
  Creating volume group...
  Creating logical volume...
  Formating file system...
  Activating logical volume...
  Mounting logical volume...
  Restoring backup...
Done
Installing packages
  Installing parted package...
Done
Removing old kernels
Done
Removing zoe-cashier src
Copying custom software and scripts
Done
Updating GRUB
Done
Updating Initramfs
Done
Installing initialization sequence
  Installing GRUB package...
  Shuffling boot...
  Configuring GRUB...
  Configuring auto-boot...
  Configuring Initrd...
Done
Removing unnecessary files...
Removing display-sas from server
Done
Cloning server  3861-Teste-Cachoeira
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    47  100    18  100    29     27     44 --:--:-- --:--:-- --:--:--    44
+ sed -i s/zoe-server-1804/3861-Teste-Cachoeira/g /etc/hosts
+ echo 3861-Teste-Cachoeira
+ curl '' --output 3861-Teste-Cachoeira-full.sql.gz
curl: (3) <url> malformed
Configure Server
Installing packages
+ echo 'UPDATE settings SET server_id = 3861 ;'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    78  100    78    0     0    141      0 --:--:-- --:--:-- --:--:--   141
npm token 
+ echo //registry.npmjs.org/:_authToken=
+ sleep 5
+ mysqld_safe --user=mysql --skip-grant-tables
240828 13:58:00 mysqld_safe Logging to syslog.
240828 13:58:00 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE machines SET attempts = 8;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE configs SET auth_lock = 1;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'TRUNCATE users;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'ALTER TABLE users MODIFY password VARCHAR(100) NOT NULL;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'INSERT INTO users (name, login, password, status, role) VALUES ('\''Admin'\'', '\''admin'\'', '\''002020'\'', 1, '\''ADMIN'\''), ('\''Cyber'\'', '\''cyber'\'', '\''010203'\'', 1, '\''LANHOUSE'\'');'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE users SET password=sha1(password);'
+ cat id.sql
+ mysql -u orion -pBl4ckBox1337 zoeslots
+ rm id.sql
++ npm view @zoeslots/zoe-terminal versions
++ tail -n 2
++ sed 's|['\'',\n]||g'
++ grep -Ev 'beta|alpha|rc'
++ tr -d '[:space:]'
++ tr -d '['
++ tr -d ']'
+ ZOE_TERMINAL_VERSION=2.0.0
++ npm view @zoeslots/zoe-watchdog versions
++ grep -Ev 'beta|alpha|rc'
++ tail -n 2
++ tr -d '['
++ sed 's|['\'',\n]||g'
++ tr -d '[:space:]'
++ tr -d ']'
+ ZOE_WD_VERSION=0.2.0
+ npm cache clean --force
npm WARN using --force I sure hope you know what you are doing.
+ npm i -g --unsafe-perm @zoeslots/zoe-data-api@3.2.1-homolog.1
/usr/bin/orion-data-client -> /usr/lib/node_modules/@zoeslots/zoe-data-api/client.js

> @zoeslots/zoe-data-api@3.2.1-homolog.1 postinstall /usr/lib/node_modules/@zoeslots/zoe-data-api
> node migrate.js

Executed:
>> 20191011161400-set-id-to-zero.js
>> 20191015164200-set-machine-fields-to-zero.js
>> 20191021162600-add-promotion-columns.js
>> 20191106143200-add-updater-logs.js
>> 20200114145000-add-chage-game-enabled-to-settings.js
>> 20201104141522-add-environment-column.js
>> 20210125192520-AddTimezoneColumn.js
>> 20210126152411-modify-total-money-to-decimal.js
>> 20210217143758-modify-default-total-money.js
>> 20210225151318-add-new-games-fortunes-diamonds.js
>> 20210323150337-add-enums-to-machine.js
>> 20211014114644-add-new-games-jacare.js
>> 20211126170836-cyber-server_type.js
>> 20211202151645-authorization_tokens.js
>> 20211207125929-add-game-jungle.js
>> 20220103150132-add-new-game-vertical.js
>> 20220203125028-server_type-to-allow-or-deny.js
>> 20220214175013-add-new-environment-value.js
>> 20220418131019-authorization_tokens.js
>> 20220426132254-authorization-token-drop-id.js
>> 20220830193936-update-deviation.js
>> 20221104170410-add-new-games.js
>> 20221206132554-add-games-84-94.js
>> 20230117131831-game-kraken-treasure.js
>> 20230120174728-games-96-99.js
>> 20230222124352-add-game-23.js
>> 20230303201821-add-game-28.js
>> 20230309194954-new-alpha-games.js
>> 20230425141403-remove-game-100.js
>> 20230601170742-new-games.js
>> 20230615134217-new-games.js
>> 20230927133505-new-games.js
>> 20230927205810-fix-game-path.js
>> 20231006132853-new-game.js
>> 20231006191211-new-games.js
>> 20231012193115-remove-48-and-49.js
>> 20240320165900-update-wichmann_hill_rand.js
>> 20240320170000-update-accumulated-procedure.js
>> 20240320170000-update-jackpot-procedure.js
>> 20240423170000-alter-settings-big_winners.js
>> 20240605191218-new-games.js
>> 20240730170000-update-accumulated-procedure.js
>> 20240730170000-update-jackpot-procedure.js
+ @zoeslots/zoe-data-api@3.2.1-homolog.1
added 97 packages from 336 contributors, removed 3 packages and updated 15 packages in 15.804s
+ npm i -g @zoeslots/zoe-game-api
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated axios@0.19.2: Critical security vulnerability fixed in v0.21.1. For more information, see https://github.com/axios/axios/pull/3410
npm WARN deprecated sequelize@3.35.1: Please update to v6 or higher! A migration guide can be found here: https://sequelize.org/v6/manual/upgrade-to-v6.html
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
npm WARN deprecated terraformer-wkt-parser@1.2.1: terraformer-wkt-parser is deprecated and no longer supported. Please use @terraformer/wkt.
npm WARN deprecated terraformer@1.0.12: terraformer is deprecated and no longer supported. Please use @terraformer/arcgis.
/usr/bin/orion-game-server -> /usr/lib/node_modules/@zoeslots/zoe-game-api/server.js
+ @zoeslots/zoe-game-api@2.6.3
added 5 packages from 7 contributors, removed 1 package and updated 109 packages in 19.694s
+ npm i -g --unsafe-perm @zoeslots/zoe-terminal@2.0.0
npm WARN deprecated axios@0.18.1: Critical security vulnerability fixed in v0.21.1. For more information, see https://github.com/axios/axios/pull/3410
npm WARN deprecated multer@1.4.4: Multer 1.x is affected by CVE-2022-24434. This is fixed in v1.4.4-lts.1 which drops support for versions of Node.js before 6. Please upgrade to at least Node.js 6 and version 1.4.4-lts.1 of Multer. If you need support for older versions of Node.js, we are open to accepting patches that would fix the CVE on the main 1.x release line, whilst maintaining compatibility with Node.js 0.10.
npm WARN deprecated uws@8.14.1: New code is available at github.com/uNetworking/uWebSockets.js
/usr/bin/zoe-terminal-client -> /usr/lib/node_modules/@zoeslots/zoe-terminal/client.js
/usr/bin/zoe-terminal-server -> /usr/lib/node_modules/@zoeslots/zoe-terminal/server.js

> uws@8.14.1 install /usr/lib/node_modules/@zoeslots/zoe-terminal/node_modules/uws
> node-gyp rebuild > build_log.txt 2>&1 || exit 0

+ @zoeslots/zoe-terminal@2.0.0
added 17 packages from 9 contributors, removed 3 packages and updated 74 packages in 67.524s
+ npm i -g @zoeslots/zoe-watchdog@0.2.0
/usr/bin/zoe-watchdog -> /usr/lib/node_modules/@zoeslots/zoe-watchdog/watchdog
+ @zoeslots/zoe-watchdog@0.2.0
updated 1 package in 5.525s
+ npm i -g @zoeslots/zoe-updater
/usr/bin/orion-updater -> /usr/lib/node_modules/@zoeslots/zoe-updater/agent.py
+ @zoeslots/zoe-updater@1.5.2
updated 1 package in 3.861s
+ npm i -g --unsafe-perm @zoeslots/orion-cashier-updater
/usr/bin/ZoeCashier -> /usr/lib/node_modules/@zoeslots/orion-cashier-updater/ZoeCashier

> @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall /usr/lib/node_modules/@zoeslots/orion-cashier-updater
> sh cashier_replacer.sh

npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall: `sh cashier_replacer.sh`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2024-08-28T17_00_20_108Z-debug.log
+ kill 24091
+ sleep 10
Finished installing
rm: cannot remove ‘/mnt/test1/home/zoe/.aws/*’: No such file or directory
Created symlink /etc/systemd/system/multi-user.target.wants/disable-usbhid-module-reboot.service → /etc/systemd/system/disable-usbhid-module-reboot.service.
Created symlink /etc/systemd/system/network-online.target.wants/network-rules.service → /etc/systemd/system/network-rules.service.
rm: cannot remove ‘/mnt/test1/root/zoe-cashier’: No such file or directory
Umount device
umount: /mnt/test1/dev/pts: not mounted
File descriptor 3 (/dev/urandom) leaked on vgchange invocation. Parent PID 24731: /bin/bash
File descriptor 4 (/dev/random) leaked on vgchange invocation. Parent PID 24731: /bin/bash
  0 logical volume(s) in volume group "lubuntu-vg1" now active
File descriptor 3 (/dev/urandom) leaked on vgchange invocation. Parent PID 24731: /bin/bash
File descriptor 4 (/dev/random) leaked on vgchange invocation. Parent PID 24731: /bin/bash
  0 logical volume(s) in volume group "lubuntu-vg" now active
Done
1447
Server done

# ---

MainWindow::writeServer(): ParÃ¢metros da gravaÃ§Ã£o do server island:  
("/dev/sdb", "3864", "") 
483+1 records out
32432455680 bytes (32 GB) copied, 1183.43 s, 27.4 MB/s
mkdir: cannot create directory ‘/mnt/test1’: File exists
 Mount /dev/mapper
 Mount /dev/sdb
Disk /dev/mapper/lvmdsw doesn't contain a valid partition table
Disk /dev/mapper/gruposw-swap doesn't contain a valid partition table
Disk /dev/mapper/gruposw-root doesn't contain a valid partition table
Disk /dev/mapper/lvmdd doesn't contain a valid partition table
Disk /dev/mapper/dadossw-conteudo doesn't contain a valid partition table

WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk doesn't support GPT. Use GNU Parted.

Disk /dev/mapper/sda5_crypt doesn't contain a valid partition table
Disk /dev/mapper/lubuntu--vg-root doesn't contain a valid partition table
Disk /dev/mapper/lubuntu--vg-swap_1 doesn't contain a valid partition table
63344640

WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk doesn't support GPT. Use GNU Parted.


Command (m for help): Partition type:
   p   primary (2 primary, 1 extended, 1 free)
   l   logical (numbered from 5)
Select (default p): Selected partition 4
First sector (1499136-234441647, default 1499136): Value out of range.
First sector (1499136-234441647, default 1499136): Sector 63344640 is already allocated
First sector (231116800-234441647, default 231116800): Value out of range.
First sector (231116800-234441647, default 231116800): First sector (231116800-234441647, default 231116800): First sector (231116800-234441647, default 231116800): 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    63  100    15  100    48     24     79 --:--:-- --:--:-- --:--:--    79
{"status":"OK"}Can't do passphrase verification on non-tty inputs.
Command successful.
Writing Zeros
Formating partition
mke2fs 1.42.9 (4-Feb-2014)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
5242880 inodes, 20971008 blocks
1048550 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=4294967296
640 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624, 11239424, 20480000

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done   

device-mapper: remove ioctl on data failed: Device or resource busy
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    47  100    47    0     0     71      0 --:--:-- --:--:-- --:--:--    71
Processing boot partition
  Creating boot partition backup...
  Creating access...
  Formating unit...
  Opening unit...
  Creating physical volume...
  Creating volume group...
  Creating logical volume...
  Formating file system...
  Activating logical volume...
  Mounting logical volume...
  Restoring backup...
Done
Installing packages
  Installing parted package...
Done
Removing old kernels
Done
Removing zoe-cashier src
Copying custom software and scripts
Done
Updating GRUB
Done
Updating Initramfs
Done
Installing initialization sequence
  Installing GRUB package...
  Shuffling boot...
  Configuring GRUB...
  Configuring auto-boot...
  Configuring Initrd...
Done
Removing unnecessary files...
Removing display-sas from server
Done
Configure Server
Installing packages
+ echo 'UPDATE settings SET server_id = 3864 ;'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    78  100    78    0     0    141      0 --:--:-- --:--:-- --:--:--   141
npm token 
+ echo //registry.npmjs.org/:_authToken=
+ sleep 5
+ mysqld_safe --user=mysql --skip-grant-tables
240828 15:45:50 mysqld_safe Logging to syslog.
240828 15:45:50 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE machines SET attempts = 8;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE configs SET auth_lock = 1;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'TRUNCATE users;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'ALTER TABLE users MODIFY password VARCHAR(100) NOT NULL;'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'INSERT INTO users (name, login, password, status, role) VALUES ('\''Admin'\'', '\''admin'\'', '\''002020'\'', 1, '\''ADMIN'\''), ('\''Cyber'\'', '\''cyber'\'', '\''010203'\'', 1, '\''LANHOUSE'\'');'
+ mysql -u orion -pBl4ckBox1337 zoeslots -e 'UPDATE users SET password=sha1(password);'
+ cat id.sql
+ mysql -u orion -pBl4ckBox1337 zoeslots
+ rm id.sql
++ npm view @zoeslots/zoe-terminal versions
++ tr -d ']'
++ tr -d '[:space:]'
++ sed 's|['\'',\n]||g'
++ tr -d '['
++ tail -n 2
++ grep -Ev 'beta|alpha|rc'
+ ZOE_TERMINAL_VERSION=2.0.0
++ npm view @zoeslots/zoe-watchdog versions
++ sed 's|['\'',\n]||g'
++ tr -d ']'
++ tr -d '['
++ tr -d '[:space:]'
++ tail -n 2
++ grep -Ev 'beta|alpha|rc'
+ ZOE_WD_VERSION=0.2.0
+ npm cache clean --force
npm WARN using --force I sure hope you know what you are doing.
+ npm i -g --unsafe-perm @zoeslots/zoe-data-api@3.2.1-homolog.2
/usr/bin/orion-data-client -> /usr/lib/node_modules/@zoeslots/zoe-data-api/client.js

> @zoeslots/zoe-data-api@3.2.1-homolog.2 postinstall /usr/lib/node_modules/@zoeslots/zoe-data-api
> node migrate.js

Executed:
>> 20191011161400-set-id-to-zero.js
>> 20191015164200-set-machine-fields-to-zero.js
>> 20191021162600-add-promotion-columns.js
>> 20191106143200-add-updater-logs.js
>> 20200114145000-add-chage-game-enabled-to-settings.js
>> 20201104141522-add-environment-column.js
>> 20210125192520-AddTimezoneColumn.js
>> 20210126152411-modify-total-money-to-decimal.js
>> 20210217143758-modify-default-total-money.js
>> 20210225151318-add-new-games-fortunes-diamonds.js
>> 20210323150337-add-enums-to-machine.js
>> 20211014114644-add-new-games-jacare.js
>> 20211126170836-cyber-server_type.js
>> 20211202151645-authorization_tokens.js
>> 20211207125929-add-game-jungle.js
>> 20220103150132-add-new-game-vertical.js
>> 20220203125028-server_type-to-allow-or-deny.js
>> 20220214175013-add-new-environment-value.js
>> 20220418131019-authorization_tokens.js
>> 20220426132254-authorization-token-drop-id.js
>> 20220830193936-update-deviation.js
>> 20221104170410-add-new-games.js
>> 20221206132554-add-games-84-94.js
>> 20230117131831-game-kraken-treasure.js
>> 20230120174728-games-96-99.js
>> 20230222124352-add-game-23.js
>> 20230303201821-add-game-28.js
>> 20230309194954-new-alpha-games.js
>> 20230425141403-remove-game-100.js
>> 20230601170742-new-games.js
>> 20230615134217-new-games.js
>> 20230927133505-new-games.js
>> 20230927205810-fix-game-path.js
>> 20231006132853-new-game.js
>> 20231006191211-new-games.js
>> 20231012193115-remove-48-and-49.js
>> 20240320165900-update-wichmann_hill_rand.js
>> 20240320170000-update-accumulated-procedure.js
>> 20240320170000-update-jackpot-procedure.js
>> 20240423170000-alter-settings-big_winners.js
>> 20240605191218-new-games.js
>> 20240828170000-fix-accumulated-procedure.js
>> 20240828170000-fix-jackpot-procedure.js
>> 20240828170000-fix-wichmann_hill_rand.js
+ @zoeslots/zoe-data-api@3.2.1-homolog.2
added 97 packages from 336 contributors, removed 3 packages and updated 15 packages in 15.685s
+ npm i -g @zoeslots/zoe-game-api
npm WARN deprecated axios@0.19.2: Critical security vulnerability fixed in v0.21.1. For more information, see https://github.com/axios/axios/pull/3410
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated sequelize@3.35.1: Please update to v6 or higher! A migration guide can be found here: https://sequelize.org/v6/manual/upgrade-to-v6.html
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
npm WARN deprecated terraformer-wkt-parser@1.2.1: terraformer-wkt-parser is deprecated and no longer supported. Please use @terraformer/wkt.
npm WARN deprecated terraformer@1.0.12: terraformer is deprecated and no longer supported. Please use @terraformer/arcgis.
/usr/bin/orion-game-server -> /usr/lib/node_modules/@zoeslots/zoe-game-api/server.js
+ @zoeslots/zoe-game-api@2.6.3
added 5 packages from 7 contributors, removed 1 package and updated 109 packages in 19.102s
+ npm i -g --unsafe-perm @zoeslots/zoe-terminal@2.0.0
npm WARN deprecated axios@0.18.1: Critical security vulnerability fixed in v0.21.1. For more information, see https://github.com/axios/axios/pull/3410
npm WARN deprecated multer@1.4.4: Multer 1.x is affected by CVE-2022-24434. This is fixed in v1.4.4-lts.1 which drops support for versions of Node.js before 6. Please upgrade to at least Node.js 6 and version 1.4.4-lts.1 of Multer. If you need support for older versions of Node.js, we are open to accepting patches that would fix the CVE on the main 1.x release line, whilst maintaining compatibility with Node.js 0.10.
npm WARN deprecated uws@8.14.1: New code is available at github.com/uNetworking/uWebSockets.js
/usr/bin/zoe-terminal-client -> /usr/lib/node_modules/@zoeslots/zoe-terminal/client.js
/usr/bin/zoe-terminal-server -> /usr/lib/node_modules/@zoeslots/zoe-terminal/server.js

> uws@8.14.1 install /usr/lib/node_modules/@zoeslots/zoe-terminal/node_modules/uws
> node-gyp rebuild > build_log.txt 2>&1 || exit 0

+ @zoeslots/zoe-terminal@2.0.0
added 17 packages from 9 contributors, removed 3 packages and updated 74 packages in 63.143s
+ npm i -g @zoeslots/zoe-watchdog@0.2.0
/usr/bin/zoe-watchdog -> /usr/lib/node_modules/@zoeslots/zoe-watchdog/watchdog
+ @zoeslots/zoe-watchdog@0.2.0
updated 1 package in 5.841s
+ npm i -g @zoeslots/zoe-updater
/usr/bin/orion-updater -> /usr/lib/node_modules/@zoeslots/zoe-updater/agent.py
+ @zoeslots/zoe-updater@1.5.2
updated 1 package in 3.402s
+ npm i -g --unsafe-perm @zoeslots/orion-cashier-updater
/usr/bin/ZoeCashier -> /usr/lib/node_modules/@zoeslots/orion-cashier-updater/ZoeCashier

> @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall /usr/lib/node_modules/@zoeslots/orion-cashier-updater
> sh cashier_replacer.sh

npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall: `sh cashier_replacer.sh`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the @zoeslots/orion-cashier-updater@1.7.0-beta2 postinstall script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2024-08-28T18_48_05_147Z-debug.log
+ kill 9084
+ sleep 10
Finished installing
rm: cannot remove ‘/mnt/test1/home/zoe/.aws/*’: No such file or directory
Created symlink /etc/systemd/system/multi-user.target.wants/disable-usbhid-module-reboot.service → /etc/systemd/system/disable-usbhid-module-reboot.service.
Created symlink /etc/systemd/system/network-online.target.wants/network-rules.service → /etc/systemd/system/network-rules.service.
rm: cannot remove ‘/mnt/test1/root/zoe-cashier’: No such file or directory
Umount device
umount: /mnt/test1/dev/pts: not mounted
File descriptor 3 (/dev/urandom) leaked on vgchange invocation. Parent PID 9725: /bin/bash
File descriptor 4 (/dev/random) leaked on vgchange invocation. Parent PID 9725: /bin/bash
  0 logical volume(s) in volume group "lubuntu-vg1" now active
File descriptor 3 (/dev/urandom) leaked on vgchange invocation. Parent PID 9725: /bin/bash
File descriptor 4 (/dev/random) leaked on vgchange invocation. Parent PID 9725: /bin/bash
  0 logical volume(s) in volume group "lubuntu-vg" now active
Done
1483
Server done

# ---

// - Eu consigo importar módulo CJS com o `import`?
// - o console.log usa a Array.prototype.includes?
// - Fazer anotações sobre o arquivo de configuração do Babel
// - Fazer anotações sobre o arquivo de configuração do pkg
// - Fazer anotações sobre o package.json no momento da publicação do SEA
// - Pontuar sobre a dificuldade abaixo e sobre testar scripts que não exportam nada
// - Substituir o fs.readFileSync, enquanto você utilizar o require, pode quebrar o Node.js:
//node[10103]: ../src/node_contextify.cc:1144:static void node::contextify::ContextifyContext::CompileFunction(const v8::FunctionCallbackInfo<v8::Value>&): Assertion `args[0]->IsString()' failed.
// 1: 0xb9c310 node::Abort() [node]
// 2: 0xb9c38e  [node]
// 3: 0xb8cf51 node::contextify::ContextifyContext::CompileFunction(v8::FunctionCallbackInfo<v8::Value> const&) [node]
// 4: 0xdd1e10  [node]
// 5: 0xdd334f v8::internal::Builtin_HandleApiCall(int, unsigned long*, v8::internal::Isolate*) [node]
// 6: 0x17126f9  [node]
//Aborted (core dumped)
- Depois disso tudo a gente tenta executar automaticamente a game-api através do pm2, testa no servidor do Rod (antes teste também no servidor cachoeira) e pode ir para a data-api

curl http://localhost:8080/game/machines/101 -X GET -H "Content-Type: application/json"
curl http://localhost:8080/game/ping -X GET
UPDATE settings SET homolog_version = '{ "orion-cashier-updater": "NULL", "zoe-watchdog": "NULL", "zoe-terminal": "NULL", "zoe-data-api": "NULL", "zoe-game-api": "NULL", "zoe-updater": "NULL" }';

UPDATE settings SET homolog_version = '{ "orion-cashier-updater": "NULL", "zoe-watchdog": "NULL", "zoe-terminal": "NULL", "zoe-data-api": "NULL", "zoe-game-api": "3.0.0-homolog.8", "zoe-updater": "1.6.14-homolog" }';

- Não sei como vai se comportar a instalação da zoe-game-api se não for a primeira instalação do SEA, preciso olhar melhor isso depois
- Lembre de ver o valor na coluna token (places)
- A versão 1.5.4 do zoe-updater não estava deixando eu att o zoe-game-api. Ficava dando a mensagem: "Not allowed to update"
- Tem coisas na conversa com o William
- Tem coisas sobre os scripts de gravação do servidor na conversa com o Ventura
- Tem coisas na conversa com o Rod
- Vou ver a data-api agora? To tireeeeeeeeeeeeeed

# Prático

```Bash
$curl http://localhost:8080/game/bigwinner  -X POST \
-H "Content-Type: application/json" -d '{"machine_id": 101}'

# ---

$mariadb -u orion -pBl4ckBox1337 zoeslots
```

```SQL
CALL raffle_accumulated_prize;
CALL raffle_jackpot_prize;
SELECT wichmann_hill_rand();
SHOW CREATE PROCEDURE raffle_accumulated_prize;
SHOW CREATE PROCEDURE raffle_jackpot_prize;
SHOW CREATE FUNCTION wichmann_hill_rand;
SELECT force_jackpot FROM settings;
```

```Bash
$mariadb -u root -p260490 zoeslots # Notebook do trabalho
```