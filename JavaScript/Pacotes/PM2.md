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
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
- [Anotações](#anotacoes)
- [Arquivos Relacionados](#arquivos-relacionados)
    + [dump.pm2](#arquivos-relacionados-dump-pm2)
- [Informações Sobre os Aplicativos em Execução](#informacoes-aplicativos-execucao)
    + [`status`](#informacoes-aplicativos-execucao-status)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
    + [`list`](#comandos-utilizados-cli-list)
    + [`describe $< ID >`](#comandos-utilizados-cli-describe)
    + [`env $< ID >`](#comandos-utilizados-cli-env)
    + [`reload`](#comandos-utilizados-cli-reload)
    + [`kill`](#comandos-utilizados-cli-kill)
    + [`save`](#comandos-utilizados-cli-save)
    + [`resurrect`](#comandos-utilizados-cli-ressurect)
    + [`delete`](#comandos-utilizados-cli-delete)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos

- O diretório **~/.pm2** é onde o PM2 armazena todas as suas informações de configuração e logs (por padrão)

# <a id="anotacoes"></a>Anotações

- Os arquivos relacionados ao PM2 geralmente se encontram em **~/.pm2**. Os associados ao root se encontram em **/root/.pm2**
    + Nestes diretórios você encontra arquivos como o **dump.pm2**
    + Quando você executa PM2 como um usuário específico, ele cria (se ainda não existir) e usa a pasta **~/.pm2** desse usuário para armazenar suas informações
        - Quando você executa PM2 com diferentes usuários, cada um deles terá seu próprio ambiente PM2 independente
- O PM2 não consegue **identificar como um executável (ele continua tentando executar o arquivo como um arquivo JavaScript) os binários construídos pelo Nexe**. Isso ocorre mesmo quando você configura a chave "`interpreter`" como "`none`" no seu arquivo **ecosystem.config.json**

# <a id="arquivos-relacionados"></a>Arquivos Relacionados

### Sumário

- [dump.pm2](#arquivos-relacionados-dump-pm2)

## <a id="dump-pm2"></a>dump.pm2

É um **arquivo de configuração gerado pelo PM2** que contém o estado atual dos processos gerenciados pelo PM2. Ele armazena informações sobre todos os aplicativos que estão sendo gerenciados, incluindo seus scripts de inicialização, opção de configuração, variáveis de ambiente, e estados de execução. Este arquivo é crucial para persistir o estado dos processos entre reinicializações do sistema ou do PM2.

- O arquivo **dump.pm2** é criado na primeira vez que você executa `pm2 save`
    + Este comando **cria ou atualiza** o **dump.pm2** com as informações atuais do processo
- Sempre que houver uma alteração nos processos (adição, remoção, ou alteração de configurações), execute `pm2 save` para atualizar o **dump.pm2**

# <a id="informacoes-aplicativos-execucao"></a>Informações Sobre os Aplicativos em Execução

## <a id="informacoes-aplicativos-execucao-status"></a>`status`

- O `status` `errored` em um processo gerenciado pelo PM2 indica que ocorreu um erro durante a inicialização ou execução desse processo

# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

### Sumário

- [`list`](#comandos-utilizados-cli-list)
- [`describe $< ID >`](#comandos-utilizados-cli-describe)
- [`env $< ID >`](#comandos-utilizados-cli-env)
- [`reload`](#comandos-utilizados-cli-reload)
- [`kill`](#comandos-utilizados-cli-kill)
- [`save`](#comandos-utilizados-cli-save)
- [`ressurect`](#comandos-utilizados-cli-ressurect)
- [`delete`](#comandos-utilizados-cli-delete)

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

## <a id="comandos-utilizados-cli-reload"></a>`pm2 reload`

É utilizado para recarregar processos gerenciados pelo PM2 de forma suave, sem downtime. Esse comando é especialmente útil quando você deseja aplicar mudanças no código ou na configuração de um aplicativo em execuçãom garantindo que as atualizações sejam aplicadas sem interrupções perceptíveis para os usuários.

**Como Funciona**

1. **Recarregamento sem downtime:** o `pm2 reload` reinicia os processos gerenciados um a um, garantindo que, enquanto um processo está sendo reiniciado, os outros continuem funcionando. Isso permite que o aplicativo continue a atender solicitações sem interrupções
2. **Aplicação de mudanças:** quando você modifica o código do seu aplicativo ou suas configurações e deseja aplicar essas mudanças, o `pm2 reload` aplica essas atualizações sem a necessidade de parar completamente os processos

**Quando Usar**

- **Atualização de código:** após realizar mudanças no código-fonte do seu aplicativo, use `pm2 reload` para aplicar essas mudanças sem interromper o serviço
- **Mudanças na configuração:** quando você altera configurações que não requerem a parada completa dos processos, o `pm2 reload` pode aplicar essas mudanças de forma eficiente
- **Manutenção programada:** para executar manutenção ou atualizações planejadas sem causar downtime para os usuários

**Benefícios**

- **Sem downtime:** o recarregamento suave garante que não haja tempo de inatividade perceptível, pois os processos são reiniciados um a um
- **Atualizações contínuas:** você pode aplicar mudanças no código ou configurações sem interromper o serviço, mantendo a continuidade das operações
- **Melhoria na disponibilidade:** a abordagem de recarregamento suave melhora a disponibilidade do aplicativo, já que sempre há processos disponíveis para atender solicitações

**Exemplos**

- **Para recarregar todos os processos gerenciados pelo PM2:** `pm2 reload all`
- **Para recarregar um processo específico pelo seu nome ou ID:** `pm2 reload $< nome do processo ou ID >`

## <a id="comandos-utilizados-cli-kill"></a>`pm2 kill`

É utilizado para parar todos os processos gerenciados pelo PM2 e também encerrar o próprio daemon do PM2. Esse comando é útil quando você precisa interromper completamente todos os serviçoes gerenciados pelo PM2 e liberar todos os recursos utilizados.

**Como Funciona**

1. **Parar todos os processos:** o `pm2 kill` vai parar todos os processos que estão sendo gerenciados pelo PM2. Isso inclui todos os aplicativos Node.js ou outros scripts que foram iniciados usando o PM2
2. **Encerrar o daemon do PM2:** além de parar os processos, o `pm2 kill` também encerra o daemon do PM2. O daemon é o processo de fundo que gerencia e monitora todos os processos iniciados com o PM2

**Considerações Importantes**

- **Perda de estado:** ao usar `pm2 kill`, você vai perder o estado atual dos processos gerenciados. Se você quiser restaurar os processos posteriormente, certifique-se de salvar o estado com `pm2 save` antes de matar os processos
- **Não recomendado para interrupções temporárias:** se você só precisa parar temporariamente alguns processos, pode ser mais adequado usar `pm2 stop $< nome do processo ou ID >` ou `pm2 delete $< nome do processo ou ID >` para processos específicos, em vez de matar todos os processos e o daemon

## <a id="comandos-utilizados-cli-save"></a>`pm2 save`

É utilizado para salvar o estado atual de todos os processos gerenciados. Esse comando cria um snapshot da configuração atual dos processos em uma arquivo chamado **dump.pm2** localizado no diretório de configuração do PM2 (geralmente em **~/.pm2**).

- A configuração atual inclui informações como os scripts que estão sendo executados, seus parâmetros, variáveis de ambiente, etc

## <a id="comandos-utilizados-cli-resurrect"></a>`pm2 resurrect`

É utilizado para restaurar processos que foram salvos anteriormente pelo PM2.

**Como Funciona**

1. **Salvar o estado atual dos processos:** antes de usar o `pm2 resurrect`, você precisa salvar o estado atual dos processos com o comando `pm2 save`. Isso cria um arquivo **dump.pm2** no diretório de configuração do PM2 (geralmente em **~/.pm2**), que contém a lista de processos e suas configurações
2. **Restaurar os processos:** quando você usa o comando `pm2 resurrect`, o PM2 lê o arquivo **dump.pm2** e reinicia todos os processos listados nesse arquivo. Isso é útil, por exemplo, após um reinício do servidor para restaurar automaticamente os processos que estavam rodando antes

**Passo a Passo para Usar**  `pm2 resurrect`

1. **Inicie e configure seus processos:** primeiro, inicie e configure todos os processos que você deseja gerenciar com PM2

```bash
$ pm2 start app.js
$ pm2 start other-app.js --name "other-app"
```

2. **Salve o estado atual:** depois de iniciar e configurar os processos, salve o estado atual (`pm2 save`)
3. **Restaurar os processos após um reinício:** se o servidor reiniciar ou você precisar restaurar os processos por qualquer motivo, use o comando `pm2 resurrect`

**Automatizando a Restauração com o SO**

Para garantir que os processos gerenciados pelo PM2 sejam restaurados automaticamente após um reinício do sistema, você pode configurar o PM2 para iniciar automaticamente na inicialização do sistema ("`pm2 startup`").

Esse comando exibirá uma linha de comando que você precisa executar com permissões de superusuário (root) para configurar o PM2 para iniciar na inicialização do sistema.

**Exemplos**

1. **Inicie e salve os processos:**

```bash
$ pm2 start app.js --name "app"
$ pm2 start app.js --name "api"
$ pm2 save
```

2. **Configure o PM2 para iniciar na inicialização do sistema:** `pm2 startup`
3. **Restaurar os processos após um reinício:** `pm2 resurrect`

Usando esses comandos, você pode garantir que seus processos Node.js gerenciados pelo PM2 sejam salvos e restaurados automaticamente, proporcionando alta disponibilidade e recuperação automática após reinicializações do sistema.

## <a id="comandos-utilizados-cli-delete"></a>`pm2 delete $< nome do processo ou ID >`

É utilizado para **remover processos gerenciados pelo PM2**. Esse comando pode ser aplicado a processos específicos ou a todos os processos em execução.

**Exemplos**

- **Deletando um processo específico pelo nome ou ID:**

```bash
$ pm2 delete my-app # Deleta o processo com o nome "my-app".
$ pm2 delete 0      # Deleta o processo com o ID 0.
```

- **Deletando todos os processos gerenciados pelo PM2:**

```bash
$ pm2 delete all
```