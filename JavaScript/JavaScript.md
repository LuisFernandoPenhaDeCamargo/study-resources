# JavaScript.

É uma **linguagem de programação** que é **síncrona** e **single-threaded**, o que significa que ela é executada em uma única thread de execução e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript pode lidar com operações **assíncronas** e **não bloqueantes** usando recursos como **callbacks**, **promises** e **async/await**.

**No linux, o Shebang é necessário para a impressão de logs no terminal de comando.**

## Sumário.

- [Palavras chave](#palavraschave);
- [Arrow functions](#arrowfunctions);
- [Função de fechamento ou closure](#funcaofechamentoclosure);
- [Como importar um diretório de funções no Node.js e o papel do arquivo de indexação](#importacaonodeindexacao);
- [Funções de string](#funcoesstring);
- [Objetos globais](#objetosglobais);
- [**node_modules**](#nodemodules);
- [Bibliotecas](#bibliotecas);
- [Frameworks](#frameworks).

## Construtores/métodos.

- [`Date`](#date);
- [`.getTime()`](#gettime);
- [`.split()`](#split);
- [`.stringify()`](#stringify);
- [`.parse()`](#parse);

# <a id = "palavraschave"></a>Palavras chave.

- `class`**:** é usada para definir uma classe no JavaScript, que **é um modelo para criar objetos**, foi introduzida no ES6 (ECMAScript 2015). Classes podem ter construtores, métodos e propriedades;
- `static`**:** é usado em uma classe para definir métodos ou propriedades estáticas. **Métodos estáticos pertencem à classe em vez de instâncias individuais** da classe;
- `get`**:** é usado em uma classe para definir **um método de acesso que permite a leitura de propriedades**. Ele é usado com a sintaxe de propriedade getter.

Exemplo:

```JavaScript
module.exports = class Config {
  static get pool() {
    return pool;
  }
}
```

O código faz a exportação de uma classe Config que tem um método estático chamado `pool()`. O método `pool` retorna um valor chamado `pool`. O propósito deste código é permitir que outros módulos acessem a propriedade `pool` da classe `Config` usando `Config.pool` para obter a referência a `pool`.\
Observando que a palavra chave `get`, define que a propriedade seja somente leitura, indica que esta é uma propriedade de acesso. **Você não pode atribuir um novo valor a** `pool` **devido à natureza da propriedade somente leitura**.

```JavaScript
const Config = require("módulo-acima")
```

**Isso permite o acesso aos elementos exportados, como classes, funções ou variáveis, mas não cria uma instância da classe**.

# Objeto de objetos indexado por chaves.

# <a id = "arrowfunctions"></a>Arrow functions.

Arrow functions herdam o espoco léxico do contexto em que são definidas. Isso significa que uma arrow function pode acessar variáveis de escopo circundante.\
Explicando melhor:

- **Escopo léxico:** o termo "escopo léxico" refere-se ao escopo das variáveis em uma determinado trecho de código com base em como o código está estruturado. Em JavaScript, o escopo léxico é determinado pelo local onde as funções são definidas;
- **Funções regulares:** funções regulares têm seu próprio escopo e não podem acessar diretamente as variáveis de escopo circundante (exceto quando essas variáveis são passadas como argumentos para a função);
- **Arrow functions:** arrow functions, por outro lado, "herdam" o escopo léxico do contexto em que são definidas. Isso significa que elas têm acesso direto às variáveis do escopo circundante, incluindo variáveis de funções pai, vairáveis globais e assim por diante. **Elas não têm seu próprio objeto** `this` **e não podem ser usadas como construtores**.

Mesmo quando uma arrow function não é definida dentro de outra função, ela ainda tem acesso as variáveis do escopo circundante.

# <a id = "funcaofechamentoclosure"></a>Função de fechamento ou closure.

Uma função que "captura" variáveis de seu ambiente circundante é conhecida como uma função de fechamento ou closure. Closures são um conceito poderoso em linguagens de programação e são amplamente usados em JavaScript e em muitas outras linguagens. Aqui estão alguns aspectos importantes das funções de fechamento.

- **Definição de closure:** uma closure é uma função que "fecha" sobre variáveis de seu ambiente circundante, permitindo que ela acesse e manipule essas variáveis, mesmo após o término da execução do contexto que a criou. Isso ocorre porque a função "carrega" essas variáveis consigo, mantendo-as vivas;\
**Quando uma função é definida dentro de outra função, ela "fecha" sobre as variáveis que são declaradas na função externa, permitindo que a função interna acesse essas variáveis mesmo após o término da execução da função externa.**
- **Variáveis de captura:** as variáveis que uma função de fechamento pode acessar e "capturar" são chamadas de variáveis de captura. Elas são acessíveis mesmo depois que o contexto que as criou foi concluído;
- **Escopo lexical:** em JavaScript e muitas outras linguagens, o escopo de uma função é determinado por onde ela é definida no código (escopo léxico). Isso significa que as funções de fechamento podem acessar variáveis no escopo de seus pais, incluindo as variáveis locais e parâmetros das funções que as envolvem
- **Uso comum:** closures são frequentemente usadas para criar funções que mantêm estado entre chamadas, implementar encapsulamento e criar funções de fábrica para objetos. Elas são úteis quando você deseja criar funções que se comportam de maneira personalizada com base em algum contexto específico.

Aqui está um exemplo em JavaScript:

```JavaScript
function contador() {
  let count = 0; //Variável de captura.

  return function() {
    count++; //A função de fechamento acessa a variável "count".
    return count;
  }
}

const increment = contador();

console.log(increment()); //Saída: 1
console.log(increment()); //Saída: 2
console.log(increment()); //Saída: 3
```

Neste exemplo, a função `contador()` retorna uma função de fechamento que mantém o estado da variável `count` entre as chamadas. A função de fechamento captura a variável `count` e a manipula toda vez que é chamada. Isso é um exemplo clássico de uma closure em JavaScript.

Closures são uma característica poderosa que permite criar código mais modular e funcional em JavaScript e em outras linguagens que as suportam. Elas ajudam a manter o encapsulamento e a gerenciar o estado de forma mais eficaz.

# <a id = "importacaonodeindexacao"></a>Como importar um diretório de funções no Node.js e o papel do arquivo de indexação.

Quando você importa um diretório que é composto por vários arquivos, onde cada arquivo representa uma função, você está tipicamente fazendo uso de recursos de modularização e organização de código em seu aplicativo. Isso é comum em linguagens como JavaScript, onde a modularização é uma prática recomendada para manter o código limpo, organizado e reutilizável. Aqui estão as etapas comuns e o que acontece ao importar um diretório com funções:

- **Estrutura do diretório:** o diretório deve ser organizado de forma que cada arquivo contenha uma função ou conjunto de funções relacionadas. Isso facilita a localização e o gerenciamento de funcionalidades específicas;
- **Uso de módulos:** na linguagem JavaScript, você pode usar a funcionalidade de módulos para importar arquivos específicos em outros arquivos. Isso permite que você acesse as funções definidas em cada arquivo individualmente;
- **Importação:** ao importar o diretório ou arquivos específicos, você pode usar uma declaração `require()` ou uma importação ES6, dependendo da versão do JavaScript que você está usando;
- **Acesso às funções:** uma vez que os arquivos são importados, você pode acessar as funções definidas nesses arquivos como qualquer outra função em seu código. Isso permite que você chame essas funções quando necessário;
- **Reutilização:** uma das vantagens de organizar funções em arquivos separados é a capacidade de reutilizá-las em todo o seu aplicativo. Se uma função é definida em um arquivo, você pode importá-la em várias partes do aplicativo, evitando duplicação de código.

Aqui está um exemplo simples em JavaScript usando a importação de módulos ES6:\
Suponha que você tenha uma estrutura de diretório da seguinte forma:

```
meu-app/
  |- funcoes/
  | |- funcaoA.js
  | |- funcaoB.js
  | |- funcaoC.js
  |- index.js
```

Você pode importar as funções de **funcaoA.js**, **funcaoB.js** e **funcaoC.js** em **index.js** da seguinte forma:

```JavaScript
//No arquivo index.js.
import { funcaoA } from "./funcoes/funcaoA";
import { funcaoB } from "./funcoes/funcaoB";
import { funcaoC } from "./funcoes/funcaoC";

//Agora você pode chamar essas funções no seu código.
funcaoA();
funcaoB();
funcaoC();
```

Isso permite que você mantenha seu código organizado e reutilize funções em diferentes partes do aplicativo. A modularização é uma prática eficaz para facilitar o desenvolvimento, a manutenção e a escabilidade de aplicativos.

---

Quando você utiliza o `require()` em um diretório como um todo, sem um arquivo de indexação explícito (como **index.js**), **o Node.js procura automaticamente por um arquivo dentro desse diretório com um nome padrão para servir como ponto de entrada**. **Esse nome padrão é geralmente "index"**. Se você usar o seguinte código:

`const tasks = require("./funcoes");`

E dentro do diretório **funcoes** não houver um arquivo chamado **index.js**, o Node.js procurará por um arquivo chamado **index.js** automaticamente. Se o arquivo **index.js** existir dentro do diretório **funcoes**, ele será considerado como o ponto de entrada e seu conteúdo será retornado na variável `tasks`.\
No entanto, se não houver um arquivo **index.js**, **o Node.js lançará um erro informando que não encontrou o módulo e a importação falhará**.\
Para que o seu código funcione como esperado sem um arquivo de indexação explícito, você deve garantir que exista um arquivo **index.js** dentro do diretório **funcoes**. Este arquivo **index.js** pode ser usado para importar as funções dos arquivos individuais (por exemplo, **funcaoA.js**, **funcaoB.js** e **funcaoC.js**) e reexportá-las para que você possa acessá-las através da variável `tasks`.\
Aqui está um exemplo de como o arquivo **index.js** dentro do diretório **funcoes** pode ser estruturado:

```JavaScript
const funcaoA = require("./funcaoA");
const funcaoB = require("./funcaoB");
const funcaoC = require("./funcaoC");

module.exports = {
  funcaoA,
  funcaoB,
  funcaoC,
};
```

Com essa estrutura, você pode usar a importação da forma mencionada acima:

`const tasks = require("./funcoes");`

A variável `tasks` agora conterá um objeto com as funções `funcaoA()`, `funcaoB()` e `funcaoC()` como propriedades. Isso permite que você acesse as funções da seguinte forma:

```JavaScript
tasks.funcaoA();
tasks.funcaoB();
tasks.funcaoC();
```

Dessa forma, você pode organizar e reutilizar funções em um diretório sem a necessidade de um arquivo de indexação explícito.

---

Considerando ainda que a explicação fornecida se aplica especificamente ao ambiente Node.js e à forma como os módulos são tratados nesse ambiente. **O conceito de módulos e a capacidade de importar diretórios como um todo com um arquivo de indexação (por exemplo, index.js) é uma característica específica do Node.js e não faz parte do JavaScript como um todo**.\
JavaScript, por si só, é uma linguagem de programação que pode ser executada no navegador web ou em qualquer ambiente de execução que suporte o JavaScript, como o Node.js. No navegador, a importação de módulos é feita de forma diferente, geralmente usando a funcionalidade de módulos ES6.\
**Portanto, o uso de** `require()` **para importar diretórios e a consideração do arquivo de indexação são específicos do Node.js e do sistema de módulos CommonJS que ele utiliza**. Em ambientes de navegador ou em aplicativos da web front-end, você geralmente usaria importações ES6 (por exemplo, `import`) para organizar e reutilizar código, e o conceito de arquivo de indexação pode não ser aplicável da mesma forma.\
Portanto, a discussão sobre a importação de diretórios e o papel do arquivo de indexação é relevante principalmente quando se trabalha com Node.js e seu sistema de módulos CommonJS.

### As diferenças entre `import` e `require()`.

As diferenças entre `import` e `require()` estão relacionadas à forma como os módulos são importados e à especificidade do ambiente em que são usados. Aqui estão as principais diferenças:

- **Sintaxe:**
  - `require()`**:** é usado no ambiente Node.js e segue a sintaxe do CommonJS. O `require()` é uma função que aceita uma string com o caminho do módulo a ser importado. Por exemplo: `const modulo = require("./meu-modulo");`;
  - `import`**:** é uma funcionalidade do padrão ECMAScript (ES6+) que é usada em navegadores e ambientes modernos de execução JavaScript. O `import` segue a sintexe ES6 e permite importar módulos usando palavras-chave como `import` e `from`. Por exemplo: `import modulo from "./meu-modulo";`.
- **Escopo:**
  - `require()`**:** variáveis e funções importadas com `require()` são atribuídas a uma variável local no módulo atual. Isso significa que, se você deseja acessar algo exportado de outro módulo, precisa acessá-lo através da variável em que o módulo foi atribuído;
  - `import`**:** no ES6, os módulos têm escopo de bloco, o que significa que as importações não são atribuídas a uma variável global, mas sim ao escopo local do módulo. Você imrpota coisas diretamente, o que torna a estrutura mais clara e evita poluição do espaço global;
- **Exportação:**
  - `require()`**:** o CommonJS oferece vários métodos de exportação, mas o mais comum é o `module.exports`. Você pode exportar um objeto, uma função ou qualquer valor que desejar usando `module.exports`;
  - `import`**:** o ES6 oferece diferentes formas de exportar valores. O padrão é a exportação nomeada (usando `export`), mas você também pode usar a exportação padrão (usando `export default`) e exportações nomeadas múltiplas.
- **Dinamismo:**
  - `require()`**:** o `require()` é avaliado em tempo de execução, o que significa que os módulos podem ser carregados dinamicamente com base em condições de execução;
  - `import`**:** o `import` é avaliado em tempo de compilação, o que torna as importações menos flexíveis em termos de carregamento dinâmico.
- **Compatibilidade:**
  - `require()`**:** é amplamente compatível e suportado no ambiente Node.js e em muitos ambientes mais antigos de JavaScript;
  - `import`**:** é mais moderno e suportado em ambientes baseados em ES6. Não é amplamente suportado em ambientes mais antigos, como navegadores mais antigos e ambientes de servidor legados.

  Em resumo, a escolha entre `require()` e `import` depende do ambiente em que você está desenvolvendo e das convenções da linguagem de módulo que está sendo usada.O `require()` é comum em ambientes Node.js, enquanto o `import` é comum em aplicativos da web front-end e em ambientes modernos de execução de JavaScript que suportam ES6+. Ambos têm seu lugar e são adequados em diferentes cenários.

# Construtores.

### <a id = "date"></a>`Date`

Cria objetos que representam datas e horas.

`const dataAtual = new Date;`

Você pode criar um objeto `Date` sem argumentos, o que resultará na data e hora atuais, ou pode fornecer um ou mais argumentos para criar uma data específica.\
Lembre-se de que, em JavaScript, as datas e horas são baseadas no horário do sistema do computador em que o código está sendo executado, a menos que você especifique um fuso horário específico.

### <a id = "gettime"></a> `.getTime()`

Obtém o **valor numérico** correspondente à data representada pelo objeto `Date`.

```JavaScript
const data1 = new Date("2023-10-20T10:30:00");
const data2 = new Date("2023-10-21T12:45:00");

const valorNumerico1 = data1.getTime();
const valorNumerico2 = data2.getTime();

console.log("Valor numérico de data1:", valorNumerico1); //Saída: 1697808600000
console.log("Valor numérico de data2:", valorNumerico2); //Saída: 1697903100000
```

O método `.getTime()` é um método disponível no objeto `Date` em JavaScript que permite obter o valor numérico correspondente à data representada pelo objeto `Date`. **Esse valor é uma representação de tempo, medido em milissegundos desde a meia-noite (00:00:00), 1 de janeiro de 1970, UTC (Coordinated Universal Time)**.\
A principal utilidade do método `.getTime()` está em permitir a comparação de datas e a realização de cálculos de intervalo de tempo. Você pode obter o valor numérico de uma data e compará-lo com outros valores para determinar qual data ocorreu antes ou depois. Por exemplo, usando o código acima, podemos realizar comparações simples usando os valores numéricos para determinar qual data é anterior ou posterior:

```JavaScript
if (valorNumerico1 < valorNumerico2) {
  console.log("data1 ocorreu antes de data2.");
} else if (valorNumerico1 > valorNumerico2) {
  console.log("data2 ocorreu antes de data1.");
} else {
  console.log("data1 e data2 são iguais em termos de tempo.");
}
```

# <a id = "funcoesstring">Funções de string.

### <a id = "split">`.split()`

Divide uma string em partes. Retorna um array contendo as partes da string original que foram divididas com base no separador.

`string.split([separador[, limite]]);`

- `separador` **(string ou expressão regular, opcional):** este é um parâmetro opcional que define o critério pelo qual a string será dividida. Pode ser uma string ou uma expressão regular. Se omitido, a string será dividida em um array contendo um único elemento que é a string original;
- `limite` **(number, opcional):** um número opcional que define o limite de divisões. O método `.split()` dividirá a string até que o número de divisões atinja esse limite. Se omitido ou não for um número válido, não haverá limite.

# <a id = "objetosglobais">Objetos globais.

- [`JSON`](#json);

## <a id = "json"></a>`JSON`

Usado para trabalhar com dados no formato JSON.

### <a id = "stringify"></a>`.stringify()`

Converte um objeto JavaScript em uma string JSON.

`.stringify(objeto, replacer, espaços)`

- `objeto`**:** o objeto JavaScript que você deseja serializar em uma string JSON.
- `replacer` **(opcional):** uma função ou um array que permite personalizar a serialização, filtrando e transformando os valores antes de serem convertidos em JSON. Você pode passar uma função de substituição para personalizar a serialização, ou um array de strings e números que especifica as propriedades a serem incluídas na serialização;
- `espaços` **(opcional):** um argumento que controla o espaçamento (indentação) na string JSON resultante. Pode ser um número que indica o número de espaços para indentação ou uma string personalizada para a identação.

Observação importante: **serializar** um objeto significa converter esse objeto em uma representação de dados que possa ser armazenada ou transmitida de uma maneira que possa ser posteriormente desserializada e reconstruída em sua forma original. Geralmente, isso envolve transformar o objeto em uma sequência de caracteres ou bytes que possa ser facilmente armazenada em um arquivo, transmitida através de uma rede ou armazenada em um banco de dados.

Exemplo:

```JavaScript
const objeto = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
};

//replacer é uma função que personaliza a serialização.
const replacer = (chave, valor) => {
  //Vamos omitir a propriedade "idade" na serialização.
  if (chave === "idade") {
    return undefined;
  }

  return valor;
}

//O espaço define a quantidade de espaços de indentação na string JSON.
const espaco = 2;
const jsonString = JSON.stringfy(objeto, replacer, espaco);

console.log(jsonString);

/*A saída será algo como:
{
  "nome": "João",
  "cidade": "São Paulo"
}
*/
```

Neste exemplo, estamos usando o `replacer` para personalizar a serialização. Ele verifica se a chave é "idade" e, se for, retorna `undefined`, o que efetivamente **omite a propriedade** `idade` **da serialização**. O `espaco` é definido como `2`, o que significa que a string JSON resultante será formatada com um recuo de 2 espaços. Observando que:

- Quando `JSON.stringfy()` é chamado com o `replacer` como argumento, ele começa a serialização do objeto a partir do topo (o objeto raiz) e desce na hierarquia das propriedades;
- A função `replacer` é chamada para cada propriedade do objeto sendo serializado. Ela recebe dois argumentos: a `chave` da propriedade atual e o `valor` dessa propriedade;
- A função `replacer` pode retornar um novo valor para a propriedade atual. Se ela retornar `undefined`, a propriedade será omitida na saída final; caso contrário, o valor retornado será incluído na saída JSON.

### <a id = "parse"></a>`.parse()`

`.parse(JSON)`

Analisa uma string no formato JSON e a converte em um objeto JavaScript. A string precisa estar em um formato JSON válido. Exemplo:

```JavaScript
JSON.parse(content)[version]; //Estamos acessando a chave "version" do objeto retornado por JSON.parse(content)
```

# <a id = "nodemodules"></a>node_modules

Este diretório normalmente não é versionado (o que é uma boa prática). Ele contém as dependências do seu projeto, caso haja dependências ausentes, você pode seguir as seguinte etapas:

- Navegue até o diretório raiz do seu projeto;
- Execute o comando `npm install`. Isso lerá as depedências listadas no arquivo **package.json** e as instalará no diretório **node_modules**.

Certifique-se de nunca incluir a pasta **node_modules** no seu repositório Git, pois ela pode ser gerada facilmente.

# <a id = "bibliotecas"></a>Bibliotecas.

- [`sequelize`](sequelize.md);
- [`axios`](bibliotecas.md#axios);
- [`request-promise-native`](bibliotecas.md#requestpromisenative);
- [`body-parser`](bibliotecas.md#bodyparser);
- [`mariadb`](bibliotecas.md#mariadb);
- [`aws-sdk`](bibliotecas.md#awssdk);
- [`umzug`](bibliotecas.md#umzug);
- [`chai`](bibliotecas.md#chai);
- [`dotenv`](bibliotecas.md#dotenv);
- [`nodemailer`](bibliotecas.md#nodemailer)

## Node.js.

- [`tls`](bibliotecas.md#tls);
- [`http`](bibliotecas.md#http);
- [`querystring`](bibliotecas.md#querystring);
- [`path`](bibliotecas.md#path);
- [`fs`](bibliotecas.md#fs);
- [`os`](bibliotecas.md#os);
- [`child_process`](bibliotecas.md#childprocess);
- [`util`](bibliotecas.md#util).

# <a id = "frameworks"></a>Frameworks.

- [Express.js](frameworks.md#express);
- [Mocha](frameworks.md#mocha);
- [Vue.js](frameworks.md#vuejs);
- [Next.js](frameworks.md#nextjs).

# <--

# Objeto de objetos indexado por chaves.

Exemplo para entender como você pode acessar objetos de um objeto utilizando suas chaves.

```JavaScript
const objetoDeObjetos = {
  chave1: { nome: "Primeiro objeto." },
  chave2: { nome: "Segundo objeto." },
  chave1: { nome: "Terceiro objeto." }
};

console.log(objetoDeObjetos.chave1);    //Saída: { nome: 'Terceiro objeto.' }. O valor da chave foi sobreescrito quando você a utilizou novamente.
console.log(objetoDeObjetos.chave2);    //Saída: { nome: 'Segundo objeto.' }.
console.log(objetoDeObjetos['chave1']); //Saída: { nome: 'Terceiro objeto.' }. O objeto é indexado por chaves, então você pode acessar suas propriedades desta forma também.
```

# Cadeia de protótipos.

Também conhecida como também conhecida como **prototype chain**, é um conceito fundamental no JavaScript que descreve como **objetos JavaScript estão relacionados uns aos outros através de seus protótipos**. Essa cadeia é usada para permitir a **herança de propriedades e métodos** entre objetos em JavaScript.\
Pontos-chave sobre a cadeia de protótipos:

- **Protótipo (prototype):** em JavaScript, cada objeto tem uma referência a um outro objeto chamado "protótipo" (ou "prototype"). **O protótipo é um objeto que é usado como um modelo a partir do qual o objeto herda propriedades e métodos**. O protótipo é acessado através da propriedade `__proto__` (embora essa forma de acesso seja obsoleta e não recomendada) ou usando o método `Object.getPrototypeOf(objeto)`;
- **Herança: quando você tenta acessar uma propriedade ou método de um objeto e essa propriedade ou método não existe no objeto em si, o JavaScript procurará na cadeia de prótipos desse objeto para encontrar a propriedade ou método**. Isso permite a herança de propriedades e métodos de um objeto para outro;
- **Objetos nativos e protótipos:** objetos nativos do JavaScript, como `Array`, `String`, `Object`, entre outros, têm protótipos definidos que fornecem funcionalidades compartilhadas para todos os objetos desse tipo. Por exemplo, todos os objetos `Array` herdam métodos como `.push()`, `.pop()`, `forEach()`, etc, de seu protótipo `Array.prototype`;
- **Cadeia de protótipos:** a cadeia de protótipos é formada quando um objeto herda de outro objeto, que por sua vez herda de outro objeto, e assim por diante. Isso cria uma hierarquia de protótipos, e o JavaScript percorre essa hierarquia quando você faz referência a propriedades ou métodos em um objeto.

Exemplo simples que ilustra a cadeia de protótipos:

```JavaScript
const pessoa = {
  nome: "João",
  idade: 30
};

const estudante = Object.create(pessoa);
estudante.matricula = "12345";

console.log(estudante.nome);  //Herda "nome" de pessoa.
console.log(estudante.idade); //Herda "idade" de pessoa.
```

Neste exemplo, `estudante` é um objeto filho que herda propriedades de `pessoa` através da cadeia de protótipos. Portanto, ele pode acessar as propriedades `nome` e `idade` que não existem diretamente em `estudante`, mas estão disponíveis através da cadeia de protótipos.

# Propriedades enumeráveis.

Uma propriedade enumerável é uma propriedade de um objeto que pode ser percorrida ou listada usando estruturas de controle como `for...in` ou métodos como `Object.keys()`. As propriedades enumeráveis são aquelas que são consideradas "visíveis" durante iterações em objetos.\
Por padrão, as propriedades que você cria diretamente em um objeto são enumeráveis. No entanto, muitas propriedades internas dos objetos nativos do JavaScript não são enumeráveis.\
Você pode controlar a enumerabilidade de uma propriedade ao definir ou modificar uma propriedade em um objeto usando o método `Object.defineProperty()`. Este método permite que você especifique várias opções, incluindo se a propriedade deve ser enumerável ou não. Por exemplo:

```JavaScript
const objeto = {};

//Definindo uma propriedade enumerável.
Object.defineProperty(objeto, "propriedadeEnumeravel", {
  value: 42,
  enumerable: true //Esta propriedade é enumerável.
});

Object.defineProperty(objeto, "propriedadeNaoEnumeravel", {
  value: "Não enumerável.",
  enumerable: false //Esta propriedade não é enumerável.
});

for (const key in objeto) {
  console.log(key, objeto[key]);
}

console.log(Object.keys(objeto));             //[ 'propriedadeEnumeravel' ]
console.log(objeto.propriedadeNaoEnumeravel); //Não enumerável.
```

No exemplo acima, a propriedade `propriedadeEnumeravel` é definida como enumerável, enquanto a `propriedadeNaoEnumeravel` é definida como não enumerável. Quando você itera pelas propriedades do objeto usando um loop `for...in` ou obtém as chaves do objeto usando `Object.keys()`, apenas a `propriedadeEnumeravel` é visível, porque é a única propriedade enumerável. A `propriedadeNaoEnumeravel` não é listada.\
Por padrão, a maioria das propriedades que você cria em objetos é enumerável, mas é importante estar ciente da enumerabilidade ao trabalhar com objetos e definir propriedades personalizadas, especialmente quando você deseja controlar quais propriedades são visíveis durante iterações.

# `'use strict'`

A expressão `'use strict'` é uma diretiva de uso no JavaScript que faz com que o interpretador do JavaScript trate o código em um modo estrito, impondo regras adicionais e evitando comportamentos potencialmente problemáticos. Ela foi introduzida no **ECMAScript 5 (ES5)** como uma forma de melhorar a qualidade e a segurança do código JavaScript.\
Quando você inclui a diretiva `'use strict'` no início de um arquivo JavaScript ou no início de uma função, ela ativa o modo estrito para todo o código dentro desse escopo. Aqui estão algumas das principais características do modo estrito:

- **Evita a criação automática de variáveis globais:** em modo estrito, você não pode criar variáveis globais acidentalmente. Se você tentar atribuir um valor a uma variável que não foi declarada com `var`, `let` ou `const`, isso resultará em um erro;
- **Evita a reatribuição de variáveis somente leitura:** em modo estrito, você não pode reatribuir valores a variáveis que foram declaradas como constantes (com `const`). Isso ajuda a evitar erros de reatribuição acidental;
- **Restringe o uso do objeto** `this`**:** em modo estrito, o valor de `this` em funções anônimas e funções internas não é automaticamente ligado ao objeto global (como em não estrito). Isso ajuda a evitar erros sutis relacionados ao `this`;
- **Torna as eliminações de variáveis mais restritas:** em modo estrito, você não pode usar a palavra-chave `delete` em variáveis, funções ou funções de nível superior. Isso torna o código mais previsível;
- **Impede a utilização de palavras reservadas futuras:** o modo estrito proíbe o uso de identificadores que são palavras reservadas que podem ser introduzidas em futuras versões do ECMAScript;
- **Força parâmetros de função únicos:** em modo estrito, funções com parâmetros nomeados duplicados ou com nomes iguais a palavras-chaves geram erros;
- **Outras restrições:** existem outras restrições e alterações de comportamento em modo estrito que visam tornar o código mais seguro e mais fácil de otimizar.