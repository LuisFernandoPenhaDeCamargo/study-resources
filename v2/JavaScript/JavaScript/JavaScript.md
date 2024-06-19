# JavaScript (Ok)

### Sumário

- [`return`](#return)
    + [Retornando Mais de um Valor](#retornando-mais-de-um-valor)
- [Shorthand Property Names Syntax](#shorthand-property-names-syntax)
- [`this`](#this)
    + [Contextos Diferentes de `this`](#this-contextos-diferentes-de-this)
- [Funções Construtoras](#funcoes-construtoras)
    + [Definindo Métodos: Diretamente na Função Construtora x Usando a Propriedade `prototype`](#funcoes-construtoras-definindo-metodos-diretamente-na-funcao-construtora-x-usando-a-propriedade-prototype)
- [Classes (`class`)](#classes-class)
- [Funções Construtoras x Classes](#funcoes-construtoras-x-classes)
    + [Sintaxe e Herança](#funcoes-construtoras-x-classes-sintaxe-heranca)
    + [Encapsulamento](#funcoes-construtoras-x-classes-encapsulamento)
    + [Propriedades Estáticas](#funcoes-construtoras-x-classes-propriedades-estaticas)
    + [Propriedades Estáticas Encapsuladas](#funcoes-construtoras-x-classes-propriedades-estaticas-encapsuladas)
    + [Comparação Resumida](#funcoes-construtoras-x-classes-comparacao-resumida)
- [`constructor`](#constructor)
- [`instance.constructor`](#instance-constructor)
- [`.prototype` e `__proto__`](#prototype-proto)
- [Objeto de Primeira Classe](#objeto-de-primeira-classe)
- [Módulo x Biblioteca](#modulo-x-biblioteca)
- [Estruturação de Código](#estruturação-codigo)

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

## <a id="retornando-mais-de-um-valor"></a>Retornando Mais de um Valor

Em JavaScript, uma função não pode retornar mais de um valor diretamente, como em algumas outras linguagens (como Python). No entanto, você pode retornar múltiplos valores usando um array ou um objeto.

### Usando um Array

Se a ordem dos valores é importante e você deseja retornar múltiplos valores, você pode usar um array:

```JavaScript
function obterCoordenadas() {
    let x = 10;
    let y = 20;

    return [x, y];
}

let [x, y] = obterCoordenadas();

console.log(x); // Output: 10
console.log(y); // Output: 20
```

### Usando um Objeto

Se você deseja retornar múltiplos valores com mais clareza sobre o que cada valor representa, você pode usar um objeto:

```JavaScript
function obterCoordenadas() {
    let x = 10;
    let y = 20;
    return { x: x, y: y};
}

let coordenadas = obterCoordenadas();

console.log(coordenadas.x); // Output: 10
console.log(coordenadas.y); // Output: 20
```

### Vantagens e Desvantagens

- **Array:**
    + **Vantangens:** simplicidade e menor uso de memória em alguns casos
    + **Desvantagens:** pode ser menos claro, especialmente se a função retornar muitos valores ou valores que não têm uma ordem óbvia
- **Objeto:**
    + **Vantangens:** mais claro e legível, especialmente quando retornando múltiplos valores com significados distintos
    + **Desvantagens:** uso ligeiramente maior de memória devido aos nomes das propriedades

# <a id="shorthand-property-names-syntax"></a>Shorthand Property Names Syntax

Você pode retornar um objeto utilizando a Shorthand Property Names Syntax em JavaScript, onde os nomes das propriedades são iguais aos nomes das variáveis:

```JavaScript
function obterCoordenadas() {
    let x = 10;
    let y = 20;

    return { x, y };
}

let coordenadas = obterCoordenadas();

console.log(coordenadas.x); // Output: 10
console.log(coordenadas.y); // Output: 20
```

Neste exemplo, `return { x, y };` é uma forma abreviada de escrever `return { x: x, y: y };`. Quando o nome da variável é o mesmo que o nome da propriedade, você pode usar a forma curta (Shorthand Property Names Syntax).

# <a id="this"></a>`this`

O `this` em JavaScript é uma referência especial que é automaticamente definida para o contexto de execução de uma função. Em termos simples, `this` é uma **palavra-chave** que aponta para um objeto específico dependendo de como a função foi chamada.

O contexto de execução da função varia dependendo de como ela é invocada. Em JavaScript, o valor de `this` é determinado durante a chamada da função e não durante a sua definição.

## <a id="this-contextos-diferentes-de-this"></a>Contextos Diferentes de `this`

1. **Método de objeto**
2. **Função sozinha**
3. **Função construtora (construtores)**
4. **Arrow Functions**
5. **Evento**
6. **Com** `.call()`, `.apply()` **e** `.bind()`

### Método de Objeto

Quando uma função é chamada como método de um objeto, `this` refere-se ao objeto que contém o método.

```JavaScript
const pessoa = {
    nome: "Alice",
    saudacao: function() {
        console.log(`Olá, meu nome é ${this.nome}.`);
    },
};

pessoa.saudacao(); // Output: Olá, meu nome é Alice.
```

### Função Sozinha

Quando uma função é chamada sozinha, `this` refere-se ao objeto global (em navegadores, isso é `window`; em Node.js, é `global`). No modo estrito (`"use strict"`), `this` é `undefined`.

```JavaScript
function saudacao() {
    console.log(this);
}

saudacao(); // Output: Object [global] { $< informações > }
```

### Função Construtora (Construtores)

Quando uma função construtora é usada como um construtor (usando `new`), `this` refere-se ao novo objeto criado.

```JavaScript
function Pessoa(nome) {
    this.nome = nome;
    this.saudacao = function() {
        console.log(`Olá, meu nome é ${this.nome}.`);
    };
}

const pessoa1 = new Pessoa("Alice");

pessoa1.saudacao(); // Output: Olá, meu nome é Alice.
```

### Arrow Function

Funções Arrow (`=>`) não têm o seu próprio `this`. Em vez disso, `this` da função pai é usado. Isso é útil em métodos de objetos e callbacks, onde o contexto `this` pode ser perdido.

```JavaScript
const pessoa = {
    nome: "Alice",
    saudacao: function() {
        const funcaoInterna = () => {
            console.log(`Olá, meu nome é ${this.nome}.`);
        };
        funcaoInterna();
    }
};

pessoa.saudacao(); // Output: Olá, meu nome é Alice.
```

### Evento

Quando uma função é usada como um manipulador de eventos, `this` refere-se ao elemento que recebeu o evento.

```JavaScript
const button = document.createElement("button");

button.textContent = "Clique em mim";

button.onclick = function() {
    console.log(this); // Output: <button> element
};

document.body.appendChild(button);
```

### Com `.call()`, `.apply()` e `.bind()`

`.call()`, `.apply()` e `.bind()` são métodos que podem ser usados para definir explicitamente o valor de `this` em uma função.

- `.call()`**:** chama uma função com um dado `this` e argumentos passados individualmente
- `.apply()`**:** chama uma função com um dado `this` e argumentos passados como uma matriz
- `.bind()`**:** retorna uma nova função onde `this` é explicitamente definido

```JavaScript
function saudacao() {
    console.log(`Olá, meu nome é ${this.nome}.`);
}

const pessoa = { nome: "Alice", };

saudacao.call(pessoa);  // Output: Olá, meu nome é Alice.
saudacao.apply(pessoa); // Output: Olá, meu nome é Alice.

const saudacaoBind = saudacao.bind(pessoa);

saudacaoBind();         // Output: Olá, meu nome é Alice.
```

### Conclusão

- **Método de bjeto:** `this` refere-se ao objeto
- **Função sozinha:** `this` refere-se ao objeto global
- **Função construtora (construtores):** `this` refere-se ao novo objeto
- **Arrow Functions:** `this` refere-se ao contexto léxico (não tem seu próprio `this`), o contexto onde a função foi definida
- **Evento:** `this` refere-se ao elemento DOM que recebeu o evento
- **Com** `.call()`, `.apply()` **e** `.bind()`**:** `this` pode ser explicitamente definido

# <a id="funcoes-construtoras"></a>Funções Construtoras

Funções Construtoras em JavaScript são **uma maneira tradicional de criar objetos e implementar a orientação a objetos** na linguagem antes da introdução das classes no ECMAScript 2015 (ES6). Elas fornecem uma estrutura para criar objetos que compartilham propriedades e métodos comuns.

Uma função construtora é apenas **uma função regular que é usada com a palavra-chave** `new` **para criar objetos**. Por convenção, os nomes das Funções Construtoras começam com letra maiúscula.

### Exemplo

```JavaScript
function Pessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

Pessoa.prototype.saudacao = function() {
    return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
}

const pessoa1 = new Pessoa("Alice", 25);

console.log(pessoa1.saudacao()); // Output: Olá, meu nome é Alice e eu tenho 25 anos.
```

### Componentes de Funções Construtoras

1. **Construtor:** quando você usa `new Pessoa("Alice", 25)`, o JavaScript cria um **novo objeto vazio**, define o `this` **para apontar para esse novo objeto**, chama a função `Pessoa()` com os argumentos fornecidos
2. **Propriedades e métodos de instância:** propriedades definidas usando `this` dentro da função construtora são propriedades de instância, acessíveis em cada objeto criado pela função
3. **Propriedades e métodos de protótipo:** métodos adicionados ao `prototype` da função construtora são compartilhados por todas as instâncias criadas por essa função

## <a id="funcoes-construtoras-definindo-metodos-diretamente-na-funcao-construtora-x-usando-a-propriedade-prototype"></a>Definindo Métodos: Diretamente na Função Construtora x Usando a Propriedade `prototype`

Você pode definir métodos diretamente dentro da Função Construtora, e esses métodos estarão disponíveis em cada instância criada por essa função construtora. No entanto, é importante notar que definir métodos dessa forma resulta em **cada instância ter sua própria cópia do método**, o que pode levar a um uso ineficiente de memória se houver muitas instâncias.

### Definindo Métodos no Construtor

Quando você define métodos diretamente dentro do construtor, cada instância terá sua própria cópia do método. Isso é útil se o comportamento do método precisa ser diferente para cada instância, mas geralmente não é eficiente em termos de memória.

```JavaScript
function Animal(nome) {
    this.nome = nome;
    this.fazemSom = function() {
        console.log(`${this.nome} faz um som.`);
    };
}

const animal1 = new Animal("Leão");
const animal2 = new Animal("Tigre");

animal1.fazemSom();                                 // Output: Leão faz um som.
animal2.fazemSom();                                 // Output: Tigre faz um som.
console.log(animal1.fazemSom === animal2.fazemSom); // Output: false (métodos diferentes para cada instância).
```

### Definindo Métodos no Protótipo

Quando você define métodos no protótipo, todas as instâncias compartilham o mesmo método. Isso é mais eficiente em termos de memória e é a abordagem recomendada quando o comportamento do método é o mesmo para todas as instâncias.

```JavaScript
function Animal(nome) {
    this.nome = nome;
}

Animal.prototype.fazemSom = function() {
    console.log(`${this.nome} faz um som.`);
}

const animal1 = new Animal("Leão");
const animal2 = new Animal("Tigre");

animal1.fazemSom();                                 // Output: Leão faz um som.
animal2.fazemSom();                                 // Output: Tigre faz um som.
console.log(animal1.fazemSom === animal2.fazemSom); // Output: true (mesmo método para todas as instâncias).
```

# <a id="classes-class"></a>Classes (`class`)

A **palavra-chave** `class` é usada para **definir classes**, que são **modelos para criar objetos**. Classes encapsulam dados e comportamentos que pertencem a esses objetos e fornecem uma maneira conveniente de definir objetos semelhantes. As classes em JavaScript foram introduzidas no ECMAScript 2015 (ES6) e fornecem uma sintaxe mais clara e concisa para criar e gerenciar objetos em comparação com a abordagem baseada em protótipos usada anteriormente.

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
const pessoa1 = new Pessoa("Alice", 25);

console.log(pessoa1.saudacao()); // Output: Olá, meu nome é Alice e eu tenho 25 anos.
```

# <a id="funcoes-construtoras-x-classes"></a>Funções Construtoras x Classes

Tanto Funções Construtoras quanto Classes podem ser usadas para criar novas instâncias de um objeto com um método construtor. No entato, eles fazem isso de maneiras diferentes, refletindo a evolução da linguagem e suas diferentes abordagens para programação orientada a objetos.

As classes são uma forma mais recente e mais organizada de criar objetos e definir construtores e métodos. Elas foram introduzidas no ECMAScript 2015 (ES6) e fornecem uma sintaxe mais clara para herança e criação de instâncias.

Antes das classes, os desenvolvedores JavaScript usavam Funções Construtoras para criar objetos e definir seus métodos. Funções Construtoras são convenções mais antigas que fazem uso de funções normais para criar novos objetos e definir métodos em seus protótipos.

## <a id="funcoes-construtoras-x-classes-sintaxe-heranca"></a>Sintaxe e Herança

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
class ClasseCachorro extends ClasseAnimal {
    constructor(nome, raca) {
        super(nome); // Chama o construtor da classe pai.
        this.raca = raca;
    }

    fazemSom() {
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


const cachorroClasse = new ClasseCachorro("Buddy", "Golden Retriever");
const cachorroFuncaoConstrutora = new FuncaoConstrutoraCachorro("Buddy", "Golden Retriever");

cachorroClasse.fazemSom();            // Output: Buddy (um Golden Retriever) late.
cachorroFuncaoConstrutora.fazemSom(); // Output: Buddy (um Golden Retriever) late.
```

### Exemplos Interessantes

```JavaScript
function Animal(tipo) {
    this.tipo = tipo;
}

const teste1 = new Animal("Réptil");

console.log(teste1.tipo);        // Output: Réptil
console.log(teste1.constructor); // Output: [Function: Animal]

Animal.prototype.som = function() {
    console.log(`${this.nome} faz um som.`);
};

teste1.som(); // Output: undefined faz um som.

function Gato(nome) {
    Animal.call(this, "Mamífero");
    this.nome = nome;
}

const teste2 = new Gato("A");

console.log(teste2.tipo);        // Output: Mamífero
console.log(teste2.nome);        // Output: A
console.log(teste2.constructor); // Output: [Function Gato]

// teste2.som(); `teste2` não tem definido em seu protótipo a função `.som()`, pois só abaixo ela é herdada através do `Object.create()`.

Gato.prototype = Object.create(Animal.prototype);

const teste3 = new Gato("B");

console.log(teste3.tipo);        // Ouput: Mamífero
console.log(teste3.nome);        // Ouput: B
console.log(teste3.constructor); // Ouput: [Function Animal]. A propriedade `constructor` só é corrigida abaixo.

teste3.som();                    // Ouput: B faz um som

Gato.prototype.constructor = Gato;

console.log(teste3.tipo);        // Output: Mamífero
console.log(teste3.nome);        // Output: B
console.log(teste3.constructor); // Output: [Function Gato]

teste3.som();                    // Output: B faz um som

const mia = new Gato("Mia");

mia.som(); // Output: Mia faz um som.
```

- `Object.create(Animal.prototype);`**:** cria um novo objeto cujo protótipo é `Animal.prototype`. Isso significa que o novo objeto terá `Animal.prototype` na sua cadeia de protótipos
- `Gato.prototype = `**:** atribui esse novo objeto a `Gato.prototype`

O resultado é que qualquer instância de `Gato` criada com `new Gato()` terá `Animal.prototype` como parte da sua cadeia de protótipos. Isso estabelece a herança, permitindo que as instâncias de `Gato` acessem métodos definidos em `Animal.prototype`

+ `Gato.prototype.constructor = Gato;`
    - Quando você substitui `Gato.prototype` com um novo objeto, a propriedade `constructor` desse protótipo também é substituída
    - **Porque isso importa?** A propriedade `constructor` é usada para referenciar a função construtora que criou a instância do objeto. Originalmente, `Gato.prototype.constructor` aponta para a função `Gato()`
    - **Depois da substituição**, `Gato.prototype` agora é um novo objeto criado com `Object.create(Animal.prototype)`, que não tem a propriedade `constructor` definida. Por padrão, a nova `constructor` referencia `Animal` em vez de `Gato`

Se não corrigirmos isso, qualquer verificação ou operação que dependa de `Gato.prototype.constructor` estará incorreta. Por exemplo, `instance.constructor` deveria retornar a função construtora correta que criou a instância. Então, ao fazer `Gato.prototype.constructor = Gato;`, estamos corrigindo o problema e fazendo com que o `constructor` de `Gato.prototype` aponte corretamente para a função `Gato()`.

### Resumo

- `Gato.prototype = Object.create(Animal.prototype);`
    + Cria um novo objeto com `Animal.prototype` como seu protótipo
    + Define esse objeto como `Gato.prototype`, estabelecendo a herança
- `Gato.prototype.constructor = Gato;`**:** corrige a propriedade `constructor` de `Gato.prototype` para apontar corretamente para a função construtora `Gato()`

Essas duas linhas juntas permitem que `Gato` herde de `Animal` corretamente, garantindo que as instâncias de `Gato` possam acessar os métodos de `Animal` e que a propriedade `constructor` esteja correta.

## <a id="funcoes-construtoras-x-classes-encapsulamento"></a>Encapsulamento

O encapsulamento é o princípio de **esconder detalhes internos de um objeto e apenas expor a interface pública**. Em JavaScript, as propriedades privadas podem ser definidas usando um prefixo de `#` (sintaxe moderna do ES2022).

```JavaScript
// Classes podem usar campos privados com o prefixo `#` (sintaxe moderna do ES2022).
class ClasseContaBancaria {
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

// Funções Construtoras utilizam variáveis locais dentro do construtor para simular privacidade.
function FuncaoConstrutoraContaBancaria() {
    let saldo = 0;

    this.depositar = function(valor) {
        saldo += valor;
    };

    this.sacar = function(valor) {
        if (valor > 0 && valor <= saldo) {
            saldo -= valor;
        }
    }

    this.getSaldo = function() {
        return saldo;
    };
}

const contaClasse = new ClasseContaBancaria();
const contaFuncaoConstrutora = new FuncaoConstrutoraContaBancaria();

contaClasse.depositar(100);
contaClasse.sacar(50);
contaFuncaoConstrutora.depositar(100);
contaFuncaoConstrutora.sacar(50);

console.log(contaClasse.getSaldo());            // Output: 50
// "Property '#saldo' is not accessible outside class 'ClasseContaBancaria' because it has a private identifier."
// console.log(contaClasse.#saldo);        // Gera um erro, "Private field '#saldo' must be declared in an enclosing class"
console.log(contaFuncaoConstrutora.getSaldo()); // Output: 50
console.log(contaFuncaoConstrutora.saldo); // Output: undefined. Você está acessando uma propriedade e não a variável local.
```

## <a id="funcoes-construtoras-x-classes-propriedades-estaticas"></a>Propriedades Estáticas

Métodos ou propriedades estáticas são aqueles que **pertencem à própria classe (função construtora), e não às instâncias da classe**. Em outras palavras, **você pode acessar métodos e propriedades estáticas diretamente na classe, sem a necessidade de criar uma instância da classe.**

A **palavra-chave** `static` em JavaScript é utilizada para **definir métodos ou propriedades estáticas em classes**. Para definir uma propriedade estática em uma função construtora, **você adiciona a propriedade diretamente à função, em vez de adicioná-lo ao** `prototype`.

```JavaScript
class ClassePessoa {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }

    // - Propriedades estáticas pertencem à classe e não a uma instância específica
    static tipo = "Humano";

    // - Métodos declarados como `static` podem ser chamados diretamente na classe sem precisar instanciar a classe
    static identificar() {
        return `Todos os humanos são do tipo: ${ClassePessoa.tipo}`;
    }

    saudacao() {
        return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
    }
}

function FuncaoConstrutoraPessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

// Propriedade estática.
FuncaoConstrutoraPessoa.tipo = "Humano";

// Método estático.
FuncaoConstrutoraPessoa.identificar = function() {
    return `Todos os humanos são do tipo: ${FuncaoConstrutoraPessoa.tipo}`;
}

FuncaoConstrutoraPessoa.prototype.saudacao = function() {
    return `Olá, meu nome é ${this.nome} e eu tenho ${this.idade} anos.`;
}

const pessoaFuncaoConstrutora = new FuncaoConstrutoraPessoa("Alice", 25);
const pessoaClasse = new ClassePessoa("Alice", 25);

console.log(pessoaClasse.saudacao());               // Output: Olá, meu nome é Alice e eu tenho 25 anos.
console.log(ClassePessoa.identificar());            // Output: Todos os humanos são do tipo: Humano.
console.log(ClassePessoa.tipo);                     // Output: Humano
console.log(pessoaClasse.tipo);                     // Output: undefined (não disponível na instância).
console.log(pessoaClasse.identificar);              // Output: undefined
// Em relação ao log acima, `pessoaClasse` (`ClassePessoa { nome: 'Alice', idade: 25 }`, um objeto da classe ClassePessoa), então `pessoaClasse.identificar()` gera um erro, pois ele não é uma função.
console.log("-----------------------------------------");
console.log(pessoaFuncaoConstrutora.saudacao());    // Output: Olá, meu nome é Alice e eu tenho 25 anos.
console.log(FuncaoConstrutoraPessoa.identificar()); // Output: Todos os humanos são do tipo: Humano.
console.log(FuncaoConstrutoraPessoa.tipo);          // Output: Humano
console.log(pessoaFuncaoConstrutora.tipo);          // Output: undefined (não disponível na instância).
console.log(pessoaFuncaoConstrutora.identificar);   // Output: undefined (não disponível na instância).
// Em relação ao log acima, `pessoaFuncaoConstrutora` (`FuncaoConstrutoraPessoa { nome: 'Alice', idade: 25 }`, um objeto da classe FuncaoConstrutoraPessoa), então `pessoaFuncaoConstrutora.identificar()` gera um erro, pois ele não é uma função.
```

### Quando Usar

- Métodos e propriedades estáticas são frequentemente usados para criar funções utilitárias, constantes, ou para manter contadores e registros que precisam ser compartilhados entre todas as instâncias da classe

### Vantagens e Desvantagens

- **Vantagens:**
    + **Centralização:** facilita a centralização de métodos ou dados comuns que não dependem de uma instância específica
    + **Acesso fácil:** pode ser acessado diretamente pela classe, sem a necessidade de instanciar a classe
- **Desvantagens:**
    + **Não-polimórfico:** não pode ser sobrescrito em instâncias, o que limita o polimorfismo em certos casos
    + **Escopo limitado:** não pode acessar `this` que se refere à instância da classe, já que `this` **dentro de um método estático se refere à própria classe**

## <a id="funcoes-construtoras-x-classes-propriedades-estaticas-encapsuladas"></a>Propriedades Estáticas Encapsuladas

Encapsulamento é uma técnica usada na programação oriendatada a objetos para restringir o acesso direto a alguns dos componentes de um objeto. Em JavaScript, especialmente com a introdução das classes no ECMAScript 2015 (ES6), é possível criar propriedades estáticas e, mais recentemente, com o ES2022, também é possível criar propriedades privadas estáticas.

```JavaScript
// Com Classes (usando o ES2022).
class ClasseContaBancaria {
    // Definindo uma propriedade estática privada.
    static #saldoMinimo = 100;

    constructor(saldoInicial) {
        this.saldo = saldoInicial >= ClasseContaBancaria.#saldoMinimo ? saldoInicial : ClasseContaBancaria.#saldoMinimo;
    }

    depositar(valor) {
        this.saldo += valor;
    }

    getSaldo() {
        return this.saldo;
    }

    // Método estático público para acessar a propriedade privada estática.
    static getSaldoMinimo() {
        return ClasseContaBancaria.#saldoMinimo;
    }
}

function FuncaoConstrutoraContaBancaria(saldoInicial) {
    // Propriedade estática privada simulada.
    const saldoMinimo = 100;

    let saldo = saldoInicial >= saldoMinimo ? saldoInicial : saldoMinimo;

    this.depositar = function(valor) {
        saldo += valor;
    };

    this.getSaldo = function() {
        return saldo;
    };

    FuncaoConstrutoraContaBancaria.getSaldoMinimo = function() {
        return saldoMinimo;
    };
}

const contaClasse = new ClasseContaBancaria(50);
const contaFuncaoConstrutora = new FuncaoConstrutoraContaBancaria(50);

console.log(contaClasse.getSaldo());                          // Output: 100
console.log(ClasseContaBancaria.getSaldoMinimo());            // Output: 100
console.log(contaFuncaoConstrutora.getSaldo());               // Output: 100
console.log(FuncaoConstrutoraContaBancaria.getSaldoMinimo()); // Output: 100
```

## <a id="funcoes-construtoras-x-classes-comparacao-resumida"></a>Comparação Resumida

- **Sintaxe:**
    + Classes têm uma sintaxe mais clara e estruturada
    + Funções construtoras requerem mais configuração e são menos intuitivas
- **Herança:**
    + Classes facilitam a herança com `extends` e `super`
    + Funções construtoras requerem herança manual com `Object.create()` e chamadas de construtor
- **Encapsulamento:**
    + Classes modernas suportam propriedades privadas diretamente
    + Funções construtoras simulam privacidade com **variáveis locais** e **closures**
- **Propriedades Estáticas:**
    + Classes facilitam a criação de propriedades estáticas com `static`
    + Funções construtoras requerem que você adicione a propriedade estática diretamente a ela

# <a id="constructor"></a>`constructor`

- O `constructor` é um método especial para criar e inicializar objetos criados a partir de uma classe
- O método `constructor` é definido usando a **palavra-chave** `constructor`
- Este método é chamado automaticamente quando um novo objeto da classe é instanciado

# <a id="instance-constructor"></a>`instance.constructor`

A **propriedade** `constructor` de uma instância (`instance`) em JavaScript refere-se à função construtora (ou classe) que criou essa instância. Quando um objeto é criado usando uma função construtora, ele herda a propriedade `constructor` do seu protótipo, essa propriedade aponta para a função construtora que criou a instância.

### Exemplos

```JavaScript
function FuncaoConstrutoraAnimal(tipo) {
    this.tipo = tipo;
}

FuncaoConstrutoraAnimal.prototype.fazerSom = function() {
    console.log(`${this.tipo} faz um som.`);
};

function Gato(nome){
    FuncaoConstrutoraAnimal.call(this, "Mamífero");
    this.nome = nome;
}

Gato.prototype = Object.create(FuncaoConstrutoraAnimal.prototype);
Gato.prototype.constructor = Gato;

Gato.prototype.miar = function() {
    console.log(`${this.nome} mia.`);
};

const mia = new Gato("Mia");

mia.fazerSom(); // Output: Mamífero faz um som.
mia.miar();     // Output: Mia mia.

// Importância da Propriedade `constructor`.

console.log(mia.constructor); // Output: [Function Gato]

// - Identificação da Função Construtora
console.log(mia.constructor === Gato);   // Output: true
console.log(mia.constructor === FuncaoConstrutoraAnimal); // Output: false
console.log(mia instanceof Gato);        // Output: true
console.log(mia instanceof FuncaoConstrutoraAnimal);      // Output: true

// - Criando Novas Instâncias Dinamicamente
const novoGato = new mia.constructor("Leo");

console.log(novoGato.nome);            // Output: Leo
console.log(novoGato instanceof Gato); // Output: true

// Classes e Herança.
class ClasseAnimal {
    constructor(nome) {
        this.nome = nome;
    }

    fazemSom() {
        console.log(`${this.nome} faz um som.`);
    }
}

class Cachorro extends ClasseAnimal {
    constructor(nome, raca) {
        super(nome);
        this.raca = raca;
    }

    fazemSom() {
        console.log(`${this.nome} (um ${this.raca}) late.`);
    }
}

const teste1 = new ClasseAnimal();
const teste2 = new Cachorro();

console.log(teste1.constructor); // Output: [class ClasseAnimal]
console.log(teste2.constructor); // Output: [class Cachorro extends ClasseAnimal]

const teste3 = new teste1.constructor();

console.log(teste3.constructor); // Output: [class ClasseAnimal]
```

### Conclusão

A propriedade `constructor` é uma maneira de rastrear a função construtora original de uma instância. Ela é especialmente útil em contextos de herança, onde garantir que a propriedade `constructor` esteja correta pode ajudar a manter o código organizado e compreensível. Ajustar manualmente `constructor` após estabelecer a herança é uma prática comum e importante para garantir a integridade do código.

# <a id="prototype-proto"></a>`.prototype` e `__proto__`

`.prototype` é uma propriedade de uma função construtora (ou classe) que aponta para um objeto. Esse objeto contém propriedades e métodos que serão compartilhados por todas as instâncias criadas pela função construtora. É importante pontuar que esta propriedade não está presente em funções de flecha e que ela é usada principalmente para implementar herança.

`__proto__` é uma propriedade de cada objeto (uma propriedade de instâncias de objeto) que aponta para o protótipo que ele herdou. Em objetos criados por funções construtoras, `__proto__` aponta para o objeto referenciado por `.prototype`.

### Exemplos

```JavaScript
function Animal(tipo) {
    this.tipo = tipo;
}

Animal.prototype.fazerSom = function() {
    console.log(`${this.tipo} faz um som.`);
};

function Gato(nome) {
    Animal.call(this, "Gato");
    this.nome = nome;
}

Gato.prototype = Object.create(Animal.prototype);
Gato.prototype.constructor = Gato;

Gato.prototype.miar = function() {
    console.log(`${this.nome} mia.`);
};

const felix = new Gato("Felix");

felix.fazerSom(); // Output: Gato faz um som.
felix.miar();     // Output: Felix mia.

console.log(Gato.prototype.constructor);          // Output: [Function: Gato]
console.log(Gato.prototype);                      // Output: Animal { constructor: [Function: Gato], miar: [Function (anonymous)] }
console.log(felix.__proto__);                     // Output: Animal { constructor: [Function: Gato], miar: [Function (anonymous)] }
console.log(Gato.prototype === felix.__proto__);  // Output: true

console.log(Animal.prototype.constructor);                   // Output: [Function: Animal]
console.log(Animal.prototype);                               // Output: { fazerSom: [Function anonymous] }
console.log(felix.__proto__.__proto__);                      // Output: { fazerSom: [Function anonymous] }
console.log(Animal.prototype === felix.__proto__.__proto__); // Output: true

console.log(Object.prototype.constructor);                             // Output: [Function: Object]
console.log(Object.prototype);                                         // Output: [Object: null prototype] {}
console.log(felix.__proto__.__proto__.__proto__);                      // Output: [Object: null prototype] {}
console.log(Object.prototype === felix.__proto__.__proto__.__proto__); // Output: true

console.log(felix.constructor);                                // Output: [Function: Gato]
console.log(Gato.prototype.constructor === felix.constructor); // Output: true

console.log(felix instanceof Gato);               // Output: true
console.log(felix instanceof Animal);             // Output: true
console.log(felix instanceof Object);             // Output: true
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
const digaOla = function() {
    console.log("Hello!");
}

// Passagem como argumentos.
function saudacao(funcao) {
    funcao();
}

saudacao(digaOla); // Passa a função como argumento.

// Retorno de funções.
function getSaudacao() {
    return function() {
        console.log("Hello!");
    };
}

const cumprimentador = getSaudacao();

cumprimentador(); // Chama a função retornada.

// Armazenamento em estruturas de dados.
const funcoes = [
    function() { console.log("Hello from function 1"); },
    function() { console.log("Hello from function 2"); }
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

# <a id="estruturação-codigo"></a>Estruturação de Código

### Objeto Simples

Você pode utilizar um objeto simples para agrupar métodos que não precisam de instâncias.

```JavaScript
const Utilidades = {
    metodo1: function() {
        console.log("Método 1.");
    },
    metodo2: function() {
        console.log("Método 2.");
    },
}
```

### Módulos ES6

Outra abordagem é usar módulos ES6, que são especialmente úteis para organizar e reutilizar código em projetos maiores.

```JavaScript
// utilidade.js
export function metodo1() {
    console.log("Método 1.");
}

export function metodo2() {
    console.log("Método 2.");
}

// em outro arquivo.
import { metodo1, metodo2 } from "./utilidades.js"

metodo1(); // Output: Método 1.
metodo2(); // Output: Método 2.
```

### Classe com Métodos Estáticos

Isso é útil se você quiser agrupar métodos relacionados sob um namespace específico.

```JavaScript
class Utilidades {
    static metodo1() {
        console.log("Método 1.");
    }

    static metodo2() {
        console.log("Método 2.");
    }
}

Utilidades.metodo1(); // Output: Método 1.
Utilidades.metodo2(); // Output: Método 2.
```

### Comparação das Abordagens

**Objeto Simples**

- **Simplicidade:** direto e fácil de lembrar
- **Performance:** levemente mais rápido, pois não há sobrecarga de criação de classes
- **Organização:** menos organizado em projetos grandes, pois pode crescer desordenadamente

**Módulo ES6**

- **Modularidade:** excelente para organizar e modularizar código
- **Reusabilidade:** facilita a reutilização de funções em diferentes partes do projeto
- **Namespace:** as funções são exportadas explicitamente, evitando colisões de nomes

**Classe com Métodos Estáticos**

- **Organização:** agrupa métodos relacionados sob um namespace, melhorando a organização
- **Extensibilidade:** pode ser facilmente estendida ou modificada no futuro
- **Clareza:** indica claramente que métodos são agrupados e pertencem a um contexto específico

### Conclusão

A escolha de abordagem depende do contexto e das necessidades do seu projeto. Para simplicidade e eficiência, um objeto simples ou módulo ES6 são geralmente as melhores opções. Se você precisar de mais organização e extensibilidade, utilizar uma classe com métodos estáticos pode ser mais apropriado.