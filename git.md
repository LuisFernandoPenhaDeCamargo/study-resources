# Git (git.md)

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

No Ubuntu, você pode usar o Gerenciador de Credenciais do Sistema para armazenar em cache suas credenciais do Git. O Ubuntu geralmente utiliza o GNOME Keyring como seu gerenciador de credenciais.

```bash
git config --global credential.helper gnome-keyring
```

Se você utilizar o GNOME Keyring como helper de credenciais, suas credenciais do Git devem persistir através de reinicializações de máquina. As credenciais serão armazenadas no GNOME Keyring indefinidamente até que sejam removidas manualmente.