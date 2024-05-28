# .service

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Arquivo de Serviço](#arquivo-servico)
    + [Seções](#arquivo-servico-secoes)
        - [Unit](#arquivo-servico-secoes-unit)
        - [Service](#arquivo-servico-secoes-service)
        - [Install](#arquivo-servico-secoes-install)
        - [Timer](#arquivo-servico-secoes-timer)
        - [Socket](#arquivo-servico-secoes-socket)
        - [Mount](#arquivo-servico-secoes-mount)
        - [Path](#arquivo-servico-secoes-path)
        - [Scope](#arquivo-servico-secoes-scope)
        - [Swap](#arquivo-servico-secoes-swap)
- [Arquivo de Ambiente](#arquivo-ambiente)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
No LSB modules are available.
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

## <a id=""></a>Seções

Uma seção é um bloco de configuração que agrupa chaves relacionadas que definem o comportamento e as características do serviço. Cada seção é denotada por um nome entre colchetes. Aqui estão algumas seções encontradas em um arquivo de serviço do systemd e o que cada uma delas representa:

### <a id="arquivo-servico-secoes-unit"></a>[Unit]

Esta seção contém metadados e dependências relacionadas ao serviço.

- **Description:** fornece uma breve descrição do serviço
- **Documentation:** URLs para documentação relevante sobre o serviço
- **After:** especifica unidades que devem ser iniciadas antes desta unidade. Isso define a ordem de inicialização

### <a id="arquivo-servico-secoes-service"></a>[Service]

Esta seção define as opções de configuração específicas para o comportamento do serviço.

- **Type:** define o tipo de processo do serviço (e.g., `simple`, `forking`, `oneshot`, `dbus`, `notify`, `idle`)
    + `forking`**:** indica que o serviço é um daemon que se bifurca e continua rodando em segundo plano
- **User:** especifica o usuário sob o qual o serviço será executado
- **LimitNOFILE:** define o número máixmo de arquivos que o processo pode abrir
- **LimitNPROC:** define o número máximo de processos que o usuário pode criar
- **LimitCORE:** define o tamanho máximo do core dump criado
- **Environment:** define variáveis de ambiente para o serviço
- **PIDFile:** especifica o arquivo que conterá o PID do daemon
- **ExecStart:** o comando a ser executado para iniciar o serviço
- **ExecReload:** o comando a ser executado para recarregar o serviço
- **ExecStop:** o comando a ser executado para parar o serviço
- **Restart:** define a política de reinicialização do serviço (e.g, `no`, `on-success`, `on-failure`, `on-abnormal`, `on-watchdog`, `on-abort`, `always`)

### <a id="arquivo-servico-secoes-install"></a>[Install]

Esta seção define informações relacionadas à instalação e habilitação do serviço.

- **WantedBy:** especifica os destinos (targets) sob os quais a unidade será instalada. Um destino é um conjunto de unidades que são tratadas como um grupo

### <a id="arquivo-servico-secoes-timer"></a>[Timer]

Usada para definir cronogramas de execução para unidades de serviço.

- **OnCalendar:** define um cronograma baseado no calendário
- **OnBootSec:** define o tempo a partir do boot para ativar o timer
- **OnUnitActiveSec:** define o tempo a partir da última ativação da unidade para ativar o timer novamente

### <a id="arquivo-servico-secoes-socket"></a>[Socket]

Usada para definir sockets que ativam unidades de serviço.

- **ListenStream:** define um socket de escuta para conexões TCP
- **ListenDatagram:** define um socket de escuta para pacotes UDP

### <a id="arquivo-servico-secoes-mount"></a>[Mount]

Usada para definir pontos de montagem de sistemas de arquivos

- **What:** especifica o dispositivo ou sistema de arquivos a ser montado
- **Where:** especifica o ponto de montagem
- **Type:** define o tipo de sistema de arquivos

### <a id="arquivo-servico-secoes-path"></a>[Path]

Usada para monitorar mudanças em arquivos ou diretórios.

- **PathExists:** especifica um caminho que, quando existente, ativa a unidade
- **PathChanged:** especifica um caminho que, quando alterado, ativa a unidade

### <a id="arquivo-servico-secoes-scope"></a>[Scope]

Usada para agrupar um conjunto de processos em uma única unidade.

- **Slice:** define a fatia de recursos à qual a unidade pertence
- **Delegate:** define se a unidade delega gerenciamento de cgroups para os processos filhos

### <a id="arquivo-servico-secoes-swap"></a>[Swap]

Usada para definir espaços de swap.

- **What:** especifica o dispositivo de swap
- **Priority:** define a prioridade do dispositivo de swap

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