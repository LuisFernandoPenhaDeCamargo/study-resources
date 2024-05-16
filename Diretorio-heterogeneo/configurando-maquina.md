# Configurando a Minha Máquina

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Ferramentas Instaladas](#ferramentas-instaladas)
- [Projeto de Script de Configuração de Ambiente](#projeto-script-configuracao-ambiente)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="ferramentas-instaladas"></a>Ferramentas Instaladas

Abaixo segue uma lista de ferramentas que eu geralmente preciso ter instaladas na minha máquina, da mais utilizada para a menos.

- `curl`**:** `sudo apt install curl`
- `nvm`**:** `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
- `pyenv`
- **Redis:** ``
- **MariaDB:** `sudo apt install mariadb-server`
- `ifconfig`**:** `sudo apt install net-tools`
- `nmap`**:** `sudo apt install nmap`
- **DBeaver:** `sudo snap install dbeaver-ce`

# <a id="projeto-script-configuracao-ambiente"></a>Projeto de Script de Configuração de Ambiente

- `sudo apt update`
- `sudo apt upgrade`
- `sudo apt install curl`
- `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
    Login no npm.
- `pyenv`
- `sudo apt install mariadb-server`
    + Adquira um dump
    + **Crie o banco:** `sudo mariadb -e "CREATE DATABASE zoeslots;"`
    + **Insira o dump:** `sudo mariadb zoeslots < dump.sql`
    + Crie o usuário e conceda as permissões a ele
- `sudo apt install net-tools`
- `sudo apt install nmap`
- `sudo snap install dbeaver-ce`
    Adicione e configure as conexões.