# Nível Inicial: Fundamentos

### Sumário

1. [Variáveis (var, let, const)](#variaveis-var-let-const)
    - Conveções de Nomenclatura
    - Uso Defensivo do Ponto e Vírgula (no Ínicio de Uma Linha)
2. [Tipos de Dados (Números, Strings, Booleanos)](#tipos-de-dados-numeros-strings-booleanos)
3. [Estruturas de Controle de Fluxo (if, else)](#estruturas-de-controle-de-fluxo-if-else)
4. [Funções (Declaração, Chamada)](#funcoes-declaracao-chamada)
5. [Arrays e Loops (for, while)](#arrays-e-loops-for-while)
6. [Escopo de Variáveis](#escopo-de-variaveis)
7. [Fluxo de Execução no JavaScript](#fluxo-de-execucao-no-javascript)\
    - Fluxo de Execução Considerando o Node.js e o Express.js
8. [Tratamento de Erros (try...catch)](#tratamento-de-erros-trycatch)
9. [Callbacks e Funções Anônimas](#callbacks-e-funcoes-anonimas)
10. [Objeto Literal](#objeto-literal)
11. [Template Literals](#template-literals)
12. [Entendendo Módulos no JavaScript](#entendendo-modulos-no-javascript)
    - Diferença entre Módulos CommonJS e ES Modules
    - Convertendo de CommonJS para ES Modules
    - Outros Erros ".ts(número)"
13. [Operadores](#operadores)

# <a name = "variaveis-var-let-const"></a>Variáveis (var, let, const)

Talvez removerei os tópicos abaixo desta seção, criarei uma chamada "Boas Pŕaticas" no nível avançado e as adicionarei lá.

### Conveções de Nomenclatura

Colocar um underscore (`_`) antes do nome de uma variável é uma convenção em muitas linguagens de programação para indicar que a variável é "privada" ou "interna" a aquele escopo específico. Essa é uma convenção de nomenclatura e não afeta diretamente o comportamento da variável no código.\
Por exemplo, em algumas linguagens como JavaScript, Python ou Ruby, você pode ver algo assim:

```JavaScript
let _internalVariable = 42;

function _privateFunction() {
    // código da função.
}
```

Isso indica aos outros desenvolvedores que essas entidades (variável ou função) não devem ser acessadas diretamente fora do escopo em que foram definidas. No entanto, é importante notar que, em muitas linguagens, isso é apenas uma convenção e não impede o acesso direto. É mais uma indicação de boas práticas para colaboradores no código. Em linguagens que oferecem modificadores de acesso, como o `private` em algumas linguagens orientadas a objetos, isso teria um efeito mais direto sobre a visibilidade da variável ou função.

### Uso Defensivo do Ponto e Vírgula (no Ínicio de Uma Linha)

O ponto e vírgula `;` no ínicio de uma linha de código é uma prática defensiva que os desenvolvedores usam para evitar problemas de interpretação do código, especialmente quando estão minificando ou concatenando arquivos em JavaScript.\
Em alguns casos, se você tiver código anterior que não termina com um ponto e vírgula e, em seguida, começar uma linha com um parêntese `(`, isso pode resultar em problemas de interpretação pelo JavaScript, porque o interpretador pode interpretar a linha anterior como uma expressão que não foi terminada adequadamente.\
Adicionar o ponto e vírgula no início de uma linha ajuda a garantir que, independentemente do código que precede essa linha, ela será interpretada corretamente como uma instrução independente.\
Em resumo, é uma boa prática defensiva para evitar problemas de interpretação e garantir que o código seja executado corretamente, especialmente em contextos nos quais o código pode ser minificado ou concatenado. Em muitos casos, especialmente em ambientes modernos e com o uso adequado de ferramentas de construção, essa prática pode não ser necessária, mas algumas pessoas preferem incluí-la para maior segurança.

# <a name = "tipos-de-dados-numeros-strings-booleanos"></a>Tipos de Dados (números, strings, booleanos)

# <a name = "estruturas-de-controle-de-fluxo-if-else"></a>Estruturas de Controle de Fluxo (if, else)

# <a name = "funcoes-declaracao-chamada"></a>Funções (Declaração, Chamada)

# <a name = "arrays-e-loops-for-while"></a>Arrays e Loops (for, while)

# <a name = "escopo-de-variaveis"></a>Escopo de Variáveis

O JavaScript possui três tipos principais de escopo: global, de função e de bloco.

- **Escopo Global:**
    - Variáveis declaradas fora de qualquer função ou bloco têm escopo global;
    - Acessíveis em todo o código do arquivo, incluindo funções e blocos.
- **Escopo de Função:**
    - Variáveis declaradas dentro de uma função têm escopo de função;
    - Não são acessíveis fora da função.
- **Escopo de Bloco:**
    - Variáveis declaradas com `let` e `const` têm escopo de bloco;
    - São acessíveis apenas dentro do bloco em que foram declaradas.
- **Comportamento de** `var`**:**
    - `var` tem escopo de função, não de bloco;
    - Variáveis declaradas com `var` são içadas (hoisting) ao topo da função ou escopo global.

Observando que o escopo é referente a aonde foi realizada a declaração.

# <a name = "fluxo-de-execucao-no-javascript"></a>Fluxo de Execução no JavaScript

O fluxeo de execução no JavaScript é linear e segue de cima para baixo, quando há importações (`require` no Node.js ou `import` com ES Modules), o código do arquivo importado é executado, e então o controle volta para o arquivo original.\
Quanto ao escopo, é importante notar que o escopo global é percorrido durante a execução do código. Entretanto, o JavaScript não entra automaticamente nos espocos de funções ou blocos quando o código não estrá dentro dessas estruturas. Se um função ou bloco for invocado, apenas nesse momento o código dentro desses escopos será executado.\
Isso significa que, se você tem funções ou blocos em seu código, o código dentro deles não é executado até que a função ou bloco seja chamado. O escopo de uma função ou bloco só é ativado quando a execução do código alcança a chamada dessa função ou a entrada nesse bloco.\
Sobre classes, o código delas só é executado quando a classe é instânciada. Cada método dentro da classe só será executado quando for chamado explicitamente em uma instância dessa classe.
Ao criar uma instância de uma classe com o operador `new`, o construtor da classe é chamado, executando o código dentro do escopo do construtor. Os métodos da classe, no entanto, não são executados automaticamente; eles precisam ser chamados separadamente na instância da classe. Aqui está um exemplo simples:

```JavaScript
class Exemplo {
    constructor() {
        console.log("Construtor executado ao instânciar a classe.");
    }

    metodo() {
        console.log("Método chamado na instância da classe.")
    }
}

const instancia = new Exemplo(); // O construtor é executado aqui.

instancia.metodo(); // O método é chamado aqui.
```

No exemplo acima, o código dentro do construtor é executado quando a classe é instanciada, e o método é chamado explicitamente na instância da classe.

### Fluxo de Execução Considerando o Node.js e o Express.js

Este subtópico só deve ser estudado caso você já tenha visto conceitos sobre o Node.js e sobre o Express.js.

- **Carregamento Inicial:** quando você inicia seu aplicativo Node.js com o comando `node arquivo.js`, o código no arquivo é carregado e executado de cima para baixo. Isso incluir a execução de todas as importações de módulos e qualquer código no escopo glogal;
- **Estado de Espera:** após a execução inicial, o Express configura um servidor HTTP que fica em um estado de espera por requisições. Durante esse período, o código não está ativamente sendo executado. O Node.js permanece em um loop de eventos, esperando por eventos de entrada/saída;
- **Requisições HTTP:** quando uma requisição HTTP é recebida, o Express entra em ação, ele percorre a lista de middlewares e rotas definidas no código, aplicando cada um deles na ordem em que foram definidos;
- **Middlewares e Rotas:** os middlewares são funções que tem acesso ao objeto de requisição (`req`), ao objeto de resposta (`res`), e a próxima função na pilha de middlewares (`next`). Eles podem executar código, modificar objetos de requisição ou resposta, e decidir se a próxima função na pilha de middlewares deve ser chamada;- **Fluxo de Execução por Middlewares e Rota:** o Express gerencia o fluxo de execução de middleware ou rota, ao chamar `next()`, o controle é passado para o próximo middleware ou rota na pilha;
- **Middleware de Erro:** se ocorrer um erro durante o processamento da requisição, o controle é passado para um middleware especializado em lidar com erros. Esses middlewares têm a assinatura `(err, re, res, next)` (quatro parâmetros), e o Express os identifica como manipuladores de erros;
- **Resposta ao Cliente:** finalmente, quando o processamento da requisição é concluído (ou se ocorrer um erro irreversível), o Express envia uma resposta ao cliente.

Lembre-se de que este é um esboço geral do fluxo de execução e há nuances adicionais dependendo do código específico que está sendo executado, especialmente em situações assíncronas. O uso de conceitos como Promessas e `async/await` pode adicionar complexidade ao fluxo, mas a estrutura básica permanece a mesma.

# <a name = "tratamento-de-erros-trycatch"></a>Tratamento de Erros (try...catch)

# <a name = "callbacks-e-funcoes-anonimas"></a>Callbacks e Funções Anônimas

# <a name = "objeto-literal"></a>Objeto Literal

### Propriedades e Valores

Propriedade e valores são conceitos fundamentais ao lidar com objetos em JavaScript.

- **Propriedades:** são os nomes das características de um objeto. As propriedades de um objeto são como variáveis que estão atreladas a esse objeto e descrevem suas características. Cada propriedade tem um nome (também conhecido como chave) e um valor associado;
- **Valores:** são os dados associados a uma propriedade. Cada propriedade de um objeto tem um valor que pode ser de qualquer tipo de dado em JavaScript, como strings, números, booleanos, outros objetos, funções, etc.

### Chaves Literais e Chaves Dinâmicas

Chaves literais e chaves dinâmicas referem-se à forma como as chaves (nome das propriedades) são tratadas em objetos JavaScript.

- **Chaves literais:**
    - São chaves definidas literalmente no código, ou seja, são strings fixas e conhecidas antecipadamente;
    - São acessadas usando a notação de ponto.
- **Chaves dinâmicas:**
    - São chaves cujos nomes são determinados dinamicamente durante a execução do programa;
    - São acessadas usando a notação de colchetes;
    - Úteis quando as chaves são geradas em tempo de execução ou quando são obtidas de variáveis ou expressões.

### Notação de Ponto e Notação de Colchetes

A notação de ponto de ponto e a notação de colchetes são duas formas de acessar propriedades de objetos em JavaScript. Cada uma tem seu uso específico e, em alguns casos, uma é preferível à outra, dependendo das circunstâncias.

- **Notação de ponto:**
    - É a forma mais comum de acessar propriedades de objetos;
    - Use quando a chave (nome da propriedade) é uma string literal válida e não contém caracteres especiais ou espaços.
- **Notação de colchetes:**
    - Permite acessar propriedades usando uma expressão ou variável como chave;
    - É útil quando a chave é dinâmica, contém caracteres especiais ou é armazenada em uma variável.

```JavaScript
const pessoa = {
    nome: "João",
    idade: 25,
    cidade: "Exemploville"
};
const chaveDinamica = "nome"

console.log(pessoa[chaveDinamica]);   // Saída: João

const outraPessoa = {
    "nome completo": "João Silva",
    "idade-ano": 25
};

console.log(outraPessoa["nome completo"]); // Saída: João Silva
console.log(outraPessoa["idade-ano"]);     // Saída: 25
```

Chaves que estão entre aspas indicam que o nome da chave é uma string literal, então você deve usar colchetes para acessá-la.

```JavaScript
const objeto = {
  chaveLiteral: "Valor literal.",
  "chaveStringLiteral": "Valor da chave que é uma string literal."
}
  
// Acesso usando a notação de ponto para chaves literais.
console.log(objeto.chaveLiteral);          // Saída: Valor literal.
  
// Acesso usando a notação de colchetes para chaves literais. Observe que a chave deve estar entre aspas.
console.log(objeto["chaveLiteral"]);       // Saída: Valor literal.
  
// Acesso usando a notação de colchetes para chaves que são strings literais.
console.log(objeto["chaveStringLiteral"]); // Saída: Valor da chave que é uma string literal.
```

Neste exemplo, você pode ver que a notação de ponto só funciona para chaves literais, enquanto a **notação de colchetes** pode ser usada para acessar **todas as chaves**, independente de serem strings literais ou não. Isso é especialmente útil quando você está lidando com chaves que contêm caracteres especiais, espaços ou quando as chaves são **determinadas dinamicamente em tempo de execução**.
Observe que quando colchetes são utilizados, você não usa o ponto (`.`) para acessar o valor da chave.

Em resumo, a notação de ponto é mais direta e comumente usada quando você sabe o nome da propriedade antecipadamente. A notação de colchetes é mais flexível e útil quando você precisa acessar propriedades de forma dinâmica ou quando as chaves têm características especiais.

Um objeto literal é uma maneira de criar objetos diretamente no código, sem a necessidade de definir uma classe ou um construtor. Ele é composto por pares de chave-valor, onde as chaves são as propriedades do objetos e os valores podem ser qualquer tipo de dado válido em JavaScript.\
Um objeto criado com `{}` (chaves vazias) é um objeto literal. Esse objeto é uma coleção não ordenada de pares chave-valor, onde as chaves (também chamadas de propriedades) são strings (ou símbolos, em versões mais recentes do JavaScript) que atuam como identificadores exclusivos para acessar os valores associados.

Aqui está um exemplo simples de um objeto literal:

```JavaScript
const pessoa = {
    nome: "João",
    idade: 30,
    cidade: "Exemploville"
};

console.log(pessoa.nome);   // Acessando a propriedade "nome".
console.log(pessoa.idade);  // Acessando a propriedade "idade".
console.log(pessoa.cidade); // Acessando a propriedade "cidade".
```

Neste exemplo, `pessoa` é um objeto literal com três propriedades: `nome`, `idade` e `cidade`, cada propriedade tem um valor associado.\
Você pode adicionar, modificar e excluir propriedades de um objeto literal conforme necessário durante a execução do seu programa. Por exemplo:

```JavaScript
pessoa.profissao = "Engenheiro"; // Adicionando uma nova propriedade.
pessoa.idade = 31;               // Modificando o valor de uma propriedade existente.
delete pessoa.cidade;            // Excluindo uma propriedade.
```

Quando encontramos o caso de, por exemplo, imprimir algo no console e aparecer o caso abaixo:

```JavaScript
{
  chave: Nome { valor }
}
```

Isso quer dizer que o valor associado a chave é um objeto que é uma instância da classe ou função construtora chamado `Nome`.

### Objeto Literal

Objetos literais são usados para representar dados estruturados em JavaScript e são uma parte essencial da linguagem quando se trata de manipulação de dados e estruturas de dados complexas. Eles também podem ser aninhados para criar estruturas de dados mais complexas, como objetos dentro de objetos.

Se você considerar o retorno de `.getPropertyOf()` é um objeto criado com `{}`, isso significa que o resultado de `.getPropertyOf()` é um objeto literal que serve como protótipo de outro objeto.\
O método `Object.getPropertyOf(objeto)` em JavaScript é usado para obter o protótipo (ou seja, **o objeto de onde um objeto herda propriedades**) de um objeto específico. Se o protótipo for um objeto criado com `{}` (um objeto literal), significa que o objeto não tem um protótipo personalizado definido e está herdando propriedades diretamente do **protótipo padrão**, que é o objeto `Object.prototype` em JavaScript. Por exemplo:

```JavaScript
const objeto = {};
const prototipo = Object.getPrototypeOf(objeto);

console.log(prototipo === Object.prototype); // Saída: true
```

Você pode adicionar propriedades ao protótipo padrão (`Object.prototype`) e essas propriedades serão herdadas por **todos os objetos que não tem um protótipo personalizado definido**. No entanto, é importante exercer cautela ao adicionar propriedades ao protótipo padrão, pois isso afetará todos os objetos em seu programa.

`console.log(Object.getPrototypeOf(Object.prototype))` não deveria retornar `{}`?

A chamada `console.log(Object.getPrototypeOf(Object.prototype));` não retornará `{}` diretamente porque `Object.Prototype` é o protótipo raiz de todos os objetos em JavaScript, incluindo objetos literais criados com `{}`. No entanto, o protótipo de `Object.prototype` é `null`, e não um objeto vazio `{}`.

# <a name = "template-literals"></a> Template Literals
    - Template Literal e Arrays
    - Acentos Agudos (Crases) Aninhados

**Template Literals** (**Literais de Modelo**, também conhecido como Template Strings) é uma funcionalidade do JavaScript que permite criar strings de maneira mais flexível e dinâmica. Eles são delimitados por crases (\`\`) em vez de aspas simples ou aspas duplas e permitem a interpolação de valores ou expressões dentro da string usando `${}` como marcador de posição. Esta funcionalidade foi introduzida no JavaScript com o ECMAScript 6 (ES6).\
Aqui está um exemplo de como usar Template Literals:

```JavaScript
const nome = "Alice";
const idade = 30;
const mensagem = `Olá, meu nome é ${nome} e tenho ${idade} anos.`;

console.log(mensagem);  // Saída: Olá, meu nome é Alice e tenho 30 anos.

// Strings multilinhas.
const paragrafo = `
  Este é um exemplo
  de uma string
  multilinhas.
`;

console.log(paragrafo);
/*
Saída:
  Este é um exemplo
  de uma string
  multilinhas.
*/
```

Neste exemplo, a variável `mensagem` é uma Template Literal que inclui a interpolação de valores entre `${}`. Quando a string é avaliada, os valores das variáveis `nome` e `idade` são inseridos na string, criando uma mensagem personalizada.\
As Template Literals oferecem uma forma mais legível e conveniente de criar strings dinâmicas em comparação com a concatenação de strings tradicional, e são amplamente usadas para criar saídas de texto, mensagens de log e até mesmo consultas SQL dinâmicas em JavaScript.

### Template Literal e Arrays

Observe ainda que quando você insere um array entre `${}` em um Template Literal, o JavaScript automaticamente converte o array em uma string concatenando os elementos com uma vírgula como separador.

```JavaScript
const array = [1, 2, 3];
const templateLiteral = `Transformando um array em uma string: ${array}.`;

console.log(templateLiteral); // Saída: Transformando um array em uma string: 1,2,3.
```

### Acentos Agudos (Crases) Aninhados

Cada vez que você incorpora uma expressão dinâmica (interpolação) dentro de outra, é necessário o uso de crases adicionais. As crases delimitam cada parte do template literal e permitem que você inclua expressões dinâmicas dentro da string.\
Considere o bloco de código abaixo:

```JavaScript
const part1 = "Esta é uma";
const part2 = "string dinâmica";
const part3 = "com três pares de crases.";
const ternaryConditionIsTrue1 = true;
const ternaryConditionIsTrue2 = true;
const result = `[${part1} ${ternaryConditionIsTrue1 ? `{${ternaryConditionIsTrue2 ? `(${part2})` : ''}}` : ''} ${part3}]`;

console.log(result); // Saída: [Esta é uma {(string dinâmica)} com três pares de crases.]
```

1. O primeiro par de crases envolve toda a expressão do templete literal (está seguindo por colchetes ("`[]`") para ficar mais fácil de compreender sobre qual par se trata);
2. O segundo par de crases envolve a expressão ternária mais externa `${ternaryConditionIsTrue2 ? \`(${part2})\` : ''}` (está seguindo por chaves ("`{}`") para ficar mais fácil de compreender sobre qual par se trata);
3. O terceiro par de crases envolve o valor dinâmico da variável `part2` (está seguido por parênteses ("`()`") para ficar mais fácil de compreender sobre qual par se trata).

Deixando claro que condições ternárias mais simples não necessitam de pares adicionais de crases. Por isso o começo da primeira expressão ternária acima não necessita da abertura da crase.\
Conforme pode ser visto no exemplo abaixo:

```JavaScript
const ternaryConditionIsTrue = true;
const result = `Is ${ternaryConditionIsTrue ? "true" : "false"}?`;

console.log(result); // Saída: Is true?
```

# <a name = "entendendo-modulos-no-javascript"></a>Entendendo Módulos no JavaScript

### Diferença entre Módulos CommonJS e ES Modules

### Convertendo de CommonJS para ES Modules

A mensagem de erro abaixo geralmente é gerada pelo TypeScript em um ambiente JavaScript quando você está usando a opção `--allowJs` e há uma mistura de módulos CommonJS (Node.js) e módulos ECMAScript (ES6).\
A mensagem está indicando que o arquivo é atualmente um módulo CommonJS (formato usado pelo Node.js com `require` e `module.exports`), mas pode ser convertido para um módulo ES6 (formato com `import` e `export`).
Lembrando que se você está programando em JavaScript Puro, e não em TypeScript, não precisa se preocupar com as opções de configuração do TypeScript.\
O aviso pode aparecer se você estiver usando ferramentas de desenvolvimento que incorporam TypeScript, mesmo que você esteja escrevendo em JavaScript.

"File is a CommonJS module; it may be converted to an ES module. ts(80001)".

Essa mensagem de erro indica que o arquivo em questão é um módulo CommonJS e que pode ser convertido para um módulo ECMAScript (ES) usando a sintaxe de módulo ES6. No TypeScript, o compilador está sugerindo que você considere a conversão para um formato de módulo mais moderno.\
O CommonJS é um sistema de nódulos usado principalmente no Node.js, enquanto o ES6 (ou ECMAScript 2015) introduziu uma nova sintaxe de módulo. A sintaxe de módulo ES6 é mais morderna e tem algumas vantagens sobre o CommonJS, incluindo uma melhor análise estática, importações dinâmicas e suporte nativo a assíncrono.\
Se você deseja converter seu arquivo para um módulo ES6, você pode fazer algumas mudanças:

- **Alterar a Extensão do Arquivo:** renomeie o arquivo de `.js` para `.mjs` ou `.cjs` para indicar que é um módulo ES6 ou CommonJS, respectivamente;
- **Atualizar Sintaxe de Importação e Exportação:** no CommonJS, você usa `require` para importar módulos e `module.exports` para exportar valores. No ES6, você usa `import` e `export`. Portanto, atualize a sintaxe de importação/exportação no arquivo.

```JavaScript
// Antigo (CommonJS)
const modulo = require("./meu-modulo");

// Novo (ES6)
import modulo from "./meu-modulo";
```

```JavaScript
// Antigo (CommonJS)
module.exports = algumaCoisa;

// Novo (ES6)
export default algumaCoisa;
```

- **Alterar Configurações no** `tsconfig.json`**:** certifique-se de que o seu arquivo `tsconfig.json` está configurado para usar módulos ES6. Adicione ou atualize a opção "module" para "es6". Exemplo de configuração no `tsconfig.json`:

```json
{
    "compilerOptions": {
        "module": "es6",
        // ...outras opções
    },
    // ...outras opções
}
```

Ao fazer essas alterações, você estará seguindo as práticas modernas de desenvolvimento TypeScript e ECMAScript 2015+.

### Outros Erros ".ts(número)"

```JavaScript
Could not find a declaration file for module 'express-graceful-shutdown'. '/home/orion/APIs/orion-data-server/node_modules/express-graceful-shutdown/index.js' implicitly has an 'any' type.
Try `npm i --save-dev @types/express-graceful-shutdown` if it exists or add a new declaration (.d.ts) file containing `declare module 'express-graceful-shutdown';`ts(7016)
```

A mensagem de erro que você está vendo indica que o TypeScript não conseguiu encontrar um arquivo de declaração (**.d.ts**) para o módulo `express-graceful-shutdown`. As declarações TypeScript (arquivos **.d.ts**) são usadas para fornecer informações sobre a forma como os módulos JavaScript devem ser tipados.\
Para resolver esse problema, você tem algumas opções:

- Instalar tipos de pacotes (@types): muitos pacotes JavaScript populares têm pacotes de tipos correspondentes diponíveis no repositório `@types` no npm. No seu caso, vocẽ pode tentar instalar os tipos do `express-graceful-shutdown` com o seguinte comando:

`npm install --save-dev @types/express-graceful-shutdown`

Certifique-se de que você tenha o TypeScript instalado como dependência de desenvolvimento (`--save-dev`);

- Criar um arquivo de declaração manual: se não houver tipos disponíveis, você pode criar um arquivo de declaração manual (**.d.ts**). Crie um arquivo chamada `express-graceful-shutdown.d.ts` e adicione o seguinte conteúdo:

`declare module 'express-graceful-shutdown'`

Coloque esse arquivo na mesma pasta em que você está vendo a mensagem de erro ou em uma pasta de tipos personalizados;

- Desativar verificação de tipos para esse módulo: se você não estiver preocupado com a verificação de tipos rigorosa para esse módulo específico, pode desativar temporariamente a verificação de tipos para esse módulo adicionando o seguinte comentário ao topo do arquivo onde você está usando `express-graceful-shutdown`:

```JavaScript
// @ts-ignore
import expressShutdown from "express-graceful-shutdown";
```

No entanto, esteja ciente de que desativar a verificação de tipos pode resultar em menos segurança em termos de tipos.

```JavaScript
Could not find a declaration file for module 'request'. '/home/orion/APIs/orion-data-server/node_modules/request/index.js' implicitly has an 'any' type.
Try `npm i --save-dev @types/request` if it exists or add a new declaration (.d.ts) file containing `declare module 'request';`ts(7016)
```

Mesmo tipo de erro que o acima, mas com um módulo diferente.

```JavaScript
'parser' is deprecated.ts(6385)
```

A mensagem de aviso `'parser' is deprecated. ts(6385)` indica que você está usando uma funcionalidade chamada `parser` que foi marcada como obsoleta (deprecated) no TypeScript. Quando algo é marcado como obsoleto em programação, isso significa que é desencorajado o uso dessa funcionalidade porque ela pode ser removida em versões futuras, e existe uma alternativa recomendada.\
No contexto específico do TypeScript, a mensagem sugere que o recurso relacionado ao `parser` que está sendo utilizado está obsoleto e que você deve considerar mudar para uma abordagem mais recente ou para uma alternativa sugerida pela equipe do TypeScript.
A funcionalidade em questão se trata do middleware `body-parser` no Express. O `body-parser` era anteriormente uma parte essencial para analisar os corpos das solicitações em aplicativos Express. No entanto, nas versões mais recentes do Express (a partir da versão 4.16.0), o middleware `body-parser` foi incorporado no próprio Express, eliminando a necessidade de instá-lo como uma dependência separada.\
Para corrigir o aviso, você ṕde simplesmente remover a importação e o uso do `body-parser`. Por exemplo, você pode modificar o trecho de código a seguir da seguinte maneira para corrigir este aviso:

 - Antes:

 ```JavaScript
 const parser = require("body-parser").

 app.use(parser.urlencoded({ extended: true }));
 ```

 - Depois:

 `app.use(express.urlenconded({ extended: true }));`

 Certifique-se de que sua versão do Express seja 4.16.0 ou superior para garantir que a funcionalidade `urlencoded` esteja incorporada no próprio Express.\
 Está mudança está alinhada com a evolução do Express e simplifica a configuração de middlewares para processamento de dados de solicitação. Lembre-se de ajustar as partes do código necessárias, se houver, para usar a nova sintaxe.

Se você estiver escrevendo código JavaScript puro (sem tipos estáticos do TypeScript) e se deparar com mensagens de erro específicas do TypeScript, isso pode indicar que o TypeScript está sendo utilizado ou configurado no seu projeto. Nesse caso, você pode precisar ajustar a configuração ou, se não estiver planejando usar TypeScript, verificar se há algo no ambiente de desenvolvimento que está introduzindo o TypeScript, como configurações de build ou dependências específicas.\
Em um ambiente JavaScript puro, o TypeScript não interfere na execução do código, pois o JavaScript não faz uso dos tipos estáticos introduzidos pelo TypeScript. Portanto, se você está confortável com o seu código JavaScript e não planeja migrar para TypeScript, você pode ignorar essas mensagens de erro relacionadas à falta de tipos.\
No entanto, é sempre uma boa prática garantir que suas dependências estejam atualizadas e que você esteja usando versões estáveis dos pacotes em seu projeto. Se a mensagem de erro estiver relacionada a uma dependência específica, você pode verificar se há uma versão mais recente dessa dependência disponível.\
Se a sua aplicação está funcionando conforme o esperado no ambiente JavaScript, e você não planeja usar TypeScript no momento, você pode considerar essas mensagens de erro como alertas informativos que não impactarão a execução do seu código.

# <a name = "operadores"></a>Operadores

Os operadores são fundamentais para a construção de expressões lógicas em JavaScript. Eles desempenham um papel crucial em cálculos, tomadas de decisão e manipulação de dados em programas JavaScript.

### Operadores Aritméticos

Usado para realizar operações matemáticas.

- `+` (adição)
- `-` (subtração)
- `*` (multiplicação)
- `/` (divisão)
- `%` (módulo)

### Operadores de Atribuição

Usados para atribuir valores a variáveis.

- `=` (atribuição simples)\
    Para objetos e arrays (estrutura complexas), uma referência é realizada, quando se trata de tipos primitivos, uma cópia é gerada.
- `+=` (atribuição de adição)
- `-=` (atribuição de subtração)
- `*=` (atribuição de multiplicação)
- `/=` (atribuição de divisão)
- `delete` (remoção de propriedades de objetos)

Embora o `delete` não atribua diretamente valores, ele é usado para atribuir `undefined` a uma propriedade, removendo-a de um objeto.\
O operador `delete` é utilizado para remover uma propriedade de um objeto. Ele permite que você exclua uma propriedade específica de um objeto, deixando o restante do objeto inalterado. Vale a pena notar que o `delete` não pode ser usado para remover variáveis ou funções, apenas propriedades de objetos.

`delete objeto.propriedade`

```JavaScript
const pessoa = {
    nome: "João",
    idade: 30,
    cidade: "Exemploville"
};
let retorno;

// Removendo a propriedade "idade" do objeto pessoa.
retorno = delete pessoa.idade;

console.log(pessoa);         // Saída: { nome: "João", cidade: "Exemploville" }
console.log(pessoa.idade);   // Saída: undefined
console.log(retorno);        // Saída: true

const array = [1, 2, 3];
const variavelGlobal = "Variável global.";

retorno = delete array[1];

console.log(array);          // Saída: [ 1, <1 empty item>, 3 ]
console.log(array[1]);       // Saída: undefined
console.log(retorno);        // Saída: true

retorno = delete variavelGlobal;

console.log(variavelGlobal); // Saída: Variável global.
console.log(retorno);        // Saída: false
```

- **Objetos padrão (built-in):** você não pode usar o `delete` para excluir propriedades de objetos internos (built-in), como `Array`, `Object`, `Function`, etc. Ele funciona apenas em objetos criados pelo usuário;
- **Variáveis globais:** o `delete` não pode ser usado para excluir variáveis globais. Ele só funciona em propriedades de objetos.\
    Propriedades definidas com o `Object.defineProperty()` com a configuração `configurable` definida como `false` não podem ser excluídas.

No entanto, tenha em mente que existem algumas limitações e considerações importantes ao usar o `delete`:

Tenha em mente que a exclusão de propriedades em objetos pode afetar o desempenho e a otimização do código, portanto, é geralmente recomendado evitá-la, a menos que seja realmente necessário.\
Em muitos casos, em vez de usar `delete`, é preferível definir a propriedade como `undefined` ou `null` se você deseja indicar que ela não tem um valor válido. Isso mantém a propriedade no objeto, mas a torna sem valor.\
Vale notar também que se você tentar excluir uma propriedade de um objeto que é `undefined`, isso resultará em um erro. O JavaScript não permitirá que você acesse ou exclua propriedades de algo que é `undefined` ou `null`. Isso ocorre porque `undefined` e `null` não tem propriedades.

### Operadores de Comparação

Usados para comparar valores.

- `==` (igual)\
    Operador de igualdade solta, compara o valor e converte o tipo de dado, se necessário.
- `===` (igual estrito)\
    Operador de igualdade estrita, compara o valor e o tipo de dado.
- `!=` (não igual)
- `!==` (não igual estrito)
- `<` (menor que)
- `>` (maior que)
- `<=` (menor ou igual a)
- `>=` (maior ou igual a)

### Operadores Lógicos

Usados para realizar operações lógicas.

- `&&` (e lógico)
- `||` (ou lógico)
- `!` (negação lógica)

O operador lógico `||` é usado para fornecer valores padrão ou valores de fallback.\
O operador `||` retorna o primeiro operando truthy encontrado em uma sequência de operandos. Se todos forem falsy, retorna o último valor. O operador lógico "ou" é usado para criar expressões lógicas condicionais.

O operador lógico `&&` é usado para curto-circuito em expressões lógicas.\
O operador `&&` retorna o primeiro operando falsy. Se todos forem truthy, retorna o último valor. Exemplo:

```JavaScript
const primeiroValor = 1;
const segundoValor = 2;
const terceiroValor = 3;
const variavel = primeiroValor && segundoValor && terceiroValor;

console.log(variavel); // Saída: 3. Se qualquer um dos valores fosse "false", a saída seria "false".
```

### Operadores de Concatenação

Usados para unir strings.

- `+` (concatenação de strings)

### Operadores de Incremento e Decremento

Usados para aumentar ou diminuir o valor de uma variável

- `++` (incremento)
- `--` (decremento)

### Operador Ternário (Operador Condicional)

Usado para criar expressões condicionais

- `? :` (operador ternário)

É um operador em linguagens de programação que permite fazer uma escolha entre dois valores com base em uma condição e é frequentemente usado para criar **expressões condicionais concisas**. Ele é chamado de "ternário" porque envolve três partes: a condição, o valor que deve ser retornado se a condição for verdadeira e o valor que deve ser retornado se a condição for falsa.

`condicao ? (valorCasoACondicaoSejaVerdadeira) : (valorCasoACondicaoSejaFalsa)`

Parênteses são usados para agrupar várias instruções em uma única expressão, enquanto chaves são usadas para definir blocos de código em JavaScript. Por isso não é possível declarar variáveis dentro de uma operação ternária diretamente, porque é necessário um escopo de bloco mais amplo do que o oferecido por uma operação ternária.

### Operadores de Bitwise

Usados para realizar operações de bits.

- `&` (E bit a bit)
- `|` (OU bit a bit)
- `^` (OU exclusivo bit a bit)
- `~` (Negação bit a bit)
- `<<` (Shift left)
- `>>` (Shift right)
- `>>>` (Shift right não sinalizado)

### Outros Operadores

Existem outros operadores, como o operador de acesso a propriedades (`.`), o operador de índice (`[]`), operador de instância (`instanceof`), operador de tipo (`typeof`), operador de atribuição condicional (`??`), entre outros.