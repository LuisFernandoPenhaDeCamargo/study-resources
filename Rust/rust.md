# Dúvidas

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

# Macros

Um "macro" se refere a uma funcionalidade poderosa e flexível para a criação de código em tempo de compilação. Macros em Rust são semelhantes a macros em outras linguagens de programação, mas a abordagem de Rust é particulamente robusta e segura.

A principal diferença entre uma função regular e uma macro é que uma macro **opera no nível do código-fonte**, enquanto uma função opera no nível do código executável. As macros em Rust permitem a geração e transformação de código Rust durante a fase de compilação.

**Macros realizam transformações no código durante a compilação, funções são chamadas em tempo de execução.**

Existem dois tipos principais de macros em Rust:

- **Procedurais:** macros procedurais são macros que geram código Rust. Elas são mais poderosas e podem ser usadas para criar novos itens de código, como funções, estruturas e módulos
    + **Exemplo:**

```rust
macro_rules! greet {
    ($name:expr) => {
        println!("Olá, {}!", $name);
    };
}

greet!("Mundo");
```

- **De identificação:**
    + Macros de identificação são macros que operam no nível de tokens e são usados para manipulação de um código mais leve
    + **Exemplo:**

```rust
macro greeting() {
    // Cria uam função de cumprimento durante a compilação.
    fn greet() {
        println!("Olá, Mundo!");
    }
}

// Uso da macro procedural. Este é um exemplo hipotético, pois não há um macro procedural real no exemplo.
greeting!();
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

# Traits



# Structs



# Enums



# Importação e Módulo x Crate

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

Sobre crate externos, para poder importá-los, ele deve ser listado como uma dependência em seu arquivo "Cargo.toml". A seção "[dependencies]" do arquivo "Cargo.toml" especifica os crates externos que seu projeto está utilizando. */
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

# Módulos

### `log`

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

### `simpleslog`

É uma crate que provê uma série de facilidades relacionadas a log, que podem ser facilmente combinada.