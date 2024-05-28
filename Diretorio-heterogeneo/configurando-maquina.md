# Configurando a Minha Máquina

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Projeto de Script de Configuração de Ambiente](#projeto-script-configuracao-ambiente)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="projeto-script-configuracao-ambiente"></a>Projeto de Script de Configuração de Ambiente

- `sudo apt update`
- `sudo apt upgrade`
- `curl`**:** `sudo apt install curl`
- **servidor SSH (OpenSSH Server):** `sudo apt install openssh-server`
- **NVM:** `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
- Login no npm
- `pyenv`
- **Redis:** `sudo apt install redis-server`
- **MariaDB:** `sudo apt install mariadb-server`
    + Verifique uma forma de instalar a seguinte versão, "`mariadb Ver 15.1 Distrib 10.1.40-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2`"
    + Adquira um dump
    + **Crie o banco:** `sudo mariadb -e "CREATE DATABASE zoeslots;"`
    + **Insira o dump:** `sudo mariadb zoeslots < dump.sql`
    + Crie o usuário e conceda as permissões a ele
- `ifconfig`**:** `sudo apt install net-tools`
- `nmap`**:** `sudo apt install nmap`
- **DBeaver:** `sudo snap install dbeaver-ce`
    + Adicione e configure as conexões