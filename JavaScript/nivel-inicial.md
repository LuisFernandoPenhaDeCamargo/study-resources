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

# <a name = "variaveis-var-let-const"></a>Variáveis (var, let, const)

# <a name = "tipos-de-dados-numeros-strings-booleanos"></a>Tipos de dados (números, strings, booleanos)

# <a name = "estruturas-de-controle-de-fluxo-if-else"></a>Estruturas de controle de fluxo (if, else)

# <a name = "funcoes-declaracao-chamada"></a>Funções (declaração, chamada)

# <a name = "arrays-e-loops-for-while"></a>Arrays e loops (for, while)

# <a name = "escopo-de-variaveis"></a>Escopo de variáveis

# <a name = "tratamento-de-erros-trycatch"></a>Tratamento de erros (try...catch)

# <a name = "callbacks-e-funcoes-anonimas"></a>Callbacks e funções anônimas

# <a name = "objeto-literal"></a>Objeto Literal

Um objeto literal é uma maneira de criar objetos diretamente no código, sem a necessidade de definir uma classe ou um construtor. Ele é composto por pares de chave-valor, onde as chaves são as propriedades do objetos e os valores podem ser qualquer tipo de dado válido em JavaScript.\
Um objeto criado com `{}` (chaves vazias) é um objeto literal. Esse objeto é uma coleção não ordenada de pares chave-valor, onde as chaves (também chamadas de propriedades) são strings (ou símbolos, em versões mais recentes do JavaScript) que atuam como identificadores exclusivos para acessar os valores associados.

Aqui está um exemplo simples de um objeto literal:

```JavaScript
const pessoa = {
    nome: "João",
    idade: 30,
    cidade: "Exemploville"
}

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