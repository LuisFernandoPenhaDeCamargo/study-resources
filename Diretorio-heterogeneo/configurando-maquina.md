# Configurando a Minha Máquina

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Projeto de Script de Configuração de Ambiente](#projeto-script-configuracao-ambiente)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="projeto-script-configuracao-ambiente"></a>Projeto de Script de Configuração de Ambiente

- `sudo apt update`
- `sudo apt upgrade`
- `curl`**:** `sudo apt install curl`
- **NVM:** `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
- Login no npm
- `pyenv`
- **Redis**
- **MariaDB:** `sudo apt install mariadb-server`
    + Adquira um dump
    + **Crie o banco:** `sudo mariadb -e "CREATE DATABASE zoeslots;"`
    + **Insira o dump:** `sudo mariadb zoeslots < dump.sql`
    + Crie o usuário e conceda as permissões a ele
- `ifconfig`**:** `sudo apt install net-tools`
- `nmap`**:** `sudo apt install nmap`
- **DBeaver:** `sudo snap install dbeaver-ce`
    + Adicione e configure as conexões