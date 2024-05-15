# NVM

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Instalando o NVM](#instalando-nvm)
  + [Observações Interessantes](#instalando-nvm-observacoes-interessantes)
- [Desinstalando o NVM](#desinstalando-nvm)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
  + [`nvm ls-remote`](#comandos-nvm-ls-remote)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="instalando-nvm"></a>Instalando o NVM

Você pode utilizar o `curl` para baixar o script de instalação, por exemplo:

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Isso baixará o script de instalação do NVM diretamento do repositório oficial e executará o script com o bash.

Depois que o script de instalação for concluído, você precisará reiniciar o terminal ou recarregar o arquivo de perfil para aplicar as alterações. Você pode recarregar o arquivo de perfil executando o seguinte comando no terminal:

```bash
$ source ~/.bashrc
```

## <a id="instalando-nvm-observacoes-interessantes"></a>Observações Interessantes

Alguns pontos interessantes a se mencionar é que se você tinha uma versão do Node.js instalada no seu sistema antes da instalação do NVM, ela será indentificada como `system`, você pode observar isso utilizando o comando `nvm ls`.

---

Se você tinha pacotes instalados globalmente antes da instalação do NVM, o seguinte log será incluindo durante a instalação:

```bash
$ sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 16555  100 16555    0     0   134k      0 --:--:-- --:--:-- --:--:--  134k
=> Downloading nvm as script to '/home/$< usuário >/.nvm'
=> Cloning into '/home/$< usuário >/.nvm'...
remote: Enumerating objects: 365, done.
remote: Counting objects: 100% (365/365), done.
remote: Compressing objects: 100% (313/313), done.
remote: Total 365 (delta 43), reused 165 (delta 26), pack-reused 0
Receiving objects: 100% (365/365), 365.08 KiB | 5.70 MiB/s, done.
Resolving deltas: 100% (43/43), done.
* (HEAD detached at FETCH_HEAD)
  master
=> Compressing and cleaning up git repository

=> Appending nvm source string to /home/$< usuário >/.bashrc
=> Appending bash_completion source string to /home/$< usuário >/.bashrc
=> You currently have modules installed globally with `npm`. These will no # Esta é a parte inicial do log que foi incluído por já termos pacotes globais instalados.
=> longer be linked to the active version of Node when you install a new node
=> with `nvm`; and they may (depending on how you construct your `$PATH`)
=> override the binaries of modules installed with `nvm`:

/usr/lib
├── $< pacote >
├── $< pacote >
├── $< pacote >
├── $< pacote >
=> If you wish to uninstall them at a later point (or re-install them under your
=> `nvm` Nodes), you can remove them from the system Node as follows:

     $ nvm use system
     $ npm uninstall -g a_module # Esta é a linha final do log que foi incluído por já termos pacotes globais instalados.

=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

O que o log "adicional" pontua é bem interessante, ele fala que a os módulos instalados globalmente com o npm não estaram linkados a versão ativa do Node quando você instala uma nova versão do Node, e esses módulos existentes ainda podem sobreescrever os binários dos módulos instalados com o nvm.

Para desistalar esses pacotes você deve utilizar a versão `system` do Node.js. A versão do Node.js e do npm estão ligadas, afinal, elas precisam ser compatíveis.

O nvm específica uma versão do Node.js, por consequência uma versão do npm. Um pacote instalado por uma versão do npm, vai ser identificado como diferente do mesmo pacote instalado por outra versão do npm, você pode observar isso pela hierarquia de arquivos `/home/$< usuário >/.nvm/versions/node/$< versão do Node.js >/lib/node_modules/`.

O mesmo pacote, instalado por versões diferentes do npm, estaram no diretório **node_modules** da respectiva versão do Node.js (a compatível com a versão do npm).

# <a id="desinstalando-nvm"></a>Desinstalando o NVM

Para desinstalar o NVM, você pode excluir o diretório onde ele está instalado. Por padrão, o NVM é instalado no diretório **/home/$< usuário >/.nvm**.

Além disso, você deve remover as entradas do NVM do seu arquivo de perfil. O NVM adiciona algumas linhas ao seu arquivo de perfil (como **.bashrc**, **.bash_profile**, ou **.profile**). Você pode editar manualmente esses arquivos e remover quaisquer linhas relacionadas ao NVM.

Por exemplo, no arquivo **.bashrc**, temos as seguintes linhas

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

que devem ser apagadas.

Após ter realizado as ações acima, reinicie o terminal e verifique se a versão do NVM é exibida.

# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

- [ls-remote](#comandos-ls-remote)

## <a id="comandos-utilizados-cli-ls-remote"></a>`nvm ls-remote`

É utilizado para listar todas as versões disponíveis do Node.js que podem ser instaladas através do NVM.