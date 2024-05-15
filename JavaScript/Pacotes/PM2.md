# <a id="pm2"></a>PM2

O PM2 é um **gerenciador de processos para aplicativos Node.js**. Ele é projetado para facilitar o gerenciamento de aplicativos Node.js em ambientes de produção, permitindo que você inicie, pare, reinicie e gerencie processos Node.js de forma eficiente e confiável.

Aqui estão algumas das principais funções e recursos do PM2:

1. **Gerenciamento de processos:** com o PM2, você pode facilmente iniciar, parar, reiniciar e listar processos Node.js em execução. Ele fornece comandos simples de linha de comando para gerenciar seus aplicativos Node.js de forma conveniente
2. **Monitoramento avançado:** o PM2 oferece recursos avançados de monitoramento que permitem acompanhar o status, a utilização de recursos e o desempenho de seus aplicativos Node.js em tempo real. Ele também fornece logs detalhados para facilitar a depuração e o diagnóstico de problemas
3. **Auto-reinicialização:** o PM2 pode ser configurado para monitorar seus aplicativos Node.js e reiniciá-los automaticamente em caso de falha. Isso ajuda a garantir a disponibilidade contínua de seus aplicativos, mesmo em caso de problemas inesperados
4. **Balanceamento de carga e escalonamento:** o PM2 oferece recursos avançados de balanceamento de carga e escalonamento que permitem distribuir o tráfego entre várias instâncias de seus aplicativos Node.js e dimensionar horizontalmente conforme necessário para lidar com carga de trabalho variáveis
5. **Gerenciamento de ambiente:** o PM2 permite configurar e gerenciar facilmente variáveis de ambiente para seus aplicativos Node.js, incluindo variáveis de ambiente específicas do aplicativo e do sistema
6. **Fácil integração:** o PM2 é fácil de instalar e usar, e é amplamente suportado pela comunidade Node.js. Ele pode ser integrado a outras ferramentas e serviços de gerenciamento de aplicativos, como sistemas de monitoramento e orquestração de contêineres

Em resumo, o PM2 é uma ferramenta poderosa e versátil para gerenciar aplicativos Node.js em ambientes de produção, ajudando a garantir a confiabilidade, o desempenho e a escabilidade de seus aplicativos Node.js.

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Anotações](#anotacoes)
- [Informações Sobre os Aplicativos em Execução](#informacoes-aplicativos-execucao)
    + [`status`](#informacoes-aplicativos-execucao-status)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
    + [`list`](#comandos-utilizados-cli-list)
    + [`describe $< ID >`](#comandos-utilizados-cli-describe)
    + [`env $< ID >`](#comandos-utilizados-cli-env)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="anotacoes"></a>Anotações

- Os arquivos relacionados ao PM2 geralmente se encontram em **/home/$< usuário >/.pm2**. Os associados ao root se encontram em **/root/.pm2**
    + Nestes diretórios você encontra arquivos como o **dump.pm2**
- O PM2 não consegue **identificar como um executável (ele continua tentando executar o arquivo como um arquivo JavaScript) os binários construídos pelo Nexe**. Isso ocorre mesmo quando você configura a chave "`interpreter`" como "`none`" no seu arquivo **ecosystem.config.json**

# <a id="informacoes-aplicativos-execucao"></a>Informações Sobre os Aplicativos em Execução

## <a id="informacoes-aplicativos-execucao-status"></a>`status`

- O `status` `errored` em um processo gerenciado pelo PM2 indica que ocorreu um erro durante a inicialização ou execução desse processo

# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

### Sumário

- [`list`](#comandos-utilizados-cli-list)
- [`describe $< ID >`](#comandos-utilizados-cli-describe)
- [`env $< ID >`](#comandos-utilizados-cli-env)

## <a id="comandos-utilizados-cli-list"></a>`pm2 list`

É utilizado para **listar todos os processos que estão sendo gerenciados pelo PM2**, juntamente com informações sobre cada processo. Ele fornece uma visão geral dos aplicativos em execução, seus IDs, versões, modo de execução, PIDs, status, número de reinicializações, tempo de atividade, uso de CPU, usuário proprietário, e se o aplicativo está sendo observado.

**Saída Típica**

```bash
$ pm2 list
┌─────────┬────┬───────────┬─────────┬───────┬────────┬─────────┬──────────┬─────┬─────┬──────────┬──────────┐
│ App name│ id │ version   │ mode    │ pid   │ status │ restart │ uptime   │ cpu │ mem │ user     │ watching │
├─────────┼────┼───────────┼─────────┼───────┼────────┼─────────┼──────────┼─────┼─────┼──────────┼──────────┤
│ app1    │ 0  │ 1.0.0     │ cluster │ 12345 │ online │ 0       │ 12h      │ 0%  │ 0%  │ user1    │ enabled  │
│ app2    │ 1  │ 2.1.0     │ fork    │ 54321 │ online │ 3       │ 7d       │ 10% │ 2%  │ user2    │ enabled  │
└─────────┴────┴───────────┴─────────┴───────┴────────┴─────────┴──────────┴─────┴─────┴──────────┴──────────┘
```

Nesta saída:

- `App name`**:** nome do aplicativo
- `id`**:** ID do processo gerenciado pelo PM2
- `version`**:** versão do aplicativo
- `mode`**:** modo de execução do aplicativo. Por exemplo, `cluster`, `fork`, `fork_mode`
- `pid`**:** PID do aplicativo
- `status`**:** status do aplicativo. Por exemplo, `online`, `stopped`, `errored`
- `restart`**:** número de vezes que o aplicativo foi reiniciado
- `uptime`**:** tempo decorrido desde que o aplicativo foi iniciado
- `cpu`**:** uso atual da CPU pelo aplicativo
- `mem`**:** uso atual da memória pelo aplicativo
- `user`**:** usuário do aplicativo
- `watching`**:** se o aplicativo está sendo observado pelo PM2

Este comando é útil para monitorar o estado dos aplicativos gerenciados pelo PM2 e diagnosticar eventuais problemas.

## <a id="comandos-utilizados-cli-describe"></a>`pm2 describe $< ID >`

É utilizado para **obter informações detalhadas sobre um processo específico gerenciado pelo PM2** com base no seu ID. Ele retorna informações detalhadas sobre o processo, incluindo nome, status, diretório de trabalho, argumentos de linha de comando, entre outras informações relevantes.

- `ID`**:** ID do processo que você deseja descrever. O ID é um identificador exclusivo atribuído a cada processo pelo PM2 quando ele é iniciado. Você deve substituir `ID` pelo ID real do processo que você deseja descrever

Este comando é uma maneira útil de obter insights sobre os processos gerenciados pelo PM2 e monitorar seu estado e comportamento.

## <a id="comandos-utilizados-cli-env"></a>`pm2 env $< ID >`

É utilizado para **exibir as variáveis de ambiente de um processo gerenciado pelo PM2** com base no seu ID. Ele exibe uma lista de todas as variáveis definidas para o processo, incluindo o nome da variável e o seu valor correspondente.

- `ID`**:** ID do processo que você deseja descrever. O ID é um identificador exclusivo atribuído a cada processo pelo PM2 quando ele é iniciado. Você deve substituir `ID` pelo ID real do processo que você deseja descrever

Este comando pode ser útil para entender como o ambiente está configurado para um processo específico e diagnosticar problemas relacionados às variáveis de ambiente.