# Arquivos

# .lock

Arquivos com a extensão **.lock** geralmente são utilizados para indicar que um recurso está sendo usado ou para previnir condições de corrida em sistemas de gerenciamento de arquivos ou durante operações críticas. Aqui estão alguns contextos comuns em que arquivos **.lock** são encontrados:

1. **Controle de concorrência:** em sistemas de gerenciamento de banco de dados ou outros aplicativos que precisam garantir a consistência de dados durante operações críticas, os arquivos **.lock** podem ser usados para sinalizar que um recurso está sendo acessado por um processo específico. Isso ajuda a evitar que outros processos acessem ou modifiquem o mesmo recurso simultaneamente
2. **Bloqueio de pacotes:** em gerenciadores de pacotes (como npm, yarn, pip), pode haver arquivos **.lock** que registram as versões específicas dos pacotes instalados. Esses arquivos são usados para garantir que uma versão específica seja instalada, evitando atualizações automáticas inesperadas
3. **Controle de sincronização:** em abientes de programação concorrente, um arquivo **.lock** pode ser usado para garantir a sincronização entre vários processos ou threads

# .toml

Arquivos com a extensão **.toml** são geralmente arquivos de configuração escritos no formato TOML (Tom's Obvius Minimal Language). TOML é um formato de arquivo de configuração fácil de ler e escrever, projetado para ser intuitivo para os humanos e fácil de mapear para estruturas de dados. Aqui estão alguns casos comuns em que você pode ecnontrar arquivos **.toml**

1. **Cargo.toml:** em projetos Rust que usam o Cargo (gerenciador de pacotes e construtor de projetos para Rust), o arquivo **Cargo.toml** é usado para configurar várias informações sobre o projeto, incluindo dependências, metadados do projeto e configurações de compilação
2. **Configurações de aplicativos:** muitas vezes, os arquivos **.toml** são usados para configurar aplicativos e serviços. Eles podem incluir configurações para diferentes partes do sistema, como configurações de banco de dados, configurações de servidor, etc
3. **Configurações de ferramentas:** algumas ferramentas e utilitários usam arquivos **.toml** para armazenar configurações. Por exemplo, o `rustfmt` (um formatador de código Rust) usa arquivos **.toml** para suas configurações
4. **Configurações de jogos:** em jogos, os arquivos **.toml** podem ser usados para armazenar configurações de jogo, como níveis, propriedades de personagens e outras opções de jogo

A estrutura básica de um arquivo TOML envolve a definição de pares chave-valor. Aqui está um exemplo simples:

```toml
# Exemplo de arquivo TOML
titulo = "Meu Projeto"
versao = "1.0"

[dependencias]
biblioteca1 = "1.2"
biblioteca2 - "3.0"
```

Neste exemplo, `titulo` e `versao` são configurações de nível superior, enquanto `dependencias` é uma tabela (table) contendo pares de chave-valor adicionais.