# Git

### Sumário

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)
  + [`gh` (GitHub CLI)](#gh-github-cli)

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

No lugar da sua senha (`Password`), insira seu token de acesso pessoal. GitHub settings -> < > Developer settings -> Personal access tokens -> Tokens (classic) -> Tokens you have generate that can be used to access the **GitHub API** (para gerar um novo).

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