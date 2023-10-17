# Git/GitHub.

# Lista de comandos.

- `git clone -b nomeDoBranch URL`**:** clona um branch específica do repositório remoto;
- `git checkout -b novaBranch`**:** cria e alterna para uma nova branch. [Explicação detalhada](#novabranch);
- `git status`**:** informa o estado dos arquivos;
- `git add arquivo`**:** adiciona o arquivo ao índice Git. [Explicação detalhada](#gitadd);
- `git checkout -- arquivo`**:** descarta alterações. [Explicação detalhada](#descartandoalteracoes);
- `git commit -m "mensagem descritiva"`**:** realiza um commit.

# Comandos.

## <a id = "novabranch"></a>Criando uma nova branch.

Você também pode fazer o processo em comandos separados:

- Use o comando `git branch` seguido do nome da nova branch que deseja criar. Por exemplo, para criar uma nova branch chamanda `novaBranch`, você pode usar o seguinte comando:

`git branch novaBranch`

- Agora que a nova branch foi criada, você pode alternar para ela usando o comando `git checkout`. Por exemplo:

`git checkout novaBranch`

Isso fará com que você comece a trabalhar na nova branch.

## <a id = "gitadd"></a>`git add`

Você pode adicionar mais de um arquivo de uma vez para o índice Git:

`git add arquivo1 arquivo2 arquivo3...`

```bash
git add .          //Adiciona todos os arquivos.
git add --all      //Também adiciona todos os arquivos.
git add -u         //Adiciona os arquivos modificados.
git add *.extensao //Adiciona os arquivos de uma extensão específica.
```

`git add -u`**:** adiciona ao índice (staging area) os arquivos que foram modificados e removidos, mas não os arquivos não monitorados. A opção `-u` ou `--update` atualiza o índice (staging area) apenas com as modificações (alteraçõs ou remoções) dos arquivos que já estão sob controle de versão do repositório.

`git add '**/*.extensao'`**:** `*.extensao` corresponderá a todos os arquivos com a extensão especificada no diretório atual. Se você quiser adicionar arquivos com a mesma extensão em subdiretórios, pode usar o comando `**` para corresponder recursivamente.\
O comando corresponderá a todos os arquivos com a extensão `extensao` em todos os subdiretórios a partir do diretório atual.

## <a id = "descartandoalteracoes"></a>Descartando alterações.

Para restaurar os arquivos para **o estado em que estavam no último commit**.

```bash
git checkout -- arquivo1 arquivo2 arquivo3...
git checkout .                       //Restaura todos os arquivos.
git checkout -- diretorio/           //Restaura um diretório específico (Git anterior à versão 2.23).
git restore --source=HEAD diretorio/ //Restaura um diretório específico (Git 2.23 ou superior).
git checkout -- *.extensao           //Restaura os arquivos de uma extensão específica.
```

## Branches. <--

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