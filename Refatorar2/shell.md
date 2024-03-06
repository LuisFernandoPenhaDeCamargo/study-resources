# Sumário

- Alterando o Hostname no Ubuntu

# Alterando o Hostname no Ubuntu

```bash
vim.tiny /etc/hostname
```

No arquivo **hostname**, você verá o nome atual do seu sistema. Substitua-o pelo novo nome de host que deseja usar. Após fazer a alteração, salve o arquivo e feche o editor de texto.

```bash
vim.tiny /etc/hosts
```

Encontre a linha que contém o endereço IP 127.0.1.1 e o nome do antigo host. Substitua o nome antigo pelo novo nome de host que você configurou no arquivo **/etc/hostname**. Reinicie o seu sistema Ubuntu para aplicar as alterações de hostname.

# ---

# Lista de Itens a se Estudar

- `mkdir`
- `wc`
- `chown`
- `date`
- `data_formatada=$(date -d @$data_mais_antiga "+%Y-%m-%d %H:%M:%S")`
- `tar`
- `md5sum`
- `>`. Operador de redirecionamento
- `|`. Pipe
- `-gt`
- `-lt`
- `-mindepth`
- `-maxdepth`
- Declaração de uma variável
- `$`
- if
- for
- `crontab`
- Sintaxe de definição de um cron
- /home/orion/Downloads/wiki-backup.sh
- `mysqldump`

# Sintaxe Básica

`comando -opção argumento`

Sendo que para opções curtas, descritas por uma letra é utilizado somente um traço. Para opções longas, descritas por palavras ou frases, é utilizado dois traços. Exemplo:

- `comando -o argumento` (opção curta, descrita por uma letra)
- `comando --opção argumento` (opção longa, descrita por uma palavra ou frase)

# Comandos

- [`echo argumento`](#echo)**:** imprime o argumento no terminal
- `lsb_release`**:** exibe informações detalhadas sobre o sistema operacional, incluindo a distribuição específica e a versão
- `whoami`**:** imprime o nome do usuário que está atualmente autenticado no sistema
- `id`**:** imprime informações detalhadas sobre o usuário que está atualmente autenticado no sistema\ 
    Incluindo seu ID de usuário (UID), ID de grupo (GID), entre outras informações
- `hostname`**:** exibe o nome de host atual
- `sudo passwd`**:** utilizado para mudar a senha do usuário em sessão\
    Você pode fornecer o `nome_do_usuário` como argumento, para alterar a senha do usuário especificado.
- [`ssh usuário@host`](#ssh)**:** estabelece uma conexão segura e criptografada com um servidor remoto
- [`ls`](#ls)**:** lista os arquivos e diretórios em um diretório específico
- [`chmod -opções permissões arquivo`](#chmod)**:** altera as permissões de acesso de arquivos e diretórios
- [cat arquivo.txt](#cat)**:** exibe o conteúdo de um arquivo
- [vim.tiny arquivo](#vim-tiny)**:** abre o editor de texto `vim.tiny` com o conteúdo do `arquivo`
- [tailf arquivo](#tailf)**:** exibe as últimas linhas de um arquivo e continua exibindo novas linhas à medida que são adicionadas no final do arquivo
- [rm arquivo](#rm)**:** remove o arquivo
- [`which comando`](#which)**:** utilizado para encontrar o caminho do executável associado a um comando específico
- `type comando`**:** semelhante ao `which`, mas fornece informações adicionais, incluindo se o comando é um alias, uma função do shell ou um comando integrado
- [`sleep intervalo_de_tempo`](#sleep)**:** faz com que um script ou processo espere por um determinado período de tempo antes de continuar a execução
- [`ifconfig`](#ifconfig)**:** exibe informações relacionadas às interfaces interfaces de rede no sistema, informações como o IP
- [`ping host`](#ping)**:** verifica a conectividade entre o seu computador e outro host em uma rede
- [`nmap alvo`](#nmap)**:** realiza uma varredura de pings nos hosts para descobrir quais deles estão online
- `nslookup endereço_IP`**:** exibe o nome de host associado ao endereço IP
- [who](#who)**:** exibe quem está atualmente conectado ao sistema
- [`reboot`](#reboot)**:** reinicia o sistema operacional

# Operadores

[`&`](#ecomercial)**:** indica que o comando deve ser executado em segundo plano

# Condicionais

No terminal, você pode usar condicionais para criar scripts mais avançados ou para executar comandos com base em determinadas condições. Os operadores condicionais mais comuns são `if`, `else` e `elif` (abreviação de "else if").

A estrutura básica de uma instrução condicional no terminal é a seguinte:

```shell
if [ condição ]; then
    # Comandos a serem executados se a condição for verdadeira
else
    # Comandos a serem executados se a condição for falsa
fi
```

**Opções Comuns**

- `-eq`**:** igual a (equal)
- `-ne`**:** diferente de (not equal)
- `-lt`**:** menor que (less than)
- `-le`**:** menor ou igual a (less than  or equal)
- `-gt`**:** maior que (greater than)
- `-ge`**:** maior ou igual a (greater than or equal)
- `-z`**:** string vazia
- `-n`**:** string não vazia
- `-f`**:** existe e é um arquivo regular
- `-d`**:** existe e é um diretório
- `-e`**:** existe (pode ser um arquivo, diretório ou qualquer outro tipo de entrada)

**Exemplos**

```shell
nota=75

if [ "$nota" -ge 90 ]; then
    echo "Aprovado com A."
elif [ "$nota" -ge 80 ]; then
    echo "Aprovado com B."
elif [ "$nota" -ge 70 ]; then
    echo "Aprovado com C."
else
    echo "Reprovado."
fi
```

A prática de usar aspas duplas ao redor de variáveis é uma boa prática geral para evitar problemas quando lidando com valores que podem conter espaços ou caracteres especiais. Portanto, adotar a prática de usar aspas duplas ao redor de veriáveis é uma maneira segura de lidar com diferentes tipos de dados.

# Explicação Com Mais Detalhes Sobre os Comandos e Operadores

### <a id = "echo"></a>`echo`

**Exemplos práticos:**

- **Mensagem fixa:** `echo "Olá, mundo!"`
- **Variáveis:**

```
nome="Alice"
echo "Bem vindo, $nome!"
```

- **Múltiplas linhas:**

```
echo "Linha 1
Linha 2
Linha 3
```

- **Sem quebra de linha:** `echo -n "Esta mensagem não terá quebra de linha."`
- **Saída para um arquivo:** `echo "Salvando esta mensagem em um arquivo." > arquivo.txt`

Lembre-se de que o comando `echo` é simples e eficaz para mensagens básicas. Se você precisar de formatação mais avançada ou se estiver lidando com scripts mais complexos, pode ser útil explorar outras ferramentas ou comandos de impressão, como `printf`.

### <a id = "ssh"></a>`ssh`

O SSH (Secure Shell) é comumente utilizado para acessar servidores remotos, transferir arquivos de forma segura, e executar comandos em máquinas remotas.

`ssh usuário@host`

- `usuário`**:** seu nome de usuário na máquina remota
- `host`**:** o endereço do servidor remoto que você deseja acessar

**Exemplo:** `ssh joao@192.168.1.100`

Quando você se conecta pela primeira vez a um host, o `ssh` normalmente pergunta se deseja adicionar a chave RSA à lista de conhecidos. Depois que a chave é adicionada, você pode se conectar novamente sem a necessidade de confirmar a chave.

**Opções comuns:**

- **Especificar uma porta:** por padrão, o `ssh` usa a porta 22. Se o servidor estiver configurado para usar uma porta diferente, você pode especificá-la com a opção `-p`

`ssh -p 2222 joao@192.168.1.100`

Você pode especificar a porta, também, no final:

`ssh joao@192.168.1.100 -p 2222 `

- **Executar comandos remotamente:** você pode executar comandos remotamente sem abrir uma sessão interativa, adicionando o comando no final

`ssh joao@192.168.1.100 ls`

Lembrando que o `ssh` é uma ferramenta poderosa e é importante entender suas opções e considerações de segurança ao utilizá-lo. Certifique-se de configurar suas chaves SSH e siga as melhores práticas de segurança ao trabalhar com conexões remotas.

### <a id = "ls"></a>`ls`

**Opções Comuns**

- **Listar com detalhes:** `ls -l`. A opção `-l` exibe uma listagem detalhada, incluindo permissões, número de links, proprietário, grupo, tamanho, data de modificação e nome do arquivo. Você também pode utilizar `ll` ao invés de especificar a opção
- **Listar todos os arquivos, inclusive os ocultos:** `ls -a`. A opção `-a` exibe todos os arquivos, incluindo aqueles cujos nomes começam com um ponto (arquivos ocultos). Você também pode utilizar `la` ao invés de especificar a opção
- **Listar com detalhes e todos os arquivos, inclusive ocultos:** `ls -la`. Combinação das opções `-l` e `-a`, exibindo detalhes e todos os arquivos
- **Listar por ordem de modificação (mais recente primeiro):** `ls -lt`. A opções `-t` ordena os arquivos pela data de modificação, exibindo os mais recentes primeiro
- **Listar recursivamente (incluindo subdiretórios):** `ls -R`. A opção `-R` lista o conteúdo de diretórios recursivamente
- **Listar com cores (realçar tipos de arquivo):** `ls --color`. Em alguns sistemas, a opção `--color` realça diferentes tipos de arquivos com cores

Essas são apenas alguns exemplos das muitas opções disponíveis para o comando `ls`. Para obter uma lista completa das opções, consulte a página de manual digitando `man ls` no terminal.

### <a id = "chmod"></a>`chmod`

As permissões controlam quem pode ler, escrever ou executar um arquivo ou diretório. O comando `chmod` é uma ferramenta fundamental para gerenciar a segurança e o acesso a arquivos no sistema.

- `opções`**:** pode incluir opções específicas do comando, como `-R` para aplicar recursivamente a permissão a diretórios e seu conteúdo
- `permissões`**:** representa as permissões que você deseja conceder ao arquivo ou diretório. Elas podem ser especificadas de diversas maneiras, incluindo:
    - **Notação octal:** por exemplo, `chmod 755 arquivo` concede permissões de leitura, escrita e execução ao proprietário, e permissões de leitura e execução aos outros
    - **Notação simbólica:** por exemplo, `chmod u=rwx,go=rx arquivo` faz a mesma coisa, especificando as permissões diretamente para o proprietário (u), grupo (g) e outros (o)
- `arquivo`**:** o caminho do arquivo ou diretório cujas permissões você deseja alterar

**Exemplo prático:**

- `chmod 751 arquivo`**:** concede permissões de leitura e execução ao proprietário, permissões de leitura e execução ao grupo, e apenas permissões de execução aos outros
- `chmod -R 700 diretório`**:** concede permissões de leitura, escrita e execução, recursivamente a um diretório e seu conteúdo
- `chmod g+x arquivo`**:** adiciona a permissão de execução ao grupo
    Observe que cada parte das permissões (usuário, grupo e outros) pode ser modificada independentemente, sem afetar as permissões das outras partes, mesmo que estas não sejam especificadas.

### <a id = "cat"></a>`cat`

O comando `cat` (concatenate) é uma ferramenta de linha de comando em sistemas operacionais Unix-like que é utilizada para concatenar e exibir o conteúdo de arquivos. Apesar de seu nome indicar concatenação, o `cat` é frequentemente utilizado para visualizar o conteúdo de um único arquivo.

`cat -opções arquivos(s)`

- **Concatenar vários arquivos:** `cat arquivo1.txt arquivo2.txt > resultado.txt`. Neste exemplo, o conteúdo dos arquivos **arquivo1.txt** e **arquivo2.txt** será concatenado e salvo no arquivo **resultado.txt**
- **Concatenar e exibir conteúdo no terminal:** `cat arquivo1.txt arquivo2.txt`. Neste caso, o conteúdo dos arquivos **arquivo1.txt** e **arquivo2.txt** será exibido diretamente no terminal

Observe que o `cat` não modifica os arquivos utilizados na concatenção. Se você quiser salvar o resultado da concatenação, você deve redirecionar o conteúdo dela para um arquivo como mostrado no exemplo `cat arquivo1.txt arquivo2.txt > resultado.txt`.

**Opções comuns:**

- **Número de linhas (**`-n`**):** adiciona números de linha ao mostrar o conteúdo do arquivo. `cat -n arquivo.txt`
- **Exibir Tabs como ^| (**`-T`**):** exibe caracteres de tabulação como "^|"
- **Exibir Linhas Vazias com Linha de Pontos (**`-s`**):** suprime linhas repetidas vazias, exibindo apenas uma linha de pontos. `cat -s arquivo.txt`

O `cat` é uma ferramenta versátil, mas para algumas operações mais complexas ou específicas, outros comandos como `more`, `less`, ou `head` e `tail` pode sem mais apropriadas.

### <a id = "vim-tiny"></a>`vim.tiny`

O comando `vim.tiny` refere-se a uma versão mais compacta do editor de texto Vim. O Vim é um editor de texto altamente configurável e poderoso, com muitos recursos para facilitar a edição de texto. No entanto, o `vim.tiny` é uma versão mais leve e básica do Vim, muitas vezes usada em ambientes onde a instalação completa do Vim pode ser excessiva.

Em alguns sistemas, principalmente em distribuições Linux mais minimalistas, você pode encontrar variantes do Vim com diferentes conjuntos de recursos. O `vim.tiny` é uma dessas variantes mais leves.

O uso do `vim.tiny` pode ser uma escolha consciente em ambientes onde os recursos são limitados ou quando você precisa de uma inicialização mais rápida do editor de texto. No entando, lembre-se de que o Vim tradicional (`vim`) fornece uma ampla gama de recursos e é mais comumente usado.

**Dentro do Editor de Texto (**`vim`**)**

- `key I`**:** permite que você faça alterações no arquivo
- `:wq!`**:** salva as alterações e sai do editor

### <a id = "tailf"></a>`tailf`

O comando `tailf` é uma versão do comando `tail` que é projetado para funcionar de forma contínua, semelhante ao comando `tail -f`, mas de uma maneira mais eficiente.\
A principal diferença entre `tailf` e `tail -f` é que o `tailf` é mais eficiente e não fecha a conexão com o arquivo, mesmo se o arquivo for renomeado, truncado ou movido. Isso é útil em situações em que o arquivo de log pode ser rotacionado, e você deseja continuar monitorando o novo arquivo que foi criado.

**Exemplo:**

`tailf /var/log/syslog`

Este comando exibirá as últimas linhas do arquivo `/var/log/syslog` e continuará a mostrar novas linhas à medida que são adicionadas ao final do arquivo.

Lembre-se de que a disponibilidade do comando `tailf` pode variar entre diferentes sistemas operacionais. Em alguns sistemas, o `tailf` pode não estar disponível como um comando separado, mas você ainda pode alcançar funcionalidades semelhantes usando o `tail -f`.

### <a id = "rm"></a>`rm`

`rm pwd_absoluto/relativo arquivo`**:** você pode usar o arquivo relativo ou absoluto para remover um arquivo

**Opções Comuns**

- `rm -f arquivo`**:** para excluir o arquivo sem ser solicitado para confirmação, você pode usar a opção `-f` (force)
- `rm -r diretório`**:** remove um diretório e todo o seu conteúdo de forma recursiva (`-r`, recursivo), incluindo subdiretórios

### <a id = "which"></a>`which`

Ele ajuda a determinar onde no sistema de arquivos está localizado o programa ou script que será executado quando você digitar um determinado comando no terminal

### <a id = "sleep"></a>`sleep`

O comando `sleep` é utilizado para introduzir um atraso ou uma pausa no script antes de iniciar o próximo comando. Mesmo para comandos sendo executados em segundo plano, o `sleep` é usado para garantir que haja um intervalo de tempo entre o início de cada aplicativo.

O `intervalo_de_tempo` é especificado por padrão em segundos. Você pode colocar `m` ou `h` após o valor númerico para especificar o intervalo de tempo em minutos ou em horas, respectivamente, por exemplo.

Essa abordagem pode ser útil, pois permite dar tempo para que cada aplicativo seja iniciado antes de prosseguir para o próximo. O valor númerico fornecido como argumento para o `sleep` especifica a quantidade de segundos que o script deve aguardar antes de executar o próximo comando. Isso ajuda a evitar potenciais conflitos ou problemas que pode surgir se várias aplicações forem iniciadas muito rapidamente e simultaneamente.

O uso do `sleep` é uma técnica comum em scripts de automação para garantir que as operações ocorram de maneira ordenada e controlada, especialmente quando há dependências temporais entre as tarefas. Se você tiver certeza que a ordem de iniciação ou sincronização não são críticas para o seu caso específico, você pode optar por remover ou ajustar o tempo de espera fornecido pelo `sleep`.

### <a id = "ifconfig"></a>`ifconfig`

O comando `ifconfig` (interface configuration) é usado para exibir e configurar informações relacionadas às interfaces de rede no sistema. No entando, observe que o `ifconfig` está sendo gradualmente substituído pelo `ip`.

### <a id = "ping"></a>`ping`

O comando `ping` envia pacotes de dados para o `host` de destino e aguarda por respostas, permitindo que você avalie a qualidade da conexão. Onde o `host` pode ser um endereço IP ou um nome de host. Por exemplo: `ping www.exemplo.com` ou `ping 192.168.1.1`.

A execução do comando `ping` resultará em uma série de mensagens monstrando o tempo que leva para os pacotes de dados viajarem de ida e volta entre o seu computador e o host de destino. Essas mensagens podem ser úteis para identificar problemas de conectividade, latência ou perda de pacotes na rede.

**Opções Comuns**

- **Número de pacotes(**`-c`**):** define o número de pacotes a serem enviados. `ping -c 4 www.exemplo.com`
- **Intervalo entre pacotes(**`-i`**):** especifica o intervalo entre os envios de pacotes. `ping -i 2 www.exemplo.com`
- **Tempo limite (**`-W`**):** define o tempo limite para esperar por uma resposta. `ping -W 5 www.exemplo.com`

O `ping` é uma ferramenta valiosa para diagnosticar problemas de rede e verificar a disponibilidade de hosts em uma rede. No entanto, alguns sistemas podem ter restrições de segurança que limitam ou bloqueiam o uso do `ping`.

### <a id = ""></a>`who`

Considere o seguinte cenário, você está verificando em uma máquina remota quem está conectado a ela. Vamos utilizar a saída abaixo para ajudar na compreensão:

```shell
vegas pts/0 2024-01-10 14:08 (notebook-sas.oriongames.intra)
vegas pts/2 2024-01-10 14:08 (notebook-sas.oriongames.intra)
```

O código acima indica que dois terminais (`pts/0` e `pts/2`) estão conectados à maquina remota com o usuário `vegas`.

- `vegas pts/0 2024-01-10 14:08 (notebook-sas.oriongames.intra)`**:** indica que o usuário `vegas` está conectado através do terminal virtual `pts/0` desde as `14:08` de janeiro de `2024`. A string `(notebook-sas.oriongames.intra)` pode ser o nome do endereço do host da máquina local de onde a conexão foi estabelecida
- `vegas pts/2 2024-01-10 14:08 (notebook-sas.oriongames.intra)`**:** indica uma segunda conexão do usuário `vegas` através do terminal virtual `pts/2`, com infomações semelhantes à primeira

O ponto é que o nome do seu usuário da máquina onde você está conectado não aparece, o de usuário que aparece é aquele utilizado na conexão `ssh`.

### <a id = "reboot"></a>`reboot`

Quando você executa o comando `reboot`, o sistema operacional encerra todos os processos em execução, desativa os dispositivos e reinicia o computador, resultando em uma reinicialização completa.

Antes de executar o comando `reboot`, é recomendável garantir que todos os trabalhos em execução e tarefas importantes sejam salvas, pois a reinicialização irá interromper todos os processos e fechar todas as aplicações. Além disso, certifique-se de que não há tarefas críticas em execução no sistema que podem ser afetadas pela reinicialização.\
Lembre-se de que a reinicialização é uma operação que deve ser realizada com cuidado, especialmente em ambientes de produção, para evitar perda de dados e impacto nas operações de execução.

### <a id = "ecomercial"></a>`&`

O `&` é um operador especial que altera o comportamento de execução do comando. Ele indica ao shell que o comando deve ser executado em segundo plano. Isso significa que o shell não aguardará a conclusão do comando antes de continuar a executar outros comandos. O terminal fica disponível para receber novos comandos imediatamente.

Em termos técnicos, o `&` é um **operador de controle de fluxo** que afeta a execução do processo associado ao comando. Ele não é tratado como um argumento que seria passado para o comando em si. Se você deseja passar um caractere "&" como parte de um argumento para um comando, você geralmente precisa escapá-lo para evitar que o shell o inteprete como um operador especial.

# Script

A execução de scripts (extesão .sh) no terminal são feitas fornecendo o caminho absoluto ou relativo para o script.\
Além da forma citada acima, se o diretório contendo o script estiver listado na variável de ambiente `PATH`, você pode executá-lo diretamente pelo nome em qualquer lugar. No entanto, isso geralmente não é recomendado para scripts específicos, especialmente se você tiver vários scripts com o mesmo nome.

# Ferramentas

### `nmap`

`nmap`é uma ferramenta de código aberto projetada para exploração de redes e auditoria de segurança. Nmap (Network Mapper) não é um comando do terminal por si só, mas sim um software que pode ser executado a partir do terminal.

Ao utilizar o Nmap, você geralmente executa um comando no terminal para iniciar a ferramenta e realizar escaneamentos de rede em sistemas específicos, verificar portas abertas, identificar serviços em execução e realizar outras tarefas relacionadas à descoberta de dispositivos em uma rede.

O `alvo` do `nmap` pode ser um endereço IP específico, um nome de host ou uma faixa de endereços IP. O Nmap oferece uma ampla varidade de opções e parâmetros para personalizar a exploração de rede de acordo com as necessidades específicas do usuário.

Portanto, você usa o Nmap como uma ferramenta para análise de redes através do terminal, mas não é um comando embutido no shell, é um programa externo que precisa ser instalado no sistema.

**Opções Comuns**

`-sn`**:** realiza uma varredura de hosts sem realizar uma varredura de portas. Ela é usada para descobrir quais hosts estão online em uma determinada rede sem verificar quais portas estão abertas nesses hosts, Essa varredura é muitas vezes chamada de "Ping Scan" ou "Host Discovery". Exemplo:

`nmap -sn 192.168.1.0/24`

Este comando realizará uma varredura de ping nos hosts na faixa de endereços I de `192.168.1.0` a `192.168.1.255` para descobrir quais deles estão online.

Ao usar o `-sn`, o Nmap enviará pacotes de ping (ICMP Echo Requests) para os hosts alvo e exibirá os resultados, indicando quais hosts responderam aos pacotes ping. Essa abordagem é rápida e eficaz para identificar a presença de hosts ativos em uma rede.