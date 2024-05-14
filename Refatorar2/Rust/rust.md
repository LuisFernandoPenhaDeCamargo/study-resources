### Projeto de Reestruturação

Este arquivo é um resumo que ressalta pontos que eu considerei importantes do livro "The Rust Programming Language".

# Estudar

- Abrir a interface de usuário em determinado diretório pelo terminal (há o utilitário `nautilus`)
- Extrair um arquivo pelo terminal
- Como descartar um commmit
- O que significa fazer um `git pull origin branch`, por exemplo, ele realiza um merge automaticamente?
- Concorrência (conceito)

### Bash

- `mkdir`
- `cd`
- `du`
- `ping`
- `rm`
- `sudo su`
- `vim.tiny` (utilitário)
- `tailf`
- `ifconfig`
- `md5sum`

# ---

# Dúvidas

- `INIT.call_once(|| { CombinedLogger::init(vec![TermLogger::new(LevelFilter::Info, Config::default(), TerminalMode::Mixed, ColorChoice::Auto)]).unwrap(); });`

# Projetos

Quero criar um projeto para praticar paralelimo e assim aprender a utilizar o módulo `std::thread`.

### Sumário

- [Rust](#rust)
- [Traits](#traits)
- [Propriedades de Rust x Classes](#propriedades-rust-x-classes)
- [Composição](#composicao)
- [Lifetime das Variáveis e Referências](#lifetime-variaveis-referencias)
- [`const` (Funções)](#const-funcoes)
- [Métodos de Instância e Métodos Associados](#metodos-instancia-metodos-associados)
- [Operadores](#operadores)
- [Marcadores de Posição](#marcadores-posicao)
- [Empréstimo (Borrow)](#emprestimo-borrow)
- [Pedaços de Código dos Quais Você Pode Absorver Muita Coisa](#pedacos-codigo-quais-voce-pode-absorver-muita-coisa)
- [Crates](#crates)
- [Convenções em Rust](#convencoes-rust)

# <a id = "rust"></a>Rust

Rust é uma linguagem de programação de sistema que se concentra em fornecer segurança de memória sem a necessidade de coletor de lixo. Desenvolvida pela Mozilla, Rust visa fornecer alto desempenho, controle próximo do hardware e prevenção de certas classes de erros, como os relacionados a acesso inválido à memória e condições de corrida.

- Seu gerenciador de pacotes (package manager) é o Cargo
- Seu gerenciador de versões é o rustup
- Seu compilador é o rustc

**Aqui estão alguns dos principais recursos e características de Rust:**

1. **Segurança de memória:** Rust utiliza um sistema de empréstimo de propriedade para garantir que as referências a dados sejam seguras, evitando problemas comuns como referências nulas, vazamentos de memória e acesso inválido
2. **Sem coletor de lixo:** Rust não possui um coletor de lixo. Em vez disso, utiliza um sistema de propriedades que permite rastrear o ciclo de vida dos dados em tempo de compilação, eliminando a necessidade de coletor de lixo durante a execução
3. **Sistema de tipos estáticos:** Rust é uma linguagem de tipagem estática, o que significa que tipos de variáveis são verificados em tempo de compilação, proporcionando segurança e desempenho. Isso também ajuda a evitar muitos erros, que, de outra forma, poderiam ocorrer em tempo de execução
4. **Concorrência sem condições de corrida:** Rust possui um modelo de concorrência que evita condições de corrida por meio de propriedades de empréstimo exclusivo e imutabilidade. Alem de ter suporte para paralelismo
5. **Abstração de alto nível:** apesar de ser uma linguagem de baixo nível, Rust oferece abstrações de alto nível que permitem o desenvolvimento eficiente de software. Possui ferramentas integradas para gerenciamento de pacotes, construção e teste
6. **Sintaxe expressiva:** a sintaxe de Rust é moderna e expressiva, tornando-a agradável de se trabalhar. Ela adota ideias de outras linguagens, mas também traz suas próprias inovações
7. **Comunidade ativa:** Rust tem uma comunidade ativa e crescente. A linguagem é usada em projetos de código aberto e por várias empresas para desenvolvimento de sistemas. Possui tutoriais e documentação disponíveis, ela é conhecida por sua ênfase na inclusão e distribuições de projetos
8. **Ecossistema e ferramentas:** Rust possui um ecossistema crescente de bibliotecas e ferramentas. O gerenciador de pacotes padrão é o Cargo, que facilita a criação, compilação e distribuições de projetos Rust
9. **Uso versátil:** embora Rust seja frequentemente usada para desenvolvimento de sistemas e programação de baixo nível, ela também é adequada para uma variedade de aplicativos, incluindo servidores, ferramentas de linha de comando e até mesmo desenvolvimento web
10. **Integração com outras linguagens:** Rust pode ser facilmente integrada com código escrito em outras linguagens, proporcionando interoperabilidade com C, C++ e outras linguagens
11. **Ferramentas poderosas:** Rust vem com um conjunto robusto de ferramentas, incluindo um gerenciador de pacotes (Cargo) e um sistema de compilação que facilita o desenvolvimento e a distribuição de software

Rust é frequentemente escolhida para desenvolvimento de sistemas operacionais, software de baixo nível, sistemas embarcados, servidores, entre outros. Sua ênfase na segurança e desempenho a torna uma escolha atraente para desenvolvedores que buscam ambas as qualidades em seus projetos.

# <a id = "traits"></a>Traits

Em Rust, um trait é uma maneira de definir métodos que podem ser implementados por tipos (structs, enums, ou até mesmo tipos primitivos). Traits fornecem uma forma de definir comportamentos compartilhados entre diferentes tipos.

A definição de um trait pode incluir métodos, associados ou não a uma implementação padrão. Uma vez que um tipo implementa uma trait, ele herda o comportamento definido por esse trait. Os traits em Rust são semelhantes às interfaces em outras linguagens de programação, mas com algumas diferenças importantes.

**Aqui está um exemplo simples de um trait em Rust:**

```rust
trait Animal {
    // Método associado ao trait.
    fn fazer_som(&self);

    // Método com implementação padrão.
    fn comer(&self) {
        println!("Este animal está comendo.");
    }
}

// Implementação do trait para um tipo específico.
struct Cachorro;

impl Animal for Cachorro {
    fn fazer_som(&self){
        println!("Au, au!");
    }
}

struct Gato;

impl Animal for Gato {
    fn fazer_som(&self) {
        println!("Miau!");
    }
}

fn main() {
    let cachorro = Cachorro;

    cachorro.fazer_som();
    cachorro.comer();

    let gato = Gato;

    gato.fazer_som();
    gato.comer();
}
```

Neste exemplo, o trait `Animal` define dois métodos: `fazer_som()` e `comer()`. A implementação padrão para `comer()` é fornecida no trait, mas pode ser sobrescrita por implementações específicas. As structs `Cachorro` e `Gato` implementam o trait `Animal`, fornecendo suas próprias implementações para os métodos definidos.

Os traits em Rust são poderosos porquem permitem polimorfismo sem herança de tipos. Eles são uma parte fundamental do sistema de tipos de Rust e são usados extensivamente para criar código genérico e flexível.

Observe que se um tipo implementa a trait, ele precisa fornecer uma implementação para todos os métodos declarados na trait (se não houver implementações padrão). Se um método não é relevante para um tipo específico, ainda assim é necessário fornecer uma implementação que pode ser apenas uma implementação vazia, como `fn metodo(&self) {}`.

# <a id = "propriedades-rust-x-classes"></a>Propriedades de Rust x Classes

Classes, structs e traits são conceitos que aparecem em diferentes paradigmas de programação e, portanto, podem ser implementados de maneiras distintas em diferentes linguagens. Vou abordar as diferenças conceituais entre eles e, em seguida, mencionar como esses conceitos são tratados em Rust.

**Classes:**

- **Orientação a objetos (OO):** classes são uma parte fundamental da programação orientada a objetos. Elas encapsulam dados e comportamentos em uma única unidade chamada objeto
- **Herança:** muitas linguagens orientadas a objetos suportam herança, onde uma classe pode herdar atributos e métodos de outra
- **Instâncias e objetos:** você cria instâncias de classes para representar objetos concretos no seu programa
- **Polimorfismo:** classes podem ser usadas para alcançar polimorfismo, onde objetos de diferentes classes podem ser tratados de maneira uniforme

**Rust:**

- **Structs e enums** são usados para definir tipos de dados com campos e variantes
- **Traits:** são usadas para definir contratos que tipos podem implementar
- **Implementações:** tipos em Rust implementam traits explicitamente, declarando quais métodos da trait eles irão fornecer
- **Sem herança direta:** Rust não tem herança direta, mas você pode usar composição e traits para alcançar a funcionalidade desejada
- **Sem polimorfismo de herança:** Rust usa polimorfismo paramétrico e polimorfismo de traços para fornecer flexibilidade em vez do polimorfismo de herança tradicional

Em resumo, em Rust, traits e tipos são usados para expressar comportamentos e contratos, e a composição é preferida sobre a herança. Isso alinha-se com a abordagem geral de Rust para ser seguro e conciso, evitando armadilhas associadas ao gerenciamento de estado mutável compartilhado.

# <a id = "composicao"></a>Composição

Em programação, o tempo "composição" se refere à prática de construir complexidade combinando partes menores e mais simples para formar um todo. É uma abordagem de design que enfatiza a criação de sistemas complexos a partir de componentes modulares e independentes.

Existem dois conceitos principais relacionados à composição em programação:

1. **Composição de objetos (object composition):** em linguagens de programação orientadas a objetos, a composição envolve criar objetos complexos combinando instâncias de objetos menores. Em vez de herdar comportamentos de uma classe base, um objeto pode conter instâncias de outras classes como membros, delegando a responsabilidade para essas instâncias. Isso é muitas vezes preferível à herança, pois permite uma maior flexibilidade e reutilização de código.

**Exemplo em uma linguagem similar a Rust (sem ser Rust):**

```rust
struct Motor {
    // Implementação do motor...
}

struct Carro {
    motor: Motor,
    // Outros membros...
}
```

2. **Composição de funções:** em programação funcional, a composição de funções envolve a criação de funções mais complexas combinando funções mais simples. Isso é alcançado aplicando uma função a um valor e, em seguida, aplicando outra função ao resultado, formando uma "composição" de funções.

**Exemplo em Rust:**

```rust
fn dobro(x: i32) -> i32 {
    x * 2
}

fn quadruplo(x: i32) -> i32 {
    dobro(x) * 2
}
```

A composição é uma prática importante no design de software, pois promove a modularidade, a reutilização de código e facilita a compreensão e manutenção do sistema. Ao quebrar um sistema em partes menores e independentes, é mais fácil entender, testar e modificar cada componente individualmente. Além disso, a composição frequentemente leva a sistemas mais flexíveis e adaptáveis a mudanças.

# <a id = "let-const-variaveis"></a>`let` e `const` (Variáveis)

4. **Tipos de dados:**
    - `let`**:** o tipo da variável pode ser inferido ou explicitamente especificado, e a variável pode ser mutável ou imutável
    - `const`**:** o tipo da constante deve ser especificado explicitamente, e a constante é sempre imutável

**Exemplo:**

```rust
let variavel: i32 = 42; // Tipo explicitamente especificado.
let mut variavel_mutavel = 42; // Tipo inferido.

const CONSTANTE: i32 = 42; // Tipo explicitamente especificado e constante.
```

# <a id = "lifetime-variaveis-referencias"></a>Lifetime das Variáveis e Referências

Em Rust, o conceito de "lifetime" (tempo de vida) refere-se à duração durante a qual uma variável ou referência é válida. As lifetimes são uma parte crucial do sistema de propriedade de Rust, que é projetado para garantir a segurança de memória sem a necessidade de coletor de lixo.

Em muitas linguagens de programação, o coletor de lixo é usado para rastrear e liberar memória automaticamente, eliminando a necessidade de o programador gerenciar manualmente a alocação e desalocação de memória. No entanto, em Rust, o sistema de propriedade permite que o compilador faça verificações de tempo de compilação para garantir que as regras de propriedade sejam seguidas, evitando erros de acesso inválido a memória.

**Lifetimes em Rust:**

1. **Analisando referências:** Rust usa lifetimes para analisar referências e garantir que referências e empréstimos de dados não ultrapassem a vida útil dos dados quais se referem
2. **Sintaxe de lifetimes:** as lifetimes são frequentemente representadas por uma única letra, como `'a` ou `'b`. A escolha da letra é arbitrária, mas a convenção é usar letras curtas e descritivas quando possível, antecedidas de uma aspas simples
3. **Restrições e vínculos:** em funções, structs ou traits que utilizam referências, as lifetimes são usadas para estabelecer vínculos entre os tempos de vida dos parâmetros e referências, garantindo que a referência seja válida durante toda a execução
4. **Tempo de vida estático (static lifetime):** `static` é uma lifetime especial que representa a duração da execução do programa inteiro. Variáveis com tempo de vida estático são acessíveis durante toda a execução do programa

**Exemplo simples:**

```rust
fn encontra_maior<'a>(x: &'a i32, y: &'a i32) -> &'a i32 {
    if x > y {
        x
    } else {
        y
    }
}

fn main() {
    let x = 42;
    let y = 27;
    let maior = encontra_maior(&x, &y);

    println!("O maior número é: {}", maior);
    // `x` e `y` saem de escopo aqui.
}
```

Neste exemplo, a função `encontra_maior()` tem uma lifetime genérica `'a` que indica que a referência retornada terá a mesma duração das referências de entrada `x` e `y`. O compilador verifca se as referências obedecem a essas restrições.

Em Rust, o sistema de propriedade e o conceito de lifetimes garantem a segurança de memória sem a necessidade de um coletor de lixo. A memória é gerenciada por meio de um conjunto de regras estáticas que o compilador verifica durante o tempo de compilação. As lifetimes desempenham um papel fundamental nesse processo.

No exemplo fornecido as referências `&x` e `&y` têm uma lifetime associada a eles, indicando até quando elas são válidas. No caso, a lifetime `'a` é usada para indicar que a referência retornada (`maior`) terá a mesma duração que as referências de entrada.

Quando a função `main()` é concluída, as variáveis `x` e `y` saem do escopo e são automaticamente desalocadas, porque não são propriedades da heap e, portanto, seguem as regras de escopo do Rust. No entanto, as referências (`&x` e `&y`) e a referência retornada (`maior`) não estão alocadas na heap, e sim no stack, porque sua vida útil está vinculada ao escopo mais amplo da função `main()`.

O compilador Rust garante que não há referências inválidas ou dangling references. As lifetimes ajudam a garantir que as referências não sobrevivam mais do que as variáveis às quais se referem. Isso significa que, enquanto a referência `maior` for usada dentro do escopo em que é definida, ela é válida. Quando o escopo se encerra, todas as referências saem de escopo e não há preocupação com a liberação de memória, pois não há alocação dinâmica envolvida.

Explicando de outra maneira, as variáveis `x` e `y` são definidas no escopo da função `main()`, e as referências `&x` e `&y` são passadas como argumentos para `encontra_maior()`. A função `encontra_maior()` retorna uma referência que está vinculada À lifetime dos argumentos passados (`'a`). Portanto, enquanto o escopo da função `main()` estiver ativo, as referências e os valores associados (`x` e `y`) serão válidos.

Quando o escopo da função `main()` é concluído (indicado pelo comentário `// x e y saem do escopo aqui.`. Não foi possível escapar as crases que envolvem `x` e `y` no comentário), as variáveis `x` e `y` saem do escopo e são desalocadas automaticamente. No entanto, as referências (`&x`, `&y` e `maior`) também saem do escopo nesse ponto, e o Rust garante que não haja referências penduradas ou inválidas, evitando assim problemas de segurança de memória.

Observe ainda que quando você não define explicitamente lifetimes em Rust, o compilador ainda aplica regras de lifetimes para garantir a segurança de memória, essas lifetimes podem ser implicitamente inferidas. O compilador tenta inferir automaticamente as lifetimes com base nas regras de escopo e referência, mas há casos em que você precisa especificar explicitamente as lifetimes para informar ao compilador sobre a relação desejada entre os tempos de vida dos argumentos e o tempo de vida do resultado.

Se você não especificar explicitamente lifetimes, Rust fará inferências com base nas regras de escopo. Em muitos casos simples, o compilador pode deduzir corretamente as lifetimes sem intervenção explícita do programador. No entanto, em situações mais complexas ou ambíguas, você pode precisar adicionar anotações de lifetimes para ajudar o compilador a entender suas intenções.

Em Rust, todas as referências e variáveis têm uma lifetime associada, mesmo que essa lifetime não seja explicitamente anotada. A lifetime é uma parte fundamental do sistema de propriedades em Rust, e o compilador utiliza lifetimes para garantir a segurança de memória.

Quando você não especifica explicitamente lifetimes, o compilador faz inferências com base nas regras de escopo e referência. O tempo de vida de uma referência é limitado ao escopo em que ela é criada, e o Rust garante que referências não sobrevivam mais do que as variáveis às quais elas se referem.

**Considerando outro exemplo simples:**

```rust
fn exemplo() -> i32 {
    let x = 42;
    let y = 27;
    let referencia_x: &i32 = &x;
    let referencia_y: &i32 = &y;

    if referencia_x > referencia_y {
        *referencia_x
    } else {
        *referencia_y
    }
} // referencia_x e referencia_y saem do escopo aqui.
```

Neste exemplo, as referências `referencia_x` e `referencia_y` têm o mesmo tempo de vida que as variáveis `x` e `y`, porque as referências são criadas dentro do escopo onde as variáveis existem.

Portanto, mesmo que você não veja explicitamente anotações do lifetimes, o Rust está trabalhando nos bastidores para gerenciar e garantir a correta utilização de lifetimes para manter a segurança de memória.

# <a id = "const-funcoes"></a>`const` (Funções)

Uma função constante é uma função que pode ser avaliada em tempo de compilação.

Ao declarar uma função como `const fn`, você está **indicando que deseja que essa função seja avaliada em tempo de compilação sempre que possível. No entanto, quando chamada em contextos normais, ela se comportará da mesma forma que uma função regular**, e as restrições associadas a funções constantes se aplicarão apenas quando chamadas em um contexto constante.

Contextos constantes são aqueles que podem ser tratados em tempo de compilação, computações que podem ser resolvidas em tempo de compilação. Isso implica, por exemplo, em restrições no tipo dos argumentos e no tipo do retorno. Um exemplo mais palpável sobre violação de um contexto constante é que nele, não é aceitável escrever um gerador de números randômicos.

# <a id = "metodos-instancia-metodos-associados"></a>Métodos de Instância e Métodos Associados

Uma maneira comum de identificar se um método é associado à instância (também conhecido como método de instância) ou associado ao tipo (método estático ou associado) em Rust é verificar a presença de `self` como parâmetro do método. Métodos que têm `&self`, `&mut self` ou `self` como primeiro parâmetro são métodos de instância, enquanto métodos associados não têm um parâmetro que representa a instância e geralmente são declarados com `Self`.

**Aqui está um exemplo que ilustra a diferença:**

```rust
#[derive(Debug)]
struct Exemplo {
    data: i32,
}

impl Exemplo {
    // Método de instância com &self como parâmetro.
    fn metodo_de_instancia(&self) {
        println!("Método de instância invocado. Data: {}", self.data);
    }

    fn metodo_associado() {
        println!("Método associado invocado.");
    }

    fn metodo_associado_com_parametros(valor: i32) -> Self {
        println!("Método associado invocado com parâmetros: {}", valor);

        Exemplo { data: valor}
    }
}

fn main() {
    let instancia = Exemplo { data: 42 };

    // Chama o método da instância.
    instancia.metodo_de_instancia();

    // Chama o método associado (estático).
    // Notação: `<Tipo>::<método>()`
    Exemplo::metodo_associado();

    // Chama o método associado (estático) com parâmetro.
    let nova_instancia = Exemplo::metodo_associado_com_parametros(100);

    println!("Nova instância: {:?}", nova_instancia);
}
```

Neste exemplo, `metodo_de_instancia()` é um método de instância porque recebe `&self` como parâmetro, e `metodo_associado()` é um método associado porque **não recebe nenhum parâmetro representando a instância**. O método `metodo_associado_com_parametros()` é um método associado que tem um parâmetro e retorna uma nova instância de `Exemplo`. Note que ele usa `Self` para **referenciar o tipo ao qual pertence, mas não recebe uma instância específica como parâmetro**.

Em métodos associados, não há um parâmetro que represente uma instância específica da struct ou enum. Em vez disso, eles podem ter outros tipos de parâmetros, como parâmetros regulares ou parâmetros relacionados ao tipo em si. O tipo ao qual o método associado pertence é geralmente referenciado usando `Self` na declaração do método.

Então, ao analisar a declaração de um método, você pode observar a presença de `&self`, `&mut self` ou `self` como indicativo de que é um método de instância, enquanto métodos associados não tem esse parâmetro (parâmetros que representam uma instância específica do tipo).

# <a id = "operadores"></a>Operadores

Em programação, operadores são símbolos ou palavras reservadas que representam operações a serem realizadas sobre variáveis ou valores. Eles são uma parte fundamental das linguagens de programação e são utilizados para realizar diversas operações, como aritmética, lógica, comparação, atribuição, entre outras. Os operadores são aplicados a operandos para produzir um resultado.

**Aqui estão alguns tipos comuns de operadores:**

1. **Aritméticos:** realizam operações matemáticas básicas, como adição, subtração, multiplicação e divisão

```rust
let soma = 5 + 3; // Adição.
let subtracao = 7 - 2; // Subtração.
let multiplicacao = 4 * 6; // Multiplicação.
let divisao = 8 / 2; // Divisão.
```

2. **Comparação:** comparação de valores para verificar igualdade, desigualdade, maior, menor, etc.

```rust
let igual = 5 == 5; // Igualdade.
let diferente = 3 != 7; // Desigualdade.
let maior_que = 8 > 4; // Maior que.
let menor_que = 2 < 6; // Menor que.
```

3. **Lógicos:** realizam operações lógicas como AND, OR e NOT

```rust
let and = true && false; // AND lógico.
let or = true || false; // OR lógico.
let not = !true; // NOT lógico.
```

4. **Atribuição:** atribuem valores a variáveis

```rust
let x = 10; // Atribuição simples.
let mut y = 5; // Atribuição com mutabilidade.
y += 3; // Atribuição composta (y = y + 3).
```

5. **Bit a bit:** realizam operações bit a bit em número inteiros

```rust
let bitwise_and = 0b1010 & 0b1100; // AND bit a bit.
let bitwise_or = 0b1010 | 0b1100; // OR bit a bit.
let bitwise_xor = 0b1010 ^ 0b1100; // XOR bit a bit.
```

Esses são apenas alguns exemplos e as linguagens de programação podem ter diferentes conjuntos de operadores e comportamentos associados a eles. Operadores são fundamentais para expressar lógica e realizar cálculos em programas de computador.

### Sumário

- [`&`](#ecomercial)
    + Referência Compartilhada
    + Referência Mutável
    + Desreferenciando Uma Referência
    + Transferência de Propriedade ou Movimentação
- [`*`](#asterisco)
    + Desreferenciamento
    + Multiplicação

## <a id = "ecomercial"></a>`&`

Em Rust, o símbolo `&` é chamado de operador de referência e é usado para criar referências a valores. Ele não é considerado uma palavra reservada, mas sim um operador que tem um significado específico na linguagem.

Uma referência é uma maneira de se referir a um valor sem possuir a propriedade (ownership) dele. Em outras palavras, quando você usa `&` antes de uma variável ou expressão, você está criando uma referência a esse valor, e você pode usá-la para acessar o valor sem mover a propriedade.

Existem dois tipos de referências em Rust:

1. **Referências compartilhadas (**`&T`**):** denotadas pelo símbolo `&`, essas referências permitem que muitas partes do código tenham acesso somente leitura ao valor referenciado. Elas não podem modificar o valor original.

**Exemplo:**

```rust
fn main() {
    let numero = 42;
    let referencia = &numero; // Criando uma referência compartilhada.

    println!("Valor de numero: {}", numero);
    println!("Valor referenciado: {}", referencia);
}
```

2. **Referências mutáveis (**`&mut T`**):** denotadas pelo símbolo `&mut`, essas referências concedem acesso de leitura e escrita ao valores referenciado. No entanto, apenas uma referência mutável por vez pode existir em um determinado escopo, evitando problemas de concorrência.

**Exemplo:**

```rust
fn main() {
    let mut numero = 42;
    let referencia_mutavel = &mut numero; // Criando uma referência mutável.
    *referencia_mutavel += 1; // Modificando o valor referenciado.

    // println!("Valor modificado: {}", numero); // Você não pode imprimir `numero` antes de `referencia_mutavel`, pois o acesso a `numero` está bloqueado por conta do empréstimo.
    println!("Valor modificado: {}", referencia_mutavel);
}
```

Além disso, você pode também desreferenciar uma referência. Isso significa acessar o valor real ao qual a referência aponta. Isso é feito usando `*`:

```rust
fn main() {
    let numero = 42;
    let referencia = &numero; // Criando uma referência compartilhada.
    
    // Desreferenciando a referência para obter o valor real.
    let valor_real = *referencia;

    println!("Valor real: {}", numero);
    println!("Valor real: {}", referencia);
    println!("Valor real: {}", valor_real);
}
```

Desreferenciar uma referência em Rust significa acessar o valor real ao qual a referência aponta. Uma referência em Rust é uma maneira de se referir a um valor sem possuir a propriedade (onwership) dele. Para acessar o valor real, você precisa desreferenciar a referência.

No exemplo acima, `referencia` é uma referência compartilhada para o valor `42`. Ao usar `*referencia`, você está desreferenciando a referência e obtendo o valor real `42`. O operador `*` é usado para acessar o conteúdo apontado pela referência.

É importante notar que a desreferenciação é uma operação fundamental em Rust, especialmente ao trabalhar com referências. Ela permite que você acesse e manipule o valor real, mas não transfere a propriedade do valor. Isso é crucial para o sistema de propriedade (ownership) de Rust, que visa garantir a segurança do acesso concorrente aos dados.

É importante notar que, ao criar uma referência, você não está movendo a propriedade do valor. Isso significa que o valor original permanece válido após a criação da referência. Além disso, Rust possui regras rigorosas de empréstimos (borrowing) que garantem a segurança do acesso concorrente aos dados.

Sobre a movimentação da propriedade do valor, em Rust, quando você usa um valor sem ser por referência, você está movendo a propriedade desse valor para o novo local. Isso é conhecido como "transferência de propriedade" ou "movimentação" (ownership).

A movimentação é uma das características fundamentais de Rust para garantir a segurança e evitar problemas de acesso concorrente a dados. Aqui estão os princípios básicos:

1. **Movimentação de propriedade:** quando um valor é atribuído a outra variável ou passado como argumento para um função, a propriedade desse valor é transferida para o novo local. Isso significa que, após a movimentação, o valor original não pode ser mais acessado na localização anterior.

**Exemplo:**

```rust
fn main() {
    let original = String::from("Olá");
    let outra_variavel = original; // Movendo a propriedade para outra_variavel.
    // A partir deste ponto, original não é mais válido e não pode ser usado.

    println!("{}", outra_variavel);
}
```

2. **Borrowing (empréstimo) e referências:** se você precisa usar um valor sem movê-lo você pode criar uma referência a ele usando `&` para referências compartilhadas ou `&mut` para referências mutáveis, como visto acima.

A movimentação é uma parte fundamental do sistema de propriedade (ownership) em Rust, e ela garante que cada valor tenha tenha um único proprietário em um determinado momento. Isso ajuda a prevenir erros de acesso concorrente e elimina a necessidade de um coletor de lixo, pois o tempo de vida dos valores pe determinado em tempo de compilação.

Ainda sobre a movimentação de propriedades, considere que no exemplo fornecido em "Movimentação de propriedade", fosse utilizado o tipo `i32` ao invés de uma `String`. O código funcionaria porque os valores em Rust têm o tipo de cópia (copy) quando são tipos primitivos como `i32`. Em Rust, tipos que implementam o trait `Copy` têm um comportamento especial em relação à movimentação de propriedade (ownership).

Quando você atribui `original` a `outra_variavel`, em vez de mover a propriedade de `original` para `outra_variavel`, ocorre uma cópia direta do valor. Isso ocorre porque tipos que implementam `Copy` são automaticamente copiados quando atribuídos a uma nova variável.

O `i32` é um exemplo de tipo que implementa `Copy`, o que significa que cada atribuição desse tipo resultará em uma cópia direta do valor, sem a necessidade de desreferenciar ou criar referências.

Por outro lado, se `original` fosse de um tipo que não implementa `Copy`, como é o caso de `String` ou uma estrutura definida pelo usuário, a movimentação de propriedade (ownership) ocorre, e você não pode imprimir `original` após a atribuição.

Em resumo, o código funcionaria para `i32` porque ele implementa `Copy`, permitindo que o valor seja copiado diretamente ao invés de ser movido. Esse comportamento é específico para tipos que implementam `Copy`.

## <a id = "asterisco"></a>`*`

O operador `*` em Rust é usado para duas finalidades principais, dependendo do contexto em que é aplicado:

1. **Desreferenciamento:** quando usado antes de um ponteiro, o operador `*` é utilizado para desreferenciar o ponteiro, ou seja, obter o valor ao qual o ponteiro aponta. Isso é semelhante ao conceito de desreferenciamento em outras linguagens de programação

**Exemplo:**

```rust
let numero = 42;
let ponteiro_para_numero = &numero;

// Desreferenciamento usando o operador `*``.
let valor = *ponteiro_para_numero;

println!("Valor desreferenciado: {}", valor);
```

2. **Multiplicação:** quando usado como um operador de multiplicação, o `*` realiza a multiplicação entre dois valores

**Exemplo:**

```rust
let multiplicando = 5;
let multiplicador = 3;

// Multiplicação usando o operador `*`.
let resultado = multiplicando * multiplicador;

println!("Resultado da multiplicação: {}", resultado);
```

Em resumo, o operador `*` em Rust tem duas funções principais: desreferenciamento quando aplicado a ponteiros e multiplicação quando usado como um operador aritmético. O comportamento exato depende do contexto em que o operador é utilizado.

# <a id = "emprestimo-borrow"></a>Empréstimo (Borrow)

A condição de empréstimo é específica de referências mutáveis (`&mut`). O Rust impõe regras rigorosas para garantir a segurança e previnir erros relacionados à mutabilidade concorrente e ao acesso simultâneo a dados mutáveis.

A principais regras que se aplicam a referências mutáveis é que você não pode ter mais de uma referência mutável no mesmo escopo, e que você não pode ter, simultaneamente, uma referência mutável e uma referência imutável à mesma variável, no mesmo escopo. Esta última regra é conhecida como **regra de empréstimo** no Rust.

Portanto, se você tem uma referência mutável, ela é considerada como tendo a "propriedade exclusiva" da variável referenciada durante o tempo de vida da referência. Isso impede que outras referências (sejam mutáveis ou imutáveis) sejam criadas simultaneamente.

Quando você tem uma referência mutável para uma variável, ela efetivamente "bloqueia" o acesso direto à variável, permitindo apenas que a referência mutável acesse e modifique o valor enquanto a referência mutável está em andamento (enquanto o empréstimo está em andamento). Isso é uma parte essencial da garantia de segurança de Rust em relação a mutabilidade concorrente.

Em Rust, o término de um empréstimo ocorre em um dos seguintes cenários:

1. **Fim do escopo:** o empréstimo termina automaticamente quando o escopo no qual a variável que recebe a atribuição existe, chega ao fim. Isso é controlado pelo tempo de vida (lifetimes) e pela saída de um bloco ou função

**Exemplo:**

```rust
fn main() {
    let mut numero = 42;

    {
        let referencia_mutavel = &mut numero; // Empréstimo mutável começa.
        *referencia_mutavel += 1;
    } // Empréstimo mutável termina ao sair do bloco.

    // Agora você pode acessar `numero` novamente.
    println!("Valor modificado: {}", numero);
    // Observe que por `referencia_mutavel` estar em outro escopo, ela não pode ser impressa aqui.
}
```

2. **Fim de uma função ou método:** se uma referência mutável é passada como argumento para uma função ou método, o empréstimo mutável termina quando a função ou método retorna

**Exemplo:**

```rust
fn main() {
    let mut numero = 42;
    let referencia_mutavel = &mut numero; // Criando uma referência mutável.
    *referencia_mutavel += 1; // Modificando o valor referenciado.

    println!("Valor de `referencia_mutavel`: {}", referencia_mutavel); // Empréstimo mutável termina aqui.
    println!("Valor de `numero`: {}", numero);
}
```

Nessas situações, o compilador Rust garante que o empréstimo seja respeitado, evitando o acesso simultâneo mutável e imutável à mesma variável, o que poderia levar a problemas de segurança. Essas regras são parte da ênfase de Rust na segurança de memória e prevenção de data races.

# <a id = "marcadores-posicao"></a>Marcadores de Posição

**Anotação:** seria interessante este conteúdo ser posicionado após os conceitos de **macros**, **traços** e **tipos**.

No contexto de Rust, `{}` e `{:?}` são marcadores de posição usados em strings de formato para especificar onde os argumentos devem ser inseridos ao utilizar macros de formatação como `println!` ou `format!`. Ambos são usados para diferentes propósitos.

1. `{}` **(formato padrão):** é utilizado para imprimir valores de tipos que implementam o traço `std::fmt::Display`. Este marcador de posição tenta formatar o valor da melhor maneira possível para ser legível por humanos.

**Exemplo:**

```rust
let numero = 42;
println!("O número é: {}", numero);
```

Neste exemplo, `{}` será substituído pelo valor da variável `numero` formatado de acordo com a implementação de `Display` para o tipo `i32`.

2. `{:?}` **(Debug):** é utilizado para imprimir valores de tipos que implementam o traço `std::fmt::Debug`. Este marcador de posição produz uma representação mais detalhada e geralmente destinada a fins de depuração.

**Exemplo:**

```rust
let vetor = vec![1, 2, 3];
println!("O vetor é: {:?}", vetor);
```

Neste exemplo, `{:?}` será substituído pela representação de depuração do vetor, que pode incluir informações adicionais úteis para entender a estrutura iterna do valor.

Em Resumo, `{}` é mais apropriado para a saída formatada para usuários finais, enquanto `{:?}` é frequentemente usado para fins de depuração, exibindo informações mais detalhadas sobre os valores. Esses marcadores de posição são comumente usados em macros de formatação como `prinln!`, `format!`, `panic!` e outros.

# <a id = "pedacos-codigo-quais-voce-pode-absorver-muita-coisa"></a>Pedaços de Código dos Quais Você Pode Absorver Muita Coisa

Esta seção trata de códigos dos quais você pode absorver muitos conceitos ou são exemplos extremamente inteligentes (ou possuem uma lógica duvidosa).

### Sumário

- [`pub fn call_once<F>(&self, f: F) where F: FnOnce();`](#pub-fn-parametro-funcao-metodo-instancia-objeto-funcao-trait)

## <a id = "pub-fn-parametro-funcao-metodo-instancia-objeto-funcao-trait"></a>`pub fn call_once<F>(&self, f: F) where F: FnOnce();`

Analise a assinatura da função abaixo:

```rust
pub fn call_once<F>(&self, f : F) where F: FnOnce();
```

Aqui está o que cada parte significa:

- `pub`**:** indica que a função é pública e pode ser acessada de fora do módulo em que está definida
- `fn`**:** indica a declaração de uma função, cujo nome, neste caso, é `call_once()`
- `(&self, f : F)`**:** parâmetros formais da função `call_once()`

+ `&self`**:** uma **referência imutável** (`&`) para a instância da estrutura à qual função pertence. Em Rust, `self` é um padrão para representar a instância atual. Quando você tem um método com `&self` como seu primeiro parâmetro, isso indica que é um método de instância e deve ser chamado em uma instância específica do tipo a qual pertence. Em Rust, a convenção é chamar esse tipo de método com a notação `objeto.metodo()`

No contexto do método `call_once()`, você precisaria criar uma instância da estrutura `Once` e, em seguida, chamar o método `call_once()` nessa instância usando a notação de ponto (`objeto.metodo()`). A função `call_once()` é então chamada na instância específica da `Once`.

+ `f: F`**:** é o segundo parâmetro do tipo genérico `F`

- `where F: FnOnce()`**:** uma cláusula de restrição (`where`) que específica uma restrição sobre o tipo genérico `F`. Diz que `F` deve implementar o trait `FnOnce`, que é um trait associado a funções que podem ser chamadas apenas uma vez (o `Once` é projetado para executar algo uma vez, portanto, espera-se que a cláusula `FnOnce` seja satisfeita)
- `call_once<F>()`**:** aqui, `F` é um tipo genérico. O uso do tipo genérico permite que a função `call_once()` aceite diferentes tipos de argumentos para o parâmetro `f`. O tipo genérico `F` é um tipo de espaço reservado para um tipo que será determinado no momento em que a função for chamada. Exemplo:

```rust
minha_chamada_unica.call_once(|| {
    // Bloco de código a ser executado apenas uma vez.
    println!("Executando uma vez!");
});
```

Aqui, `|| { ... }` é uma cláusula de fechamento (closure) que é do tipo `F`. O compilador Rust infere o tipo de `F` com base no tipo de cláusula de fechamento fornecida.

Então, o tipo genérico `F` é uma forma de tornar a função `call_once()` flexível, permitindo que ela seja usada com diferentes tipos de cláusulas de fechamento ou funções que atendam ao requisito `FnOnce`. Isso é útil porque `FnOnce` é um trait que representa coisas que podem ser chamadas uma vez (uma cláusula de fechamento é um exemplo).

Portanto, o tipo genérico `F` permite que a função `call_once()` seja parametrizada com diferentes tipos de cláusulas de fechamento ou funções, tornado-a mais genérica e reutilizável.

Sobre a trait `FnOnce`, ela é **uma trait para funções e não para structs**. Em Rust, as funções também têm tipos e podem implementar traits.

A trait `FnOnce` é uma das três traits relacionadas a funções em Rust. As outras duas são `FnMut` e `Fn`. Aqui está uma breve explicação sobre cada uma:

1. `FnOnce`**:**
    - Representa funções que podem ser chamadas uma vez
    - Essas funções consomem a propriedade (ownership) de seus argumentos
    - Geralmente é usada quando a função precisa possuir o que ela recebe
2. `FnMut`**:**
    - Representa funções que podem ser chamadas mutavelmente
    - Essas funções podem modificar o estado do ambiente onde são chamadas
    - Geralmente usada quando a função precisa mutar, mas não necessariamente possuir, seus argumentos
3. `Fn`**:**
    - Representa funções que podem ser chamadas de forma imutável
    - Essas funções não modificam o estado do ambiente onde são chamadas
    - Geralmente usada quando a função não precisa nem mutar, nem possuir seus argumentos

A escolha entre `FnOnce`, `FnMut`, e `Fn` depende de como você deseja que a função interaja com seus argumentos e com o ambiente onde é chamada.

Quando você passa uma cláusula de fechamento como `|| { ... }` para a função `call_once()`, está efetivamente fornecendo algo que implementa `FnOnce`. A trait `FnOnce` é um mecanismo poderoso que permite que o Rust lide de maneira segura com funções que consomem a propriedade de seus argumentos.

Ainda sobre `call_once<F>()`, o tipo genérico `F` na assinatura da função `call_once()` representa o **tipo da função** que você passará como argumento quando chamar a função `call_once()`.

Ao usar o tipo genérico `F`, a função `call_once()` se torna flexível e pode aceitar diferentes tipos de funções ou cláusulas de fechamento, desde que essas funções ou cláusulas de fechamento implementem a trait `FnOnce`.

Quando você chama a função `call_once()` e fornece uma cláusula de fechamento como argumento, o tipo `F` é inferido automaticamente pelo compilador com base na assinatura da cláusula de fechamento, isso é possível porque as cláusulas de fechamento em Rust implementam automaticamente as traits `FnOnce`, `FnMut`, ou `Fn`m dependendo de como elas acessam as variáveis do ambiente em que são definidas.

A flexibilidade oferecida pelo tipo genérico `F` permite que `call_once` seja usada com diferentes tipos de funções ou cláusulas de fechamento, tornando o código mais genérico e reutilizável.

# <a id = "crates"></a>Crates

**Anotação:** para pesquisar sobre uma crate:

```plaintext
Contexto: Rust
`crate nome_da_crate`
```

Para pesquisar sobre um conteúdo específico da crate:

```plaintext
Contexto: Rust
`crate::conteudo`
```

Todo método ou função devem ter catalogado a sua assinatura. Template para documentação de funções da Rust:

- "**Definição resumida:**" (a formatação deste item está diferente do padrão para facilitar a sua compreensão)
- "**Assinatura da função:**" (a formatação deste item está diferente do padrão para facilitar a sua compreensão)
- Anotações adicionais

Em Rust, uma "crate" é a unidade de compilação do código. Ela pode ser comparada a bibliotecas ou pacotes em outras linguagens de programação. Uma crate pode conter módulos, tipos, funções e outros itens relacionados, e ela é a unidade básica de compartilhamento de código em Rust.

Existem dois tipos principais de crates em Rust:

1. **Biblioteca (library crate):** uma crate que é destinada a ser usada por outros programas. Ela fornece funcionalidades encapsuladas e pode ser incluída como dependência em outros projetos Rust. Bibliotecas geralmente contêm módulos, tipos, funções e outras abstrações que podem ser reutilizadas
2. **Aplicação (binary crate):** uma crate que é destinada a ser executada como um programa independente. Uma aplicação geralmente contém uma função `main()` e é compilada em um executável que pode ser iniciado diretamente

As crates em Rust são organizadas em um sistema de gerenciamento de pacotes chamado Cargo. Cargo permite que você crie, gerencie e compartilhe crates facilmente. Quando você cria um novo projeto Rust usando o Cargo, ele cria automaticamente uma crate para o seu projeto.

A estrutura básica de um projeto Rust gerenciado pelo Cargo geralmente inclui um arquivo **Cargo.toml** que especifica as configurações do projeto, e os diretórios **src** para o código-fonte e **target** para os artefatos compilados. O código-fonte é organizado em módulo dentro do diretório **src**.

### Sumário

- [`std`](#std)
- [`serde`](#serde)

# <a id = "std"></a>`std`

Em Rust, `std` refere-se a biblioteca padrão (standard library) da linguagem. A biblioteca padrão é uma parte integrante do ecossistema Rust e fornece funcionalidades essenciais que são usadas comumente em programas Rust.

A `std` inclui módulos que oferecem suporte a operações básicas, manipulação de strings, coleções, entrada/saída, concorrência, e muito mais. Ela é parte integrante do ambiente de execução Rust e geralmente é automaticamente incluída em qualquer programa Rust.

Ao escrever código Rust, você frequentemente verá imports que começam com `std::`, por exemplo:

```rust
use std::collections::HashMap;
use std::io::{self, Read};
```

Neste exemplo, estamos usando parte da `std` para importar `HashMap` do módulo `collections` e `io` e `Read` do módulo `io`. Isso permite que usemos essas funcionalidades diretamente em nosso código.

Observando que você não precisa importar explicitamente a biblioteca padrão `std`, pois ela é automaticamente incluída em todos os programas Rust. Portanto, você pode usar a maioria dos tipos e funções fornecidos pela `std` sem precisar de uma declaração de importação explícita (há partes da crate que precisam ser importadas explicitamente pois não estão inclusas na importação implícita).

Lembre-se de que, enquanto alguns itens podem estar disponíveis sem uma importação explícita, é uma prática comum e boa legibilidade do código importar explicitamente os itens que você está usando. Isso torna mais claro para os leitores do código de onde vêm esses itens e facilita a compreensão do código.

O sistema de gerenciamento de pacotes Rust, chamado Cargo, também faz parte do ecossistema Rust e é frequentemente usado para baixar, compilar e gerenciar dependênciasm incluindo a `std`.

```rust
fn main() {
    // Exemplo de uso da biblioteca std.
    let texto = "Olá, Rust!";

    println!("{}", texto);
}
```

Neste exemplo, a função `println!()` é uma macro fornecida pela biblioteca `std`, que é usada para imprimir texto no console. A string `Olá, Rust!` é uma string literal e é parte dos tipos básicos fornecidos pela `std`.

Em resumo, a `std` é essencial para o desenvolvimento em Rust e oferece uma ampla variedade de ferramentas e funcionalidades para desenvolvedores.

### Sumário

- [`std::println!`](#std-println)\
    + `std::print!`
- [`std::time` (Módulo)](#std-time)
- [`std::time::Duration (`struct`)`](#std-time-duration)
- [`std::time::Duration::from_secs()`](#std-time-Duration-from_secs)
- [`std::fs` (Módulo)](#std-fs)
- [`std::thread` (Módulo)](#std-thread)
- [`std::thread::sleep()`](#std-thread-sleep)
- [`std::sync` (Módulo)](#std-sync)
- [`std::sync::Once` (`struct`)](#std-sync-once)
- [`std::sync::Once::new()`](#std-sync-once-new)
- [`std::sync::Once::call_once()`](#std-sync-once-call_once)

## <a id = "std-println"></a>`std::println!`

`println!` é uma macro em Rust que é usada para imprimir texto na saída padrão (normalmente, a tela do console). Essa macro é uma forma conveniente de formatar e exibir mensagens no console, sendo especialmente útil para depuração e exibição de informações durante a execução do programa.

A sintaxe básica da macro `println!` é semelhante à da função `println` em linguagens como C e Java, mas o `!` no final indica que é uma macro, não uma função. Aqui está um exemplo simples de uso:

```rust
fn main() {
    let nome = "Mundo";

    println!("Olá, {}!", nome);
}
```

Neste exemplo, "`Olá, {}!`" é uma string de formato, e `{}` é um marcador de posição que será substituído pelo valor da variável `nome` quando a string for impressa. O resultado seria "Olá, Mundo!".

Você também pode usar a formatação mais avançada, semelhante à macro `format!`, dentro da macro `println!`:

```rust
fn main() {
    let nome = "Mundo";
    let idade = 30;

    println!("Olá, {}! Você tem {} anos.", nome, idade);
}
```

A macro `println!` automaticamente adiciona uma quebra de linha no final da saída, enquanto `print!` (sem o "ln") não adiciona.

```rust
fn main() {
    let nome = "Mundo";

    print!("Olá, {}!", nome); // Sem quebra de linha no final.
    println!("Esta linha terá início ao lado da linha acima (sem espaço em branco a esquerda)."); // Com quebra de linha no final.
}
```

Essa macro é muito útil para depuração e feedback interativo durante o desenvolvimento em programas em Rust.

## <a id = "std-time"></a>`std::time` (Módulo)

`std::time` é um módulo em Rust que fornece tipos e funções relacionados ao tempo. ele inclui tipos como `Duration` (duração) e `SystemTime` (tempo de sistema), bem como várias funções para operações relacionadas ao tempo. Sua funcionalidade está disponível por padrão sem a necessidade de uma importação explicíta.

**Aqui estão alguns elementos principais do módulo** `std::time`**:**

1. `Duration`**:** representa uma duração de tempo entre dois pontos. Pode ser usado para medir intervalos de tempo

**Exemplo:**

```rust
use std::time::Duration;

let cinco_segundos = Duration::from_secs(5);
```

2. `SystemTime`**:** representa um ponto específico no tempo, geralmente relacionado ao relógio do sistema. Pode ser usado para comparar diferentes momentos no tempo

**Exemplo:**

```rust
use std::time::{SystemTime, Duration};

let agora = SystemTime::now();
let alguns_segundos_depois = agora + Duration::from_secs(10);
```

3. **Funções relacionadas ao tempo:** o módulo também inclui várias funções úteis relacionadas ao tempo, como `System::now()` para obter o tempo atual do sistema

**Exemplo:**

```rust
use std::time::SystemTime;

let agora = SystemTime::now();
```

Essas são apenas alguns exemplos, e o módulo `std::time` fornece mais funcionalidades relacionadas ao tempo. Esses tipos são frequentemente utilizados em programação para lidar com medições de tempo, aguardar por intervalos específicos e outras operações relacionadas ao tempo.

## <a id = "std-time-duration">`std::time::Duration` (`struct`)

`std::time::Duration` é uma estrutura em Rust que representa uma duração de tempo, ou seja, um intervalo entre dois pontos no tempo. Essa estrutura é parte da biblioteca padrão de Rust (`std`) e é comumente usada para expressar períodos de tempo em operações como espera (sleep), temporização e outras manipulações de tempo.

**A assinatura da estrutura** `Duration` **é a seguinte:**

```rust
use std::time::Duration;

let duration = Duration::new(seconds: u64, nanoseconds: u32);
```

- `seconds`**:** número de segundos na duração
- `nanoseconds`**:** número de nanossegundos adicionados à duração

Você pode criar uma instância de `Duration` usando o método `new()` ou outros métodos fornecidos, como `from_secs()` e `from_nanos()`. Aqui estão alguns exemplos:

```rust
use std::time::Duration;

// Criar uma Duration de 5 segundos.
let cinco_segundos = Duration::new(5, 0);

// Criar uma Duration de 2.5 segundos usando `from_secs_f64()`.
let dois_segundos_e_meio = Duration::from_secs_f64(2.5);

// Criar uma Duration de 1 segundo usando `from_secs()`.
let um_segundo = Duration::from_secs(1);

// Criar uma Duration de 500 milissegundos usando `from_millis()`.
let meio_segundo = Duration::from_millis(500);
```

Você pode realizar várias operações com `Duration`, como adição, subtração e comparação. Aqui estão alguns exemplos:

```rust
use std::time::Duration;

let duration1 = Duration::new(5, 0);
let duration2 = Duration::from_secs(3);

// Adição de durações.
let soma_duration = duration1 + duration2;

// Subtração de durações.
let diferenca_duration = duration1 - duration2;

// Comparação de durações.
if duration1 > duration2 {
    println!("duration1 é maior que duration2.");
}
```

`Duration` é frequentemente usada em conjunto com funções relacionadas ao tempo, como `std::thread::sleep()` para pausar a execução de um programa por um determinado período:

```rust
use std::time::Duration;
use std::thread;

fn main() {
    println!("Início do programa.");

    // Pausa a execução por 2 segundos.
    thread::sleep(Duration::from_secs(2));

    println!("Fim do programa após pausa de 2 segundos.");
}
```

Essa é uma introdução básica à utilização da estrutura `std::time::Duration` em Rust. Essa estrutura é muito útil para representar e manipular intervalos de tempo no contexto de programação.

## <a id = "std-time-Duration-from_secs"></a>`std::time::Duration::from_secs()`

**Definição resumida:** cria uma nova `Duration` a partir do número especificado em segundos inteiros.

**Assinatura da função:**

```rust
pub const fn from_secs(secs: u64) -> Duration
```

**Exemplo de uso:**

```rust
use std::time::Duration;

fn main() {
    // Criando uma Duration de 5 segundos.
    let cinco_segundos = Duration::from_secs(5);

    // Imprimindo a representação textual da Duration.
    println!("Cinco segundos: {:?}", cinco_segundos);
}
```

## <a id = "std-fs"></a>`std::fs` (Módulo)

`std::fs` é um módulo na biblioteca padrão de Rust que fornece funcionalidades para operações de sistema de arquivos (file system). Ele faz parte do conjunto de bibliotecas padrão que oferecem suporte a operações de entrada/saída, manipulação de arquivos e diretórios, entre outras tarefas relacionadas a sistema de arquivos.

Dentro do módulo `std::fs`, você encontrará funções e tipos relacionados a operações de arquivos e diretórios, como:

1. **Leitura e escrita de arquivos:**
    - `std::fs::read()`**:** lê o conteúdo de um arquivo para um vetor de bytes
    - `std::fs::write()`**:** escreve bytes em um arquivo

**Exemplo:**

```rust
use std::fs;

fn main() -> std::io::Result<()> {
    let conteudo = fs::read("arquivo.txt")?;

    fs::write("novo_arquivo.txt", conteudo)?;

    Ok(())
}
```

2. **Manipulação de diretórios:**
    - `std::fs::create_dir()`**:** cria um novo diretório
    - `std::fs::remove_dir()`**:** remove um diretório vazio
    - `std::fs::read_dir()`**:** lista entradas em um diretório

**Exemplo:**

```rust
use std::fs;

fn main() -> std::io::Result<()> {
    fs::create_dir("novo_diretorio")?;
    for entrada in fs::read_dir(".")? {
        println!("{}", entrada?.file_name().to_string_lossy());
    }

    Ok(())
}
```

3. **Metadata e informações de arquivo:**
    - `std::fs::metadata()`**:** obtém informações sobre um arquivo ou diretório
    - `std::fs::symlink_metadata()`**:** obtém informações sobre um arquivo ou diretório, seguindo links simbólicos

```rust
use std::fs;

fn main() -> std::io::Result<()> {
    let metadata = fs::metadata("arquivo.txt")?;

    println!("Tamanho do arquivo: {} bytes", metadata.len());

    Ok(())
}
```

4. **Remoção e renomeação de arquivos:**
    - `std::fs::remove_file()`**:** remove um arquivo
    - `std::fs::rename()`**:** renomeia um arquivo ou move entre diretórios

**Exemplo:**

```rust
use std::fs;

fn main() -> std::io::Result<()> {
    fs::remove_file("arquivo_antigo.txt")?;
    fs::rename("arquivo.txt", "arquivo_novo_txt")?;

    Ok(())
}
```

Essas são apenas algumas funcionalidades fornecidas pelo módulo `std::fs em Rust. Ele oferece um conjunto abrangente de ferramentas para interagir com o sistema de arquivos de forma segura e eficiente.

Um ponto importante a se observar sobre este módulo é que muitas operações de arquivos em Rust consideram o diretório de trabalho atual, que geralmente é o diretório a partir do qual o programa foi executado. Se você não especificar caminhos de forma absoluta, as operações de arquivo e diretório padrão serão relativas ao diretório de trabalho atual.

Por exemplo, quando você usa `fs::read_dir(".")`, está listando o conteúdo do diretório atual. Se você usar caminhos relativos para criar ou acessar arquivos (`fs::read()`, `fs::write()`, `fs::create_dir()`, etc.), esses caminhos serão relativos ao diretório de trabalho atual

Se você quiser operar em um diretório específico, você pode usar caminhos absolutos ou modificar o diretório de trabalho atual usando a função `std::env::set_current_dir`. Aqui está um exemplo:

```rust
use std::fs;
use std::env;

fn main() -> std::io::Result<()> {
    // Obter o diretório do executável.
    let diretorio_executavel = env::current_exe()?.parent().unwrap().to_path_buf();

    // Configurar o diretório de trabalho atual para o diretório do executável.
    env::set_current_dir(&diretorio_executavel)?;

    // Agora, as operações de sistema de arquivos serão relativas ao diretório do executável.
    let conteudo = fs::read("arquivo_txt")?;

    fs::write("novo_arquivo.txt", conteudo)?;

    Ok(())
}
```

Este exemplo assume que o diretório do executável é obtido corretamente, mas você pode precisar ajustar isso dependendo da estrutura do seu projeto e como você está gerenciando seus caminhos.

## <a id = "std-thread"></a>`std::thread` (Módulo)

Em Rust, o módulo `std::thread` faz parte da biblioteca padrão (standard library) e fornece funcionalidades para criar e gerenciar threads. As threads são uma forma de concorrência em que diferentes partes do código podem ser executadas simultaneamente. Sua funcionalidade está disponível por padrão sem a necessidade de uma importação explicíta.

**Aqui estão algumas das principais funcionalidades fornecidas pelo módulo** `std::thread`**:**

1. **Criar uma nova thread:**

```rust
use std:thread;

thread::spawn(|| {
    // Código a ser executado na nova thread.
});
```

O método `spawn()` é usado para criar uma nova thread que executa o código fornecido no bloco.

2. **Esperar pelo término de uma thread:**

```rust
use std::thread;

let handle = thread::spawn(|| {
    // Código a ser executado na nova thread.
});

// Espera pelo término da thread antes de continuar.
handle.join().unwrap();
```

O método `join()` é usado para esperar pelo término de uma thread antes de continuar a execução.

3. **Compartilhamento de dados entre threads:**

```rust
use std::thread;
use std::sync::{Arc, Mutex};

fn main() {
    let contador = Arc::new(Mutex::new(0));

    for _ in 0..10 {
        let contador = Arc::clone(&contador);
        thread::spawn(move || {
            let mut valor = contador.lock().unwrap();
            *valor += 1;
        });
    }

    // Aguarda a conclusão de todas as threads antes de encerrar.
    thread::sleep(std::time::Duration::from_secs(2));

    println!("Contador final: {}", *contador.lock().unwrap());
}
```

O módulo `std::sync` fornece mecanismos de sincronização, como `Mutex`, para compartilhar dados entre threads de forma segura.

A instrução `let mut valor = contador.lock().unwrap();` está realizando uma operação de blocagem (block) sobre o mutex associado ao contador. Essa operação bloqueia o acesso simultâneo de várias threads à seção crítica protegida pelo mutex.

Ao realizar `contador.lock()`, você obtém um guardião (locker) que garante o acesso execlusivo à seção crítica até que seja liberado. A função `unwrap()` é usada aqui para tratar qualquer erro que possa ocorrer ao tentar bloquear o mutex.

Portanto é uma operação de aquisição do mutex para garantir que a atualização da variável `valor` seja feita de forma segura e exclusiva, evitando condições de corrida em ambientes multithread.

O asterisco (`*`) é utilizado para desreferenciar um ponteiro. No contexto de Rust, quando você tem um ponteiro e deseja acessar o valor apontado por esse ponteiro, você usa o operador `*`.

No código em questão:

```rust
* valor += 1;
```

`valor` é um tipo `MutexGuard`, que é essencialmente um tipo que permite acesso exclusivo à seção crítica protegida pelo Mutex. O `*` é usado para desreferenciar o `MutexGuard` e acessar o valor contido dentro dele. Nesse caso, é um inteiro, e `+= 1` está incrementando esse valor.

Em resumo, `*valor` está sendo usado para acessar e modificar o valor protegido pelo mutex.

4. **Configuração de número máximo de threads:**

```rust
use std::thread;

// Configura o número máximo de threads simultâneas.
thread::Builder::new().spawn(|| {
    // Código a ser executado na nova thread.
});
```

O método `Builder::new()` permite configurar opções específicas ao criar uma nova thread.

5. **Esperar por todas as threads em um grupo:**

```rust
use std::thread;

let handles: Vec<_> = (0..10).map(|_| {
    thread::spawn(|| {
        // Código a ser executado em cada thread.
    })
}).collect();

for handle in handles {
    handle.join().unwrap();
}
```

O exemplo mostra como criar um vetor de handles para threads e esperar por todas elas.

Essas são apenas alguns exemplos das funcionalidades oferecidas pelo módulo `std::thread` em Rust. O Rust fornece um modelo de concorrência seguro, onde o sistema de tipos ajuda a evitar condições de corrida e outras situações problemáticas relacionadas à concorrência.

## <a id = "std-thread-sleep"></a>`std::thread::sleep()`

**Assinatura da função:**

```rust
pub fn sleep(dur: Duration)
```

A função `std::thread::sleep()` é parte da biblioteca padrão de Rust e é usada para suspender a execução do programa por um determinado período de tempo. Essa função é comumente utilizada em situações em que você deseja introduzir um atraso ou pausa na sua aplicação.

**Exemplo:**

```rust
use std::thread;
use std::time::Duration;

fn main() {
    // Supende a execução por 2 segundos.
    thread::sleep(Duration::from_secs(2));

    println!("Faça algo após suspender a execução por 2 segundos.");
}
```

Neste exemplo, `tread::sleep(Duration::from_secs(2))` suspende a execução do programa por 2 segundos. A duração do sono é especifícada usando `Duration::from_secs(2)`, onde `from_secs()` é um método associado da estrutra `Duration` usado para criar uma duração a partir de uma quantidade específica de segundos.

## <a id = "std-sync"></a>`std::sync` (Módulo)

O módulo `std::sync` em Rust fornece tipos e primitivas de sincronização para facilitar a comunicação e coordenação entre threads e concorrentes. Aqui estão alguns dos principais elementos deste mmódulo:

1. **Mutex (MutexGuard e MutexGuardMut):** um mecanismo de exclusão mútua que permite a sincronização do acesso a dados compartilhados entre threads. O `Mutex` só permite que uma thread por vez acesse a seção crítica protegida

**Exemplo:**

```rust
use std::sync::{Mutex, Arc};

let contador = Arc::new(Mutex::new(0));

// ...

let contador_clone = Arc::clone(&contador);

thread::spawn(move || {
    let mut valor = contador_clone.lock().unwrap();
    *valor += 1;
});
```

2. **Arc (Atomic Reference Counting):** um tipo de ponteiro inteligente para compartilhar referências entre threads. É frequentemente usado em conjunto com `Mutex` para compartilhar dados entre threads de maneira segura

**Exemplo:**

```rust
use std::sync::{Mutex, Arc};

let contador = Arc::new(Mutex::new(0));

// ...

let contador_clone = Arc::clone(&contador);
thread::spawn(move || {
    let mut valor = contador_clone.lock().unwrap();
    *valor += 1;
});
```

3. **RwLock (Read-Write Lock):** um mecanismo que permite múltiplas leituras simultâneas ou uma única gravação exclusiva. Pode ser útil quando você tem dados que podem ser lidos por várias threads ao mesmo tempo, mas exigem exclusividade durante a escrita

**Exemplo:**

```rust
use std::sync::{RwLock, Arc};

let dados = Arc::new(RwLock::new(Vec::new()));

// ...

// Leitura simultânea.
let leitura = dados.read().unwrap();

// Escrita exclusiva.
let mut escrita = dados.write().unwrap();
escrita.push(42);
```

4. **Condvar (condição de variável):** uma variável de condição quer permite que as threads esperem por um condição específica antes de continuar a execução. Pode ser útil para coordenar o comportamento entre threads

**Exemplo:**

```rust
use std::sync::{Mutex, Condvar, Arc};

let dados = Arc::new((Mutex::new(false), Condvar::new()));

// Thread 1.
let (lock, condvar) = &*dados;
let mut guard = lock.lock().unwrap();

*guard = true;
condvar.notify_one();

// Thread 2.
let (lock, condvar) = &*dados;
let mut guard = lock.lock().unwrap();

while !*guard {
    guard = condvar.wait(guard).unwrap();
}
```

Essas são algumas das primitivas de sincronização fornecidas pelo módulo `std::sync`. Cada uma delas tem seu uso adequado dependendo dos requisitos específicos de sincronização em um programa concorrente.

## <a id = "exemplo-std-sync-once"></a>Exemplo `Once`, `new()` e `call_once()`

```rust
use std::sync::Once;

static INIT_1: Once = Once::new();
static INIT_2: Once = Once::new();

fn inicializar_alguma_coisa() {
    // Alguma inicialização cara ou crítica.
    println!("Inicialização realizada!");
}

fn main () {
    // Vamos assumir que queremos inicializar alguma coisa apenas na primeira vez que esta função é chamada.
    INIT_1.call_once(|| {
        inicializar_alguma_coisa();
        println!("Uma instância de `Once`.");
    });

    // As chamadas subsequentes à função não realizarão a inicialização novamente.
    INIT_1.call_once(|| {
        println!("Esta linha não será impressa.");
    });

    // As instâncias de `Once` são independentes das outras em relação à execução única. Cada instância de `Once` possui o seu próprio estado interno.
    INIT_2.call_once(|| {
        println!("Outra instância de `Once`.");
    });
}
```

No exemplo acima, a função `inicializar_alguma_coisa()` será chamada apenas na primeira vez que `INIT.call_once()` for executado. As chamadas subsequentes à função não causarão a execução de inicialização novamente, mesmo que ocorram em diferentes threads.

## <a id = "std-sync-once">`std::sync::Once` (`struct`)

**Definição resumida:** `std::sync::Once` é uma estrutura em Rust que permite a execução de uma determinada função de forma única, garantindo que ela seja executada apenas uma vez, independente de quantas threads tentem executá-la simultaneamente.

A ideia principal é garantir que uma determinada inicialização seja realizada de forma preguiçosa (lazy) e apenas na primeira vez que é requisitada. Isso é especialmente útil em cenários onde a inicialização é custosa ou deve ser realizada de maneira segura em um ambiente multithread.

`Once` é uma ferramenta útil para garantir a inicialização única de recursos compartilhados ou configurações em programas multithread.

[**Exemplo.**](#exemplo-std-sync-once)

## <a id = "std-sync-once-new"></a>`std::sync::Once::new()`

**Definição resumida:** método utilizado para criar uma nova instância de `Once`.

**Assinatura da função:**

```rust
pub const fn new() -> Once
```

[**Exemplo.**](#exemplo-std-sync-once)

## <a id = "std-sync-once-call_once></a>`std::sync::Once::call_once()`

`std::sync::Once::call_once()` é um método fornecido pela biblioteca padrão de Rust (std) que faz parte do módulo `std::sync`. Essa função é utilizada para garantir que um determinado bloco de código seja executado exatamente uma vez, independente do número de threads que o chamam.

**A assinatura da função é a seguinte:**

```rust
pub fn call_once<F>(&self, f: F) where F: FnOnce();
```

- `&self`**:** uma referência imutável à instância da estrutura `Once`
- `f: F`**:** uma clausura ou função que será executada uma vez

A função `call_once()` garante que a clausura `f` será chamada apenas na primeira vez que `call_once()` é invocada em uma instância particular de `Once`. Se várias threads chamarem `call_once()` simultaneamente, apenas uma delas executará a clausura, e as outras esperarão até que a clausura seja concluída.

Essa função é comumente usada para inicializações únicas, onde você deseja garantir que um bloco de código seja executado apenas uma vez, mesmo em um ambiente com várias threads.

Observe também que a função `call_once()` só garante que o bloco de código passado como argumento será executado uma vez para a instância específica da estrutura `Once` na qual foi chamada. Cada instância de `Once` mantém seu próprio estado interno para rastrear se a cláusula já foi executada.

Se você criar outra instância de `Once` e chamar `call_once()` nessa nova instância, o bloco de código associado a essa instância específica será executado uma vez. No entanto, isso não afeta outras instâncias de `Once`, e seus blocos de código associados permanecerão não executados até que `call_once()` seja chamado nelas.

A ideia principal do `Once` é garantir a execução única de um bloco de código para uma instância específica, isolando o estado entre diferentes instâncias. Cada instância de `Once` é independente das outras em relação à execução única.

[**Exemplo.**](#exemplo-std-sync-once)

# <a id = "serde"></a>`serde`

Serde é uma crate (biblioteca) em Rust. Ela é uma das bibliotecas mais amplamente utilizadas para serialização e desserialização de dados em Rust. A crate Serde oferece suporte a diversos formatos de serialização, incluindo JSON, binário, TOML, e outros.

Para utilizá-la, você precisa adicionar a dependência correspondente ao seu arquivo **Cargo.toml**. Aqui está um exemplo para usar Serde com JSON:

```toml
[dependencies]
serde = { version = "1", features = ["derive"] }
serde_json = "1.0"
```

Na configuração acima:

- `serde` é a crate principal e é utilizado com a feature `"derive"` para habilitar a derivação automática de traits, como `Serialize` e `Deserialize`
- `serde_json` é uma crate específica para serialização e desserialização de JSON

Você pode substituir `serde_json` por outras crates Serde dependendo do formato de serialização que você deseja usar.

Após adicionar essas dependências ao seu **Cargo.toml**, você pode utilizar Serde no seu código Rust. Por exemplo:

```rust
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
struct Pessoa {
    nome: String,
    idade: u32,
}

fn main() {
    let pessoa = Pessoa { nome: "Alice".to_string(), idade: 30 };

    // Serialização para JSON.
    let json_serializado = serde_json::to_string(&pessoa).unwrap();

    println!("JSON serializado: {}", json_serializado);

    // Deserialização de JSON.
    let pessoa_desserializada: Pessoa = serde_json::from_str(&json_serializado).unwrap();

    println!("Pessoa desserializada: {:?}", pessoa_desserializada);
}
```

Este é apenas um exemplo simples, e Serde oferece suporte a uma variedade de casos de uso e formatos de serialização. A documentação oficial da crate Serde é uma execelente fonte de informações sobre como usá-la efetivamente.

### Sumário

- [`serde::Serialize` (`trait`)](#serde-serialize)
- [`serde::Deserialize` (`trait`)](#serde-deserialize)

## <a id = "serde-serialize"></a>`serde::Serialize` (`trait`)

`serde::Serialize` é um trait em Rust que faz parte da crate `serde`, que é uma ferramenta de serialização e desserialização em Rust. A `serde` é amplamente utilizada para converter dados de e para formatos comuns, como JSON ou binário.

O `serde::Serialize` é um trait usado para serializar dados em um formato que pode ser salvo ou transmitido. Ao implementar esse trait para um tipo personalizado, você permite que instâncias desse tipo sejam convertidas em uma representação serializável.

**Aqui está um exemplo simples de implementação do** `serde::Serialize`**:**

```rust
use serde::{Serialize, Serializer};

#[derive(Serialize)]
struct Pessoa {
    nome: String,
    idade: u32,
}

fn main() {
    let pessoa = Pessoa {
        nome: String::from("Alice"),
        idade: 30,
    };

    // Convertendo a pessoa para uma string JSON.
    let json_serializado = serde_json::to_string(&pessoa).unwrap();
    println!("JSON serializado: {}", json_serializado);
}
```

Neste exemplo:

- `Pessoa` é uma estrutura com dois campos
- A anotação `#[derive(Serialize)]` informa ao compilador Rust para gerar automaticamente a implementação do trait `serde::Serialize` para `Pessoa`
- O código dentro de `main()` usa `serde_json::to_string()` para serializar uma instância de `Pessoa` em uma string JSON

Ao implementar `serde::Serialize` para tipos personalizados, você pode controlar como esses tipos são convertidos em formatos serializáveis, definindo manualmente a lógica de serialização se necessário. Isso é útil ao lidar com casos específicos ou formatos de dados personalizados.

## <a id = "serde-deserialize"></a>`serde::Deserialize` (`trait`)

Em Rust, `serde::Deserialize` é um trait (traço) fornecido pela crate Serde. Serde é uma das crates mais populares em Rust para serialização e desserialização de dados. O trait `Deserialize` define métodos que são implementados para tipos de dados específicos, permitindo que esses tipos desserializados a partir de um formato serializado, como JSON ou binário.

A declaração do trait `Deserialize` parece assim:

```rust
pub trait Deserialize<'de>: Sized {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>
}
```

- `'de` é uma vida útil (lifetime) que representa a duração do processo de desserialização
- `deserialize` é um método associado a trait, que deve ser implementado para permitir a desserialização de um tipo específico

O método `deserialize` é genérico sobre o tipo de desserializador (`D`). O deserializador implementa o trait `Deserializer`, que também faz parte da biblioteca Serde.

Ao implementar `Deserialize` para um tipo específico, você permite que instâncias desse tipo sejam construídas a partir de um formato serializado. Isso é útil, por exemplo, ao desserializar dados JSON para estruturas de dados em Rust.

**Exemplo de implementação para um típo fictício:**

```rust
use serde::{Deserialize, Deserializer};

#[derive(Debug)]
struct Pessoa {
    nome: String,
    idade: u32,
}

impl<'de> Deserialize<'de> for Pessoa {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        // Lógica de desserualização aqui.
        // Geralmente, isso envolverá acessar os campos do deserializador e construir uma instância do tipo.
        // No mundo real, pode-se usar serde_derive oara gerar implementações automáticas para muitos casos comuns.
        unimplemented!("Exemplo de implementação de desserialização para Pessoa.")
    }
}

fn main() {
    // Exemplo de uso de desserialização.
    let json_serializado = r#"{ "nome": "Alice", "idade": 30 }"#;
    let pessoa: Pessoa = serde_json::from_str(json_serializado).unwrap();

    println!("{:?}", pessoa);
}

// Se você quiser executar o código acima, você pode documentar a implementação do traço e utilizar a derivação para isso, adicionando `Deserialize` a struct `Pessoa`. Aleḿ de adicionar a importação `serde_derive::*;`
```

Observe que, na prática, você pode muitas vezes usar a derivação automática fornecida pelo `serde_derive`, evitando a necessidade de escrever manualmente a implementação do `Deserialize` para muitos casos comuns.

# <a id = "convencoes-rust"></a>Convenções em Rust

A escolha de nomear o tipo genérico como `F` é uma convenção comum em Rust e frequentemente associado a "Function". O nome `F` é frequentemente utilizado para representar um tipo que é esperado ser uma função ou algo relacionado a funções.

Essa convenção ajuda a tornar o código mais legível e expressivo. Ela é um exemplo do uso de nomes de variáveis que fornecem uma dica ou informação sobre o propósito ou função do tipo. Quando alguém lê o código e vê um tipo genérico chamado `F`, é razoável inferir que esse tipo se refere a uma função.

Vale ressaltar que, embora `F` seja uma escolha comum, você poderia usar qualquer identificador de tipo válido em Rust. A escolha de `F` é mais uma questão de convenção e clareza do código do que uma exigência da linguagem.

Para **lifetimes** a convenção são caracteres minúsculos antecedidos de um apóstrofo simples (`'`).

# ---

### Sumário

- **Cross e a Compilação de Binários Estáticos Compatíveis**
- **Target**
- **Arquivo Makefile no Formato TOML**
- **Executando Um Código Feito em Rust**
- **Cargo**
- **Macros**
    + `macro`
    + `macro_rules!`
    + `vec![]`
- `#[derive(lista_de_traits)]` **(Derivação)**
- **Structs (**`struct`**)**
- `;`
    + `return`
    + **Retorno Implícito**
    + **Retorno Implícito x Retorno explícito**
- **Tipos de Dados**
    + `i32`
    + `&str`
    + **Enums (**`enum`**)**
- **String Bruta (String Raw)**
- **Tipos de Variáveis (**`static`**)**
- **Palavras Reservadas**\
    + `fn`
        - `return`
        - **Retorno Implícito**
    + `type`
    + `loop`
    + `match`\
        - `match` **x** `if`
    + `self`
- **Operadores**\
    + `?`
- **Importação e Módulo x Crate (**`use`**)**\
    + **Auto Importação**
- **Parâmetros**\
    + **Parâmetros de Tipo Genérico** `<T, E> Result<T, E>`
- **Closures (**`||`**.** `mut`**)**
- **Threads**
- **Pedaços de Código dos Quais Você Pode Absorver Muita Coisa**\
    + `pub fn init(logger: Vec<Box<dyn SharedLogger>>) -> Result<(), SetLoggerErros>`
    + `Main()` **Sendo Chamada de Forma Recursiva**\
        - `Result<(), ()>`
- **Crates**
    + `log`\
        - `info` **(macro)**
    + `simplelog`
        - `simplelog::CombinedLogger` **(**`struct`**)**\
        - `simplelog::CombinedLogger::init()` **(método)**
        - `simplelog::TermLogger` **(**`struct`**)**\
        - `simplelog::TermLogger::new()` **(método)**
    + `anyhow`
        - `anyhow::bail` **(macro)**
        - `anyhow::Context` **(**`trait`**)**
        - `anyhow::Result` **(**`type`**)**
        - `unwrap()` **(método)**
- **Boas Práticas**
    + `,`
    + **Variáveis com Todas as Letras em Maiúsculo**

# Cross e a Compilação de Binários Estáticos Compatíveis

O `cross` é uma ferramenta que facilita a compilação de binários estáticos para diferentes plataformas. Ele é especialmente útil quando você precisa compilar um programa em uma arquitetura ou sistema operacional (SO) diferente daquele em que você está trabalhando.

A expressão "compile compatible static binaries" significa que o `cross` permite compilar binários estáticos que são compatíveis com diversas plataformas. Vamos quebrar essa frase para entender melhor:

- **Compile** o `cross` facilita o processo de compilação de programas
- **Compatible:** os binários resultantes são compatíveis com a plataforma de destino. Isso significa que você pode criar um binário em um SO ou arquitetura e executá-lo em outro SO ou arquitetura compatível
- **Static Binaries:** o `cross` enfatiza a compilação de binários estáticos. Binários estáticos incluem todas as bibliotecas necessárias dentro do próprio executável, tornando-o autocontido e eliminando a dependência de bibliotecas compartilhadas. Isso é útil para garantir que o binário funcione em diferentes ambientes sem a necessidade de instalar bibliotecas adicionais

Em resumo, o `cross` é uma ferramenta que simplifica o processo de compilação para diferentes plataformas, gerando binários estáticos compatíveis que podem ser executados em uma variedade de sistemas operacionais e arquiteturas sem a necessidade de ajustes ou instalação de dependências adicionais. Essa abordagem pe comum em ambientes de desenvolvimento de software que precisam ser distribuídos em várias plataformas.

# Target

Em contextos de desenvolvimento de software, o termo "target" (alvo, em português) geralmente se refere à plataforma específica para a qual um programa ou código-fonte está sendo compilado. Isso inclui informações sobre a arquitetura do processador, o sistema operacional (SO), a ABI (Application Binary Interface) e outros detalhes específicos da plataforma.

Quando você compila um programa, você precisa especificar o "target" para o qual o código resultante deve ser direcionado. O compilador usa essas informações para gerar um binário compatível com a plataforma desejada. Isso é especialmente relevante quando se trabalha em ambientes com múltiplas plataformas, como desenvolvimento cruzado ou quando se deseja compilar código em uma máquina diferente daquela em que será executado.

Exemplos de "targets" podem incluir:

- **Arquitetura do processador:**
    + x86_64 (64 bits)
    + x86 (32 bits)
    + ARM
- **SO:**
    + Linux
    + Winwdows
    + macOS
    + Android
    + iOS
- **Variantes específicas:**
    + musl (biblioteca C alternativa para sistemas Linux)
    + glibc (biblioteca C padrão para sistemas Linux)
    + msvc (para compilação com o Microsoft Visual C++ no Windows)

Ao usar ferramentas como `cross` ou ao configurar projetos com o Cargo (o gerenciador de pacotes e compilador para Rust), você específica o "target" para o qual deseja compilar. Isso garante que o binário resultante seja compatível com a plataforma desejada.

# Arquivo Makefile no Formato TOML

Considere o seguinte código `cargo make --makefile workflow.toml cross-release`.

- `cargo make`**:** é uma extensão do Cargo que adiciona funcionalidades de automação de tarefas ao processo de construção e desenvolvimento. Ele usa arquivos de configuração chamados de Makefiles (no formato TOML) para definir tarefas e automações
- `--makefile workflow.toml`**:** especifica o nome do arquivo Makefile que contém as definições de tarefas e automações. Neste caso, o arquivo de configuração é chamado `workflow.toml`
- `cross-release`**:** é o nome de uma tarefa definida no Makefile

Conteúdo do arquivo `workflow.toml`.

```toml
[tasks.cross-clean] # Nome da tarefa: [tasks.nome_da_tarefa]. As tarefas são definidas como tabelas aninhadas no arquivo TOML.
# Pares de chave-valor.
args = ["clean"] # args (chave) = ["clean"] (valor, é um vetor).
command = "cross"

[tasks.cross-build]
args = ["build", "--target", "x86_64-unknown-linux-musl"]
command = "cross"

[tasks.cross-build-release]
args = ["build", "--target", "x86_64-unknown-linux-musl", "--release"]
command = "cross"

[tasks.strip]
args = ["-s", "./target/x86_64-unknown-linux-musl/release/updater"]
command = "strip"
dependencies = ["cross-build-release"]

# "args", "command" e "dependencies" são palavras chave.
# "command args" compõem o comando que será executado quando "nome_da_tarefa" for chamada.
# "dependencies" indica as dependências de uma tarefa. As tarefas listadas como dependências são executadas antes da tarefa principal.

[tasks.upx]
args = ["--best", "--lzma", "./target/x86_64-unknown-linux-musl/release/updater"]
command = "upx"
dependencies = ["strip"]

[tasks.cross-release]
dependencies = ["cross-build-release", "strip", "upx"]
```

# Executando Um Código Feito em Rust

- Instale o Rust (rustup, Cargo e rustc)
- Instale o Cross
- Crie um ponto de entrada\
    O padrão é um arquivo **main.rs** que contém a função `main()`
- Execute o comando `cargo init` no diretório que contém o arquivo **main.rs**
    Ele irá criar o arquivo **Cargo.toml**

# Cargo

`cargo add dependência`**:** adiciona a dependência `dependência` ao seu arquivo **Cargo.toml** na seção `[dependencies]` com a versão mais recente. Após a adição, você pode usar `cargo build` para baixar e compilar a dependência.

Antes de usar este comando você precisa instalá-lo se ainda não o tiver. Você pode instalá-lo usando o seguinte comando: `cargo install cargo-edit`.

Se quiser uma versão específica da dependência, você pode fornecê-la da seguinte forma: `cargo add dependência@versão`, por exemplo, `cargo add anyhow@1.0`.

# Macros

Um "macro" se refere a uma funcionalidade poderosa e flexível para a criação de código em tempo de compilação. Macros em Rust são semelhantes a macros em outras linguagens de programação, mas a abordagem de Rust é particulamente robusta e segura.

A principal diferença entre uma função regular e uma macro é que uma macro **opera no nível do código-fonte**, enquanto uma função opera no nível do código executável. As macros em Rust permitem a geração e transformação de código Rust durante a fase de compilação.

**Macros realizam transformações no código durante a compilação, funções são chamadas em tempo de execução.**

Existem dois tipos principais de macros em Rust:

- **Procedurais:** macros procedurais são macros que geram código Rust. Elas são mais poderosas e podem ser usadas para criar novos itens de código, como funções, estruturas e módulos
    + **Exemplo:**

```rust
macro greeting() {
    // Cria uma função de cumprimento durante a compilação.
    fn greet() {
        println!("Olá, Mundo!");
    }
}

// Uso da macro procedural. Este é um exemplo hipotético, pois não há um macro procedural real no exemplo.
greeting!();
```

- **De identificação:**
    + Macros de identificação são macros que operam no nível de tokens e são usados para manipulação de um código mais leve
    + **Exemplo:**

```rust
macro_rules! greet {
    ($name:expr) => {
        println!("Olá, {}!", $name);
    };
}

greet!("Mundo");
```

As macros em Rust são poderosa, mas devem ser usadas com responsabilidade. Elas são uma ferramenta poderosa para a metaprogramação, mas o código gerado deve ser claro, legível e seguro.

As macros são declaradas usando a palavra-chave `macro_rules!` para macros de identificação e a palavra-chave `macro` para macros procedurais. O uso de macros em Rust é uma parte fundamental da flexibilidade e expressividade da linguagem.

O uso de macros oferece alguns benefícios específicos devido à natureza de transformação de código (o código que se encontra no escopo da macro é inserido nos locais em que ele é chamado) em tempo de compilação das macros. Aqui estão alguns dos benefícios:

1. **Geração de código dinâmico:** as macros em Rust permitem a geração de código dinâmico com base em padrões específicos definidos pelo usuário. Isso pode ser útil para criar código que segue padrões específicos ou para automatizar tarefas repetitivas
2. **Reduçaõ de repetição:** macros podem ser usadas para evitar repetição de código. Se você tem blocos de código que se repetem em vários lugares, uma macro pode gerar esses blocos automaticamente, evitando a necessidade de escrever o mesmo código várias vezes
3. **Expressividade:** macros podem melhorar a expressividade do código, permitindo a criação de construções de linguagem específicas que se encaixam melhor no problema em questão. Isso pode tornar o código mais claro e conciso
4. **Meta-programação:** as macros em Rust permitem meta-programação, onde você pode escrever código que gera código. Isso é poderoso para criar abstrações complexas, sistemas de tipos ou para implementar padrões de design de maneira mais eficiente
5. **Capacidade de correspondência de padrões:** macros em Rust usam a correspondência de padrões, o que permite criar padrões complexos para transformar o código de maneira específica. Essa capacidade de correspondência de padrões é mais avançada do que a substituição simples de texto, como ocorre em muitas linguagens de pré-processamento
6. **Melhor desempenho em casos específicos:** em alguns casos, o uso de macros pode resultar em um desempenho melhor em comparação com funções. Isso ocorre porque o código gerado pela macro é inserido diretamente no local de chamada durante a compilação, evitando a sobrecarga de chamadas de função

Embora esses benefícios sejam valiosos, é importante notar que as macros devem ser usadas com moderação. Macros complexas podem tornar o código difícil de entender, e seu uso excessivo pode levar a código menos manutenível. Em muitos casos, funções regulares são preferíveis devido à sua clareza e capacidade de encapsular lógica reutilizável. As macros são uma ferramenta poderosa, mas devem ser usadas quando realmente oferecem vantagens claras.

### `vec![]`

A sintaxe `vec![]` em Rust é um atalho conveniente para criar um vetor contendo os elementos fornecidos. O `!` após o `vec` indica que é um macro.

A macro `vec!` é uma maneira concisa de inicializar um vetor, permitindo que você forneça os elementos do vetor dentro dos colchetes (`[]`), sem a necessidade de criar manualmente um vetor usando `Vec::new()` e depois usar o método `push()` para adicionar elementos.

# `#[derive(lista_de_traits)]` (Derivação)

Resumidamente, `derive` implementa traits de forma automática com valores padrão predefinidos.

Quando você adiciona `#[derive(lista_de_traits)]` a uma estrutura ou enum em Rust, está **instruindo o compilador a gerar automaticamente a implementação dos métodos associados a esse traço**. Esses métodos gerados automaticamente têm **comportamentos padrão predefinidos** que são apropriados para a maioria dos casos.

Ao usar `derive`, você obtém a implementação automática de alguns métodos associados a esses traços com código que seria tedioso e propenso a erros se fosse feito manualmente. Aqui estão alguns exemplos, considerando a derivação abaixo:

```rust
use serde_derive::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Debug)]
struct Pessoa {
    nome: String,
    idade: u32,
}
```

1. **Serialize:** o código gerado automaticamente pelo `serde_derive` irá inspecionar cada campo da estrutura e serializá-la para o formato desejado (por exemplo, JSON). Para tipos simples, como inteiros, strings e enums, o `serde_derive` já fornece implementações padrão
2. **Deserialize:** o código gerado pelo `serde_derive` vai desserializar a entrada correspondente ao formato da serialização (por exemplo, JSON) e construir uma instância da estrutura. Novamente, para tipos simples, o `serde_derive` lida automaticamente com a desserialização
3. **Debug:** o código gerado pelo Rust irá imprimir uma representação de depuração da estrutura, útil para depuração e logging. Para tipos básicos, a implementação gerada automaticamente é geralmente adequada

Para ser mais preciso, quando você usa `derive` na struct do exemplo acima, você está pedindo ao compilador para gerar implementações automáticas dos métodos associados a cada traço listado. Por exemplo, `#[derive(Serialize, Deserialize, Debug)]` em uma struct gera automaticamente o código necessário para serialização, desserialização e formatação de depuração.

A derivação é uma poderosa ferramenta para tornar o código mais conciso e menos propenso a erros, especialmente em situações comuns onde a lógica é padrão. No entanto, em casos mais complexos ou específicos, pode ser necessário escrever manualmente a implementação dos métodos associados ao traço para personalizar o comportamento.

Observe que os traços são aplicados a uma estrutura (struct) ou enum mais próxima que precede a derivação. A derivação deve ser colocada diretamente acima da definição da struct ou enum à qual você deseja aplicar a derivação.

Se você quiser aplicar a derivação a várias structs ou enums, você precisa repetir a derivação para cada uma delas, colocando-a diretamente acima da definição de cada struct ou enum.

# Structs (`struct`)
Em Rust, uma "struct" (estrutura) é um tipo de dados que permite agrupar diferentes tipos de dados sob um único nome. Ela é semelhante a uma classe ou a uma estrutura de dados em outras linguagens de programação.

As structs em Rust são utilizadas para criar tipos de dados personalizados, onde você pode definir os campos (propriedades) que a estrutura terá. Cada campo pode ter um tipo de dados diferente. Aqui está um exemplo básico de como você pode definir e usar uma struct:

```rust
// Definindo uma struct chamada "Ponto".
struct Ponto {
    x: i32,
    y: i32
}

fn main() {
    // Criando uma instância da struct "Ponto".
    let ponto1 = Ponto { x: 10, y: 20 };

    // Acessando os campos da struct.
    println!("Coordenadas do ponto: ({}, {}).", ponto1.x, ponto1.y);
}
```

Neste exemplo, a struct `Ponto` tem dois campos `x` e `y`, ambos do tipo `i32`. No `main()`, uma instância da struct é criada com valores específicos para os campos, e esses valores são acessados usando a notação de ponto (`ponto1.x` e `ponto1.y`).

As structs são frequentemente utilizadas para modelar dados mais complexos e estruturados em Rust. Elas podem ser usadas em conjunto com traits para adicionar comportamentos específicos a tipos de dados personalizados.

# `;`

O ponto e vírgula (`;`) em Rust é usado como um separador de instruções. Em Rust, o ponto e vírgula indica o final de uma instrução. Cada instrução em Rust deve terminar com um ponto e vírgula.

A presença do ponto e vírgula em Rust é obrigatória para indicar o fim de uma instrução. Sem o ponto e vírgula, o compilador pode interpretar o código de maneira diferente ou gerar mensagens de erro, dependendo do contexto.

**Por exemplo:**

```rust
fn main() {
    println!("Olá, Mundo!"); // Ponto e vírgula indica o fim da instrução.

    let x = 5; // Ponto e vírgula indica o fim da instrução.
    let y = x + 1;  // Ponto e vírgula indica o fim da instrução.

    if y > 5 {
        println!("y é maior que 5."); // Ponto e vírgula indica o fim da instrução.
    } else {
        println!("y não é maior que 5.") // Ponto e vírgula indica o fim da instrução.
    }
}
```

No exemplo acima, cada linha termina com um ponto e vírgula, indicando o final da instrução. Essa é uma característica fundamental da sintaxe Rust e ajuda a tornar o código mais preciso e previsível.

Em resumo, o ponto e vírgula em Rust é um indicador de fim de instrução e é usado para separar diferentes instruções no código fonte.

Observe ainda que o ponto e vírgula em Rust não é um operador, é uma parte fundamental da sintaxe da linguagem e serve como um marcador de fim de instrução. Sua função principal é indicar ao compilador onde termina uma instrução. O ponto e vírgula é uma construção de controle de fluxo, indicando onde termina uma expressão ou instrução e onde começa a próxima.

```rust
let x = 5; // Ponto e vírgula indica o fim da declaração da variável.
println!("O valor de x é: {}.", x); // Ponto e vírgula indica o fim da instrução de impressão.
```

Então, enquanto o ponto e vírgula é essencial na sintaxe do Rust, ele não é um operador no sentido de realizar uma operação em valores, mas sim um elemento estrutural que ajuda a definir a estrutura e a sequência das instruções em um programa Rust.

O ponto e vírgula e o `return` têm relacionamentos distintos na linguagem Rust.

- **Ponto e vírgula:** o ponto e vírgula é usado para indicar o fim de uma instrução. Cada linha de código em Rust geralmente termina com um ponto e vírgula para denotar o término de uma instrução
- `return`**:** o `return` é uma palavra-chave usada para explicitamente retornar um valor de uma função. Ele geralmente não é seguido por um ponto e vírgula, pois não é considerado uma expressão que termina com um ponto e vírgula. O valor após `return` é a última expressão avaliada na função e serve como o valor de retorno da função.

**Exemplo:**

```rust
fn soma(a: i32, b: i32) -> i32 {
    return a + b; // Não é necessário ponto e vírgula após o `return`.
}
```

Em muitos casos, o `return` não precisa ser usado explicitamente; a última expressão em uma função é implicitamente considerada o valor de retorno. O ponto e vírgula é mais comumente usado para indicar o término de instruções, e não é colocado após a última expressão em uma função. No entanto, se você optar por usar `return`, geralmente não é colocado o ponto e vígula após ele.

No Rust, o ponto e vírgula em uma expressão indica uma instrução, e o valor da expressão é "descartado". Isso significa que o valor resultante da expressão não será retornado ou utilizado de qualquer maneira.

**Vamos considerar um exemplo:**

```rust
fn main() {
    let x = 42; // Instrução.
    let y = {
        let a = 10;  // Instrução.
        let b = 20;  // Instrução.
        a + b // Expressão, seu valor **vai** ser atribuído a `y` quando a execução do escopo for encerrada. O uso de ponto e vírgula aqui causaria um erro.
    };  // Instrução. `let y = valor_da_expressão`.
    let z = x + y; // É diferente de `let z = { x + y }`. `let z = x + y;` é uma instrução de atribuição.

    println!("Valor de x: {}.", x); // Saída: Valor de x: 42.
    println!("Valor de y: {}.", y); // Saída: Valor de y: 30.
    println!("Valor de y: {}.", z); // Saída: Valor de y: 72.
}
```

No exemplo acima, a expressão `a + b` dentro do bloco `{}` não tem um ponto e vírgula, então o valor da expressão (`a + b`) é retornado. 

É importante observar a diferença entre `let z = x + y;` e `let z = { x + y }`. O ponto e vírgula em Rust é crucial principalmente para indicar o término de uma **instrução**. Em Rust, uma instrução é uma unidade de código que realiza uma ação, e ela frequentemente terminar com um ponto e vígula.

Quando se trata de **expressões** (que produzem um valor), o ponto e vírgula tem um papel diferente. Se você termina uma expressão com um ponto e vírgula, você está convertendo aquela expressão em uma instrução e, portanto, o valor resultante não é utilizado em qualquer operação subsequente (no exemplo acima, `z` é utilizado, mas a expressão `x + y` a direita, não). Se você não coloca um ponto e vírgula, a expresão é avaliada e o valor resultante é utilizado conforme necessário.

Sobre retornar algo implicitamente e retornar algo explicitamente. O uso de `return` tem implicações significativas no fluxo de controle e no retorno da **função**.

Quando você utiliza `return` em uma função em Rust, a função é **encerrada imediatamente** e o valor especificado após o `return` é retornado como valor da função. Vamos considerar um exemplo:

```rust
fn soma(a: i32, b: i32) -> i32 {
    return a + b // `a + b` . Retorno implícito.

    // println!("Para o retorno ser implícito, não pode haver outras ações após a expressão, como por exemplo, uma instrução de impressão.")
}

fn main() {
    let resultado = soma(10, 20);

    println!("Resultado da soma: {}.", resultado); // Saída: Resultado da soma: 30.
}
```

Neste exemplo, a função `soma()` utiliza `return a + b`. Isso significa que, assim que a expressão `a + b` é avalida, o valor resultante é retornado imediatamente, e a execução da função `soma()` é encerrada.

Por outro lado, se você não explicitamente `return` na última expressão de uma função, Rust considerará essa expressão como o valor de retorno implícito. Isso é comum em Rust, e a última expressão (deve ser também a última ação realizada pela função) avaliada em uma função é implicitamente o valor de retorno da função.

Ambos os métodos são válidos em Rust, mas o uso explícito de `return` é geralmente reservado para casos em que você deseja encerrar a função prematuramente ou quando a lógica de controle exige um retorno antecipado. Para a maioria das funções, a expressão final como valor de retorno implícito é preferida ela concisão e clareza do código.

**Um exemplo usando ambos os tipos de retorno:**

```rust
fn soma(a: i32, b: i32) -> i32 {
    if a + b > 0 {
        println!("O valor da soma é positivo: {}.", a + b);

        return a + b
    } else {
        println!("O valor da soma é negativo.");
    }
    a + b
}

fn main() {
    let resultado = soma(1, 2);
    println!("O valor do resultado é: {}.", resultado);
}
```

# Tipos de Dados

### `i32`

`i32` é um tipo de dados em Rust que representa um número inteiro de 32 bits com sinal (significado que pode ser positivo ou negativo). Aqui está uma breve explicação:

- `i`**:** indica que é um tipo de inteiro com sinal (signado)
- `32`**:** indica que ocupa 32 bits de armazenamento na memória

Isso significa  que um valor do tipo `i32` pode variar de -2\^31 a 2\^31-1, cobrindo uma faixa de aproximadamente -2 bilhões a 2 bilhões.

**Exemplo de uso:**

```rust
fn main() {
    // Declarando uma variável do tipo i32.
    let numero: i32 = 42;

    // Imprimindo o valor.
    println!("O valor é: {}.", numero);
}
```

### `&str`

`&str` é um tipo de dado em Rust que representa uma "fatia" (slice) de uma string, também conhecido como uma referência a uma sequência de caracteres. Aqui está uma breve explicação.

- `&`**:** indica que é uma referência, ou seja, uma forma de referenciar dados sem possuí-los diretamente
- `str`**:** representa uma sequência de caracteresm, ou seja, uam string

Este tipo é uma forma comum de lidar com strings em Rust. Ele não possui propriedades próprias de propriedades de propriedades de string, como `String`, mas pode apontar para uma parte específica de uma string existente.

**Exemplo de uso:**

```rust
fn main() {
    // Criando uma string.
    let minha_string = String::from("Olá, Mundo!");

    // Criando uma referência a parte da string (slice).
    let parte_da_string: &str = &minha_string[0...5];

    // Imprimindo a parte da string.
    println!("Parte da string: {}", parte_da_string);
}
```

Neste exemplo, `&minha_string[0...5]` cria uma referência a uma fatia da string original que inclui os caracteres nas posições 0 a 4 (5 não é incluído). `&str` é frequentemente usado para passar partes de strings em funções ou métodos sem a necessidade de copiar os dados.

### Enums (`enum`)

Em Rust, "enum" (enumeração) é um tipo de dado que permite a definição de um conjunto finito e nomeado de valores possíveis. Enums são frequentemente utilizados para representar diferentes variantes ou estados em um programa.

Ao contrários de enums em algumas outras linguagens, em Rust, os enums podem ter dados associados a cada variante, tornando-os extremamente versáteis.

Aqui está um exemplo básico de como você pode definir e usar um enum em Rust:

```rust
// Definindo um enum chamado "Dia".
enum Dia {
    Segunda,
    Terca,
    Quarta,
    Quinta,
    Sexta,
    Sabado,
    Domingo
}

fn main() {
    // Criando uma instância do enum "Dia".
    let dia_da_semana = Dia::Quarta;

    // Utilizando um "match" para lidar com diferentes variantes.
    match dia_da_semana {
        Dia::Segunda => println!("É segunda-feira!"),
        Dia::Quarta => println!("É quarta-feira!"),
        Dia::Sexta => println!("É sexta-feira!"),
        _=> println!("Outro dia da semana.")
    }
}
```

Neste exemplo, o enum `Dia` tem sete variantes, representando cada dia da semana. Uma instância do enum é criada com um valor específico, e um `match` é usado para lidar com as diferentes variantes.

Os enums em Rust são poderosos, especialmente quando combinados com dados associados. Eles são usados para criar tipos de dados customizados e expressar conceitos que podem ter múltiplos estados os valores distintos.

# String Bruta (String Raw)

A sintaxe `r#" ... "#` é chamada de string raw ou string bruta em Rust. Ela é usada para criar strings literais que podem conter caracteres especiais (como barras invertidas) sem a necessidade de escapa-los.

```rust
fn main() {
    let string_bruta : String = r#"Lista de caracteres especiais:
    - {}
    - ()
    - \

    O espaço em branco acima é incluso.
    - *
O espaço em branco abaixo também é incluso. Também é possível observar indentação.
    "#.to_string();

    println!("{}", string_bruta);
}
```

O `r#"` no início e `"#;` no final indicam que a string é raw, então você pode incluir quebras de linha e espaços sem a necessidade de escapar cada caractere especial.

Essa sintaxe é especialmente útil quando você precisa incluir grandes blocos de texto em seu código, como consultas SQL, expressões regulares complexas, dados JSON, etc. A string raw simplifica a legibilidade do código ao evitar a necessidade de escapar caracteres especiais.

# Tipos de Variáveis (`static`)

`static INIT:` [`Once`](#once) `= Once::new()`

Aqui, estamos declarando uma variável estática chamada `INIT` do tipo `Once` e está inicializando essa variável com o resultado da chamada do método estático `new()` do módulo `Once`. Em Rust, a criação de variáveis estáticas requer uma inicialização constante, e a função `new()` do tipo `Once` fornece essa inicialização para garantir que a variável esteja pronta para uso.

A função `new()` do tipo `Once` é uma função associada, o que significa que você a chama no tipo (`Once::new()`) em vez de uma instância específica. Nesse caso, ela retorna uma nova instância da struct `Once` configurada para ser usada como uma variável de inicialização única. Isso é frequentemente usado para inicializar uma variável estática apenas uma vez em um programa.

Essa abordagem é comumente usada para garantir que a inicialização de uma variável estática ocorra de maneira thread-safe, especialmente quando a inicialização envolve operações que só devem ser realizadas uma vez (como inicialização de recursos globais). A estrutura `Once` ajuda a garantir que essa inicialização ocorra de maneira segura em um ambiente multithread.

# Palavras Reservadas

## `fn`

Em Rust, a palavra reservada `fn` é usada para declarar uma função. Ela é seguida pelo nome da função, uma lista de parâmetros entre parênteses e o bloco de código que compõe o corpo da função.

A sintaxe básica de uma declaração de função em Rust é a seguinte:

```rust
fn nome_da_função(parâmetro1: Tipo1, parâmetro2: Tipo2) -> Tipo_do_retorno {
    // Corpo da função.
    // ...
    // Opcionalmente, a função retorna um valor usando a palavra chave `return`.
}
```

Aqui estão alguns pontos-chaves sobre a palavra reservada `fn`:

1. **Declaração de função:** `fn` é usada para declarar uma função
2. **Nome da função:** o nome da função segue a palavra `fn` e é usado para chamar a função posteriormente no código
3. **Parâmetros:** a lista de parâmetros está entre parênteses e consiste em nomes de parâmetros seguidos por seus tipos
4. **Tipo de retorno:** a seta (`->`) é seguida pelo tipo de retorno da função. Se a função não retornar nada, o tipo de retorno é especificado como `()`
5. **Corpo da função:** o corpo da função é delimitado por chaves (`{}`) e contém o código executado quando a função é chamada

**Exemplo:**

```rust
fn soma(a: i32, b: i32) -> i32 {
    a + b
}

fn main() {
    let resultado = soma(3, 5);

    println!("O resultado da soma é: {}.", resultado);
}
```

Neste exemplo, `soma()` é uma função que aceita dois parâmetros `a` e `b`, ambos tipo `i32`, e retorna a soma desses valores como um `i32`. A função é chamada na `main()`, e o resultado é impresso no console.

Observe ainda que a palavra-chave `return` não é necessária, em Rust, a última expressão avaliada em uma função é implicitamente retornada. Assim, a função `soma()` pode ser definida de forma mais concisa sem o `return` explícito.

No exemplo acima, `a + b` é a última expressão na função, e seu valor é implicitamente retornado.

## `type`

Em Rust, a palavra reservada `type` é utilizada para criar um alias (apelido) para um tipo existente. Isso permite qye você crie um nome mais descritivo para um tipo complexo ou longo, tornado o código mais legível e fácil de entender.

A sintaxe básica para usar `type` é a seguinte:

```rust
type MeuTipo = TipoExistente;
```

**Aqui está um exemplo prático:**

```rust
type Idade = u32;

fn main() {
    let minha_idade: Idade = 25;

    println!("Minha idade é: {}.", minha_idade);
}
```

Neste exemplo, `Idade` é um alias para o tipo `u32` (um número sem sinal de 32 bits). Isso significa que você pode usar `Idade` em vez de `u32` em todo o seu código para representar idade, tornando o código mais legível.

O uso de `type` é especialmente útil quando se trabalha com tipos complexos, como tipos de retorno de funções, structs, enums, onde um nome mais significativo pode melhorar a clareza do código.

## `loop`

A palavra-chave `loop` em Rust é utilizada para criar um loop infinito. Esse loop não possui uma condição de termino, sendo executado continuamente até que seja interrompido explicitamente com uma instrução `break` ou até que ocorra uma condição de erro fatal (como um panic).

A estrutura básica de um loop `loop` em Rust é a seguinte:

```rust
loop {
    // Código a ser repetido infinitamente.

    // Utilize `break` para sair do loop sob certas condições.
    if alguma_condição() {
        break;
    }
}
```

**Principais características do** `loop`**:**

- **Loop infinito:** um loop `loop` é executado indefinidamente, a menos que seja explicitamente interrompido por uma instrução `break`
- **Sem condição de término:** ao contrário de outros loops, como `while` ou `for`, o `loop` não possui uma condição de término incorporada. Ele continuará executando indefinidamente até ser interrompido por um `break`
- **Uso de** `break`**:** para sair do loop, você utiliza a instrução `break`. Isso é geralmente condicionado a alguma lógica específica que determina quando o loop deve ser interrompido

**Exemplo de um loop** `loop` **simples:**

```rust
fn main() {
    let mut contador = 0;

    loop {
        println!("Loop infinito! Contador: {}.", contador);

        // Incrementa o contador.
        contador += 1;

        // Condição para sair do loop após cinco iterações.
        if contador == 5 {
            break;
        }
    }

    println!("Fim do programa.");
}
```

Neste exemplo, o loop `loop` imprime uma mensagem e incrementa um contador indefinidamente até que o contador alcance o valor de `5`, momento em que o loop é interrompido usando a instrução `break`.

## `match`

Em Rust, a palavra reservada `match` é usada para realizar controle de fluxo com base em padrões. É uma construção poderosa que permite combinar um valor contra uma série de padrões e executar o código associado ao primeiro padrão correspondente.

A sintaxe básica de uma expressão `match` em Rust é a seguinte:

```rust
match valor {
    padrão1 => {
        // Código a ser executado se o valor corresponder a `padrão1`.
    }
    
    padrão2 => {
        // Código a ser executado se o valor corresponder a `padrão2`.
    }

    _ => {
        // Código a ser executado se nenhum dos padrões anteriores corresponder.
    }
}
```

Aqui estão alguns conceitos-chave relacionados à palavra-chave `match`:

- **Padrões:** cada ramo do `match` inclui um padrão que o valor é comparado. Os padrões podem ser valores, intervalos, enumerações, etc.
- **Armazenamento (binding):** em cada ramo, você pode associar partes do valor correspondido a novos identificadores, conhecidos como "bindings". Isso permite que você use partes do valor correspondido no código do ramo
- **Padrão** `_`**:** o padrão `_` é um padrão de "coringa" que corresponde a qualquer valor. Pode ser usado para lidar com casos que você não deseja especificar explicitamente
- **Exaustividade:** o `match` em Rust é exigente quanto à exaustividade, o que significa que você deve lidar com todos os possíveis valores ou usar um padrão `_` para indicar que você está ciente de valores não tratados.

Aqui está um exemplo de código utilizando o `match`:

```rust
fn main() {
    let numero = 5;

    match numero {
        1 => println!("É um."),
        2 | 3 => println!("É dois ou três."),
        4..=7 => println!("Está entre 4 e 7, inclusive."),
        _ => println!("Não é nenhum dos casos anteriores.")
    };
}
```

Neste exemplo, o valor `numero` é correspondido contra diferentes padrões, e o código associado ao primeiro padrão correspondente é executado.

### `match` x `if`

Ambos `if` e `match` são construções de controle de fluxo em Rust, mas cada um tem seu propósito e casos de uso específicos. Vamos explorar as principais diferenças e quando você pode preferir um sobre o outro:

- `if`**:**
    + **Simplicidade para condições simples:**
        - O `if` é adequado para casos simples onde você precisa avaliar uma condição única
        - Pode ser mais legível e conciso em situações onde há apenas uma condição a ser verificada
    + **Condições booleanas:** bem adaptado pra avaliar condições booleanas diretas
- `match`**:**
    + **Combinação de padrões:**
        - O `match` é poderoso quando você precisa combinar um valor contra diferentes padrões
        - Útil para lidar com múltiplas condições ou valores diferentes
    + **Múltiplos casos:** permite lidar com várias condições em um único bloco, tornando o código mais estruturado
    + **Pattern matching:** melhor para usar com enumerações, structs, e tipos mais complexos onde você pode aproveitar o "pattern matching" para extrair e comparar partes de um valor

**Escolha entre** `if` e `match`**:**

- Use `if` quando tiver condições simples e diretas
- Use `match` quando precisar lidar com múltiplos padrões e realizar diferentes ações com base no valor

Em muitos casos, a escolha entre `if` e `match` é uma questão de preferência pessoal e legibilidade do código. No entanto, `match` é frequentemente preferido quando você está lidando com tipos complexos, enumerações ou necessidade de "pattern matching" mais avançadas.

Em termos de desempenho computacional, a escolha entre `if` e `match` geralmente não terá um impacto significativo. Ambas as construções são otimizadas pelo compilador Rust e, na maioria dos casos, a diferença de desempenho será insignificante.

Rust é projetada para ser uma linguagem de programação de alto desempenho, e o compilador realiza diversar otmizações para garantir que o código gerado seja eficiente. Diferenças de desempenho entre `if` e `match` são improváveis de serem notáveis em código Rust típico.

Na prática, ao tomar decisões de design, é geralmente mais importante priorizar a clareza e a legibilidade do código em relação ao desempenho microscópico de construções específicas. Escolher a construção que melhor expressa a intenção do código e facilita a manutenção é frequentemente mais valioso do que se preocupar com diferenças de desempenho insignificantes.

Se, por algum motivo, você encontrar uma situação específica onde a diferença de desempenho entre `if` e `match` se torna crítica, é sempre recomendável perfilar seu código para identificar gargalos reais e, possivelmente, considerar abordagens alternativas. No entanto, otimizações prematuras devem ser evitadas, e a clareza do código deve ser prioridade principal na fase inicial do desenvolvimento.

## `self`

Em Rust, a palavra reservada `self` é usada para se referir ao próprio valor de um objeto dentro dos métodos de uma estrutura ou enumeração. O uso de `self` em Rust é semelhante ao uso de `this` em outras linguagens de programação, mas Rust utiliza explicitamente `self`.

Existem diferentes formas de `self` em Rust, dependendo do contexto:

1. `self` **como Referência para a instância atual:** em métodos que não modificam o estado do objeto, você usará `&self` para referenciar a instância atual

**Exemplo:**

```rust
struct Pessoa {
    nome: String,
    idade: u32,
}

impl Pessoa {
    // Método que não modifica o estado (usa `&self`).
    fn exibir_informacoes(&self) {
        println!("Nome: {}, idade: {}.", self.nome, self.idade);
    }
}

fn main() {
    let pessoa = Pessoa {
        nome: String::from("Alice"),
        idade: 30,
    };

    pessoa.exibir_informacoes();
}
```

2. `self` **como referência mutável para a instância atual:** em métodos que modificam o estado do objeto, você usará `&mut self` para referenciar a instância atual de forma mutável.

**Exemplo:**

```rust
struct Contador {
    valor: u32,
}

impl Contador {
    // Método que modifica o estado (usa `&mut self`).
    fn incrementar(&mut self){
        self.valor += 1
    }
}

fn main() {
    let mut contador = Contador { valor: 0,};

    contador.incrementar();

    println!("Valor do contador: {}.", contador.valor);
}
```

3. `self` **como proprietário da instância atual:** em métodos que consomem a instância atual (a transformam em propriedade), você usará `self`

**Exemplo:**

```rust
struct Proprietario {
    dado: String,
}

impl Proprietario {
    // Método que consome a instância (usa `self`).
    fn obter_dado(self) -> String {
        self.dado
    }
}

fn main() {
    let objeto = Proprietario {
        dado: String::from("Informações confidencial"),
    };

    let informacao = objeto.obter_dado();

    println!("Informação obtida: {}.", informacao);
}
```

Em resumo, `self` em Rust é uma parte importante da definição de métodos em structs ou enums, permitindo que você acesse e manipule o próprio objeto ao qual o método está associado. A escolha entre `&self`, `&mut self`, ou `self` dependerá da natureza do método em relação à modificação ou consumo da instância.

# Operadores

### `?`

O operador de propagação de erro `?` em Rust é uma forma concisa de lidar com erros em funções que retornam `Result<T, E>` ou `Option`. Ele é usado dentro de funções que retornam um tipo que implementa o trait `std::ops::Try`, como os mencionados acima. Ele simplifica a verificação e propagação de erros, tornando o código mais legível e evitando a necessidade de repetir manualmente a verificação de erro.

Quando você usa o operador `?`, você está essencialmente dizendo ao Rust para extrair o valor dentro do `Result` em caso de sucesso (`Ok`) ou retornar o erro (`Err`) imediatamente, se houver um erro. Ele é frequentemente usado em funções que retornam `Result` para facilitar o encadeamento de operações que podem falhar. Quando usado dentro de uma função que retorna um `Result` ou `Option`, ele verifica automaticamente se o resultado é `Ok` ou `Some`. Se for `Err` ou `None`, ele retorna imediatamente, propagando o erro ou interrompendo a execução da função atual.

Aqui está um exemplo simples de como o operador `?` é usado:

```rust
use std::fs::File;
use std::io::{self, Read};

fn ler_conteudo_do_arquivo(caminho_do_arquivo: &str) -> io::Result<String> {
    let mut arquivo = File::open(caminho_do_arquivo)?;
    let mut conteudo = String::new();

    arquivo.read_to_string(&mut conteudo)?;
    Ok(conteudo)
}

fn main() {
    match ler_conteudo_do_arquivo("exemplo.txt") {
        Ok(conteudo) => println!("Conteúdo do arquivo: {}", conteudo),
        Err(err) => println!("Erro lendo o arquivo: {}", err)
    }
}
```

Neste exemplo, `File::open(caminho_do_arquivo)?` tenta abrir um arquivo, e se isso falhar, o erro é imediatamente retornado. Da mesma forma, `arquivo.read_to_string(&mut conteudo)?` tenta ler o conteúdo do arquivo, e um erro será retornado se a leitura falhar. Isso simplifica a lógica de tratamento de erros em comparação com a verificação manual em cada etapa.

Abaixo, iremos verificar que o operador de propagação de erro `?` é funcionalmente equivalente ao uso do `match` com `Ok(())` e `Err(err) => return Err(err)`. Ambas as abordagens lidam com a propagação de erros de maneira semelhante, mas a versão com `?` é geralmente mais concisa.

```rust
use std::error::Error;

fn funcao() -> Result<(), Box<dyn Error>> {
    Err("Erro simulado".into())
}

fn main() -> Result<(), Box<dyn Error>> {

    println!("`main()`");

    loop {
        // O `match` abaixo é equivalente a `funcao()?`
        match funcao() {
            Ok(()) => (),
            Err(err) => return Err(err)
        }
    }
}
```

# Importação e Módulo x Crate (`use`)

A palavra-chave `use` em Rust é usada para importar módulos, crates ou itens específicos em um escopo. Isso facilita a reutilização de código e a organização de namespaces. Por exemplo:

```rust
// Importa todo o módulo std::io
use std::io;

// Importa a função println do módulo std::fmt
use std::fmt::println

/* Sintaxe
use nome_do_crate::nome_do_módulo::nome_da_definição;

- O "nome_do_crate" só precisa ser especificado se ele for um crate externo
- Os "::" (dois pontos duplos) são usados para acessar definições dentro de módulos. Eles indicam uma hierarquia, semelhante à notação de ponto em algumas outras linguagens
- Você pode usar um asterisco no lugar do nome da definição para importar todas as definições de um módulo. Isso é conhecido como importação "glob", e pode ser útil para evitar a repetição de nomes no código

Sobre crate externos, para poder importá-los, ele deve ser listado como uma dependência em seu arquivo "Cargo.toml". A seção "[dependencies]" do arquivo "Cargo.toml" especifica os crates externos que seu projeto está utilizando.*/
```

Em Rust, "módulo" e "crate" são conceitos relacionados, mas têm significados ligeiramente diferentes:

- **Crates:** um "crate" em Rust é a unidade de compilação. Ele pode ser uma biblioteca (crate de biblioteca) ou um programa executável (crate de aplicativo). Um crate pode conter módulos e outras definições, e é a unidade básica de organização de código em Rust. Crates podem ser publicados e compartilhados através do sistema de gerenciamento de pacotes Cargo
- **Módulos:** um "módulo" em Rust é uma forma de organizar o código dentro de um crate. Ele permite agrupar denifições relacionadas, como funções, structs, enums, etc. Módulos ajudam a evitar conflitos de nomes e proporcionam uma estrutura lógica ao código. A palavra-chave `mod` é usada para criar módulos

A principal diferença entre crates e módulos é que um crate é a unidade de compilação e distribuição, enquanto um módulo é uma unidade organizacional dentro de um crate. Você pode ter múltiplos módulos em um único crate, e eles podem ser aninhados para criar uma hierarquia

Exemplo de um crate com módulos em Rust:

```rust
// Arquivo lib.rs (raiz do crate).
mod modulo_a {
    // Definições do módulo A.
}

mod modulo_b {
    // Definições do módulo B.
}

// Função principal do crate.
fn main() {
    // Código principal do programa.
}
```

Neste exemplo, `modulo_a` e `modulo_b` são módulos dentro do crate principal. Eles podem conter definições de funções, structs, enums, etc., ajudando a organizar o código de maneira modular.

Em, Rust, os módulos podem ser organizados em árvores hierárquicas sem a necessidade de especificar a crate a que pertencem. A organização de módulos em Rust ocorre no nível do próprio código-fonte, e a hierarquia é determinada pela estrutura de diretórios e pelos próprios módulos no código.

A hierarquia de módulos é refletida na organização dos arquivos e diretórios no projeto. Por exemplo, se você tem um arquivo **meu_modulo.rs** em um diretório chamado **modulos**, a estrutura pode parecer assim:

```plaintext
meu_projeto/
    src/
        modulos/
            meu_modulo.rs
    main.rs
```

Dentro do arquivo **main.rs**, você pode usar `modulos::meu_modulo` para referenciar o módulo `meu_modulo`. Não é necessário especificar a crate quando você está se referindo a módulos internos ao seu próprio projeto.

se você estiver referenciando módulos de outras crates, você precisará especificar a crate. Isso é feito usando o nome da crate como o primeiro componente do caminho do módulo. Por exemplo:

```rust
extern crate outra_crate;

use outra_crate::OutroModulo;
```

Aqui, `outra_crate` é o nome da crate externa, e `OutroModulo` é um módulo dentro dessa crate.

Portanto, para módulos internos ao seu projeto, você não precisa especificar explicitamente a crate, enquanto para módulos de outras crates, você deve indicar a crate no caminho do módulo.

### Auto Importação

Para realizar uma auto-importação (importação dos itens da sua própria crate), o nome do seu pacote no arquivo **Cargo.toml** deve ser usado na declaração `use` dentro dos seus arquivos código. O formato típico seria:

```toml
# No seu arquivo Cargo.toml.
[package]
name = "updater"
version = "1.0.0" # Por exemplo.
# ...
```

```rust
// No seu código, por exemplo, em main.rs.
use updater::*; // Importa todos os itens públicos da crate "updater"
```

Essa declaração permite que você use todos os itens públicos da sua própria crate, tornando-os disponíveis no escopo do arquivo de código onde você fez a importação. Dessa forma, você pode referenciar esses itens sem precisar usar o caminho completo da crate cada vez.

Lembre-se de que isso importa apenas os itens marcados como públicos (aqueles que têm a visibilidade `pub` no código-fonte da sua crate). Itens não marcados como públicos não serão importados dessa maneira.

Essa prática pode tornar o seu código mais conciso e legível, especialmente quando você tem muitos itens públicos em sua crate e deseja usá-los sem repetir o nome completo da crate em cada referência.

# Parâmetros

Em Rust, parâmetros podem aparecer em diferentes contextos, não apenas dentro de parênteses. Aqui estão alguns lugares onde você pode encontrar parâmetros em Rust:

1. **Parênteses de funções e métodos:** os parâmetros de função ou método são declarados dentro de parênteses. Exemplo:

```rust
fn exemplo(parâmetro: i32) {
    // Corpo da função.
}
```

2. **Sintaxe de traits e structs:** em definições de traits e structs, você pode usar parâmetros de tipo genérico para tornar o código mais flexível e reutilizável. Exemplo:

```rust
struct MinhaStruct<T> {
    campo: T
}

trait MinhaTrait<T> {
    fn minha_função(&self, parametro: T);
}
```

3. **Assinatura de enums:** enums também podem ter parâmetros, especialmente enums genéricas. Exemplo:

```rust
enum MinhaEnum<T> {
    Variante1(T),
    Variante2
}
```

4. **Parâmetros de macros:** macros podem ter parâmetros, e eles têm uma sintaxe específica. Exemplo:

```rust
macro_rules! minha_macro {
    ($parâmetro: expr) => {
        // Corpo da macro.
    };
}
```

5. **Parâmetros de closures:** closures podem receber parâmetros entre barras verticais. Exemplo:

```rust
let minha_closure = |parâmetro| {
    // Corpo da closure.
};
```

6. **Parâmetros de estruturas de controle:** em estruturas de controle como `if`, `match`, `for`, etc., você pode usar padrões e variáveis como parâmetros. Exemplo:

```rust
if let Some(parâmetro) = alguma_opção {
    // Corpo do bloco `if`.
}
```

Em Rust, os parâmetros podem ser encontrados em várias partes do código, dependendo do contexto em que são utilizados.

### Parâmetros de Tipo Genérico `<T, E> Result<T, E>`

As letras dentro dos sinais `<` e `>` em `<T, E>` são parâmetros do tipo genérico. Em Rust, esse parâmetros de tipo genérico são usados para tornar estruturas, enums, funções e métodos mais flexíveis e reutilizáveis, permitindo que trabalhem com diferentes tipos de dados.

Vamos analisar o significa específico de `<T, E> Result<T, E>`:

- `<T, E>`**:** aqui, `T` e `E` são parâmetros do tipo genérico
    + `T`**:** geralmente representa o tipo do valor de sucesso (`Ok`) em um `Result`
    + `E`**:** geralmente representa o tipo do erro (`Err`) em um `Result`
- `Result<T, E>`**:** é uma enumeração (enum) do Rust que representa um resultado que pode ser bem-sucedido (`Ok(T)`) ou conter um erro `(Err(E))`. Os parâmetros de tipo `T` e `E` permitem que `Result` seja parametrizado com tipos específicos para o valor de sucesso e o tipo de erro

Quando você vê `<T, E>` como parte de uma declaração, isso geralmente significa que a estrutura, função ou método é genérico em relação a esses tipos. Por exemplo, uma função que retona um `Result` pode ser definida para trabalhar com diferentes tipos de valores de sucesso e erros, tornado-a mais flexível e reutilizável em vários contextos.

Exemplo de função genérica com `Result` em Rust:

```rust
fn dividir(a: i32, b: i32) -> Result<i32, &'static str> {
    if b == 0 {
        // Se `b` for zero, retorna um erro.
        Err("Divisão por zero não é permitida.")
    } else {
        // Se `b` não for zero, retorna o resultado da divisão.
        Ok(a / b)
    }
}

fn main() {
    match dividir(10, 2) {
        Ok(resultado) => println!("Resultado: {}.", resultado),
        Err(erro) => println!("Erro: {}", erro)
    }
}
```

Neste exemplo, a função `dividir()` é genérica em relação aos tipos `i32` (valor de sucesso) e `&'static str` (tipo de erro), permitindo que ela seja usada com diferentes tipos de dados.

Vamos considerar mais casos com parâmetros genéricos:

- `-> Result <()>`
- `: Result<i32>`

Dentro dos sinais de menor (`<`) e maior (`>`) em Rust, você encontra parâmetros de tipo genérico. Esses parâmetros são espaços reservados para tipos específicos que podem ser fornecidos em tempo de compilação.

Vamos considerar os exemplos acima:

- `Result<()>`**:** neste contexto, `<>` indica um parâmetro de tipo genérico. No caso `Result<()>`, `()` é um tipo vazio em Rust. `Result<()>` significa que você tem um `Result` que pode conter um valor de sucesso de tipo vazio (`Ok(())`) ou um erro (`Err(E)`), onde `E` é um tipo específico que será inferido ou fornecido
- `Result<i32>`**:** `i32` indica que `Result` é parametrizado com um tipo de valor de sucesso `i32`. Assim, `Result<i32>` representa um `Result` que pode conter um valor de sucesso de tipo `i32` (`Ok(um_valor_i32)`) ou um erro (`Err(E)`), onde `E` seria um tipo específico

Em ambos os casos, a sintaxe `<T>` indica genericidade em relação ao tipo `T`. Quando você vê algo como `<T>` ou `<E>`, isso significa que o código é genérico e pode ser usado com diferentes tipos.

Exemplo de outra função genérica usando `Result` com parâmetros de tipo genérico:

```rust
fn exemplo_generico<T>(valor: T) -> Result<T, &'static str> {
    if algum_criterio(&valor) {
        Ok(valor)
    } else {
        Err("Algum critério não foi atendido.")
    }
}

fn algum_criterio<T>(valor: &T) -> bool {
    // Lógica para verificar algum critério no valor.
    true
}

fn main() {
    match exemplo_generico(42) {
        Ok(resultado) => println!("Resultado: {}", resultado),
        Err(erro) => println!("Erro: {}", erro)
    }
}
```

Neste exemplo, `exemplo_generico()` é uma função genérica que retorna um `Result` parametrizado com o tipo genérico `T`. A função pode ser usada com diferentes tipos, e a lógica de critério é aplicada ao valor do tipo `T`.

# Closures (`||`. `mut`)

Os dois pipes (`||`) após os parênteses em Rust representam a sintaxe para a criação de uma expressão de fechamento (closure). Em Rust, uma closure é uma função anônima que pode capturar variáveis do ambiente circundante.

A sintaxe geral de uma closure em Rust é a seguinte:

```rust
|| {
    // Código da closure.
}
```

- `||`**:** indica o início e o fim do bloco de código da closure
- `{}`**:** delimita o corpo da closure, onde você pode colocar o código que deseja executar

Em resumo, os dois pipes são usados para criar uma closure em Rust, e o código dentro da closure será executado quando o método que recebe a closure for chamado.

O escopo do ambiente circundante de uma closure em Rust inclui as variáveis que estão no mesmo escopo onde a closure é definida e que são capturadas por essa closure. Em Rust, existem três formas de capturar variáveis em closures, cada uma alterando como as variáveis são capturadas:

- `FnOnce`**:** a closure pode capturar variáveis por valor. Isso significa que ela possui a propriedade das variáveis capturadas e, portanto, pode consumi-las, impedindo o acesso a essas variáveis fora da closure. Isso geralmente acontece quando a closure possui a propriedade das variáveis capturadas e as move para dentro dela
- `FnMut`**:** a closure pode capturar variáveis por referência mutável. Isso permite que a closure modifique as variáveis capturadas, mas não as possua completamente. O acesso fora da closure ainda é possível, mas com restrições
- `Fn`**:** a closure pode capturar variáveis por referência imutável. Isso permite apenas leitura das variáveis capturadas

O escopo do ambiente circundante de uma closure é o escopo onde a closure é definida, não onde ela é chamada. Isso significa que as variáveis que são capturadas pela closure estão no mesmo escopo ou em escopos externos, mas não em escopos internos onde a closure é chamada.

Aqui está um exemplo para ilustrar:

```rust
fn main() {
    let x = 42;

    // Definindo uma closure que captura `x` por valor.
    let closure_fn_once = || {
        println!("Capturando por valor: {}.", x);
    };

    // Definindo uma closure que captura `y` por referência mutável.
    let mut y = 100;
    let mut closure_fn_mut = || {
        y += 1;
        println!("Capturando por referência mutável: {}.", y);
    };

    // Definindo uma closure que captura `x` por referência imutável.
    let closure_fn = || {
        println!("Capturando por referência imutável: {}.", x);
    };

    // Chamando as closures.
    closure_fn_once();
    closure_fn_mut();
    closure_fn();
}
```

Neste exemplo, `x` é capturado por valor pela primeira closure (`FnOnce`), y, por referência mutável pela segunda closure (`FnMut`), e x, por referência imutável pela terceira closure (`Fn`). O acesso fora das closures ainda é possível, mas a forma de captura determina o que é permitido fazer com essas variáveis dentro das closures.

Observe que as closures podem ser chamadas mesmo que você as declare como variáveis. Você as chama simplesmente invocando-as como se fossem funções.

Quanto à forma como as closures capturam as variáveis, isso é influenciado pelos "traits" associados a cada tipo de closure (`FnOnce`, `FnMut` e `Fn`). A inferência de trait é feita automaticamente pelo compilador com base no seu contexto de uso. Se o compilador identificar que a closure é chamada apenas uma vez (`FnOnce`), ele usará essa trait. Se a closure for chamada várias vezes, mas não modificar as variáveis capturadas, ele usará `Fn`. Se a closure for chamada várias vezes e modificar as variáveis capturadas, ele usará `FnMut`.

# Threads

Em Rust, o número de threads sendo executadas é geralmente uma informação que depende da lógica do seu programa. O módulo `std::thread` fornece ferramentas para criar e manipular threads, mas não possui uma função direta para consultar o número total de threads em execução. A gestão de threads é geralmente feita pelo próprio progama.

A função `std::thread::spawn()` é comumente usada para criar novas threads. Você pode ter tantas threads quanto forem necessárias para a lógica do seu programa. A biblioteca padrão de Rust não impõe limitações rígidas no número de threads que você pode criar, mas, na prática, há limites impostos pelo sistema operacional e pelo hardware.

Se você estiver interessado em monitorar o número de threads em execução em algum momento específico, isso geralmente envolve criar uma lógica personalizada para rastreá-las. Por exemplo, você pode manter um contador global que é atualizado cada vez que uma nova thread é criada e decrementado quando uma thread é encerrada.

Observe ainda que se você não criar **explicitamente** novas threads usando funções de criação de threads, então o código será executado na thread principal, também conhecida como "thread principal" ou "thread do main".

Quando você inicia um programa Rust, ele começa a execução na função `main()` na thread principal. Se você não criar explicitamente novas threads dentro do seu código, todo o código será executado na thread principal. Esta é a thread que começa a execução e também é a última a terminar.

A criação de novas threads é geralmente usada para paralelizar tarefas ou lidar com operações assíncronas. Se você não precisa de paralelismo ou assincronicidade, pode executar todo o seu código na thread principal sem a necessidade de criar novas threads explicitamente.

**Exemplo simples:**

```rust
fn main() {
    // Código executado na thread principal.

    // ...

    // Sem criação explicita de novas threads.
}
```

Neste exemplo, todo o código é executado na thread principal. Se você precisar realizar tarefas em parelelo ou de forma assíncrona, ai você usaria `std::thread::spawn()` ou outras abstrações para criar novas threads conforme necessário.

# Pedaços de Código dos Quais Você Pode Absorver Muita Coisa

### <a id = "combinedlogger-init"></a>`pub fn init(logger: Vec<Box<dyn SharedLogger>>) -> Result<(), SetLoggerError>`

1. **Método** `init`**:** este método é público (`pub`), o que significa que pode ser acessado de fora do módulo que define a struct `CombinedLogger`
2. **Parâmetros:** `logger` é um parâmetro do tipo `Vec<Box<dyn SharedLogger>>`. Aqui está o que cada parte significa:
    - `Vec<Box<dyn ShareLogger>>`**:** é um vetor que contém as caixas (`Box`) de tipos que implementam o trait `SharedLogger`. O `dyn` indica que os objetos dentro do vetor podem ser de qualquer tipo que implemente o trait `SharedLogger`
    - Isso sugere que você pode fornecer uma lista de loggers para serem combinados pelo `CombinedLogger`. Cada logger dentro do vetor deve implementar o trait `SharedLogger`
3. **Retorno:** `Result<(), SetLoggerError>`. O método retorna um `Result`, indicando sucesso ou falha na inicialização do logger combinado:
    - Se a inicialização for bem-sucedida, retorna `Ok(())`
    - Se ocorrer um erro, retorna `Err(SetLoggerError)`
4. **Exceções (Erro):** o método pode falhar ao inicializar o logger combinado, e a falha é representada pelo tipo `SetLoggerError`. Este tipo é parte da crate `simplelog` e é usado para representar erros relacionados à configuração de loggers
5. **Finalidade do método:** o propósito desse método é inicializar o `CombinedLogger` com uma lista de loggers fornecidos. Isso sugere que o `CombinedLogger` age como um proxy que roteia logs para vários loggers internos

### `Main()` Sendo Chamada de Forma Recursiva

```rust
use std::{time, thread, error::Error};

fn main_loop() -> Result<(), Box<dyn Error>> {
    Err("Erro simulado".into())
}

fn main() -> Result<(), Box<dyn Error>> {
    
    //logger();
    
    //info!("Starting program...");

    let sleep_time = time::Duration::from_secs(10);
    let sleep_error_time = time::Duration::from_secs(60);
    loop {
        //thread::sleep(sleep_time);
        match main_loop() {
            Ok(()) => println!("Program is running..."),
            Err(e) => {
                println!("Program has failed, reason: {}", e);
                println!("Sleeping 60 seconds to avoid excessive log and processing...");
                //thread::sleep(sleep_error_time);
                main()?;
            }
        }
    }
}
```

Considerando o contexto do código acima (levemente adaptado de um cenário real), a `main()` está sendo chamada de forma recursiva em certos cenários:

![`Main()` Sendo Chamada de Forma Recursiva.](../Imagens/main-recursiva.png)

Como podemos ver na imagem acima, toda vez que `main_loop()` retorna um `Err`, uma nova chamada a `main()?` é realizada e isso pode ocorrer de forma indefinida até que ocorra um stack overflow. Observe que isso ocorre quando `main_loop()` retorna um erro, caso, em algum momento, ocorra um erro fora do escopo da `main_loop()` (dentro de alguma invocação da `main()`), o operador de propagação de erro `?` garante que a invocação atual retorne o erro para quem a chamou, propagando o erro de invocação da `main()` para a invocação anterior, até a `main()` original, onde este retorno encerra a execução do programa.

Podemos observar o ponto mencionado acima no código abaixo:

```rust
use std::{time, thread, error::Error};

fn funcao() -> Result<(), Box<dyn Error>> {
    Err("Erro simulado".into())
}

fn main() -> Result<(), Box<dyn Error>> {

    println!("`main()`");

    loop {
        funcao()?
    }

    // Impressão nunca alcançada.
    println!("Final da `main()`.");
}
```

O operador de propagação de erro `?` propaga o erro, retornando-o, então o erro que ocorre em `funcao()` é propagado para a `main()` através de um `return`, o que encerrá o `loop`. A impressão "`Final da main().`" nunca é alcançada.

Quando você usa o operador de propagação de erro (`?`) em uma expressão de erro (`Result`), ele irá automaticamente retornar o erro para a função que o chamou, no caso do loop acima, a função `main()`. Isso significa que se a função `funcao()` retorna um erro, ele será automaticamente propagado para a função `main()` e o loop não será executado novamente.

O problema do código adaptado é que ele usa recursão sem nenhuma condição de parada (o operador de propagação de erro "funciona" como uma condição de parada).

Tenha em vista também que `Result<()>` é equivalente a `Result<(), ()>`. Em Rust, `()` é o tipo que representa unidade, e uma tupla vazia é denotada por `()`.

Em Rust, o tipo `Result<T, E>` é usado para representar o resultado de uma computação que pode falhar. `Result` é parametrizado por dois tipos: `T`, que é o tipo de valor de sucesso, e `E`, que é o tipo do erro. No caso de `Result<(), ()>`, tanto o tipo de sucesso quanto o tipo de erro são representado por `()`.

`()` é o único valor possível para o tipo de unidade em Rust. Ele é usado quando não há informação útil a ser transmitida ou quando o resultado é apenas para indicar sucesso ou falha.

Portanto, `Result<(), ()>` é usado quando a computação representa uma operação que pode falhar, mas não retorna nenhum valor útil no caso de sucesso ou erro. É uma maneira de indicar sucesso ou falha sem transmitir nenhum dado adicional. Isso é comumente usado quando o resultado da computação é usado apenas para indicar se a operação foi bem-sucedida ou não.

# Crates

## `log`

O módulo `log` faz parte da biblioteca padrão e é usado para facilitar a geração de logs em programas. Ele fornece uma interface comum para a criação e manipulação de mensagens de log, permitindo que os desenvolvedores personalizem a forma como as mensagens de log são tratadas.

O módulo `log` não implementa diretamente a saída real dos logs, mas define um conjunto de macros e um trait chamado `Log` que pode ser implementado por diferentes backends de logging. Os backends reais, responsáveis por gravar ou exibir os logs, são fornecidos por bibliotecas adicionais, como `env-logger` ou `log4rs`.

Principais elementos no módulo `log`:

- **Macros de logging:** o módulo `log` define várias macros para gerar mensagens de log em diferentes níves, como `debug!`, `info!`, `warn!`, e  `error!`
- **O trait** `Log`**:** o trait `Log` é implementado por tipos que desejam atuar como destinos de log. As mensagens de log geradas pelas macros são entregues a implementações específicas do trait `Log`
- **Configuração de logging:** a configuração do sistema de logging em Rust é frequentemente feita usando uma biblioteca específica, como `env_logger`. Essas bibliotecas fornecem configurações flexíveis para controlar o nível de log, o formato das mensagens, e para onde os logs devem ser direcionados (console, arquivo, etc)

Exemplo de uso do módulo `log`:

```rust
use log::{info, error};

fn main() {
    // Configuração do sistema de logging.
    env_logger::init();

    // Geração de mensagens de log.
    info!("Isso é uma mensagem de informação.");
    error!("Isso é uma mensagem de erro.")
}
```

Neste exemplo, `env_logger` é uma biblioteca popular para configuração de loggings em Rust, e `info!` e `error!` são macros fornecidos pelo módulo `log`. O nível de log mínimo e a formatação são controladas pela biblioteca `env_logger`, mas o código em si utiliza as macros do `log` para gerar as mensagens de log.

No exemplo acima, o `env_logger` não precisa ser explicitamente importado porque o código está usando macros do `log`, nas funções específicas do `env_logger`. A configuração e inicialização do sistema de logging ocorrem implicitamente quando `env_logger::init()` é chamado.

A biblioteca `env_logger` usa um inicializador implícito que é acionado quando você chama `env_logger::init()`. Isso significa que você não precisa importar explicitamente `env_logger` no código que está usando as macros do `log`. A biblioteca `env_logger` configura automaticamente os manipuladores de log para redirecionar mensagens de log para a saída do console.

Se você utilizar outras bibliotecas de logging em Rust, a importação pode ser necessária, dependendo da API específica que essas bibliotecas oferecem. No entanto, para o exemplo fornecido, a importação expĺícita de `env_logger` não é necessária.

### `info!` (macro)

`info!` é um macro fornecido pela biblioteca de logging chamada `log` em Rust. A macro `info!` é usada para gerar mensagens de log no nível de informação (info). Essa biblioteca é amplamente usada em ecossistemas Rust para facilitar o registro de mensagens de log em vários níveis, como debug, info, warn e error.

Quando você vê algo como `info!("Mensagem.");`, isso está usando a macro `info!` para criar uma mensagem de log no nível de informação. O texto "`"Mensagem."`" é a mensagem que será registrada.

Para usar a macro `info!`, você precisa adicionar a dependência da crate `log` no seu arquivo **Cargo.toml** e configurar um logger específico, como `env_logger`, para controlar o destino das mensagens de log.

**Exemplo básico do uso da crate** `log` **e** `env_logger`**:**

```rust
/* Adicione a dependência no seu Cargo.toml
[dependencies]
log = "0.4"
env_logger = "0.11"*/

use log::{info, LevelFilter};
use env_logger::Env;

fn main() {
    // Configuração do logger `env_logger`.
    env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();

    // Uso da macro `info!`.
    info!("Iniciando o programa...");

    // Restante do código...
}
```

Este exemplo inicializa o logger `env_logger` com um filtro de nível de informação (`"info"`). A partir desse ponto, você pode usar `info!` e outras macros fornecidas pela biblioteca `log` para gerar mensanges de log. Certifique-se de adicionar as versões corretas no seu arquivo **Cargo.toml** conforme necessário.

## `simplelog`

É uma crate que provê uma série de facilidades relacionadas a log, que podem ser facilmente combinada.

### `simplelog::CombinedLogger` (`struct`)

Provê uma implementação de logger que faz proxies de vários loggers como um só.

### `simplelog::CombinedLogger::init()` **(função)**

Método de inicialização. Inicializa globalmente o `CombinedLogger` como o único recurso de log usado.

[`pub fn init(logger: Vec<Box<dyn SharedLogger>>) -> Result<(), SetLoggerError>`](#combinedlogger-init)

### `simplelog::TermLogger` (`struct`)

Provê uma stderr/out baseada na implementação de um logger. Suporta saída colorida.

### `simplelog::TermLogger::new()` **(função)**

```rust
pub fn new(
    log_level: LeverFilter,
    config: Config,
    mode: TerminalMode,
    color_choice: ColorChoice
) -> Box<TermoLogger>
```

## `anyhow`

`anyhow` é uma biblioteca em Rust que simplifica a manipulação e tratamento de erros. Ela visa fornecer uma maneira mais ergonômica e conveniente de lidar com erros em comparação com a biblioteca padrão `Result` e o uso extensivo de `unwrap`, `expect` ou padrões de correspondência de erros.

**Exemplo de uso básico:**

```rust
use anyhow::{Result, anyhow};

fn dividir(a: i32, b: i32) -> Result<i32> {
    if b == 0 {
        return Err(anyhow!("Divisão por zero não é permitida."))
    }

    Ok(a / b)
}

fn main() {
    let resultado = dividir(10, 2);

    match resultado {
        Ok(valor) => println!("Resultado: {}.", valor),
        Err(e) => eprintln!("Erro: {}", e),
    }
}
```

Neste exemplo, a função `dividir()` retorna um `Result<i32>` usando `anyhow`. Se ocorrer um erro (divisão por zero), ele retorna um `Err` com uma mensagem de erro específica. Na `main()`, o resultado é tratado usando um padrão de correspondência para lidar com o sucesso (`Ok`) ou o erro (`Err`). A biblioteca `anyhow` facilita a construção e manipulação de erros de maneira mais expressiva.

### `anyhow::bail` (macro)

O macro `anyhow::bail!()` é um macro fornecido pela crate `anyhow` em Rust. O `bail!()` é usado para criar rapidamente um erro `Result` contendo uma mensagem de erro fornecida como argumento. Ele é uma maneira conveniente de criar um erro e interromper a execução de uma função quando algo inesperado ocorre.

**Exemplo de como usá-lo:**

```rust
use anyhow::Result;

fn minha_funcao() -> Result<()> {
    if algo_inesperado_aconteceu() {
        anyhow::bail!("Algo inesperado aconteceu!") // Cria um erro simulado e interrompe a função.
    }

    Ok(())
}

fn algo_inesperado_aconteceu() -> bool {
    true // Exemplo simples para fins de demonstração.
}

fn main() {
    match minha_funcao() {
        Ok(_) => println!("Tudo ocorreu como esperado!"),
        Err(e) => eprintln!("Erro: {}", e),
    }
}
```

Neste exemplo, `anyhow::bail!("Algo inesperado aconteceu!")` cria um erro `Result` com uma mensagem específica, interrompendo a execução da função e retornando o erro. O código no bloco seguinte a essa chamada nãoo será executado.

O uso de `anyhow::bail` é particularmente útil quando você deseja propagar um erro de uma maneira concisa e legível. O macro `bail!()` é uma maneira conveniente de criar um `Result::Err` sem a necessidade de criar explicitamente um `Result::Err(ErrKind::Msg(...))`.

### `anyhow::Context` (`trait`)

`anyhow::Context` é um compenente crucial na biblioteca `anyhow` em Rust. `Context` é uma trait (um tipo de interface em Rust) que estende o comportamento de um tipo `Result<T, E>`, permitindo adicionar informações contextuais aos erros.

Quando você usa `Context`, você pode encadear métodos adicionais para adicionar informações úteis a uma falha. O método mais comum é o `context()`:

```rust
use anyhow::{Result, Context};

fn exemplo() -> Result<(), anyhow::Error> {
    let resultado: Result<(), anyhow::Error> = Err(anyhow::anyhow!("Erro ao realizar algo importante."));

    resultado.context("Mensagem de erro que será impressa.")?;

    Ok(())
}

fn main() {
    if let Err(e) = exemplo() {
        eprintln!("Erro: {}", e); // Saída: Erro: Mensagem de erro que será impressa.
    }
}
```

Neste exemplo,  `context()` é usado para adicionar uma mensagem de contexto ao erro. Isso pode ser útil para entender melhor onde ocorreu o problema no código. A mensagem fornecida ao `context()` será incorporada ao erro se o resultado for um `Err`.

### `anyhow::Result` (`type`)

Em Rust, `anyhow::Result` refere-se ao ao tipo de resultado (`Result`) fornecido pela biblioteca `anyhow`. A crate `anyhow` é projetada para simplificar o manuseio de erros em Rust, fornecendo um tipo de erro mais flexível e mensagens de erro mais informativas.

O tipo `anyhow::Result` é um abstração sobre o tipo `Result` padrão de Rust, que é geralmente usado para representar resultados que podem ser bem-sucedidos (`Ok`) ou conter um erro (`Err`). A principal diferença entre `anyhow::Result` e o `Result` padrão é o tipo do erro.

Em um `Result` padrão, o tipo de erro é muitas vezes bastante específico, e isso pode tornar a manipulação de erros um pouco mais rigída. `anyhow::Result`, por outro lado, usa um tipo de erro mais genérico e flexível, que é `anyhow::Error`. Este tipo de erro pode conter informações de erro formatadas de uma maneira mais amigável.

**Exemplo de como usá-lo:**

```rust
use anyhow::Result;

fn minha_funcao() -> Result<()> {
    if algo_inesperado_aconteceu() {
        anyhow::bail!("Algo inesperado aconteceu!") // Cria um erro simulado e interrompe a função.
    }

    Ok(())
}

fn algo_inesperado_aconteceu() -> bool {
    true // Exemplo simples para fins de demonstração.
}

fn main() {
    match minha_funcao() {
        Ok(_) => println!("Tudo ocorreu como esperado!"),
        Err(e) => eprintln!("Erro: {}", e),
    }
}
```

Neste exemplo, `minha_funcao()` retorna um `Result<()>` usando `anyhow::Result`. Se algo der errado dentro da função, `anyhow::bail!()` é usado para criar um erro `Result` com uma mensagem específica. O bloco seguinte à chamada de `bail!()` não será executado.

Ao lidar com `anyhow::Result`, você pode se beneficiar de mensagens de erro mais expressivas e flexibilidade no tipo de erro mais expressivas e flexibilidade no tipo de erro, o que pode tornar o código mais fácil de entender e manter.

Observe ainda que `anyhow::Result` é um **alias** para o **tipo** `Result` mais geral de Rust que utiliza a crate `anyhow`.

Em Rust, o tipo `Result` é uma enumeração genérica que pode ter dois variantes: `Ok(T)` para representar um resultado bem-sucedido contendo um valor do tipo `T`, e `Err(E)` para representar um erro contendo um valor do tipo `E`. A biblioteca padrão de Rust usa a enumeração `Result` para representar operações que podem falhar.

A biblioteca `anyhow` introduz uma abstração chamada `Result` que é um alias para o `Result` padrão de Rust, mas usando a enumeração `anyhow:Error` como o tipo de erro. A enumeração `anyhow::Error` é um tipo que pode conter mensagens de erro formatadas e infomações adicionais.

Então, para ser preciso:

`anyhow::Result<T>` é um alias para `Result<T, anyhow::Error>`, onde `anyhow::Error` é uma enumeração que pode representar mensagens de erro formatadas.

Em resumo, `anyhow::Result` é uma abstração que utiliza a enumeração `anyhow::Error` para fornecer uma representação mais flexível e informativa de erros em comparação com o `Result` padrão de Rust.

Para apronfundar o entendimento, vamos analisar a definição básica de `anyhow::Result` na biblioteca `anyhow`, que é algo como:

```rust
pub type Result<T> = std::result::Result<T, anyhow::Error>;
```

Essencialmente, isso significa que `anyhow::Result<T>` é apenas uma abreviação para `Result<T, anyhow::Error>`. Isso simplifica a assinatura de funções e o retorno de resultados, especialmente quando se está trabalhando com a biblioteca `anyhow`. Você pode usar `Result<T>` em vez de `Result<T, anyhow::Error>` para tornar o seu código mais conciso e legível.

### `unwrap()` **(método)**

1. Este é um metódo associado ao trait `Result`, comum em Rust e frequentemente utilizado com a crate `anyhow`
2. **O que ele faz:** o método `unwrap()` é usado para obter o valor armazenado dentro de `Ok` se o `Result` for `Ok`. Se o `Result` for `Err`, ele irá paniciar, encerrando o programa com uma mensagem de erro
3. `Assinatura do método`**:** a assinatura é geral e se aplica a qualquer `Result`

```rust
impl<T, E> Result<T, E> {
    fn unwrap(self) -> T {
        // Corpo do método.
    }
}
```

4. **Parâmetros:** `self`. Isso consome o `Result`, transferindo a propriedade do valor contido dentro de `Ok`. Se o `Result` for `Err`, causará um panic
5. **Retorno:** retorna o valor armazenado dentro de `Ok` se o `Result` for `Ok`. Caso contrário, gera um panic com a mensagem de erro do `Err`
7. **Exemplo de uso (**`anyhow`**):**

```rust
use anyhow::Result;

fn exemplo() -> Result<()> {
    let resultado: Result<i32> = Ok(42);
    let valor_desembrulhado = resultado.unwrap();

    println!("Valor desembrulhado: {}.", valor_desembrulhado);

    let resultado_erro: Result<i32> = Err(anyhow::anyhow!("Algo deu errado!"));
    // O `unwrap()` a seguir causaria um panic, encerrando o programa.
    // let valor_erro = resultado_erro.unwrap();

    Ok(())
}

fn main() {
    exemplo().unwrap();
}
```

Esse exemplo utiliza `anyhow` para criar um `Result` e, em seguida, usa `unwrap()` para desembrulhar o valor contido em `Ok`. Se o `Result` for `Err`, o programa encerrará com um panic.

# Boas Práticas

### `,`

Incluir a vírgula após o último item em listas, structs, enums e outras estruturas de dados é considerada uma boa prática em Rust. Existem várias razões para isso:

1. **Facilita a adição ou remoção de itens:** adicionar ou remover itens se torna mais simples, pois você não precisa se preocupar em adicionar ou remover vírgulas dependendo da positção do item
2. **Consistência e clareza:** manter uma vírgula consistente após o último item torna o código mais consistente e fácil de ler. Cada item na lista tem a mesma estrutura, o que ajuda na legibilidade
3. **Facilita a comparação e revisão do código:** ao visualizar alterações em sistemas de controle de versão ou ao revisar o código, é mais fácil identificar as alterações quando a vírgula está presente. Isso pode ser particularmente útil em ambientes colaborativos

Ambas as formas, utilizar a vírgula após o último item ou não, são aceitas pelo compilador, e a escolha pode depender das preferências da equipe de desenvolvimento. No entanto, a prática mais comum em comunidades Rust é incluir a vírgula após o último item para manter a consistência e facilitar a manutenção do código.