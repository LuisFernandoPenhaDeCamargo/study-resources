# `pyenv`

---

### Resumo

É um gerenciador de versões.

---

`pyenv` é uma ferramenta de código aberto que permite instalar e gerenciar várias versões do intepretador Python em um único sistema. Ele facilita a instalação de diferentes versões do Python e permite alternar entre elas de forma fácil e flexível.

Algumas das principais características do `pyenv` incluem:

1. **Instalação de múltiplas versões do Python:** com o `pyenv`, você pode instalar várias versões do Python lado a lado em seu sistema
2. **Gerenciamento de versões:** ele permite que você mude facilmente entre diferentes versões do Python definindo a versão global, local ou por diretório
3. **Gerenciamento de dependências:** o `pyenv` permite que você instale pacotes e bibliotecas específicos para cada versão do Python
4. **Virtualenv Integration:** ele funciona bem com o `virtualenv` e o `virtualenvwrapper`, permitindo criar ambientes virtuais para projetos específicos
5. **Compatibilidade com diferentes sistemas operacionais:** o `pyenv` é compatível com uma variedade de sistemas operacionais, incluindo Linux, macOS e outros sistemas Unix-like

Em resumo, o `pyenv` é uma ferramenta poderosa para desenvolvedores Python que precisam trabalhar com várias versões do Python em seus projetos. Ele simplifica a gestão e a troca entre essas versões, ajudando a garantir a compatibilidade e consistência em diferentes ambientes de desenvolvimento.

### Sumário

- [Comandos](#comandos)
    + [`pyenv versions`](#comandos-pyenv-versions)
    + [`pyenv install --list`](#comandos-pyenv-install-list)
    + [`pyenv local`](#comandos-pyenv-local)
    + [`pyenv shell $< versão >`](#comandos-pyenv-shell-versao)
- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Instalação](#instalacao)
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)

# <a id="comandos"></a>Comandos

### Sumário

- [`pyenv versions`](#comandos-pyenv-versions)
- [`pyenv install --list`](#comandos-pyenv-install-list)
- [`pyenv local`](#comandos-pyenv-local)
- [`pyenv shell $< versão >`](#comandos-pyenv-shell-versao)

## <a id="comandos-pyenv-versions"></a>`pyenv versions`

Isso mostrará todas as versões do Python que foram instaladas pelo Pyenv e também aquela que está atualmente em uso (marcada com um asterisco).

## <a id="comandos-pyenv-install-list"></a>`pyenv install --list`

Lista todas as versões Python disponíveis para instalação.

## <a id="comandos-pyenv-local"></a>`pyenv local`

Exibe a versão do Python configurada para um diretório específico.

## <a id="comandos-pyenv-shell-versao"></a>`pyenv shell $< versão >`

Muda para a versão desejada somente na sessão atual.

# <a id="observacoes-sistema-operacional"></a>Observações Sobre o Sistema Operacional

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="instalacao"></a>Instalação

- **Repositório:** https://github.com/pyenv/pyenv

- **Automatic installer** (https://github.com/pyenv/pyenv?tab=readme-ov-file#automatic-installer)

```bash
$ curl https://pyenv.run | bash
```

- **Set up your shell environment for Pyenv** (https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv)

Em **/home/$< usuário >/.bashrc**, adicione ao final do arquivo ou ao seu local de preferência:

```bash
# As linhas abaixo foram adicionadas por mim.

# pyenv.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
```

Realize o processo acima em **/home/$< usuário >/.profile** também.

- Para que as alterações tenham efeito, recarregue o arquivo de configuração do shell executando:

```bash
$ source ~/.bashrc
```

- **Install Python build dependencies** (https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
$ sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

- **Install additional Python versions** (https://github.com/pyenv/pyenv?tab=readme-ov-file#usage)

```bash
# Verificando as versões disponíveis.
$ pyenv install -l

# Instalando a versão desejada.
$ pyenv install $< versão >

# A versão utilizada para conseguir instalar o pacote do zoe-terminal foi a pypy2.7-7.3.15, que é a versão 7.3.15 do PyPy para Python 2.7.

# Para mudar para a versão desejada somente na sessão atual.
$ pyenv shell $< versão >

# Para mudar para a versão desejada, de forma automática, quando se encontrar em um diretório específico (ou em um de seus subdiretórios).
$ pyenv local $< versão >

# Para mudar para a versão desejada em seu usuário.
$ pyenv global $< versão >
```

# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos

O diretório do `pyenv` se encontra em **/home/luis/.pyenv/**.