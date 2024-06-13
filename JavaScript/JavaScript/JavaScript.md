# JavaScript (Ok)

### Sumário

- [Objeto de Primeira Classe](#objeto-de-primeira-classe)
- [Módulo x Biblioteca](#modulo-x-biblioteca)

# <a id="objeto-de-primeira-classe"></a>Objeto de Primeira Classe

Em programação, um objeto de primeira classe (ou cidadão de primeira classe) é uma **entidade que pode ser tratrada como qualquer outro valor**. Em outras palavras, um objeto de primeira classe possui as seguintes propriedades:

1. **Pode ser atribuído a uma variável:** você pode armazenar o objeto em uma variável
2. **Pode ser passado como argumento para uma função:** você pode passar o objeto como um argumento para funções
3. **Pode ser retornado de uma função:** uma função pode retornar um objeto
4. **Pode ser armazenado em estruturas de dados:** você pode armazenar o objeto em arrays, objetos, ou outras estruturas de dados

### Exemplos em JavaScript

Em JavaScript, funções são objetos de primeira classe. Isso significa que funções podem ser tratadas como qualquer outro objeto.

```JavaScript
// Atribuição a variáveis.
const digaOla = function () {
    console.log("Hello!");
}

// Passagem como argumentos.
function saudacao(funcao) {
    funcao();
}

saudacao(digaOla); // Passa a função como argumento.

// Retorno de funções.
function getSaudacao() {
    return function () {
        console.log("Hello!");
    };
}

const cumprimentador = getSaudacao();

cumprimentador(); // Chama a função retornada.

// Armazenamento em estruturas de dados.
const funcoes = [
    function () { console.log("Hello from function 1"); },
    function () { console.log("Hello from function 2"); }
];

funcoes.forEach(funcao => funcao()); // Chama cada função no array.
```

**Objetos de Primeira Classe em Geral**

Além de funções, todos os outros tipos de valores em JavaScript (números, strings, arrays, objetos) também são considerados de primeira classe, pois possuem as mesmas propriedades.

### Comparação com Outras Linguagens

Em algumas linguagens de programação, como C, funções não são objetos de primeira classe. Isso significa que, embora você possa chamar funções e passá-las como ponteiros de funções, não pode atribuí-las diretamente a variáveis ou retorná-las de outras funções de maneira tão simples e direta quanto em linguagens que tratam funções como objetos de primeira classe.

### Conclusão

O conceito de objetos de primeira classe é fundamental para a compreensão de linguagens de programação modernas, especialmente aquelas que suportam programação funcional. Ele permite um estilo de programação mais flexível e poderoso, onde funções podem ser manipuladas e usadas como qualquer outro valor.

# <a id="modulo-x-biblioteca"></a>Módulo x Biblioteca

### Módulo

Um módulo é um pedaço de código reutilizável que fornece funções, classes, objetos ou valores específicos. Em JavaScript, um módulo é um arquivo que exporta código para ser usado em outros arquivos.

**Características**

- **Granularidade:** normalmente focado em uma funcionalidade específica ou um pequeno conjunto de funcionalidades
- **Escopo:** um módulo é uma unidade de encapsulamento e pode ter seu próprio escopo. Tudo definido dentro de um módulo não interfere com o escopo global a menos que seja explicitamente exportado
- **Reutilização:** projetado para ser reutilizado em diferentes partes de uma aplicação ou em diferentes projetos

### Biblioteca

Uma biblioteca é uma coleção de módulos que fornecem uma ampla gama de funcionalidades relacionadas. Ela é mais abrangente e oferece uma coleção coesa de funções, métodos ou classes que são destinadas a serem usadas em conjunto para resolver problemas ou realizar tarefas específicas.

**Características**

- **Amplitude:** oferece uma coleção de funcionalidades que cobrem um domínio ou tarefa específicos, mas de forma mais abrangente do que um módulo individual
- **Coesão:** as funcionalidades fornecidas por uma biblioteca são geralmente relacionadas e trabalham bem juntas
- **Complexidade:** pode ser composta de muitos módulos e arquivos, cada um com responsabilidades específicas, mas combinados para fornecer funcionalidades robustas

### Comparação

| Característica | Módulo | Biblioteca |
|---|---|---|
| Escopo | Focado em funcionalidades específicas | Coleção de módulos relacionados |
| Reutilização | Pode ser reutilizado em diferentes contextos | Oferece um conjunto de funcionalidades coesas |
| Granularidade | Normalmente mais granular | Mais abrangente |
| Exemplo | `math.js` com funções de adição e subtração | Express para criação de servidores web |
| Complexidade | Menos complexo | Por ser bastante complexo, com muitos módulos |

### Conclusão

- **Módulo:** ideal para encapsular e reutilizar pequenas partes do código. Excelente para funções ou classes específicas
- **Biblioteca:** ideal para fornecer um conjunto coeso de funcionalidades que trabalham juntas para resolver problemas mais complexos. É composta por múltiplos módulos, oferecendo uma solução mais abrangente

Ambos são fundamentais para a organização e reutilização de código, mas são utilizados em diferentes níveis de abstração.