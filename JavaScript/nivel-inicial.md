# Nível Inicial: Fundamentos

### Sumário

1. [Variáveis (var, let, const)](#variaveis-var-let-const)
2. [Tipos de dados (números, strings, booleanos)](#tipos-de-dados-numeros-strings-booleanos)
3. [Estruturas de controle de fluxo (if, else)](#estruturas-de-controle-de-fluxo-if-else)
4. [Funções (declaração, chamada)](#funcoes-declaracao-chamada)
5. [Arrays e loops (for, while)](#arrays-e-loops-for-while)
6. [Escopo de variáveis](#escopo-de-variaveis)
7. [Tratamento de erros (try...catch)](#tratamento-de-erros-trycatch)
8. [Callbacks e funções anônimas](#callbacks-e-funcoes-anonimas)
9. [Objeto Literal](#objeto-literal)
10. [Operadores](#operadores)

# <a name = "variaveis-var-let-const"></a>Variáveis (var, let, const)

# <a name = "tipos-de-dados-numeros-strings-booleanos"></a>Tipos de dados (números, strings, booleanos)

# <a name = "estruturas-de-controle-de-fluxo-if-else"></a>Estruturas de controle de fluxo (if, else)

# <a name = "funcoes-declaracao-chamada"></a>Funções (declaração, chamada)

# <a name = "arrays-e-loops-for-while"></a>Arrays e loops (for, while)

# <a name = "escopo-de-variaveis"></a>Escopo de variáveis

# <a name = "tratamento-de-erros-trycatch"></a>Tratamento de erros (try...catch)

# <a name = "callbacks-e-funcoes-anonimas"></a>Callbacks e funções anônimas

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

- `=` (atribuição simples)
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
Em muitos casos, em vez de usar `delete`, é preferível definir a propriedade como `undefined` ou `null` se você deseja indicar que ela não tem um valor válido. Isso mantém a propriedade no objeto, mas a torna sem valor.

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
- `||` (ou lógico)\
    Operador lógico "ou" é usado para criar expressões lógicas condicionais. Ele retorna o primeiro valor verdadeiro encontrado em uma sequência de operandos\
    Se todos os operandos forem falsos, ele retorna o último valor.
- `!` (negação lógica)

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