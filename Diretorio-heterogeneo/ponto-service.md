# .service

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Arquivo de Serviço](#arquivo-servico)
- [Arquivo de Ambiente](#arquivo-ambiente)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="arquivo-servico"></a>Arquivo de Serviço

- Os arquivos de serviço normalmente se encontram em **/etc/systemd/system/** ou em **/lib/systemd/system/**
- Dentro do arquivo de serviço, deve haver uma seção que define variáveis de ambiente necessárias para o serviço. Procure por linhas que começam com `Environment=` ou `EnvironmentFile=`. Essas linhas indicam quais arquivos de ambiente o serviço espera carregar

```bash
$ cat zoe-updater.service 
[Unit]
Description=ZoeUpdate
After=mysql.service
StartLimitIntervalSec=0

[Service]
EnvironmentFile=/etc/environment
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=/bin/bash -c "orion-updater >> /var/log/orion-updater.log 2>&1"

[Install]
WantedBy=multi-user.target
```

O arquivo de serviço acima específica que ele utiliza um arquivo de ambiente que se encontra em **etc**, chamado **environment**.

Uma vez encontramos um erro que era causado porque o arquivo estava em **etc**, mas estava com o nome errado (**enviroment**, o **n** estava faltando). Se os caminhos estiverem incorretos ou os arquivos estiverem ausentes, atualize o arquivo de serviço para apontar para os locais corretos dos arquivos de ambiente.

Caso seja necessário, após fazer as alterações necessárias, recarregue o daemon do systemd e reinicie o serviço. `sudo systemctl daemon-reload` para recarregar o daemon e, `sudo systemctl restart $< nome do serviço >.service` para reiniciar o serviço (especificar o `.service` do nome do arquivo não é necessário).

## Seções

## Chaves

# <a id="arquivo-ambiente"></a>Arquivo de Ambiente

O arquivo abaixo é usado para definir variáveis de ambiente globais para todos os usuários do sistema. Neste arquivo, as variáveis de ambiente são definidas no formato `$< VARIAVEL >="$< valor >"`, onde `VARIAVEL` é o nome da variável e `valor` é o valor atribuído a ela.

```bash
$ cat /etc/environment 
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
ZOE_LOG_LEVEL="5"
ZOE_WAN_IFACE="eth1"
ZOE_LAN_IFACE="eth0"
JAVA_VERSION=ZW05bGMyeHZkSE44YjNKcGIyNThRbXcwWTJ0Q2IzZ3hNek0zZkRFeU55NHdMakF1TVE9PQo=
```

No arquivo acima temos cinco variáveis de ambiente. A variável `PATH` é definida com o valor que é uma lista de diretórios separados por `:`. O `PATH` é uma variável de ambiente especial que contém uma lista de diretórios onde o sistema procura por executáveis de comandos quando você digita um comando no terminal. Cada diretório listado no `PATH` é separado por `:` e o sistema busca os executáveis nesses diretórios na ordem em que são listados.