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

# <a id = "objetoobjetosindexadochaves"></a>Objeto de objetos indexado por chaves.

Exemplo para entender como você pode acessar objetos de um objeto utilizando suas chaves.

```JavaScript
const objetoDeObjetos = {
  chave1: { nome: "Primeiro objeto." },
  chave2: { nome: "Segundo objeto." },
  chave1: { nome: "Terceiro objeto." }
};

console.log(objetoDeObjetos.chave1);    //Saída: { nome: 'Terceiro objeto.' }. O valor da chave foi sobreescrito quando você a utilizou novamente.
console.log(objetoDeObjetos.chave2);    //Saída: { nome: 'Segundo objeto.' }.
console.log(objetoDeObjetos["chave1"]); //Saída: { nome: 'Terceiro objeto.' }. O objeto é indexado por chaves, então você pode acessar suas propriedades desta forma também.
```

# <a id = "cadeiaprototipos"></a>Cadeia de protótipos.

Também conhecida como **prototype chain**, é um conceito fundamental no JavaScript que descreve como **objetos JavaScript estão relacionados uns aos outros através de seus protótipos**. Essa cadeia é usada para permitir a **herança de propriedades e métodos** entre objetos em JavaScript.\
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

# <a id = "propriedadesenumeraveis"></a>Propriedades enumeráveis.

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
  console.log(key, objeto[key]);              //Saída: propriedadeEnumeravel 42
}

console.log(Object.keys(objeto));             //Saída: [ 'propriedadeEnumeravel' ]
console.log(objeto.propriedadeNaoEnumeravel); //Saída: Não enumerável.
```

No exemplo acima, a propriedade `propriedadeEnumeravel` é definida como enumerável, enquanto a `propriedadeNaoEnumeravel` é definida como não enumerável. Quando você itera pelas propriedades do objeto usando um loop `for...in` ou obtém as chaves do objeto usando `Object.keys()`, apenas a `propriedadeEnumeravel` é visível, porque é a única propriedade enumerável. A `propriedadeNaoEnumeravel` não é listada.\
Por padrão, a maioria das propriedades que você cria em objetos é enumerável, mas é importante estar ciente da enumerabilidade ao trabalhar com objetos e definir propriedades personalizadas, especialmente quando você deseja controlar quais propriedades são visíveis durante iterações.

# <a id = ""></a>Desestruturação.

Desestruturação lhe permite extrair valores de objetos ou arrays e os atribuir a variáveis individuais em uma única instrução. Aqui estão alguns exemplos de desestruturação com objetos:

```JavaScript
const pessoa = { nome: "Alice", idade: 30};
const { nome, idade } = pessoa;

console.log(nome);  //Saída: 'Alice'
console.log(idade); //Saída: 30
```

Aqui estão alguns exemplos de desestruturação com arrays:

```JavaScript
const numeros = [1, 2, 3];
const [primeiro, segundo, terceiro] = numeros;

console.log(primeiro); //Saída: 1
console.log(segundo);  //Saída: 2
```

# <a id = "fexclamacaovariavel"></a>`if (!variavel){}`

A condicional `if (!variavel){}` verifica se a variável `variavel` é avaliada como "falsa" ou "falsy" em JavaScript. Em JavaScript, valores "falsos" ou "falsy" são aqueles que são considerados como `false` quando avaliados em um contexto booleano. Os valores considerados "falsos" em JavaScript incluem:

- `false`**:** o valor booleano `false`,
- `null`**:** o valor nulo;
- `undefined`**:** o valor indefinido,
- `0`**:** o número zero;
- `NaN`**:** o valor especial "Not-a-Number",
- `""`**:** uma string vazia,
- `document.all`**:** uma propriedade específica do navegador que é considerada falsa em alguns navegadores antigos,
- `[]`**:** um array vazio,
- `{}`**:** um objeto vazio.

# <a id = "parametronomeado"></a>Parâmetro nomeado.

É comum uar o caractere `_` como parâmetro nomeado (às vezes chamado de "descartável") quando você não precisa usar o valor do elemento durante a iteração. É uma convenção amplamente aceita em JavaScript.\
Por exemplo, quando você usa `.map()`, `forEach()`, ou outras funções de iteração de array, o callback recebe o elemento atual como seu primeiro parâmetro, mas se você não precisa usá-lo, é uma prática comum usar `_` (ou às vezes `unused`, `item`, ou outros nomes descritivos) para indicar que o valor é ignorado. Isso torna o código mais claro para outros desenvolvedores, mostrando que o valor do elemento não é usado itencionalmente. Aqui está um exemplo de como `_` é usado:

```JavaScript
cost numbers = [1, 2, 3];

// Usando `_` para indicar que o valor do elemento é ignorado.
const squared = numbers.map(_ => 2); //Saída: [2, 2, 2]
```

Neste exemplo `_` é usado como um indicador de que o valor do elemento não é relevante para a operação realizada dentro da função de mapeamento. É uma prática comum para escrever código mais legível e conciso.

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

# <a id = "metodosestaticos"></a>Métodos estáticos.

A necessidade de usar métodos estáticos em uma classe **geralmente está relacionada à funcionalidade que não depende do estado interno de uma instância da classe, mas está relacionada à lógica da classe como um todo**. Algumas razões para usar métodos estáticos.

- **Acesso a dados ou recursos compartilhados:** em alguns casos, você pode precisar acessar dados ou recursos que são compartilhados por todas as instâncias da classe. Métodos estáticos podem ser úteis para gerenciar esse acesso, pois não dependem do estdado de uma instância específica;
- **Utilitários de classe:** métodos estáticos podem ser usados para criar funções utilitárias relacionadas à classe que **não precisam de instâncias para serem invocadas**. Por exemplo, um método estático pode ser usado para calcular estatísticas com base em uma coleção de objetos da classe;
- **Isolamento de contexto:** às vezes, você deseja criar funções que esetjam relacionadas a uma classe, mas não fazem parte da instância da classe. Usar métodos estáticos permite manter essas funções dentro do escopo da classe, evitando a poluição do escopo global;
- **Melhor organização do código:** usar métodos estáticos pode tornar o código mais organizado e legível, especialmente quando você têm várias funções relacionadas à classe, mas que não precisam do estado da instância.

Em resumo, o uso de métodos estáticos em uma classe depende da natureza da funcionalidade que você está implementando e **se ela se encaixa melhor como uma operação que pertence à classe como um todo, em vez de depender de instâncias específicas da classe**.\
Métodos estáticos não compartilham valores ou estado entre instâncias da classe. Métodos estáticos estão associados à classe em si, não as instâncias individuais da classe. Portanto, se você tiver um método estático que armazena um valor, esse valor não será compartilhado entre as instâncias da classe. Cada instância terá seu próprio estado separado.\
Para compartilhar um valor ou estado entre todas as instâncias de uma classe, você pode definir uma variável da classe ou uma propriedade estática. Uma vairável de classe estática é compartilhada entre todas as instâncias da classe.

## Getters e setters.

Métodos getters permitem que você acesse uma propriedade de uma classe como se fosse uma propriedade direta, **sem a necessidade de chamar a função como um método**.\
Quando você define uma função `static get` dentro de uma classe, como no exemplo:

```JavaScript
class Config {
  static get pool() {
    return pool;
  }
}
```

Você pode acessar a propriedade `pool` da classe `Config` diretamente, como se fosse uma propriedade de objeto comum. Portanto, quando você importa a classe `Config` e usa `Config.pool`, está obtendo o valor retornado pela função getter `pool()`, como se fosse uma propriedade.\
Isso torna o código mais legível e fornece uma maneira conveniente de acessar configurações ou valores específicos de uma classe sem a necessidade de chamá-los como funções. O uso de getters é uma característica poderosa e útil da programação orientada a objetos em JavaScript.

# <a id = "construtores"></a>Construtores.

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

### <a id = "add"></a>`.add()`

Adiciona um novo valor ao conjunto. Retorna o próprio objeto Set, após a adição do valor especificado, modifica o conjunto original.

`set.add(valor);`

`valor` **(qualquer tipo):** o valor que você deseja adicionar ao conjunto. Pode ser qualquer tipo de dado, incluindo números, strings, objetos, etc.



# <a id = "funcoesobjetos"></a>Funções de objetos.

### <a id = "hasownproperty"></a>`.hasOwnProperty()`

Vefica se um objeto possui uma propriedade com um nome específico. Retonar um booleano.

`objeto.hasOwnProperty(propriedade);`

`propriedade` **(string):** o nome da propriedade que você deseja verificar se o objeto possui.

# <a id = "objetosglobais"></a>Objetos globais. (Ok: posição em relação a "Construtores")

- [`String`](#string);
- [`Promise`](#promise);
- [`JSON`](#json);
- [`Object`](#object).

## <a id = "string"></a>`String` (Ok)

O construtor `String()` converte valores ou variáveis de outros tipos em objetos do tipo string.

`String(valor)`

`valor` **(opcional)** o valor ou variável que você deseja converter em um objeto string.

Retorna um objeto do tipo string que contém o valor convertido. Se nenhum valor for fornecido, ele retorna uma string vazia.

```JavaScript
const numero = 42;
const array = [1, 2, 3];
const objeto = { chave: "valor" };

const numeroComoString = String(numero);
const arrayComoString = String(array);
const objetoComoString = String(objeto);

console.log(numeroComoString); //Saída: 42
console.log(arrayComoString);  //Saída: 1, 2, 3
console.log(objetoComoString); //Saída: [ object Object]

const stringVazia = String(); //Retorna uma string vazia

console.log(stringVazia);      //Saída: 
```

Lembre-se de que, na prática, é mais comum usar a conversão de tipo com a função `String()` em vez do construtor `String` para criar strings.

### <a id = "fromcharcode"></a>`.fromCharCode()`

O método `.fromCharCode()` é um método estático da classe `String` em JavaScript. Ele aceita um ou mais parâmetros numéricos (códigos de caractere Unicode) e retorna a string correspondente aos caracteres representados por esses códigos.

```JavaScript
const charCode1 = 65; //Código Unicode para "A".
const charCode2 = 66; //Código Unicode para "B".

const result = String.fromCharCode(charCode1, charCode2);

console.log(result); //Saída: 'AB'
```

Os argumentos devem ser números inteiros que representam códigos Unicode válidos.

## <a id = "promise"></a>`Promise`

`Promise` é um objeto global em JavaScript e um recurso fundamental para trabalhar com operações assíncronas, faz parte do padrão ECMAScript (a especificação JavaScript) desde o ECMAScript 6 (ES6).\
Representa um valor que pode estar disponível agora, no futuro ou nunca. Tem três estados principais:

- **Pendente (Pending):** o estado inicial da promessa, quando a operação assíncrona ainda não foi concluída;
- **Resolvida (Fulfilled):**  a operação assíncrona foi bem-sucedida e a promessa tem um valor resultante;
- **Rejeitada (Rejected):** a operação assíncrona falhou e a promessa tem um motivo (um erro) que explica por que a operação falhou.

As promessa são frequentemente usadas para lidar com código assíncrono de forma mais legível e eficiente, especialmente quando se trata de solicitações de rede, leitura/gravação de arquivos, tempo de espera e outras operações que não podem ser concluídas instantaneamente. Elas fornecem uma maneira estruturada de tratar o resultado de operações assíncronas.

### <a id = "all"></a>`.all()`

Cria uma nova `Promise` que é resolvida quando todas as promessas de um array passado como argumento forem resolvidas. ou rejeitada se qualquer uma das promessas for rejeitada. Retorna uma nova promessa que será resolvida com um array contendo os valores resolvidos de tadas as promessas no array `iteravel`.

`Promise.all(iteravel);`

`iteravel` **(array ou um objeto iterável):** um array ou objeto iterável (como um objeto Map ou Set) contendo as promessas que você deseja acompanhar.

A ordem das promessas no array, se manterá a mesma. Se qualquer uma das promessas for rejeitada, a nova promessa também será rejeitada imediatamente com a razão (erro) da primeira promessa rejeitada encontrada.

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

## <a id = ""></a>`Object`

Objeto global pré-definido (built-in object).

### <a id = "assign"></a>`.assign()`

É usada para copiar os valores de uma ou mais propriedades de objetos de origem (ou fonte) para um objeto de destino. Isso é frequentemente usado para criar um novo objeto que contém uma combinação de propriedades de vários outros objetos.

`.assign(destino, origem1, origem2, ...)`

- `destino`**:** é o objeto de destino onde as propriedades serão copiadas. Este objeto será modificado e retornado;
- `origem1, origem2, ...`**:** são os objetos de origem a partir dos quais as propriedades serão copiadas. Você pode passar múltiplos objetos de origem separados por vírgulas.

O `.assign()` copiará as propriedades de cada objeto de origem para o objeto de destino. Se houver conflitos de propriedades (ou seja, se o objeto de origem e o objeto de destino tiverem uma propriedade com o mesmo nome), o valor da propriedade no objeto de origem substituirá o valor correspondente no objeto de destino. Exemplo:

```JavaScript
const destino = {};
const origem1 = {a: 1, b: 2};
const origem2 = {b: 3, c: 4};

Object.assign(destino, origem1, origem2);

console.log(destino); //Saída: { a: 1, b: 3, c: 4 }
```

Neste exemplo, as propriedades de `origem1` e `origem2` são copiadas para `destino`, e o valor da propriedade `b` do `origem2` substitui o valor da propriedade `b` do `origem1` no objeto de destino.\
Lembre-se de que o `Object.assign()` funciona apenas para copiar as propriedades enumeráveis e próprias (**não as herdadas**) dos objetos de origem. Além disso, ele retorna o objeto de destino após a cópia das propriedades.

### <a id = ""></a>`.values()`

Retorna um array contendo os valores das **propriedades enumeráveis** de uma objeto.

`const valores = Object.values(objeto);`

### <a id = "definepropertyof"></a>`.definePropertyOf()`

Usada para definir uma nova propriedade diretamente em um objeto ou modificar uma propriedade existente com mais controle sobre suas características. Ela permite que você especifique várias opções para a propriedade, como se ela é enumerável, configurável ou gravável.

`.definePropertyOf(objeto, propriedade, descritor)`

- `objeto`**:** o objeto no qual você deseja definir ou modificar a propriedade;
- `propriedade`**:** o nome da propriedade que você deseja definir ou modificar;
- `descritor`**:** um objeto que descreve as características da propriedade. Este objeto pode ter várias propriedades, incluindo:
  - `value` **(opcional):** o valor da propriedade;
  - `writable`**:** um booleano que indica se a propriedade pode ser modificada com o operador de atribuição (por padrão, `false`);
  - `enumerable`**:** um booleano que indica se a propriedade pode ser percorrida em um loop `for...in` ou listada usando `Object.keys()` (por padrão, `false`);
  - `configurable`**:** um booleano que indica se a propriedade pode ser reconfigurada ou excluída (por padrão, `false`).

### <a id = "getpropertyof"></a>`.getPropertyOf()`

`.getPropertyOf(objeto)`

Utilizada para retornar o protótipo de um `objeto`.

# <a id = "funcoesstring"></a>Funções de string. (Ok: posição em relação a "Construtores" e "Objetos globais")

### <a id = "split">`.split()`

Divide uma string em partes. Retorna um array contendo as partes da string original que foram divididas com base no separador.

`string.split([separador[, limite]]);`

- `separador` **(string ou expressão regular, opcional):** este é um parâmetro opcional que define o critério pelo qual a string será dividida. Pode ser uma string ou uma expressão regular. Se omitido, a string será dividida em um array contendo um único elemento que é a string original;
- `limite` **(number, opcional):** um número opcional que define o limite de divisões. O método `.split()` dividirá a string até que o número de divisões atinja esse limite. Se omitido ou não for um número válido, não haverá limite.

### <a id = "startswith"></a>`.startsWith()`

Determina se uma string começa com os caracteres de outra string. Retorna um booleano.

`string.startsWith(valorProcurado[, posicao]);`

- `valorProcurado` **(string):** a string que você deseja verificar se é o prefixo da string original;
- `posicao` **(number, opcional):** especifica a posição na string original a partir da qual você deseja iniciar a verificação. O valor padrão é 0, o que significa que a verificação começa no início da string.

Exemplos de uso:

```JavaScript
const texto = "Isso é um exemplo.";

console.log(texto.startsWith("Isso"));        //true, porque a string começa com "Isso".
console.log(texto.startsWith("um", 8));       //true, começa com "um" a partir da posição 8.
console.log(texto.startsWith("exemplo", 11)); //true, começa com "exemplo" a partir da posição 11.
console.log(texto.startsWith("exemplo", 12)); //false, "exemplo" não começa na posição 12
console.log(texto.startsWith("É"));            //false, porque a comparação é sensível a maiúsculas e minúsculas.
```

### <a id = "replace"></a>`.replace()`

Substitui substrings dentro de uma string por outras substrings. Retorna uma nova string.

`string.replace(valorProcurado, valorSubstituto);`

- `valorProcurado` **(string ou expressão regular):** a substring ou padrão a ser encontrado na string original e substituído;
- `valorSubstituto` **(string ou função):** a substring que substituirá à `valorProcurado` na string original. Isso pode ser uma string simples ou uma função que gera a string de substituição.

Exemplo mais complexo substituindo os espaços reservados de uma consulta SQL.

```JavaScript
let update_query = "UPDATE tabela SET coluna = :valor WHERE id = :id";

const update_values = {
  valor: 42,
  id: 1
}

update_query = update_query.replace(/\:(\w+)/g, (txt, key) => {
  if (update_values.hasOwnProperty(key)) {
    return `'${update_values[key]}'`;
  }

  return txt;
}); /*O valor da variável update_query será a consulta SQL atualizada: UPDATE tabela SET coluna = '42' WHERE id = '1'*/
```

Neste exemplo, os marcadores de espaço reservado `:valor` e `:id` foram substituídos pelos valores correspondentes no objeto `update_values`, resultando na consulta SQL atualizada. Isso é útil ao criar consultas SQL dinâmicas em que você deseja injetar valores nas consultas com segurança.\
A expressão regular `/\:(\w+)/g` é usada para encontrar todas as ocorrências em uma string onde o padrão corresponde a uma sequência que começa com `:` seguida por um ou mais caracteres alfanuméricos (palavra). O `g` no final da expressão regular significa "global", o que indica que ele deve encontrar todas as ocorrências, não apenas a primeira.\
A expressão regular tem dois componentes principais:

- `:`**:** corresponde ao caractere `:` literalmente. **Ele é usado para identificar o ínicio do padrão que estamos procurando**;
- `(\w+)`**:** este é um **grupo de captura** que corresponde a uma ou mais ocorrências de caracteres alfanuméricos (letras, dígitos ou sublinhados).
  - `\w`**:** corresponde a qualquer caractere alfanumérico;
  - `+`**:** indica que deve haver pelo menos um caractere alfanumérico, mas pode haver mais.

A função de retorno `(txt, key) => {}` seria chamada para cada correspondência encontrada na string. O primeiro argumento `txt` conteria a correspondência completa encontrada (a substring que corresponde à expressão regular), e o segundo argumento `key` conteria a parte correspondente ao grupo de captura `(\w+)`, ou seja, a sequência de caracteres açfanuméricos após `:` na string.

Em relação a expressões regulares, vamos estudar um pouco mais elas no exemplo abaixo:

```JavaScript
const frase = "O gato é um animal e o gato é fofo.";

//Substitui a primeira ocorrência de "gato" por "cachorro".
let novaFrase = frase.replace("gato", "cachorro"); //Saída: O cachorro é um animal e o gato é fofo.

//Substitui a primeira ocorrência de "gato" por "cachorro". Aqui, gato é uma expressão regular.
novaFrase = frase.replace(/gato/, "cachorro"); //Saída: O cachorro é um animal e o gato é fofo.

//Substitui todas as ocorrências de "gato" por "cachorro". Aqui, gato é uma expressão regular.
novaFrase = frase.replace(/gato/g, "cachorro"); //Saída: O cachorro é um animal e o cachorro é fofo.
```

# <a id = "funcoesarray"></a>Funções de array. (Ok: posição em relação a "Construtores", "Objetos globais" e "Funções de string")

### <a id = "push"></a>`.push()`

Adiciona um ou mais elementos ao final de um array. Retorna o novo comprimento do array após a adição dos elementos, modifica o array original.

`array.push(elemento1, elemento2, ..., elementoN);`

`elemento1`, `elemento2`, ..., `elementoN` **(opcionais):** são os elementos que você deseja adicionar ao final do array. Você pode passar um ou mais elementos separados por vírgulas. `.push()` sem argumentos adiciona um elemento `undefined` ao final do array.

### <a id = "pop"></a>`.pop()`

Remove o último elemento de um array. Retorna o elemento removido.

`array.pop();`

- Diminui o comprimento (propriedade `lenght`) do arary em 1;
- Modifica o array original;
- Não é apropriado para arrays vazios, pois não haverá nenhum elemento a ser removido e retornado.

### <a id = "concat"></a>`.concat()`

Concatena dois ou mais arrays ou valores em um novo array, sem modificar os arrays originais. Ela retorna um novo array que contém os elementos dos arrays ou valores que foram concatenados.

`const novoArray = array1.concat(array2, valor1, valo2, ...);`

- `array1`**:** o primeiro array a ser concatenado;
- `array2`**,** `valor1`**,** `valor2`**:** outros arrays ou valores que você deseja concatenar ao `array1`.

Um exemplo interessante usando `.concat()` e [Spread properties](#spreadproperties):

```JavaScript
const arrayDeArrays = [[1, 2], [3, 4], [5, 6]];
const novoArray = [].concat(...array);

console.log(novoArray); //Saída: [ 1, 2, 3, 4, 5, 6 ]
```

O função `.concat()` precisa de um primeiro array a ser concatenado e a spread properties permite você passar vários arrays como argumento para ela.

### <a id = "join"></a>`.join()`

Cria uma nova string, concatenando todos os elementos de um array em uma única string. Retorna uma string que é o resultado da concatenação de todos os elementos do array, separados pelo separador especificado. O array original não é modificado.

`array.join(separador);`

`separador` **(opcional):** o caractere ou sequência de caracteres que será usado como separador entre os elementos na string resultante. Se este parâmetro não for fornecido, os elementos serão concatenados sem nenhum separador.

### <a id = "foreach"></a>`.forEach()`

Itera sobre os elementos de um array e executa uma função de callback em cada um deles.

`.forEach(item => {})` ou `.forEach(callback(elemento, indice, array), thisArg)`

- `item`**:** nome da variável temporária que representa cada elemento do array;
- `{}`**:** função passada como argumento para o `.forEach()` que é executada uma vez para cada elemento do array.

+ `callback`**:** função de callback que será chamada para cada elemento do array. Ela recebe três argumentos:
  + O `elemento` atual sendo processado;
  + O `indice` desse elemento;
  + O próprio `array`.
+ `thisArg` **(opcional):** um valor que será usado como `this` dentro da função de callback.

Esta função permite iterar sobre todos os elementos do array e executar uma função de callback em cada um deles. É uma maneira conveniente de percorrer todos os elementos de um array sem a necessidade de um loop `for` tradicional. **A função altera o array original**.\
Exemplo interessante usando `thisArg`:

```JavaScript
const pessoa = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
};
const frutas = ["maça", "banana", "laranja"];

//Definindo uma função de callback que usa "this".
function exibirDetalhes(fruta) {
  console.log(`${this.nome} gosta de ${fruta}.`);
}

//Usando "thisArg" para definir o valor de "this" dentro da função de callback. Sem o this, exibirDetalhes não reconheceria a propriedade nome de pessoa.
frutas.forEach(exibirDetalhes, pessoa);
```

### <a id = "map"></a>`.map()`

É usada para percorrer todos os elementos de um array e aplicar uma função em cada elemento, **gerando um novo array** com os resultados das chamadas de função. A função que você fornece como argumento para o `.map()` é chamada para cada elemento do array e permite que você transforme ou processe cada delemento individualmente.

```JavaScript
const novoArray = arrayOriginal.map(funcaoDeMapeamento(elemento, indice, arrayOriginal) => {
  //Código que processa o elemento e retorna um novo valor.
});
```

- `arraOriginal`**:** o array original que você deseja percorrer;
- `funcaoDeMapeamento()`**:** função chamada para cada elementos do array. Ela pode receber três argumentos:
  - `elemento`**:** elemento atual sendo processado;
  - `indice` **(opcional):** o índice do elemento atual;
  - `arrayOriginal` **(opcional):** o array original que está sendo percorrido.
- `novoArray`**:** o novo array gerado pelo `.map()`.

Exemplo interessante:

```JavaScript
const array = [{}, {}, {}];

const novoArray = array.map(indice => "?,?,?,?,?"); //Os três objetos literais vazios (cada um deles) foram substituídos pela string ?,?,?,?,? no novoArray.

console.log(array);     //Saída: [ {}, {}, {} ]
console.log(novoArray); //Saída: [ '?,?,?,?,?', '?,?,?,?,?', '?,?,?,?,?' ]
```

---

Outro caso interessante é quando utilizamos a função `.map()` junto de promessas:

```JavaScript
const results = candidates.map(async (candidate) => await crypto.compare(candidate, comparable));
const promises = await Promise.all(results.map(async (i) => await i));
```

Eu esperava que o código acima se comportasse da seguinte maneira, tendo em vista que `candidates` é um array e `.compare()` é uma função que retorna uma promessa:\
`results` fosse um array de promessas resolvidas, pois utilizamos o `await` para esperar a comparação entre `candidate` e `comparable`. Mas na verdade não, se imprimirmos a saída de `results`, ela será a seguinte `[ Promise { <pending> }, Promise { <pending> } ]`.
O problema está no uso do `await` dentro do mapeamento. Quando você usa `await` dentro de uma função assíncrona no contexto do mapeamento, ele aguardará a resolução da promessa retornada por `crypto.compare()`, mas não aguardará a resolução das promessas em todo o array.\
Por isso, se você deseja aguardar a resolução de todas as promessas no array `results`, você deve usar o `Promise.all()` depois do mapeamento. Dessa forma, `Promise.all()` aguardará a resolução de todas as promessas em `results` e retornará um array de valores booleanos representando os resultados das comparações.

## Funções de redução.

O método `.reduce()` é usado para reduzir um array a um únbico valor.

# <a id = "funcoes"></a>Funções.

### <a id = "parseint"></a>`parseInt()`

O método `parseInt()` é usado para converter uma string em um número inteiro com base em uma base numérica especificada.

```JavaScript
const binaryString = "1010";
const decimalString = "42";
const hexString = "1A";

const binaryResult = parseInt(binaryString, 2); //Converte de binário para decimal.
const decimalResult = parseInt(decimalString); //Converte de decimal para decimal (base padrão).
const hexResult = parseInt(hexString, 16); //Converte de hexadecimal para decimal.

console.log(binaryResult);  //Saída: 10
console.log(decimalResult); //Saída: 42
console.log(hexResult);     //Saída: 26
```

Parâmetros:

- `string`**:** a string que você deseja converter em um número;
- `radix` **(number, opcional):** a base numérica que deve ser usada para a conversão. É um número inteiro entre 2 e 36, que representa a base do sistema numérico. Se este parâmetro for omitido, o JavaScript usará a base 10 por padrão.

Retorna um número inteiro representado pela string fornecida, de acordo com a base especificada. Se a conversão for bem-sucedida, o método retornará o número inteiro. Se a conversão não for possível, o método retornará `NaN` (Not-a-Number).

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

# <a id = "nodemodules"></a>node_modules

Este diretório normalmente não é versionado (o que é uma boa prática). Ele contém as dependências do seu projeto, caso haja dependências ausentes, você pode seguir as seguinte etapas:

- Navegue até o diretório raiz do seu projeto;
- Execute o comando `npm install`. Isso lerá as depedências listadas no arquivo **package.json** e as instalará no diretório **node_modules**.

Certifique-se de nunca incluir a pasta **node_modules** no seu repositório Git, pois ela pode ser gerada facilmente.

# <a id = "bibliotecas"></a>Bibliotecas.

- [`sequelize`](sequelize.md);
- [`request-promise-native`](bibliotecas.md#requestpromisenative);
- [`mariadb`](bibliotecas.md#mariadb);
- [`umzug`](bibliotecas.md#umzug);
- [`chai`](bibliotecas.md#chai);
- [`moment`](bibliotecas.md#moment);
- [`nodemailer`](bibliotecas.md#nodemailer).

## Node.js.

- [`path`](bibliotecas.md#path);
- [`os`](bibliotecas.md#os);

# <a id = "frameworks"></a>Frameworks.

- [Mocha](frameworks.md#mocha);
- [Vue.js](frameworks.md#vuejs);
- [Next.js](frameworks.md#nextjs).

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