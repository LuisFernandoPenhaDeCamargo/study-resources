# Git

### Sumário

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)

### <a id="primeiro-commit"></a>Primeiro `commit`

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

### <a id="armazenando-suas-credenciais"></a>Armazenando Suas Credenciais

Você pode usar o armazenamento de credenciais fornecido pelo próprio Git, chamado de "cache de credenciais". Essa opção armazena suas credenciais em cache de memória, eliminando a necessidade de digitar suas credenciais repetidamente durante um período de tempo especificado.

```bash
git config --global credential.helper 'cache --timeout=tempo_em_segundos'
```

Esta abordagem é útil para evitar a autenticação repetitiva e ainda oferece uma camada de segurança, já que as credenciais são armazenadas apenas temporariamente em memória. Diferente do `git config --global credential.helper store`, que armazena suas credenciais de forma não temporária em texto simples em um arquivo em disco.

Outra técnica que não é recomendada é a utilização dos URLs dos repositórios, isso porque os URLs dos repositórios, assim como credenciais, podem ser facilmente expostos em logs ou outros lugares, o que é uma prática  de segurança ruim.