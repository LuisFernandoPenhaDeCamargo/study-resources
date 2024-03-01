# Rust

### Sumário

- [Utilitários](#utilitarios)
- [Livro: A Linguagem de Programação Rust](#livro-linguagem-programacao-rust)
    + [Obtenção do Livro em Português](#obtencao-livro-portugues)
- [Introduction](#introduction)
- [1. Getting Started](#1-getting-started)
    + [1.1 Installation](#11-installation)
    + [1.2 Hello, World!](#12-hello-world)
        - [Anatomia de Um Programa em Rust](#anatomia-programa-rust)
        - [Compilar e Executar são Etapas Separadas](#compilar-executar-etapas-separadas)
    + [1.3 Hello, Cargo!](#13-hello-cargo)
        - [Criando Um Projeto com o Cargo](#criando-projeto-cargo)
        - [Construindo e Executando um Projeto Cargo](#construindo-executando-projeto-cargo)
- [3. Common Programming Concepts](#3-common-programming-concepts)
    + [3.1 Variables and Mutability](#31-variables-and-mutability)
        - [Constants](#constants)
        - [Shadowing](#shadowing)
    + [3.2 Data Types](#32-data-types)
        - [Scalar Types](#scalar-types)
        - [Compound Types](#compound-types)
    + [3.3 Functions](#33-functions)
        - [Parameters](#parameters)
        - [Statements and Expressions](#statements-expressions)
        - [Functions with Return Values](#functions-with-return-values)
- [21. Appendix](#21-appendix)
    + [21.1 A - Keywords](#211-a-keywords)
- [Executando Código em Rust](#executando-codigo-rust)
- [Boas Práticas](#boas-praticas)

# <a id="utilitarios"></a>Utilitários

- `rustup`**:** ferramenta de gerenciamento de versão do Rust e de utilitários associados
- `rustc`**:** ferramenta de compilação
- `rustfmt`**:** ferramenta de formatação de código para a linguagem de programação Rust. Ela é usada para garantir que o código escrito em Rust siga as convenções de estilo recomendadas pela comunidade

A principal finalidade do `rustfmt` é automatizar o processo de formatação do código-fonte, tornando-o consistente e legível.

Ambos `rustc` e `rustfmt` estão inclusos na instalação do `rustup`.

# <a id="livro-linguagem-programacao-rust"></a>Livro: A Linguagem de Programação Rust

### <a id="obtencao-livro-portugues"></a>Obtenção do Livro em Português

Para ler o livro no modo offline, você precisa do utilitário `mdbook` instalado. Você pode obtê-lo com o comando `cargo install mdbook`.

Após a instalação do utilitário, você utiliza o comando `mdbook build` para "construir o livro". Isso basicamente significa que ele vai pegar os arquivos **.md** e transformá-los em um formato que possa ser utilizado pelo seu navegador (**.html**).

Os arquivos **.md** se encontram em um repositório, então você deve cloná-lo e **utilizar o comando de construção no clone do repositório** (no diretório criado pelo comando de clone).

Para abrir o livro no google-chrome você pode executar o comando `google-chrome book/index.html`.

# <a id="introduction"></a>Introduction

Se você precisa de um resumo do que será visto nos próximos capítulos, no final da "Introduction", em "How to Use This Book", temos o que você precisa.

# <a id="1-getting-started">1. Getting Started

## <a id="11-installation"></a>1.1 Installation

```bash
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

Acho interessante pontuar que o que o comando faz é baixar um script e começar a instalação do utilitário `rustup`, o qual instá-la a última versão estável do Rust.

Rust também precisa de um linker, que é um programa que o Rust usa para juntar a saída das suas compilações em um arquivo. É algo que você provavelmente já tem, mas caso um erro de link seja gerado, você deve instalar um compilador de C, pois ele provavelmente irá incluir um linker. Um compilador de C também é útil por conta que vários pacotes comuns do Rust dependem de codigo C e vão precisar de um compilador de C.

Usuários Linux provavelmente vão precisar instalar o GCC ou o Clang.

## <a id="12-hello-world"></a>1.2 Hello, World!

```rust
// main.rs
fn main() {
    println!("Hello, World!");
}
```

Você utiliza o comando: 

```bash
rustc nome_do_arquivo.rs
```

para compilar o arquivo e depois

```bash
./nome_do_arquivo
```

para executá-lo.

### <a id="anatomia-programa-rust"></a>Anatomia de Um Programa em Rust

```rust
fn main() {

}
```

As linhas de código acima definem uma função chamada `main()`. A função `main()` é especial, é sempre o primeiro código a ser executado em todo executável em um programa Rust. A função `main()` não tem parâmetros, se ela tivesse, eles deveriam estar dentro de `()`.

O corpo da função está envolto por `{}`. Rust requer as chaves em volta de todos os corpos das funções. A abertura das chaves define onde o corpo da função começa e o fechamento das chaves define onde o corpo da função termina.

No arquivo **main.rs**, a linha `println!("Hello, World!");` invoca um macro, não uma função. Usar `!` significa que você está invocando um macro e não uma função, macros nem sempre seguem as mesmas regras que uma função.

A string `"Hello, World!"` é passada como um argumento para `println!()`. A string é impressa em tela.

A linha termina com um ponto e vírgula `;`, o ponto e vírgula indica que uma expressão terminou e a próxima está pronta pra começar. A maioria das linhas em 
Rust terminam em ponto e vírgula.

### <a id="compilar-executar-etapas-separadas"></a>Compilar e Executar são Etapas Separadas

Antes de executar um programa Rust, você deve compila-lo. Após a compilação, um binário executável será gerado.

## <a id="13-hello-cargo"></a>1.3 Hello, Cargo!

Cargo é o sistema de construção e o gerenciador de pacotes do Rust. Ele é muito utilizado pela comunidade Rust porque lida com várias tarefas para você, como construir o seu código, fazer o download de bibliotecas que o seu código utiliza, além de construir as bibliotecas mencionadas anteriormente (nos referimos as bibliotecas que o nosso código utiliza, depende de, de dependências).

O Cargo já vem instalado com o Rust, se você o instalou Rust através do processo citado na seção 1.1.

### <a id="criando-projeto-cargo"></a>Criando Um Projeto com o Cargo

```bash
cargo new hello_cargo
```
O comando acima, cria um novo diretório chamado `hello_cargo`. Dentro dele, o cargo cria um arquivo **Cargo.toml** e um diretório chamado **src**, dentro de **src** é criado um arquivo chamado **main.rs**.

O diretório criado pelo Cargo (**hello_cargo**) ja é inicializado como um novo repositório Git e, também já possui, o arquivo **.gitignore**. Arquivos Git não serão gerados se você executar o `cargo new` dentro de um repositório Git já existente.

O conteúdo do arquivo **Cargo.toml** deve ser similar a:

```toml
[package]
name = "hello_cargo"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
```

**Cargo.toml** está na formato TOML (Tom's Obvious, Minimal Language), que é o formato de configuração do Cargo.

A primeira linha, `[package]`, é o título da seção que indica que as próximas declarações são configurações de pacote.

As próximas três linhas definem as informações de configuração que o Cargo precisa para compilar o programa, o nome, a versão, e a edição do Rust que será usada.

A última linha, `[dependencies]`, é o começo da seção para você listar qualquer uma das dependências do seu projeto. Em Rust, pacotes de código são denominados como **crates**.

O arquivo **main.rs** possuirá um "Hello, world!" gerado automaticamente.

O Cargo espera que seus arquivos "source" (fonte) estejam dentro da pasta **src**. O nível superior do diretório do projeto é usado somente para arquivos README, informação de licença, arquivos de configuração, e qualquer coisa que não seja relacionado ao código. Usar o Cargo ajuda a organizar os projetos. "Há um lugar para tudo e tudo está no lugar".

Se você começou um projeto sem o Cargo, que não o usa, você pode converte-lo em um que usa. Mova seu código fonte para o diretório **src** e crie um arquivo **Cargo.toml** apropriado.

### <a id="construindo-executando-projeto-cargo"><>Construindo e Executando um Projeto Cargo

No seu diretório **cargo_hello**, construa o seu projeto usando o comando:

```bash
cargo build
```

Esse comando cria um executável em **target/debug/hello_cargo**, porque a construção padrão é a construção de "debug" (depuração). O Cargo coloca o executável no diretório chamado **debug**. Você pode executar o executável com o comando:

```bash
./target/debug/hello_cargo
```

Executando `cargo build` pela primeira vez também faz o Cargo criar um novo arquivo no nível superior do diretório do projeto: **Cargo.lock**. Este arquivo acompanha as exatas versões das dependências no seu projeto. Você nunca precisará mudar este arquivo manualmente, o Cargo gerencia o conteúdo para você.

Nós construímos o projeto com `cargo build` e o executamos com `./target/debug/hello_cargo`, mas nos também podemos usar `cargo run` para compilar o código e executar o executável resultante.

```bash
cargo run
```

Usar `cargo run` é mais conveniente do que usar `cargo build` e depois usar o caminho até o binário.

Observe que, se seu código não possuir modificações, `cargo run` irá descobrir isso, então ele só executará o binário. Caso você modifique o seu código fonte, Cargo reconstruirá o seu projeto antes de executá-lo.

Cargo também provê o comando `cargo check`, este comando analisa rapidamente o seu código para verificar se é possível compila-lo, mas não produz um executável.

```bash
cargo check
```

Este comando é muito útil se você estiver querendo verificar se o seu trabalho ainda é compilável, pois não gerar um executável acelera bastante este processo.

# <a id="3-common-programming-concepts"></a>3. Common Programming Concepts

## <a id="31-variables-and-mutability"></a>3.1 Variables and Mutability

Variáveis, **por padrão, são imutáveis**. Esta é uma forma que o Rust te incentiva a escrever código que aproveita a segurança e a concorrência que ele oferece. Ainda assim, você pode tornar elas mutáveis, vamos observar o porque o Rust te encoraja a ser a favor da imutabilidade e porque, as vezes, você pode querer optar variáveis mutáveis.

Quando a variável é imutável, uma vez que o valor é vinculado ao nome, você não pode mudar o valor. Para ilustrar isso, vamos gerar um projeto chamado **variables**, no nosso arquivo **main.rs**, estará o código abaixo:

```rust
fn main() {
    let x = 5;

    println!("O valor de x é: {x}");

    x = 6;

    println!("O valor de x é: {x}");
}
```

A compilação do código acima gera um erro relacionado a imutabilidade. Erros de compilação podem ser frustrantes, mas eles simplesmente significam que o seu programa não está fazendo de forma segura o que você quer que ele faça, ainda.

Você recebeu a mensagem de erro `cannot assign twice to immutable variable 'x'`, porque você tentou atribuir um segundo valor a variável imutável `x`.

Se um erro de compilação não fosse gerado quando tentamos mudar o valor de uma variável imutável, esta situação poderia levar a vários bugs. Se uma parte do nosso código parte do pressuposto que um valor nunca vai mudar e a outra parte do código muda este valor, é possível que a primeira parte não fará o que foi designada para fazer. A causa deste tipo de problema pode ser difícil de rastrear, especialmente quando a segunda parte do código muda o valor, somente, as vezes. O compilador do Rust garante que quando você pontua que um valor não vai mudar, ele realmente não muda, assim, você não precisa ficar de olho, você mesmo. Seu código é, portanto, mais fácil de raciocinar.

Entretanto, mutabilidade pode ser muito útil, fazendo até com que o código seja mais conveniente de escrever. Apesar das variáveis serem imutáveis por padrão, você pode torna-las mutáveis as declarando como `mut`. Declarar uma variável como `mut` indica aos leitores do código que outras partes do código iram alterar o valor da variável.

Vamos arrumar o código acima, a versão do código que ficará salva no projeto é a versão funcional.

```rust
fn main() {
    let mut x = 5;

    println!("O valor de x é: {x}");

    x = 6;

    println!("O valor de x é: {x}");
}
```

Nos é permitido alterar o valor vinculado a `x` de `5` para `6` porque `mut` é utilizada. Utilizar ou não mutabilidade depende inteiramente de você e o que você acha que ficará mais claro em determinada situação.

### <a id="constants"></a>Constants

Assim como variáveis imutáveis, **constantes** são valores que são vinculados a um nome e não é permitido alterar ele, mas há algumas diferenças entre `const` e variáveis.

Primeiramente, você não pode utilizar `mut` com constantes, constantes não são simplesmente imutáveis por padrão, elas são **sempre imutáveis**. Você declara constantes utilizando a palavra-chave `const` ao invés de `let`, e o tipo do valor **deve** ser especificado. Variáveis declaradas como `let` podem ter o seu tipo inferido, como dito antes, variáveis declaradas como `const`, devem ter o seu tipo especificado.

Constantes podem ser declaradas em qualquer escopo, inclusive o escopo global, o que faz delas úteis para valores que serão utilizadas em vaŕias partes do código.

A última diferença entre constantes e outras variáveis é que o seu valor deve ser uma expressão constante, seu valor não pode ser o resultado de um valor que só pode ser obtido em tempo de execução.

Abaixo, temos um exemplo de uma declaração constante:

```rust
const TRES_HORAS_EM_SEGUNDOS: u32 = 60 * 60 * 3;
```

O nome da constante é `TRES_HORAS_EM_SEGUNDOS` e o seu valor é uma combinação do resultado da multiplicação `60 * 60 * 3`. A convenção de nomeação de constantes em Rust é que ela deve estar completamente em maiúsculo com undescore entre as palavras. O compilador consegue calcular um limitado conjunto de operações em tempo de compilação, o que nos permite escolher entre escrever o valor de uma maneira que é fácil de ler e entender o seu significado, ao invés de escrever o valor resultante da expressão, que pode ser difícil de compreender. Em um capítulo a frente, veremos quais operações podem ser usadas quando declarando constantes.

Constantes são válidas por toda a execução do programa, considerando o escopo no qual foram declaradas. Esta propriedade faz de constantes úteis para valores que serão utilizados em várias partes do domínio da sua aplicação.

Nomear valores que ficarão codificados permanentemente em seu programa como constantes é útil para transmitir o significado desse valor para futuros mantenedores do código. Isso também ajuda a ter um lugar específico em seu código, caso você precise atualizar no futuro, valores que são codificados permanentemente.

### <a id="shadowing"></a>Shadowing

Você pode declarar uma nova variável com o mesmo nome de uma variável já existente. Rustaceans falam que a primeira variável foi "shadowed" (sombreada) pela segunda, o que significa que a segunda variável é a que o compilador vai enxergar quando você usar o nome da variável. O que acontece é que a segunda variável ofusca a primeira, assumindo o controle do uso do nome da variável, até ela ser ofuscada, ou o seu escopo terminar. Nos podemos sombrear uma variável usando o nome dela em outra declaração.

```rust
fn main() {
    let x = 5;
    let x = x + 1;

    {
        let x = x * 2;

        println!("O valor de x neste escopo é: {x}");
    }

    println!("O valor de x é: {x}");
}
```

O código acima vincula `x` ao valor `5`. Então, cria uma nova variável `x`, ao repetir `let x =`, utilizando o valor original de `x` e adicionando `1` a ele. Depois, dentro do escopo interno criado com as chaves, uma terceira declaração de `x` é realizada e cria uma nova variável, ofuscando a variável anterior. O seu valor é o valor anterior multiplicado por `2`. Quando o escopo acaba, o sombreamento interno termina e o valor de `x` volta a ser `6`.

Sombrear é diferente de marcar uma variável como `mut`, porque nós iremos receber um erro em tempo de compilação, caso a gente, acidentalmente, tente reatribuir a variável sem utilizar a palavra-chave `let`. Ao utilizar `let`, nos conseguimos realizar algumas transformações no valor, mas possuir uma variável imutável após as transformações terem sido completadas.

Outra diferença entre `mut` e sombrear é que, quando sombreamos, estamos efetivamente criando uma nova variável ao utilizar a palavra-chave `let`. Com isso, podemos mudar o tipo do valor da variável, mas reutilizar o nome.

```rust
let espaco = "     "; // Uma quantidade de espaços em branco (5).
let espaco = espaco.len(); // O tipo foi alterado.
```

O primeiro `espaco` é uma variável do tipo string e a segunda é uma variável do tipo number. Sombrear nos poupa de ter que escolher diferentes nomes, como, `espaco_str` e `espaco_num`, ao invés disso, podemos simplesmente reutilizar `espaco`. Contudo, se tentarmos fazer isso utilizando a palavra-chave `mut`, um erro será gerado, nos informando que não podemos mudar o tipo de uma variável mutável.

```rust
let mut espaco = "     ";
espaco = espaco.len();
```

**Exemplo interessante:**

```rust
fn main() {
    let mut x: u32 = 1;

    {
        let mut x = x; // O `x` do escopo interno consegue enxergar o valor de `x` do escopo externo. O `x` interno deixa de existir quando o escopo em que ela se encontra termina.
        x += 2;

        println!("x: {x}"); // Saída: 3
    }

    /* Caso fizessemos o seguite:
    let x = "Olá";
    A saída abaixo seria "Olá". Isso é permitido pois estamos declarando uma nova variável, por isso é permitido um novo valor de tipo diferente. Pelo o que eu entendi, **a ideia do sombreamento é reutilizar o valor, apesar do tipo do valor acabar mudando**.
    */

    println!("x: {x}"); // Saída: 1
}
```

## <a id="32-data-types"></a>3.2 Data Types

Todo valor em Rust é de um certo tipo de dado, essa especificação é o que diz a ele como trabalhar com aquele dado. Iremos observar dois subconjuntos de dados, escalar e composto.

Tenha em mente que o Rust é uma linguagem de tipagem estática, o que significa que o Rust sabe os tipos de todas as variáveis em tempo de compilação. O compilador consegue, normalmente, **inferir** o tipo que nos desejamos baseado no valor da variável e como nós a utilizamos. Nos casos em que vários tipos são possíveis, por exemplo, quando convertemos uma `String` para um tipo númerico utilizando `parse()`, nós devemos denotar o tipo:

```rust
let variavel: u32 = "42".parse().expect("Não é um número.");
```

Se nós não adicionarmos a anotação de tipo, `: u32`, o Rust irá exibir um erro relacionado ao fato que o compilador precisa de mais informação sobre qual o tipo do valor que nós queremos usar.

### <a id="scalar-types"></a>Scalar Types

Um tipo escalar representa um valor único. Rust possui quatro tipos escalares primários: integers (inteiros), floating-point numbers (números de ponto flutuante), booleans (booleanos) e characters (caracteres).

**Integers Types**

Um inteiro é um número sem o componente fracionário. A tabela abaixo ilustra a variação dos tipos inteiros.

|Comprimento|Signed|Unsigned|
|---|---|---|
|8-bit|i8|u8|
|16-bit|i16|u16|
|32-bit|i32|u32|
|64-bit|i64|u64|
|128-bit|i128|u128|
|arch|isize|usize|

Cada variação pode ser "signed" ou "unsigned" e tem um tamanho explícito. "Signed" e "unsigned" se refere a ser possível para o valor ser negativo ou não, se um número é "unsigned", ele só será positivo.

Cada variante que depende do sinal ("signed", "i". Pode ser positiva ou negativa) pode armazenar números de -(2^(n-1)) até 2^(n-1)-1, onde n é o número de bits que a variação usa. Então um i8 pode armazenar números de -(2^7) a até (2^7)-1, que é igual a -128 a até 127. Variações "unsigned" podem armazenar números que vão de 0 até (2^n)-1, então, um u8, pode armazenar de 0 a até (2^8)-1, que é igual a 0 a até 255.

Adicionalmente, os tipos `isize` e `usize` dependem da arquitetura do computador no qual o seu programa está sendo executado, o que é denotado na tabela como "arch": 64 bits se você está em uma arquitetura 64-bits e 32 bits se você está em uma arquitetura 32-bits.

Você pode escrever inteiros literais em qualquer uma das formas da tabela acima. Observe que literais numéricos que podem ser vários tipos numéricos permitem um tipo de sufixo, como `57u8`, para designar o tipo (com exceção dos bytes). Literais numéricos também podem usar "_" como separador visual para facilitar a leitura do número, como 1_000, que terá o mesmo valor que 1000 (se tivesse sido especificado desta forma),

Literais inteiros.

|Números literais|Exemplo|
|---|---|
|Decimal|98_222|
|Hexadecimal|0xff|
|Octal|0o77|
|Binário|0b1111_0000|
|Byte (u8 apenas)|b'A'|

Caso você não esteja seguro sobre qual tipo de integer usar, os valores padrões do Rust geralmente são um bom lugar para começar. O padrão para tipos inteiros é `i32`. A primeira situação na qual você terá que usar `isize` e `unsize` é quando estiver indexando algum tipo de coleção.

**Integer Overflow (Estouro de Número Inteiro)**

Vamos considerar o cenário no qual você tem uma variável do tipo `u8` (em que o valor associado a ela é do tipo `u8`), então você aceita valores no intervalo de 0 a até 255. Se você tentar mudar o valor dela para algo fora desse intervalo, como 256, por exemplo, um estouro de número inteiro irá ocorrer, o que pode resultar em dois tipos de comportamento. Quando você está compilando no modo depuração ("debug"), Rust inclui verificações de estouro de número inteiro que fazem com que o seu programa entre em pânico ("panicking") em tempo de execução se esse comportamento ocorrer. Rust usa o termo entrar em pânico quando um programa é encerrado com um erro.

Quando você está compilando em modo de liberação ("release"), com a opção `--release`, Rust não inclui uma checagem para estouro de número inteiro que causará pânico. Ao invês disso, caso o estouro de memória de número inteiro ocorrá, Rust irá realizar dois embrulhos ("wrapping") complementares. Em resumo, valores maiores que o máximo que o tipo aceita envolvem em torno ("wrap around") do valor mínimo que o tipo aceita. Neste caso (`u8`), o valor 256 se torna 0, o valor 257 se torna 1, e assim por diante. O programa não irá ser encerrado ("entrar em pânico"), mas a variável irá estar vinculada a um valor que provavelmente não é o que você está esperando que ela possua. Confiar no comportamento pontuado acima, no qual os valores acima do máximo envolvem em torno dos valores mínimos, é considerado um erro.

Para tornar explícito o fato que o código lida com a possibilidade de estouro, você pode utilizar os seguintes método disponibilizados pela biblioteca padrão do Rust ("standard libray", `std`) para tipos númerico primitivos:

- Envolva todos os modos com o método `wrapping_`*, por exemplo, `wrapping_add`
- Retorne o valor `None` caso ocorra um estouro nos métodos que utilizam `checked_*`
- Retorne o valor e um booleano indicando se houve ou não um estouro nos método que utilizam `overflowing_*`
- Saturar no valor mínimo ou máximo com os métodos que utilizam `saturating_*`

**Floating-Point Types**

Rust também tem dois tipos primitivos para números de ponto flutuante, os quais são números com casas decimais. Os tipos de ponto flutuante do Rust são `f32` e `f64`, os quais possuem tamanho 32 bits e 64 bits, respectivamente. O tipo padrão para pontos flutuantes é `f64`, porque nas CPU's mais modernas, a velocidade é praticamente a mesma do `f32`, mas é capaz de uma precisão maior. Todos os números de ponto flutuante são signed.

Um exemplo de código que usa números de ponto flutuante:

```Rust
// main.rs
fn main() {
    let x = 2.0; // `f64`
    let y: f32 = 3.0; // `f32`
}
```

Números de ponto flutuante são representados de acordo com o padrão IEEE-754. O tipo `f32` tem precisão simples, o `f64` tem precisão dupla.

**Operações Númericas**

Rust suporta as operações matemáticas básicas para todos os tipos númericos: adição, subtração, multiplicação, divisão e resto. A divisão inteira trunca em direção a zero para o número inteiro mais próximo. O código a seguir mostra como você usa cada operação númerica com a declaração `let`.

```Rust
// main.rs
fn main() {
    // Adição.
    let sum = 5 + 10;

    // Subtração.
    let difference = 95.5 - 4.3;

    // Multiplicação.
    let product = 4 * 30;

    // Divisão.
    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3; // Resulta em -1.

    // Resto.
    let remainder = 43 % 5;
}
```

Cada expressão nestas declarações usa um operador matemático e avalia como um único valor, o qual é vinculado a uma variável. O apêndice **B - Operators and Symbols** contém uma lista com todos os operadores que o Rust provê.

**The Boolean Type**

Booleanos podem possuir um de dois valores: `true` e `false`. Booleanos possuem um byte de tamanho. O tipo booleano é especificado em Rust usando `bool`. Por exemplo:

```Rust
fn main () {
    let t = true;
    let f: bool = false; // Anotação de tipo explicita.
}
```

A principal maneira de usar valores booleanos é através de condicionais, por exemplo, a expressão `if`.

**The Character Type**

O tipo `char` do Rust é o tipo alfabético mais primitivo da linguagem. A seguir temos alguns exemplos da declaração de valores `char`:

```Rust
// main.rs
fn main() {
    let c = 'z';
    let z: char = 'Z'; // Anotação de tipo explicita.
    let heart_eyed_cat = '😻';
}
```

Observe que especificamos literais `char` com aspas simples, para literais string, nos usamos aspas duplas. O tipo `char` do Rust tem quatro bytes de tamanho e representa um valor escalar Unicode, o que significa que ele pode representar muito mais do que apenas ASCII. Letras acentuadas, caracteres japoneses, chineses, e coreanos, emojis, e espaços de largura zero são todos valores `char` válidos em Rust. Valores escalares Unicode vão de `u+0000` a até `u+D7FF`, e de `U+E000` a até `U+10FFFF`, inclusive. Entretanto, um "caracter" não é realmente um conceito em Unicode, então a intuição humana sobre o que é um "caracter" pode não corresponder ao que é um caracter em Rust. Veremos isto de forma detalhada no Capítulo 8.

### <a id="compound-types"></a>Compound Types

Tipos compostos podem agrupar múltiplos valores em um tipo. Rust possui dois tipos compostos primitivos: tuplas e arrays.

**The Tuple Type**

Uma tupla é uma maneira genérica de agrupar um número de valores com uma variedade de tipos em um tipo composto. Tuplas tem um comprimento fixo, uma vez declarada, ela não pode crescer ou diminuir em tamanho.

A forma de criar uma tupla é escrevendo uma lista de valores, separados por vírgula, dentro de um parênteses. Cada posição da tupla possui um tipo, e os tipos dos diferentes valores dentro da tupla não precisam ser iguais. No exemplo abaixo, nós adicionamos a notação de tipo opcional:

```Rust
// main.rs
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);
}
```

A variável `tup` é vinculada a toda a tupla, porque uma tupla é considerada um único elemento composto. Para obter valores individuais da tupla, nos podemos usar correspondência de padrões para desestruturar o valor da tupla, desta forma:

```Rust
// main.rs
fn main() {
    let tup = (500, 6.4, 1);
    let (x, y, z) = tup;

    println!("The value of y is: {y}");
}
```

O programa acima, primeiro cria uma tupla e víncula a ela a variável `tup`. Então ele usa o padrão com `let` para pegar `tup` e tornar isto em três variáveis separadas, `x`, `y` e `z` (a variável `tup` ainda existe e mantém os seus valores). Isto é chamado de desestruturação, porque isso quebra uma única tupla em três partes. Finalmente, o programa imprime o valor de `y`, que é `6.4`.

Observe que não podemos desestruturar a tupla em uma quantidade de elementos menor que o seu comprimento.

Nós também podemos acessar um elemento da tupla diretamente utilizando a notação de ponto (`.`), seguido pelo índice do valor que nós queremos acessar. Por exemplo:

```Rust
// main.rs
fn main() {
    let x: (i32, f64, u8) = (500, 6.4, 1);
    let five_hundred = x.0;
    let six_point_four = x.1;
    let one = x.2;
}
```

O programa acima cria uma tupla `x` e acessa cada elemento da tupla utilizando seu respectivo índice. Como na maioria das linguagens de programação, o primeiro índice de uma tupla é 0.

Uma tupla sem qualquer valor tem um nome especial, **unit**. Este valor e o seu tipo correspondente são escritos utilizando parênteses vazios (`()`) e representam um valor vazio ou um tipo de retorno vazio. Expressões retornam implicitamente o valor unit se elas não retornam nenhum outro valor.

**The Array Type**

Outra forma de ter uma coleção de múltiplos valores é com um array. Diferentemente da tupla, cada elemento de um array deve possuir o mesmo tipo. Arrays em Rust, diferentemente de outras linguagens, possuem um comprimento fixo.

Para escrever valores em um array, nós os colocamos dentro de colchetes, separados por vírgulas.

```Rust
// main.rs
fn main() {
    let a = [1, 2, 3, 4, 5];
}
```

Arrays são úteis quando nós queremos alocar os dados na stack ao invés de aloca-los na heap, ou quando você quer garantir que você possui uma quantidade fixa de elementos. Arrays não são flexíveis como vetores, um vetor é similar a um tipo de coleção. Eles são disponibilizados pela biblioteca padrão (standard library) e podem crescer ou encolher de tamanho.

Arrays são muito úteis quando você sabe que a quantidade de elementos não irá mudar. Por exemplo, se vpcê está usando os nomes dos meses em seu programa, você provavelmente deve usar um array, porque você sabe que ele irá conter 12 elementos.

```Rust
let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
```

Para especificar o tipo do array, você utiliza colchetes, dentro dele, você pontua o tipo dos valores, ponto e vírgula, e a quantidade de elementos do array.

```Rust
let a: [i32; 5] = [1, 2, 3, 4, 5];
```

Acima, cada valor possui o tipo `i32`. O número 5, após o ponto e vírgula, indica que o array contém 5 elementos.

Você também pode inicializar um array que contém o mesmo valor para cada elemento, especificando o valor inicial, seguido por ponto e vírgula, e o tamanho do array. Como é mostrado abaixo:

```Rust
let a = [3; 5];
```

O array acima irá conter `5` elementos, todos eles irão possuir o valor inicial `3`. Esta é uma forma mais concisa de escrever `let a = [3, 3, 3, 3, 3];`.

Um array é um pedaço de memória conhecido, de tamanho fixo, que pode ser alocado na stack. Você pode acessar seus elementos utilizando índices.

```Rust
// main.rs
fn main() {
    let a = [1, 2, 3, 4, 5];
    let first = a[0];
    let second = a[1];
}
```

No exemplo acima, a variável chamada `first` irá obter o valor `1` e a variável chamada `second` irá obter o valor `2`. Índices em arrays também começam em 0.

**Exemplo interessante:**

```Rust
// main.rs
fn main() {
    let tuple = ([1; 2], [3; 4]); // `tuple` é, basicamente, `([1, 1], [3, 3, 3, 3])`.
    let (position_zero, _position_one) = tuple;

    // `tuple.1[0]`, é a segunda posição da tupla (o índice 1, o vetor `[3, 3, 3, 3]`), pegando depois o índice 0 do vetor.
    println!("Sum of position_zero[0] + tuple.1[0]: {}", position_zero[0] + tuple.1[0]);
}
```

**Invalid Array Element Acess**

Considere o código abaixo:

```Rust
// main.rs
use std::io;

fn main() {
    let a = [1, 2, 3, 4, 5];

    println!("Please enter an array index.");

    let mut index = String::new();

    io::stdin()
        .read_line(&mut index)
        .expect("Failed to read line");
    
    let index: usize = index
        .trim()
        .parse()
        .expect("Index entered was not a number");

    let element = a[index];

    println!("The value of the element at index {index} is: {element}");
}
```

O código acima compila com sucesso. Se você fornecer um valor de 0 a 4 para o programa, o valor deste índice no array será impresso, mas caso você forneça um valor igual ao comprimento do array ou maior, o programa irá panicar.

O programa irá resultar em um erro em tempo de execução. Ele será encerrado com uma mensagem de erro e a impressão final não será realizada. Quando você tenta acessar um elemento usando indexação, Rust irá verificar se o índice é menor que o comprimento do array, caso ele seja igual ou maior, Rust irá panicar. Esta checagem ocorre em tempo de execução, especialmente no caso acima, porque não é possível para o compilador saber o valor que o usuário irá fornecer ao código.

Este é um exemplo dos princípios de segurança de memória do Rust em ação. Em muitas linguagens de baixo nível, este tipo de checagem não é feita e quando você fornece um índice inválido, uma posição de memória inválida pode ser acessada. Rust te protege contra este tipo de erro, encerrando a execução imediatamente, ao invés de permitir o acesso de memória.

## <a id="33-functions"></a>3.3 Functions

Funções são predominantes em Rust. E nós já vimos as funções mais importantes na linguagem: `main()`, que é o ponto de entrada para os programas escritos em Rust. Com isso, nós também acabamos por ver a palavra-chave `fn`, a qual permite a declaração de funções.

Rust usa a convenção de estilo "snake case" para funções e nome de variáveis, esta convenção dita que todas as letras devem ser minúsculas e "palavras separadas", devem ser separadas por um underscore. Abaixo temos um programa que contém um exemplo de definição de funções:

```Rust
// main.rs
fn main() {
    println!("Hello, world!");

    another_function();
}

fn another_function() {
    println!("Another function.");
}
```

Nós definimos uma função em Rust utilizando a palavra-chave `fn` seguida pelo nome da função e um conjunto de parênteses. As chaves dizem ao compilador onde o corpo da função começa e onde ele termina.

Nós podemos invocar qualquer função já definida utilizando o seu nome seguido por um conjunto de parênteses. Observe que no exemplo acima `another_function()` é definida após a `main()`, nós também poderíamos ter definido ela antes da `main()`. Rust não se importa onde você define suas funções, desde que elas estejam definidas em algum lugar no escopo que é visível pelo seu invocador.

Vamos iniciar um novo projeto chamado **functions**, para assim, explorar funções mais a fundo.

### <a id="parameters"></a>Parameters

Nós podemos definir funções que possuem parâmetros, que são variáveis especiais que fazem parte da assinatura da função. Quando uma função tem parâmetros, você pode prover valores concretos para eles, tecnicamente falando, o nome dos valores concretos fornecidos para uma função são argumentos.

```Rust
// main.rs
fn main() {
    another_function(5);
}

fn another_function(x: i32) {
    println!("The value of x is: {x}");
}
```

A declaração de `another_function()` possui um parâmetro, chamado `x`, o tipo de `x` é `i32`. Quando nós passamos `5` para `another_function()`, o macro `println!` coloca ele no lugar de `{x}`.

Na assinatura de funções, você deve declarar o tipo de cada parâmetro. Isto é uma decisão de design do Rust: requerer a anotação explicita de tipo significa que o compilador, provavelmente, não vai precisar que você utilize a função em algum lugar para descobrir o tipo do parâmetro. Isso também significa que o compilador vai ser capaz de fornecer mensagens de erro mais úteis, pois ele sabe que tipos a função espera.

Quando você vai definir uma função que possui múltiplos parâmetros, separe cada parâmetro com uma vírgula:

```Rust
// main.rs
fn main() {
    print_labeled_measurement(5, 'h');
}

fn print_labeled_measurement(value: i32, unit_label: char) {
    println!("The measurement is: {value}{unit_label}");
}
```

O exemplo acima cria uma função chamada `print_labeled_measurement()` com dois parâmetros, o primeiro, é chamado `value` e seu tipo é `i32`, o segundo, é chamado `unit_label` e seu tipo é `char`. A função imprime o texto contendo os valores de `value` e `unit_label`.

Por conta de termos invocado a função com os seguintes valores como argumentos `5` e `h`, a saída do programa irá as conter.

### <a id="statements-expressions"></a>Statements and Expressions

Os corpos da função são feitos de uma série de declarações, terminando, opcionalmente, em uma expressão. Até então, as funções que nós abordamos não incluem uma expressão final, mas nós vimos expressões como parte de uma declaração. Por conta de Rust ser uma linguagem baseada em expressões, está é uma distinção importante de se entender. Outras linguagens não fazem essa distinção, então vamos analisar as diferenças entre declarações e expressões e como elas afetam o corpo das funções:

- **Statements** (declarações) são instruções que realizão algum tipo de ação e não retornam um valor
- **Expressions** (expressões) são avaliadas em um valor resultante

```Rust
// main.rs
fn main() {
    let y = 6;
}
```

A definição de funções é uma declaração, o exemplo anterior como um todo, é uma declaração em si.

Declarações não retornam valoes, então, você não pode atribuir uma declaração `let` a declaração de outra variável, como o código abaixo exemplifica, isso irá gerar um erro.

```Rust
fn main() {
    let x = (let y = 6);
}
```

A declaração `let y = 6` não retorna um valor, então não há nada para vincular a `x`. Isso funciona de forma diferente para outras linguagens, como C e Ruby, onde as atribuições retornam o valor da atribuição. Nessas linguagens você pode fazer `x = y = 6`, fazendo com que ambos `x` e `y`, possuam o valor `6`; não é assim que Rust funciona.

Expressões são avaliadas em um valor e compõem boa parte do código que você escreverá em Rust. Considere a seguinte operação matemática, 5 mais 6, é uma expressão que é avaliada no valor 11. Expressões podem fazer parte de declarações, na declaração acima, `let y = 6`, é uma expressão que resulta no valor 6; invocar uma função é uma expressão, chamar um macro é uma expressão. Um novo escopo criado com chaves é uma expressão, por exemplo:

```Rust
fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y os: {y}");
}
```

a expressão

```Rust
{
    let x = 3;
    x + 1
}
```

é um bloco, que neste caso, é avaliado em `4`, O valor é vinculado a `y` como parte da declaração `let`. Observe que a linha `x + 1` não possue um ponto e vírgula ao final, diferentemente da maioria das linhas que vimos até então. Expressões não terminam com ponto e vírgula, se você adicionar um ponto e vírgula ao final de uma expressão, você torna ela em uma declaração, e ela não orá retornar um valor.

### <a id="functions-with-return-values"></a>Functions with Return Values

# <a id="21-appendix"></a>21. Appendix



## <a id="211-a-keywords"></a>21.1 A - Keywords

Tópico que lista as palavras-chave, com poucas explicações, mas muito útil.

# <a id="executando-codigo-rust"></a>Executando Código em Rust

- Instale o Rust
- Tenha um Ponto de Entrada
- Compile o arquivo
- Execute o executável gerado pela compilação

# <a id="boas-praticas"></a>Boas Práticas

- Para nome de arquivos, se você for utilizar mais de uma palavra, as separe por um underscore
- A abertura de chaves deve estar na minha linha da declaração da função e estar separada dela por um espaço em branco
- Rust utiliza quatro espaços ao invés do TAB
- Nomes de variáveis constantes devem estar completamente em maiúsculo