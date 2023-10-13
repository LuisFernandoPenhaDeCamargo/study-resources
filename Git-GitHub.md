# Git/GitHub.

# Comandos.

`git clone -b nomeDoBranch URL`**:** clona um branch específica do repositório remoto.

---

**Up to date:** 05/08/2023.
# Lista de comandos.

## Arquivos.

- **[ git status ]:** informa o estado dos arquivos;
- **[ git add <nome do arquivo 1> <nome do arquivo 2> <nome do arquivo 3> … ]:** adiciona os arquivos ao índice Git;
    
    ```bash
    git add .            //Todos arquivos.
    git add -u           //Modificados ao índice.
    git add *.**<extensão>** //Uma extensão específica.
    ```
    
- **[ git checkout -- <nome do arquivo 1> <nome do arquivo 2> <nome do arquivo 3> … ]:** descarta alterações;
    
    Restaura os arquivos para **o estado em que estavam no último commit**.
    
    ```bash
    git checkout .               //Todos arquivos.
    git checkout **<diretório>**     //Um diretório específico.
    git checkout -- *.**<extensão>** //Uma extensão específica.
    ```
    
- **[ git commit -m <mensagem descritiva> ]:** realiza um commit.

## Branches.

- **[ git branch ]:** lista todas as branches;
    
    Lista todas as branches **locais** e **destaca com um asterisco em qual você se encontra**.
    
- **[ git checkout -b <nome da nova branch> ]:** cria uma nova branch;
    
    Cria uma nova branch **a partir da branch em que você se encontra**.
    
- **[ git push origin <nome da branch> ]:** envia a branch para o repositório remoto.

## Repositórios.

**[ git clone <url> ]:** clona o repositório.

# Dificuldades encontradas.

## Ao realizar o primeiro commit.

```bash
**<nome de usuário>**@**<hostname>**:~$ git commit -m "**<mensagem>**"
Author identity unknown

*** Please tell me who you are.

Run

	git config --global user.email "you@example.com"
	git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.
```

**O seu e-mail e o seu nome não devem estar entre aspas**.

# Lógica de nomenclatura de branches.

- **Branches de recursos (feature branches):** muitas equipes usam um padrão de nomenclatura que inclui o nome ou descrição da funcionalidade ou recurso que está sendo desenvolvido;
    
    Exemplo:
    
    ```bash
    feature/nova-autenticacao
    feature/melhorias-pagina-inicial
    ```
    
- **Branches de correções (bug fix branches):** para branches que são usados para corrigir bugs, um padrão de nomenclatura semelhante pode ser aplicado;
    
    Exemplo:
    
    ```bash
    bugfix/correcao-autenticacao
    bugfix/conserta-erro-de-formulario
    ```
    
- **Branches de versões (release branches):** para branches relacionados a versões específicas do software;
    
    Exemplo:
    
    ```bash
    release/v1.0.0
    release/v2.0.0
    ```
    
- **Branches de desenvolvimento principal:** normalmente, o branch principal onde a maior parte do desenvolvimento acontece é chamado de main ou master. Este é o branch padrão quando você cria um novo repositório Git.

# Semantic commit.

É uma convenção de formatação que faz com que as mensagens sigam um padrão semântico específico.

**<tipo>(<escopo>): <descrição>**

- **tipo:** indica o **tipo** de alteração que está sendo feita;
- **escopo (opcional):** indica a área específica do código que está sendo afetada pela alteração. Isso pode ser uma **pasta**, um **módulo** ou qualquer outra unidade relevante;
- **descrição:** uma descrição concisa do que a alteração faz. Deve ser clara e informativa.

Exemplos:

```bash
feat(auth): adiciona autenticação de usuário
fix(api): corrige o bug de consulta de dados
docs(readme): atualiza a documentação de instalação
style(css): ajusta estilos do botão de login
```

## Tipos de alteração.

- **feat:** abreviação de **feature** (**funcionalidade**). Este tipo de commit é usado quando uma **nova funcionalidade** ou **recurso** é adicionado ao código;
    
    Exemplo:
    
    ```bash
    feat(auth): adiciona autenticação de usuário
    ```
    
- **fix**: usado quando um **bug é corrigido**. Isso indica que a alteração resolve um problema ou erro existente no código;
    
    Exemplo:
    
    ```bash
    fix(api): corrige bug de consulta de dados
    ```
    
- **docs**: este tipo de commit se refere a **alterações na documentação**. Isso pode incluir atualizações na documentação do código, na documentação de instalação, no README ou em outros documentos relacionados ao projeto;
    
    Exemplo:
    
    ```bash
    docs(readme): atualiza a documentação de instalação
    ```
    
- **style:** indica mudanças relacionadas à **formatação do código**, estilos de codificação, espaçamento, tabulação, etc. Essas alterações não afetam o comportamento do código, apenas sua apresentação;
    
    Exemplo:
    
    ```bash
    style(css): ajusta estilos do botão de login
    ```
    
- **refactor:** usado quando o código é refatorado, ou seja, **alterado internamente para melhorar a estrutura**, a legibilidade ou a eficiência, mas **sem alterar o comportamento externo do código**;
    
    Exemplo:
    
    ```bash
    refactor(api): reorganiza funções de manipulação de dados
    ```
    
- **chore:** este tipo de commit se refere a tarefas de manutenção, atualizações de dependências, configuração de build, entre outros. Geralmente, são tarefas que não têm impacto direto no código do usuário final;
    
    Exemplo:
    
    ```bash
    chore(build): atualiza as dependências do projeto
    ```
    
- **test:** usado quando são **adicionados, atualizados ou corrigidos testes automatizados**. Isso ajuda a garantir que o código funcione conforme o esperado e que as alterações futuras não introduzam regressões;
    
    Exemplo:
    
    ```bash
    test(unit): adiciona testes para a função de autenticação
    ```
    
- **perf:** indica **melhorias de desempenho no código**, como otimizações ou ajuste que tornam o código mais rápido ou mais eficiente;
    
    Exemplo:
    
    ```bash
    perf(api): otimiza consulta de bancos de dados
    ```
    
- **ci:** utilizado para alterações relacionadas à **configuração e integração contínua (CI/CD)**. Isso pode incluir alterações em arquivos de configuração de pipeline de CI, scripts de automação, etc;
    
    Exemplo:
    
    ```bash
    ci(pipeline): atualiza configuração do pipeline de construção
    ```
    
- **revert:** usado para indicar que uma **alteração anterior foi desfeita ou revertida**. A mensagem geralmente inclui uma referência ao commit original que está sendo revertido.
    
    Exemplo:
    
    ```bash
    revert: revert "feat(auth): adiciona autenticação de usuário"
    ```
    

# Template.

## Listas.

- **Item 1 em negrito:** conteúdo relacionado ao item 1;
    
    Exemplo: exemplo relacionado ao item 1.
    
- **Item 2 em negrito:** conteúdo relacionado ao item 2;
- …

## Comandos.

**[ comando entre colchetes, tudo em negrito; os colchetes também estarão em vermelho. Um espaço entre os colchetes e o comando ]**

**<descrição de um parâmetro. Deve estar em negrito e em vermelho>**

## Lista de estruturas que recebe destaque.

### Negrito.

## Catálogo de termos.

- Diretório > pastas;
- Branch/branches.