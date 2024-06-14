# JavaScript

### Sumário

- [`return`](#return)
- [`class`](#class)
- [`static`](#static)
- [Propriedades Estáticas em Funções Construtoras](#propriedades-estaticas-funcoes-construtoras)
- [Classes x Objetos (no Contexto em que Ambos Podem ser Utilizados para Criar Novas Instâncias)](#classes-x-objetos-contexto-em-que-ambos-podem-ser-utilizados-para-criar-novas-instancias)
- [Objeto de Primeira Classe](#objeto-de-primeira-classe)
- [Módulo x Biblioteca](#modulo-x-biblioteca)

# <a id="return"></a>`return`

O `return` é uma **palavra-chave** fundamental em muitas linguagens de programação, incluindo JavaScript, que permite que **uma função produza um valor como resultado de sua execução e, opcionalmente, termine sua execução antecipadamente**.

```JavaScript
// - `return` é usado dentro de uma função para especificar o valor que deve ser retornado ao chamador da função
function nomeFuncao(parametros) {
    // Corpo da função.
    return "valor";
}

// - Quando uma função encontra uma instrução `return`, ela termina imediatamente sua execução e retorna o valor especificado
// - O `return` também pode ser usado sem um valor para terminar a execução de uma função antecipadamente
function verificaNumero(numero) {
    if (numero < 0) {
        return; // Termina a função se `numero` for negativo.
    }

    console.log("Número positivo:", numero);
}

verificaNumero(-1); // Nada é impresso.
verificaNumero(5);  // Output: Número positivo: 5

// - Qualquer código após uma instrução de `return` dentro de uma função não será executado (lembre de considerar o escopo)
function exemplo() {
    return 42;

    console.log("Este código nunca será executado");
}

// Considerações Importantes
// - Quando uma função não possui uma instrução `return` explícita, ela retorna `undefined` por padrão
// - Ao retornar objetos, é crucial colocar os parênteses corretamente para evitar ambiguidades
// - Para evitar retornos inesperados, use parênteses ao retornar objetos literais diretamente
function retornaObjeto() {
    return ({
        mensagem: "Olá",
    });
}
```

# <a id="class"></a>`class`

A **palavra-chave** `class` é usada para **definir classes**, que são modelos para criar objetos. Classes encapsulam dados e comportamentos que pertencem a esses objetos e fornecem uma maneira conveniente de definir objetos semelhantes. As classes em JavaScript foram introduzidas no ECMAScript 2015 (ES6) e fornecem uma sintaxe mais clara e concisa para criar e gerenciar objetos em comparação com a abordagem baseada em protótipos usada anteriormente.

```JavaScript
// Definindo uma classe.
class Pessoa {
    // Construtor.
    // - O método `constructor` é um método especial para criar e inicializar objetos criados com a classe
    // - Só pode haver um método `constructor` em uma classe
    constructor (nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }

    // Método.
    saudacao() {
        return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
    }
}

// Criando uma instância da classe.
const pessoa1 = new Pessoa("Alice", 30);

console.log(pessoa1.saudacao()); // Output: Olá, meu nome é Alice e eu tenho 30 anos.
```

### Herança

Classes em JavaScript podem herdar de outras classes usando a **palavra-chave** `extends`. A herança permite criar uma nova classe que é uma extensão de uma classe existente.

```JavaScript
class Animal {
    constructor(nome) {
        this.nome = nome;
    }

    fazerSom() {
        console.log(`${this.nome} faz um som.`);
    }
}

class Cachorro extends Animal {
    constructor(nome, raca) {
        super(nome); // Chama o construtor da classe pai.
        this.raca = raca;
    }

    fazerSom() {
        console.log(`${this.nome} (um ${this.raca}) late.`)
    }
}

const cachorro = new Cachorro("Buddy", "Golden Retriever");

cachorro.fazerSom(); // Outpu: Buddy (um Golden Retriever) late.
```

### Encapsulamento

O encapsulamento é o princípio de **esconder detalhes internos de um objet e apenas expor a interface pública**. Em JavaScript, as propriedades privadas podem ser definidas usando um prefixo de `#` (sintaxe moderna do ES2022).

```JavaScript
class ContaBancaria {
    #saldo = 0;

    depositar(valor) {
        if (valor > 0) {
            this.#saldo += valor;
        }
    }

    sacar(valor) {
        if (valor > 0 && valor <= this.#saldo) {
            this.#saldo -= valor;
        }
    }

    getSaldo() {
        return this.#saldo;
    }
}

const conta = new ContaBancaria();

conta.depositar(100);
conta.sacar(50);

console.log(conta.getSaldo()); // Output: 50
// "Property '#saldo' is not accessible outside class 'ContaBancaria' because it has a private identifier."
console.log(conta.#saldo);     // Gera um erro, "Private field '#saldo' must be declared in an enclosing class"
```

# <a id="static"></a>`static`

A **palavra-chave** `static` em JavaScript é usada para definir métodos ou propriedades estáticas **em classes**. Métodos ou propriedades estáticas são aqueles que **pertencem à própria classe, e não às instâncias da classe**. Em outras palavras, **você pode acessar métodos e propriedades estáticas diretamente na classe, sem a necessidade de criar uma instância da classe**.

```JavaScript
// - Métodos declarados como `static` podem ser chamados diretamente na classe sem precisar instanciar a classe
class Utilidades {
    static saudacao() {
        return "Olá, mundo!";
    }
}

console.log(Utilidades.saudacao()); // Output: Olá, mundo!

// - Propriedades estáticas são variáveis que pertencem à classe e não a uma instância específica
class Configuracoes {
    static versao = "1.0.0";
}

console.log(Configuracoes.versao); // Output: 1.0.0

// - Métodos e propriedades estáticas não podem ser acessados por instâncias da classe
class Exemplo {
    static metodoEstatico() {
        return "Método estático";
    }
}

const exemplo = new Exemplo();

console.log(exemplo.metodoEstatico);   // Output: undefined
// Em relação ao log acima, `exemplo` é um objeto vazio (`Exemplo {}`, um objeto vazio da classe Exemplo), então `exemplo.metodoEstatico()` gera um erro, pois ele não é uma função.
console.log(Exemplo.metodoEstatico()); // Output: Método estático
```

### Quando Usar

Métodos e propriedades estáticas são frequentemente usados para criar funções utilitárias, constantes, ou para manter contadores e registros que precisam ser compartilhados entre todas as instâncias da classe.

### Vantagens e Desvantagens

- **Vantagens:**
    + **Centralização:** facilita a centralização de métodos ou dados comuns que não dependem de uma instância específica
    + **Acesso fácil:** pode ser acessado diretamente pela classe, sem a necessidade de instanciar a classe
- **Desvantagens:**
    + **Não-polimórfico:** não pode ser sobrescrito em instâncias, o que limita o polimorfismo em certos casos
    + **Escopo limitado:** não pode acessar `this` que se refere à instância da classe, já que `this` **dentro de um método estático se refere à própria classe**

# <a id=""></a>Propriedades Estáticas em Funções Construtoras

Propriedades estáticas em funções construtoras em JavaScript são aquelas que **pertencem à própria função, e não às instâncias criadas por essa função**. Para definir uma **propriedade estática em uma função construtora, você adiciona a propriedade diretamente à função, em vez de adicioná-lo ao** `prototype`.

```JavaScript
function Pessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

// Propriedade estática.
Pessoa.tipo = "Humano";

// Método estático.
Pessoa.identificar = function() {
    return `Todos os humanos são do tipo: ${Pessoa.tipo}`;
}

Pessoa.prototype.saudacao = function() {
    return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
}

const pessoa1 = new Pessoa("Alice", 25);

console.log(pessoa1.saudacao());   // Output: Olá, meu nome é Alice e eu tenho 25 anos.
console.log(Pessoa.identificar()); // Output: Todos os humanos são do tipo: Humano.
console.log(Pessoa.tipo);          // Output: Humano
console.log(pessoa1.tipo);         // Output: undefined (não disponível na instância).
```

# <a id="classes-x-objetos-contexto-em-que-ambos-podem-ser-utilizados-para-criar-novas-instancias"></a>Classes x Objetos (no Contexto em que Ambos Podem ser Utilizados para Criar Novas Instâncias)

Tanto classes quanto objetos em JavaScript podem ser usados para criar novas instâncias com um método construtor. No entanto, eles fazem isso de maneiras diferentes, refletindo a evolução da linguagem e suas diferentes abordagens para programação orientada a objetos.

As classes são uma forma mais recente e mais organizada de criar objetos e definir construtores e métodos. Elas foram introduzidas no ECMAScript 2015 (ES6) e fornecem uma sintaxe mais clara para herança e criação de instâncias.

Antes das classes, os desenvolvedores JavaScript usavam **funções construtoras** para criar objetos e definir seus métodos. Funções construtoras são convenções mais antigas que fazem uso de funções normais para criar novos objetos e definir métodos em seus protótipos.

### Sintaxe e Herança

```JavaScript
// Classes oferecem uma sintaxe mais limpa e direta para definir métodos e herança.
class ClasseAnimal {
    constructor(nome) {
        this.nome = nome;
    }

    fazemSom() {
        console.log(`${this.nome} faz um som.`);
    }
}

// Funções Construtoras requerem a definição de métodos separadamente, usando a propriedade `prototype`.
function FuncaoConstrutoraAnimal(nome) {
    this.nome = nome;
}

FuncaoConstrutoraAnimal.prototype.fazemSom = function() {
    console.log(`${this.nome} faz um som.`);
};

// Herança
// Classes utilizam a palavra-chave `extends` e `super` para herança, tornando o código mais legível e fácil de manter.
class ClassCachorro extends ClasseAnimal {
    constructor(nome, raca) {
        super(nome);
        this.raca = raca;
    }

    fazerSom() {
        console.log(`${this.nome} (um ${this.raca}) late.`);
    }
}

// Funções Construtoras implementam herança manualmente, usando `Object.create()` e chamadas explícitas aos construtores pai.
function FuncaoConstrutoraCachorro(nome, raca) {
    FuncaoConstrutoraAnimal.call(this, nome);
    this.raca = raca;
}

FuncaoConstrutoraCachorro.prototype = Object.create(FuncaoConstrutoraAnimal.prototype);
FuncaoConstrutoraCachorro.prototype.constructor = FuncaoConstrutoraCachorro;

FuncaoConstrutoraCachorro.prototype.fazemSom = function() {
    console.log(`${this.nome} (um ${this.raca}) late.`);
};
```

### Encapsulamento

```JavaScript
// Classes podem usar campos privador com o prefixo `#` (sintaxe moderna do ES2022).
class ClasseContaBancaria {
    #saldo = 0;

    depositar(valor) {
        this.#saldo += valor;
    }

    getSaldo() {
        return this.#saldo;
    }
}

// Funções Construtoras utilizam variáveis locais dentro do construtor para simular privacidade.
function FuncaoConstrutoraContaBancaria() {
    let saldo = 0;

    this.depositar = function(valor) {
        saldo += saldo;
    };

    this.getSaldo = function() {
        return saldo;
    };
}
```

### Comparação Resumida

- **Sintaxe:**
    + Classes têm uma sintaxe mais clara e estruturada
    + Funções construtoras requerem mais configuração e são menos intuitivas
- **Herança:**
    + Classes facilitam a herança com `extends` e `super`
    + Funções construtoras requerem herança manual com `Object.create()` e chamadas de construtor
- **Encapsulamento:**
    + Classes modernas suportam propriedades privadas diretamente
    + Funções construtoras simulam privacidade com variáveis locais e closures

### Exemplo

```JavaScript
class ClassePessoa {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }

    saudacao() {
        return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`
    }
}

const pessoa1 = new ClassePessoa("Alice", 25);

console.log(pessoa1.saudacao()); // Output: Olá, meu nome é Alice e eu tenho 25 anos.

function FuncaoConstrutoraPessoa(nome, idade) {
    this.nome = nome;
    this.pessoa = pessoa;
}

FuncaoConstrutoraPessoa.prototype.saudacao = function() {
    return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
}

const pessoa2 = new FuncaoConstrutoraPessoa("Alice", 25);

console.log(pesso2.saudacao()); // Output: Olá, meu nome é Alice e eu tenho 25 anos.
```

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