# Git

### Sumário

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)
  + [`gh` (GitHub CLI)](#gh-github-cli)
- [Comandos](#comandos)

# <a id="primeiro-commit"></a>Primeiro `commit`

Ao tentar realizar o primeiro `commit`:

```bash
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'user@hostname.(none)')
```

Ao tentar realizar o primeiro `push`:

```bash
Username for 'https://github.com': 
Password for 'https://username@github.com': 
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/username/nome_do_repositório/'
```

No lugar da sua senha (`Password`), insira seu token de acesso pessoal. GitHub settings -> Developer settings -> Personal access tokens -> Tokens (classic) -> Tokens you have generate that can be used to access the **GitHub API** (para gerar um novo).

# <a id="armazenando-suas-credenciais"></a>Armazenando Suas Credenciais

Você pode usar o armazenamento de credenciais fornecido pelo próprio Git, chamado de "cache de credenciais". Essa opção armazena suas credenciais em cache de memória, eliminando a necessidade de digitar suas credenciais repetidamente durante um período de tempo especificado.

```bash
git config --global credential.helper 'cache --timeout=tempo_em_segundos'
```

Esta abordagem é útil para evitar a autenticação repetitiva e ainda oferece uma camada de segurança, já que as credenciais são armazenadas apenas temporariamente em memória. Diferente do `git config --global credential.helper store`, que armazena suas credenciais de forma não temporária em texto simples em um arquivo em disco.

Outra técnica que não é recomendada é a utilização dos URLs dos repositórios, isso porque os URLs dos repositórios, assim como credenciais, podem ser facilmente expostos em logs ou outros lugares, o que é uma prática  de segurança ruim.

### <a id="gh-github-cli"></a>`gh` (GitHub CLI)

Se você verificar as configurações globais utilizadas pelo `git` (`git config --global -l`), podem aparecer as seguintes chave:

```bash
credential.https://github.com.helper=
credential.https://github.com.helper=!/usr/bin/gh auth git-credential
user.name=Nome
user.email=email
```

a linha `credential.https://github.com.helper=!/usr/bin/gh auth git-credential` especifica o helper de credencial a ser usado em URLs que correspondem a "`https://github.com`"

- `credential.https://github.com.helper`**:** indica que essa configuração se aplica a URLs que correspondem a "`https://github.com`"
- `=!/usr/bin/gh auth git-credential`**:** especifica o comando a ser executado para lidar com a obtenção das credenciais de autenticação, o comando se refere ao utilitário chamado `gh` (GitHub CLI) que é usado para autenticação do GitHub através do comando `git`, ele lida com a autenticação do usuário e a obtenção das credenciais necessárias para acessar o GitHub

Para ver as configurações utilizadas pelo gh, você pode usar o comando `gh auth status`, isso poderá exibir a seguinte saída:

```bash
github.com
  ✓ Logged in to github.com as nome_de_usuário (pwd_para_o_arquivo_de_configuração)
  ✓ Git operations for github.com configured to use https protocol.
  ✓ Token: *******************
```

no arquivo de configuração você poderá encontrar as seguinte chaves:

```bash
github.com:
  user: nome_do_usuário
  oauth_token: token
  git_protocol: https
```

**O problema deste método de autenticação, é que seu token está salvo em um arquivo em máquina.**

# <a id=""></a>Comandos

### Sumário

- [`git branch`](#git-branch)
- [`git checkout`](#git-checkout)
    + [Alternar Entre Branches](#alternar-entre-branches)
    + [Restaurar Arquivos](#restaurar-arquivos)
- [`git config pull.rebase false`](#git-config-pullrebase-false)

## <a id ="git-branch"></a>`git branch`

O comando `git branch` é utilizado para listar todas as branches presentes no seu repositório Git. Quando executado sem argumentos adicionais, ele lista as branches locais. Se você adicionar a opção `-a`, ele lista tanto as branches locais quanto as branches remotas.

- Para listar todas as branches locais

```bash
git branch
```

- Para listar todas as branches (locais e remotas)

```bash
git branch -a
```

Isso mostrará todas as branches presentes no seu repositório Git, tanto localmente quanto no repositório remoto. As branches remotas serão listadas no formato `remotes/nome_do_repositório/branch`.

## <a id="git-checkout"></a>`git checkout`

O comando `git checkout` é usado principalmente para alternar entre branches ou para restaurar arquivos em um repositório Git. Dependendo do contexto em que é usado, ele pode ter diferentes funcionalidades.

Alguns pontos importantes:

- Tenha cuidado ao usar o `git checkout` para alternar entre branches ou restaurar arquivos, pois ele pode substituir alterações não confirmadas. Certifique-se de ter confirmado ou armazenado essas alterações antes de usar este comando
- A partir do Git 2.23, foi introduzido um novo comando chamado `git switch`, que é preferível ao `git checkout` para alternar entre os branches. O `git switch` é mais seguro e intuitivo para alternar entre os branches, enquanto o `git checkout` ainda é usado para outros propósitos, como restaurar arquivos

Aqui estão as principais formas de uso do `git checkout`:

### <a id="alternar-entre-branches"></a>Alternar Entre Branches

- Para alternar para um branch existente

```bash
git checkout nome_da_branch
```

- Para criar e alternar para um novo branch

```bash
git checkout -b novo_branch
```

- Para criar e alternar para um novo branch, especificando o branch do qual você quer obter os recursos

```bash
git checkout -b novo_branch branch
```

Todos os commits e o estado dos arquivos neste branch (`branch`) serão copiados para `novo_branch`.

### <a id="restaurar-arquivos"></a>Restaurar Arquivos

- Para restaurar um arquivo específico para sua versão no último commit

```bash
git checkout -- nome_do_arquivo
```

- Para restaurar todos os arquivos para suas versões no último commit (útil para desfazer alterações não confirmadas)

```bash
git checkout .
```

## <a id="git-config-pullrebase-false"></a>`git config pull.rebase false`

O comando `git config pull.rebase false` é usado para configurar o Git para não realizar o rebase automático ao executar o comando `git pull`.

Quando você executa `git pull`, o Git geralmente tenta mesclar as alterações remotas com o seu branch local. No entanto, se você configurar `pull.rebase` como `false`, o Git optará por fazer um merge em vez de um rebase automático ao executar o `git pull`.

Essa configuração é útil se você preferir fazer merge em vez de rebase ao atualizar seu branch local com as alterações do repositório remoto. Por exemplo, algumas equipes de desenvolvimento preferem evitar rebase automático para manter um histórico de commits mais explícito e linear.

Você pode definir essa configuração globalmente para todos os seus repositórios Git ou especificamente para um repositório usando a opção `--global` ou a omitindo, respectivamente.