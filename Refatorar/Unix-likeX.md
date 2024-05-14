# Unix-like.

### Prompt de comando.

Exemplo: `orion@orion-OptiPlex-7010:`.

- `orion`**:** nome de usuário;
- `orion-OptoPlex-7010`**:** é o nome do host ou nome da máquina, que pode ser o nome do seu computador;
- `:`**:** indica o final do prompt.


### identificador@IP

Exemplo:\
`orion-data-server@137.184.223.0` ou `orion-data-server@legacy-api-slotzoe` é uma combinação de um identificador (possivelmente um nome de usuário) e um endereço IP (ou um nome de host, ou um domínio).

- `orion-data-server`**:** o nome do usuário usado para autenticar e se conectar a um servidor, como um servidor SSH. O nome de usuário é geralmente seguido por um símbolo "@" para indicar a separação entre nome de usuário e o endereço IP ou nome de host do servidor;
- `137.184.223.0`**:** endereço IP. Um endereço IP é um identificador único atribuído a dispositivos em uma rede para permitir a comunicação. No contexto de um servidor, esse endereço IP pode representar o local onde o servidor está hospedado na rede;
- `legacy-api-slotzoe`**:** é o nome de host ou domínio que identifica o servidor ou serviço ao qual você deseja se conectar. Pode ser um nome de domínio ou um nome de host na rede.

# Diretórios.

## .ssh/

O diretório **.ssh/** é um diretório oculto em sistemas Unix-like. **Ele é usado para armazenar configurações e chaves relacionadas ao SSH (Secure Shell)**, um protocolo de rede seguro amplamente utilizado para acessar e gerenciar sistemas remotos. O diretório **.ssh/** está localizado no diretório inicial do usuário e contém arquivos de configuração e chaves de autenticação.\
Alguns dos arquivos comuns encontrados no diretório **.ssh/**:

- **id_rsa e id_rsa.pub**:** esses são os arquivos de chave privada e pública do usuário, respectivamente. A chave privada (**id_rsa**) é usada para autenticar o usuário ao se conectar a servidores remotos usando SSH, enquanto a chave pública (**id_rsa.pub**) é copiada para os servidores remotos que o usuário deseja acessar. A chave pública é usada para verificar a identidade do usuário;
- **config:** este arquivo contém configurações específicas do SSH, como opções de encaminhamento de portas, aliases de host e outros ajustes personalizados;
- **know_hosts:** este arquivo registra as chaves públicas dos servidores aos quais o usuário se conectou anteriormente. Isso ajuda a verificar a autenticidade dos servidores quando você tenta se conectar novamente;
- **authorized_keys:** este arquivo é usada no servidor SSH remoto e contém as chaves públicas dos usuários autorizados a fazer login na conta. Isso permite que o usuário autentique-se com sua chave privada.

Lembrando que o diretório **.ssh/** é oculto por padrão, o que significa que seu nome começa com um ponto ("."), tornando-o invisível quando você lista o conteúdo de um diretório com o comando `ls`.

Se você executar o comando `cat id_rsa.pub`, o conteúdo que aparecerá na saída do seu interpretador será algo semelhante a

```BASH
orion@orion-OptiPlex-7010:~/.ssh$ cat id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC79X+8/39OTfNSh18+n5T41KA6J3hPyVqikASQeBfMqwDFbfxI/s7anmu/rV4XKEkIgqqBKhHvVFvQNGXoCXq0gy0C3BSGMGfFuB93bWqco3OkhxQkPLMTR0LiPT63Re8nj/symIauPuqd76yUWMY+4JxIjahM2JcLV1HA8xUhV8q7KS57M3Jr6dTYw6toatWMZEJTl+gf1wxNQV5am+3Mh4EtYkyawlhnjmcQV9DbM0F5IsFDtoR6UyVAH3g9q8onGJjHvlb1SpQd3YYtJuIAYhvsgZU8rhdxxuTX4xcTnlXSMKlEa8nT3lOx6NrIUFSFe4fSiScCLSFN9u05aPvnut/e9WpyMEbCjV8YbB6C9hja8roU6QA26N++CtsfTXbH37sanqv6GBKwp7hH9KQKnFrsR7t0bHS4hiGLWu2TQdWI/W79+8mpW+8udWO+JSXnpJP7ZkFaEu5BLnl43KMyj+oVMcKBe12CX5pKG/5Ci16wiZZMggRwf/jp2p6Rhm1H7agS5rNkCYD2FFZQFXuO6PZmhcZnR67N9OYcs0qNBLt32tdCApLmGylElqVpTW7Wkz1wWfPglGaFo7GsDuz7ViavdpcKoF7WnfKYu8h8xeTVqGwb3M99f22QT5Mu5eeczaC6naG1asE46iQaTxrUam02fWZyQeDOXGaFViz4zw== luisfernandopenhadecamargo@gmail.com
```

ou seja, a estrutura é basicamente `ssh-rsa hash e-mail`.

# Cron.

A palavra **Cron** geralmente se refere ao sistema de agendamento de tarefas em sistemas operacionais Unix-like, como o Linux. O Cron permite que os usuários programem a execução automática de tarefas em horários específicos, datas ou intervalos regulares. Essas tarefas agendadas são conhecidas como **cron jobs**. Alguns dos conceitos básicos relacionados ao Cron:

- **Cron jobs:** são as tarefas agendadas que você programa para serem executadas automaticamente em momentos específicos. Isso pode incluir coisas como backup de dados, geração de relatórios, limpeza de arquivos temporários e muito mais;
- **Sintaxe Cron:** a sintaxe utilizada para agendar tarefas no Cron é composta por cinco campos separados por espaços, que indicam o minuto, a hora, o dia do mês, o mês e o dia da semana em que a tarefa deve ser executada. A sintaxe é semelhante a esta:
`* * * * * comando_a_ser_executado`
    - Cada asterisco representa um campo e pode ser substítuido por um número ou um intervalo;
    - O campo `comando_a_ser_executado` contém o comando que você deseja executar.
- **Exemplos:** alguns exemplos de agendamento de tarefas no Cron:
    - `0 2 * * *`**:** executa uma tarefa todos os dias às 2h da manhã;
    - `30 8 * * 1-5`**:** executa uma tarefa às 8h30 de segunda a sexta-feira;
    - `0 0 1 1 *`**:** executa uma tarefa à meia-noite no primeiro dia de cada ano.
- **Comandos Cron:** os comandos executados pelo Cron podem ser qualquer comando que você normalmente executaria no terminal do sistema. Isso inclui scripts shell, comandos Linux, programas personalizados, etc;
- **Arquivo Crontab:** os cron jobs são geralmente configurados e gerenciados através do arquivo "crontab". Cada usuário pode ter seu próprio arquivo crontab para definir suas tarefas agendadas. Você pode editar o crontab do usuário usando o comando `crontab - e`;
- **Logs de saída:** quando um cron job é executado, ele normalmente gera uma saída. Essa saída é frequentemente enviada para o e-mail do usuário ou para um arquivo log, dependendo da configuração;
- **Ferramentas relacionadas:** existem ferramentas gráficas e utilitários de linha de comando que facilitam a configuração e a administração de cron jobs em sistemas Unix-like.

# .deb

Para atualizar um aplicativo que está instalado a partir de um arquivo **.deb** (**Debian package**) em sistemas Linux baseados em **Debian**, como o Ubuntu, você pode seguir estas etapas:

- **Obtenha a versão mais recente:** primeiro, certifique-se de que há uma versão mais recente do aplicativo disponível como um arquivo **.deb**. Você pode verificar o site oficial do desenvolvedor do aplicativo ou usar os repositórios oficiais da distribuição para verificar se há uma versão mais recente;
- **Baixe o novo pacote .deb:** baixe o novo arquivo **.deb** da versão atualizada do aplicativo. Você pode fazer isso diretamente do site do desenvolvedor ou de um repositório de pacotes;
- **Instale o pacote .deb:** use o comando `dpkg` para instalar o novo pacote **.deb**. Substitua `nome-do-arquivo.deb` pelo nome real do arquivo **.deb** que você baixou:

`sudo dpkg -i nome-do-arquivo.deb`

Isso instalará a versão mais recente do aplicativo.

**Resolva dependências:** se houver dependências que não estão satisfeitas no novo pacote, o comando `dpkg` mostrará um erro. Você precisará resolver essas dependências manualmente, instalando os pacotes ausentes. Isso pode ser feito usando o comando `apt`:

`sudo apt-get install -f`

O comando acima tentará corrigir e instalar as dependências ausentes.

Lembre-se de que essa abordagem é útil quando você possui um arquivo **.deb** disponível. Para a maioria dos aplicativos, especialmente aqueles disponíveis nos repositórios oficiais da sua distribuição, é mais recomendável usar o gerenciador de pacotes, como o `apt`, para garantir atualizações automáticas e gerenciamento eficiente de dependências.\
Além disso, tenha cuidado ao baixar pacotes **.deb** de fontes não oficiais, pois eles podem não ser seguros e podem conter software malicioso. É sempre aconselhável verificar a autenticidade da fonte e preferir os repositórios oficiais da sua distribuição sempre que possível.