### Sumário

- **Rust**
- **Cross e a Compilação de Binários Estáticos Compatíveis**
- **Target**
- **Arquivo Makefile no Formato TOML**
- **Executando Um Código Feito em Rust**
- **Rust e o Seu Ponto de Entrada**
- **Cargo**
- **Macros**
    + `macro`
    + `macro_rules!`
    + `vec![]`
- **Traits (**`trait`**)**
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
    + `std`
        - `println` **(macro)**
        - `std::time`
        - `std::thread`
        - `std::time::Duration` **(**`struct`**)**\
            + `std::time::Duration::from_secs()` **(método)**
        - `std::thread::sleep()` **(função)**
        - `std::sync::Once::new()` **(método)**\
            + `std::sync::Once` **(**`struct`**)**
            + `std::sync::Once::call_once()` **(função)**
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

# Rust

Rust é uma linguagem de programação de sistema que se concentra em oferecer segurança de memória sem a necessidade de coletor de lixo. Ela foi desenvolvida pela Mozilla e é projetada para ser rápida, concisa e eficiente em termos de recursos, enquanto fornece garantias de segurança de alto nível.

- Seu gerenciador de pacotes (package manager) é o Cargo
- Seu gerenciador de versões é o rustup
- Seu compilador é o rustc

Aqui estão alguns pontos-chaves sobre Rust:

1. **Segurança de memória:** Rust utiliza um sistema de propriedade que permite que o compilador detecte e previna erros de acesso inválido à memória, como referências nulas, ponteiros inválidos e vazamentos de memória
2. **Concorrência:** a linguagem tem suporte embutido para concorrência e paralelismo
3. **Sistema de tipos estáticos:** Rust é uma linguagem de tipagem estática, o que significa que o tipo de uma variável é verificado em tempo de compilação. Isso ajuda a evitar muitos erros que, de outra forma, poderiam ocorrer em tempo de execução
4. **Sintaxe expressiva:** a sintaxe de Rust é moderna e expressiva, tornando-a agradável de se trabalhar. Ela adota ideias de outras linguagens, mas também traz suas próprias inovações
5. **Ecossistema e ferramentas:** Rust possui um ecossistema crescente de bibliotecas e ferramentas. O gerenciador de pacotes padrão é o Cargo, que facilita a criação, compilação e distribuições de projetos Rust
6. **Comunidade ativa:** Rust tem uma comunidade ativa e engajada, com muitos recursos, tutoriais e documentação disponíveis. Aleḿ disso, ela é conhecida por sua ênfase na inclusão e na promoção de um ambiente amigável
7. **Uso versátil:** embora Rust seja frequentemente usada para desenvolvimento de sistemas e programação de baixo nível, ela também é adequada para uma variedade de aplicativos, incluindo servidores, ferramentas de linha de comando e até mesmo desenvolvimento web

Para começar a programar em Rust, você pode instalar o compilador Rust e o Cargo. A documentação oficial em rust-lang.org é um excelente ponto de partida, fornecendo tutoriais, guias e exemplos.

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
- Execute o comando `cargo run`
    - Ele irá executar o comando `cargo build`
    - Ele irá criar o arquivo **Cargo.lock**
    - Ele irá criar a pasta target, a qual contém em seu subdiretório o executável do seu código fonte

# Rust e o Seu Ponto de Entrada

Em Rust, para criar uma aplicação executável, você precisa de um ponto de entrada, e o ponto de entrada padrão é a função `main`. A convenção é ter essa função no arquivo chamado **main.rs** na raiz do projeto. Se você quiser usar um nome diferente para o arquivo ou ter vários arquivos com funções `main`, você precosa indicar ao Cargo como lidar com eles.

- **Convenção padrão:**
    + Tenha um arquivo **main.rs** na raiz do projeto
    + A função `main` neste arquivo é o ponto de entrada padrão
    + Você pode usar `cargo run` para compilar e executar o programa
- **Outros nomes de arquivo:**
    + Se você desejar usar um nome diferente para o arquivo (por exemplo, **nome_do_arquivo.rs**), você precisa indicar isso ao Cargo
    + Use `cargo run --bin nome_do_arquivo` para compilar e executar o programa quando a função `main` está em **nome_do_arquivo.rs**
- **Múltiplos pontos de entrada:**
    + Se você tem vários arquivos com funções `main`, você pode usar um diretório **src/bin/** para organizá-los
    + Cada arquivo em **src/bin** é tratado como um ponto de entrada separado
    + Use `cargo run --bin nome_do_arquivo` para especificar qual ponto de entrada executar

Em resumo, a função `main` é necessária para criar uma aplicação executável, e a convenção padrão é ter essa função em um arquivo chamado **main.rs**. Você pode personalizar isso, mas precisa informar ao Cargo como lidar com seus pontos de entrada alternativos.

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

# Traits (`trait`)

Em Rust, um "trait" é um mecanismo que permite a definição de comportamentos compartilhados entre tipos. É uma maneira de declarar um conjunto de métodos que um tipo pode implementar, permitindo que vários tipos compartilhem funcionalidades comuns.

Os traits em Rust são semelhantes às interfaces em outras linguagens de programação, mas têm algumas características distintas. Um trait define um comportamento que pode ser implementado por tipos específicos.

Aqui está um exemplo básico de como você pode definir um trait e implementá-lo para um tipo:

```rust
// Definfindo um chamado "Exemplo".
trait Exemplo {
    // Método do trait
    fn mostrar(&self);
}

// Implementando o trait "Exemplo" para o tipo i32.
impl Exemplo for i32 {
    fn mostrar(&self) {
        println!("Este é um número: {}.", self);
    }
}

// Implementando o trait "Exemplo" para o tipo &str.
impl Exemplo for &str {
    fn mostrar(&self) {
        println!("Esta é uma string: {}", self);
    }
}

fn main() {
    let numero: i32 = 42;
    let texto: &str = "Olá, Mundo!";

    // Chamando o método "mostrar()" para o tipo i32.
    numero.mostrar();

    // Chamando o método "mostrar()" para o tipo &str.
    numero.mostrar();
}
```

Neste exemplo, o trait `Exemplo` é definido com um método chamado `mostrar()`. Ele é então implementado para os tipos `i32` e `&str`. O método `mostrar()` é chamado para instâncias desses tipos no `main()`, demonstrando como os traits permitem compartilhar comportamentos entre tipos diferentes.

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

## `std`

A biblioteca `std` em Rust é a biblioteca padrão que faz parte do ambiente de execução padrão da linguagem. Ela fornece as funcionalidades essenciais necessárias para a maioria dos programas em Rust. Aqui estão algumas das principais características da biblioteca `std`:

1. **Tipos básicos:** inteiros, ponto flutuante, booleanos, caracteres, strings, slices, etc
2. **Coleções:** vetores, slices, strings, hash maps, hash sets, listas duplamente vinculadas, etc
3. **Operações de E/S (Entrada/Saída):** manipulação de arquivos, leitura e gravação, formatação de strings, etc
4. **Concorrência e sincronização:** Threads, canais, Mutex, Arc (Atomic Reference Counting), etc
5. **Gestão de memória:** smart pointers, Box, Rc (Reference Counting), Arc, etc
6. **Manipulação de tempo:** tipos para representar datas e horas, temporizadores, etc
7. **Manipulação de erros:** Result, Option, tipos para lidar com erros, etc
8. **Manipulação de strings:** métodos e funções para manipular strings, conversão, etc
9. **Padrões de correspondências:** macros e funcionalidades relacionadas a padrões
10. **Ponto de entrada principal (main):** o ponto de entrada principal para a execução de programas Rust

Ao criar um programa Rust, você não precisa importar explicitamente a biblioteca padrão `std`, pois ela é automaticamente incluída em todos os programas Rust. Portanto, você pode usar os tipos e funções fornecidos pela `std` sem precisar de uma declaração de importação explícita.

```rust
fn main() {
    // Exemplo de uso da biblioteca std.
    let texto = "Olá, Rust!";

    println!("{}", texto);
}
```

Neste exemplo, a função `println!()` é uma macro fornecida pela biblioteca `std`, que é usada para imprimir texto no console. A string "`Olá, Rust!`" é uma string literal e é parte dos tipos básicos fornecidos pela `std`.

```rust
use std::{thread, time, sync::Once};

fn main() {
    let now = time::Instant::now();

    thread::sleep(time::Duration::from_secs(2));

    let elapsed = now.elapsed();
    let once = Once::new();

    // Restante do código...
}
```

- `thread` **e** `time`**:** ambos são módulos do prelúdio padrão, o que significa que suas funcionalidades estão disponíveis por padrão sem uma importação explicíta. Então, tecnicamente, você pode usar `std::thread` e `std::time` sem importá-los explicitamente. São módulos que contêm funcionalidades relacionadas a threads e manipulação de tempo, respectivamente
- `sync::Once`**:** `sync` é um módulo no `std` que contém várias estruturas e tipos relacionados a sincronização. Neste caso, você precisaria importar explicitamente `std::sync::Once` para usá-lo em seu código. <a id = "once"></a>`Once` é uma estrutura de sincronização fornecida no módulo `sync` dentro do crate `std`

Lembre-se de que, enquanto alguns itens podem estar disponíveis sem uma importação explícita, é uma prática comum e boa legibilidade do código importar explicitamente os itens que você está usando. Isso torna mais claro para os leitores do código de onde vêm esses itens e facilita a compreensão do código.

### `std::time::Duration` (`struct`)

`Duration` é um tipo em Rust que representa uma duração de tempo. Ele faz parte do módulo `std::time` e é usado para representar um intervalo específico de tempo. A unidade básica de medida para `Duration` em Rust são os segundos, mas você pode criar durações em outras unidades de tempo usando métodos ou operações aritméticas.

A expressão `time::Duration::from_secs(valor)` cria uma instância de `Duration` representando `valor` segundos. Aqui está uma explicação mais detalhada:

- `time:Duration`**:** este é o tipo `Duration` fornecido pelo módulo `std::time`
- `from_secs(valor)`**:** este é um método associado à struct `Duration` que cria uma `Duration` a partir de uma quantidade de segundos. Neste caso, `from_secs()` está sendo usado para criar uma `Duration` representando `valor` segundos

**Exemplo de uso em código:**

```rust
use std::time::Duration;

fn main() {
    // Criando uma `Duration` de 10 segundos.
    let duration = Duration::from_secs(10);

    // Use a `Duration` como necessário, por exemplo, em uma pausa (sleep)
    std::thread::sleep(duration);

    println!("Passaram-se 10 segundos.");
}
```

Neste exemplo, `Duration::from_secs(10)` cria uma `Duration` de 10 segundos, que é usada para fazer o programa esperar por 10 segundos usando `std::thread::sleep(duration)`. Isso é comumente usado em situações em que você precisa introduzir pausas em seu programa por um determinado período de tempo.

### `std::thread::sleep()` (função)

`sleep()` é uma função do módulo `std::thread` em Rust. Vamos abordar suas características:

1. **Tipo:** `sleep()` é uma função do módulo `std::thread`. Ela não está associada a uma instância específica de um tipo, então não é um método
2. **O que ele faz:** `sleep()` é usado para suspender a execução da thread atual por um determinado período de tempo
3. **Assinatura da função:** a assinatura da função `sleep()` é a seguinte `pub fn sleep(tempo: Duration)`. Isso significa que ela aceita um argumento do tipo `Duration` que especifica a quantidade de tempo que a thread deve ficar suspensa
4. **Parâmetros:** `tempo`. Um parâmetro do tipo `Duration`, que indica por quanto tempo a thread deve ser suspensa. Esse parâmetro é obrigatório
5. **Retorno:** a função `sleep()` não retorna um valor útil. Ela apenas suspende a execução da thread
6. **Exemplo de uso:**

```rust
use std::{hread, time::Duration};

fn main() {
    println!("Início do programa.");

    // Suspender a execução da thread por dois segundos.
    thread::sleep(Duration::from_secs(2));

    println!("Após a pausa de dois segundos.");

    // Restante do código...
}
```

Neste exemplo, a função `sleep()` é usada para pausar a execução da thread principal por dois segundos antes de continuar com o restante do código.

Essa função é útil em situações em que você precisa introduzir atrasos ou pausas em um programa, como em simulações, temporizações e testes.

### `std::sync::Once::new()` (método)

Vamos analisar o método `new()` do módulo `Once` em Rust:

- Método (associado ao tipo `Once`)
- **O que ele faz:** cria uma nova instância do tipo `Once`, que é usado para garantir que uma determinada inicialização ocorra apenas uma vez, independente de quantas vezes é chamada
- **Assinatura do método:** `pub const fn new() -> Once`
- **Parâmetros:** não possui parâmetros. É um método associado que cria uma nova instância de `Once`
- **Exemplos de uso:**

```rust
use std::sync::Once;

static INIT: Once = Once::new();

fn main() {
    INIT.call_once(|| {
        // Código a ser executado apenas uma vez.
        println!("Esta inicialização ocorre apenas uma vez!");
    });

    // Resto do código...
}
```

Neste exemplo, `Once::new()` é usado para criar uma instância de `Once`. A função `call_once()` garante que o bloco fornecido seja executado apenas uma vez, mesmo que `call_once()` seja chamado de forma concorrente por várias threads.

Em resumo, o método `new()` do módulo `Once` é um método associado usado para criar uma instância de `Once`, e é frequentemente utilizado para garantir a execução única de uma inicialização em ambientes concorrentes.

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

## `serde`

A crate `serde` é amplamente utilizada em Rust para serialização e desserialização de dados. Ela fornece uma maneira fácil e flexível de converter dados de e para formatos comuns, como JSON, binário e outros.

**Aqui está um exemplo básico de como usar** `serde` **para serializar e desserializar dados em JSON:**

```rust
use serde_derive::{Serialize, Deserialize};
use serde_json::Result;

#[derive(Serialize, Deserialize, Debug)]
struct Pessoa {
    nome: String,
    idade: u32,
}

fn main() -> Result<()> {
    // Serialização para JSON.
    let pessoa = Pessoa {
        nome: String::from("Alice"),
        idade: 30,
    };
    let json_serializado = serde_json::to_string(&pessoa)?;

    println!("JSON serializado: {}", json_serializado);

    // Desserialização de JSON.
    let json_deserializado = r#"
        {
            "nome": "Bob",
            "idade": 25
        }
    "#;

    let pessoa_desserializada: Pessoa = serde_json::from_str(json_deserializado)?;

    println!("Objeto desserializado: {:?}", pessoa_desserializada);

    Ok(())
}
```

Este é apenas um exemplo básico, e a crate `serde` suporta uma ampla variedade de casos de uso e formatos. Dependendo do que você precisa fazer, você pode explorar a documentação oficial do `serde` para obter informações mais detalhadas.

# Boas Práticas

### `,`

Incluir a vírgula após o último item em listas, structs, enums e outras estruturas de dados é considerada uma boa prática em Rust. Existem várias razões para isso:

1. **Facilita a adição ou remoção de itens:** adicionar ou remover itens se torna mais simples, pois você não precisa se preocupar em adicionar ou remover vírgulas dependendo da positção do item
2. **Consistência e clareza:** manter uma vírgula consistente após o último item torna o código mais consistente e fácil de ler. Cada item na lista tem a mesma estrutura, o que ajuda na legibilidade
3. **Facilita a comparação e revisão do código:** ao visualizar alterações em sistemas de controle de versão ou ao revisar o código, é mais fácil identificar as alterações quando a vírgula está presente. Isso pode ser particularmente útil em ambientes colaborativos

Ambas as formas, utilizar a vírgula após o último item ou não, são aceitas pelo compilador, e a escolha pode depender das preferências da equipe de desenvolvimento. No entanto, a prática mais comum em comunidades Rust é incluir a vírgula após o último item para manter a consistência e facilitar a manutenção do código.

### Variáveis com Todas as Letras em Maiúsculo

A decisão de nomear constantes e variáveis estáticas em maiúsculas é uma convenção para tornar essas variáveis facilmente distinguíveis de variáveis locais e para destacar que são valores que não devem ser alterados durante a execução do programa. Isso é particularmente comum em muitas linguagens de progamação.

Essa convenção pode ser encontrada em várias linguagens, incluindo Rust. Ela ajuda a melhorar a legibilidade do código e a indicar a intenção do programador de que a variável é constante ou estática.

Em resumo, a escolha de usar todas as letras em maiúsculo para o nome da variável é uma prática comum para variáveis estáticas e constantes e ajuda a comunicar a natureza especial dessas variáveis no código-fonte.