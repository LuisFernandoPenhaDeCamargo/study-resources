# Bash

### Sumário

- [Comandos](#comandos)
    + [`lsb_release -a`](#comandos-lsb-release)
    + [`sudo -E`](#comandos-sudo-e)
    + [`sudo apt update`](#comandos-sudo-apt-update)
    + [`sudo apt upgrade`](#comandos-sudo-apt-upgrade)
    + [`ssh`](#comandos-ssh)
    + [`arp`](#comandos-arp)
    + [`pgrep`](#comandos-pgrep)
    + [`kill`](#comandos-kill)
    + [`cat`](#comandos-cat)
    + [`tr`](#comandos-tr)
    + [`sed`](#comandos-sed)
    + [`curl`](#comandos-curl)
    + [`strip`](#comandos-strip)
    + [`upx`](#comandos-upx)
    + [`strings`](#comandos-strings)
    + [`ldd`](#comandos-ldd)
- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [`apt`](#apt)
- [Snap](#snap)
- [`vim`](#vim)

# <a id="comandos"></a>Comandos

### Sumário

- [`lsb_release -a`](#comandos-lsb-release)
- [`sudo -E`](#comandos-sudo-e)
- [`sudo apt update`](#comandos-sudo-apt-update)
- [`sudo apt upgrade`](#comandos-sudo-apt-upgrade)
- [`ssh`](#comandos-ssh)
- [`arp`](#comandos-arp)
- [`pgrep`](#comandos-pgrep)
- [`kill`](#comandos-kill)
- [`cat`](#comandos-cat)
- [`tr`](#comandos-tr)
- [`sed`](#comandos-sed)
- [`curl`](#comandos-curl)
- [`strip`](#comandos-strip)
- [`upx`](#comandos-upx)
- [`strings`](#comandos-strings)
- [`ldd`](#comandos-ldd)

## <a id="comandos-lsb-release"></a>`lsb_release -a`

O comando `lsb_release` é usado para exibir informações sobre a distribuição Linux em execução. Ele mostra detalhes como o nome da distribuição, a versão e o codinome. Isso pode ser útil para verificar rapidamente informações específicas sobre a distribuição Linux que está sendo usada.

```bash
$ lsb_release -a
```

Isso exibirá todas as informações disponíveis sobre a distribuição Linux em execução.

## <a id="comandos-sudo-e"></a>`sudo -E`

O comando `sudo -E` é usado para preservar as variáveis de ambiente do usuário quando executando comandos com privilégios de superusuário usando `sudo`.

**Exemplos**

Se você definir uma variável de ambiente no seu shell atual e precisar executar um comando com `sudo`, pode usar `sudo -E` para garantir que o comando tenha acesso às mesmas variáveis de ambiente que você têm no seu shell atual.

```bash
sudo -E $< comando >
```

Isso garantirá que o comando `comando` tenha acesso às variáveis de ambiente definidas no seu shell atual.

## <a id="comandos-sudo-apt-update"></a>`sudo apt update`

O comando `sudo apt update` é usado para atualizar a lista de pacotes disponíveis nos repositórios configurados no sistema. Quando você executa este comando, o sistema irá verificar os repositórios definidos no arquivo **/etc/apt/sources.list** e em qualquer arquivo de lista de repositórios dentro do diretório **etc/apt/sources.list.d/**. Ele irá baixar as informações mais recentes sobre os pacotes disponíveis e suas versões.

É importante atualizar a lista de pacotes regularmente para garantir que você tenha acesso às versões mais recentes e às últimas correções de segurança. No entanto, este comando não instala ou atualiza os próprios pacotes, ele apenas atualiza a lista de pacotes disponíveis. Para instalar ou atualizar os pacotes, você precisa usar o comando `sudo apt install` ou `sudo apt upgrade`, respectivamente.

## <a id="comandos-sudo-apt-upgrade"></a>`sudo apt upgrade`

O comando `apt upgrade` é usado para atualizar os pacotes instalados no sistema para suas versões mais recentes disponíveis. Ele verifica os pacotes instalados em seu sistema em relação à lista de pacotes disponívei nos repositórios configurados e, se houver versões mais recentes disponíveis, o `sudo apt upgrade` irá atualizar esses pacotes para as versões mais recentes.

É importante observar que o `sudo apt upgrade` pode atualizar várias partes no sistema, incluindo o kernel, bibliotecas compartilhadas e outros pacotes de software. Antes de executar este comando, é uma boa prática fazer backup dos dados importantes e garantir que você esteja ciente das alterações que serão feitas no sistema. Além disso, em sistemas de produção, é comum agendar atualizações e realizar testes para evitar interrupções não planejadas.

## <a id="comandos-ssh"></a>`ssh`

**Opções Comuns**

- `-oHostKeyAlgorithms`**:** é usado no comando `ssh` para especificar algoritmos de chave host que o cliente SSH pode oferecer para autenticação durante a conexão com um servidor remoto. Por exemplo, `oHostKeyAlgorithms=+ssh-rsa`
    + `-o`**:** esta opção é usada para definir opções específicas do OpenSSH
    + `HostKeyAlgorithms=+ssh-rsa`**:** esta é a parte especifica os algoritmos de chave host a serem oferecidos durante a negociação de chaves com o servidor SSH. O `+` indica que o algoritmo SSH-RSA deve ser adicionado à lista padrão de algoritmos suportados  
        O algoritmo SSH-RSA é um dos métodos de autenticação de chave pública usados pelo protocolo SSH para autenticar o servidor remoto. Esta opção permite que o cliente SSH especifique explicitamente que deseja oferecer o algoritmo SSH-RSA para autenticação de chave host durante a conexão SSH; Isso pode ser útil em situações onde há restrições ou preferências específicas de segurança em relação aos algoritmos de chave host a serem usados durante a comunicação SSH.

## <a id="comandos-arp"></a>`arp`

O comando `arp` é usado para exibir e manipular tabelas de resolução de endereços de protocolo (ARP) em sistemas Unix e Linux. Ele mostra o mapeamento entre endereços IP e endereços MAC na rede local.

1. **Exibir a tabela ARP:**

```bash
$ arp
```

2. **Exibir informações detalhadas sobre a tabela ARP:**

```bash
$ arp -a
```

3. **Limpar a tabela ARP:**

```bash
$ sudo arp -d -a
```

Tenha em mente que, em sistemas modernos, o ARP é frequentemente gerenciado automaticamente pelo sistema operacional e pelo hardware de rede, portanto, você pode não precisar manipular a tabela ARP manualmente com tanta frequência.

## <a id="comandos-pgrep"></a>`pgrep`

O comando `pgrep` é usado para encontrar processos com base em seus nomes ou outros atributos e imprimir seus IDs de processo (PIDs). Ele é frequentemente usado em scripts ou comandos de uma linha para automatizar tarefas relacionadas a processos.

Por exemplo, para encontrar o PID de um processo chamado `orion-game-server`, você pode usar

```bash
$ pgrep orion-game-server
```

Isso retornará o PID do processo `orion-game-server`, se estiver em execução. Se houver mais de um processo com o mesmo nome, o `pgrep` listará todos os PIDS.

Você também pode usar expressões regulares com o `pgrep`. Por exemplo, para encontrar todos os processos do Node.js, você pode usar:

```bash
$ pgrep -f node
```

Isso retornará os PIDs de todos os processos cujos comandos correspondem à expressão regular `node`.

O `pgrep` oferece várias opções para ajustar o comportamento da pesquisa, como ignorar maiúsculas/minúsculas, limitar a busca ao usuário atual, entre outros. Você pode ver todas as opções disponíveis na página do manual usando `man pgrep`.

## <a id="comandos-kill"></a>`kill`

O comando `kill` é usado no sistema operacional Unix e em sistemas Unix-like para enviar sinais para processos em execução. Ele é usado principalmente para interagir com processos em execução no sistema. Aqui estão algumas formas comuns de usar o comando `kill`:

1. **Enviar um sinal para um processo por ID de processo (PID):**

```bash
$ kill $< PID >
```

Substitua `PID` pelo ID de processo do processo que você deseja sinalizar. Por exemplo, `kill 1234`

2. **Enviar um sinal específico para um processo:**

```bash
$ kill -$< SIGNAL > $< PID >
```

Substitua `SIGNAL` pelo nome ou número do sinal que você deseja enviar. Por exemplo, `kill -TERM 1234` para enviar um sinal SIGTERM

3. **Enviar um sinal para um processo por nome:**

```bash
$ pkill $< nome do processo >
```

Este comando envia um sinal para todos os processos cujo nome corresponde a `nome do processo`

4. **Enviar um sinal específico para um processo por nome:**

```bash
$ pkill -SIGNAL $< nome do processo >
```

Isso envia um sinal específico para todos os processos cujo nome corresponde a `nome do processo`. Observando que o nome do processo é a coluna `COMMAND`, exibida pelo comando `ps aux`

5. **Encerrar um processo graciosamente:**

```bash
$ kill $< PID >
```

Isso envia o sinal SIGTERM, que instrui o processo a encerrar graciosamente

6. **Forçar o encerramento de um processo:**

```bash
$ kill -9 $< PID >
```

Isso envia o sinal SIGKILL, que termina imediatamente o processo

Certifique-se de ter as permissões adequadas para enviar sinais para os processos desejados. O envio de sinais inadequados ou a terminação forçada de processos pode resultar em perda de dados ou corrupção do sistema. Use com cuidado.

**Exemplos Interessantes**

O comando

```bash
$ pkill -9 node
```

encerrou os processos de PID `19587` e `19593`

```bash
luis@lfernando:~$ ps aux | grep orion
luis       19587  6.5  0.2 1210452 59040 pts/5   Sl+  13:52   0:00 node ./orion-game-server
luis       19593  5.1  0.2 1210436 57420 pts/5   Sl+  13:52   0:00 /home/luis/.nvm/versions/node/v8.16.0/bin/node /home/luis/.nvm/versions/node/v8.16.0/bin/orion-game-server
luis       19614  0.0  0.0   9240  2432 pts/1    S+   13:52   0:00 grep --color=auto orion
```

Ou seja, o nome dos dois processos acima é "`node`".

## <a id="comandos-cat"></a>`cat`

O comando `cat` é uma abreviação de "concatenate" (concatenar). Ele é usado principalmente para exibir o conteúdo de arquivos de texto no terminal. O `cat` é uma ferramenta muito simples e versátil sendo frequentemente utilizada para visualizar ou combinar conteúdos de arquivos.

**Sintaxe Básica**

```bash
$ cat [opções] [arquivo(s)]
```

- `[opções]`**:** opções adicionais que podem ser usadas com o comando `cat`
- `[arquivo(s)]`**:** o(s) arquivo(s) cujo conteúdo será exibido

**Exemplos**

- Para exibir o conteúdo de um arquivo chamado `exemplo.txt`, você usaria:

```bash
$ cat exemplo.txt
```

- Se você quiser visualizar o conteúdo de vários arquivos, pode listar todos eles como argumentos para o `cat`:

```bash
$ cat arquivo1.txt arquivo2.txt arquivo3.txt
```

O `cat` também pode ser usado para criar, concatenar e manipular arquivos, mas seu uso principal é para visualização de conteúdo de arquivos.

## <a id="comandos-tr"></a>`tr`

O comando `tr` é usado para traduzir ou excluir caracteres em um fluxo de entrada e imprimir o resultado no terminal. Ele é uma ferramenta muito útil para fazer transformações simples em texto.

**Sintaxe Básica**

```bash
$ tr [opções] $< conjunto de caracteres 1 >  $< conjunto de caracteres 2 >
```

- `[opções]`**:** opções adicionais que podem ser usadas com o comando `tr`
- `conjunto de caracteres 1`**:** conjunto de caracteres a serem substituídos
- `conjunto de caracteres 2`**:** conjunto de caracteres de substituição

**Exemplos**

- Para substituir todos os caracteres minúsculos por maiúsculos em um texto, você usaria:

```bash
$ echo "Olá Mundo" | tr '[:lower:]' '[:upper:]'
```

Aqui `[:lower:]` e `[:upper:]` são classes de caracteres que representam, respectivamente, os caracteres minúsculos e maiúsculos

- O `tr` também pode ser usado para excluir caracteres ou fazer outras substituições simples. Por exemplo, para remover todos os espaços de um texto, você poderia usar:

```bash
echo "Olá Mundo" | tr -d ' '
```

Isso removerá todos os espaços do texto de entrada

O `tr` é uma ferramenta muito útil e versátil para manipulação de texto em scripts de shell ou na linha de comando.

## <a id="comandos-sed"></a>`sed`

O comando `sed`, que significa "editor de fluxo", é uma poderosa ferramenta de processamento de texto disponível em sistemas Unix e Unix-like. Ele é usado principalmente para fazer transformações em texto em um pipeline de comandos ou em scripts.

Alguns usos comuns do `sed` incluem:

1. **Substituição de texto:** substituir texto em um arquivo por outro texto. Por exemplo:

```bash
$ sed 's/antigo/novo/g' arquivo.txt
```

Isso substituirá todas as ocorrências de "`antigo`" por "`novo`" em `arquivo.txt`

2. **Remoção de linhas:** remover linhas específicas de um arquivo. Por exemplo:

```bash
$ sed '/padrão/d' arquivo.txt
```

Isso removerá todas as linhas que contêm o padrão especificado do arquivo `arquivo.txt`

3. **Inserção de texto:** inserir texto em linhas específicas. Por exemplo:

```bash
$ sed '3i\Nova linha inserida' arquivo.txt
```

Isso inserirá "`Nova linha inserida`" antes da terceira linha em `arquivo.txt`

4. **Seleção de intervalo de linhas:** selecionar um intervalo de linhas para processamento. Por exemplo:

```bash
$ sd '10, 20d' arquivo.txt
```

Isso removerá todas as linhas da 10ª à 20ª  em `arquivo.txt`

5. **Uso de expressões regulares:** o `sed` suporta expressões regulares para combinar padrões de texto mais complexos

Esses são apenas alguns exemplos das muitas coisas que você pode fazer com o `sed`. Ele é uma ferramenta muito versátil e útil para manipulação de texto em scripts ou em linha de comando.

**Exemplos Interessantes**

O comando abaixo é usado para imprimir a segunda linha de um arquivo. Aqui está o que cada parte do comando faz:

```bash
sed -n 2p
```

- `sed`**:** invoca o comando `sed`, que é o editor de fluxo
- `-n`**:** essa opção desativa a saída automática de padrão, o que significa que o `sed` não imprimirá automaticamente cada linha após processá-la. Isso é útil quando queremos controlar explicitamente o que será impresso
- `2`**:** indica que queremos trabalhar com a segunda linha do arquivo
- `p`**:** esta é a instrução de impressão do `sed`, que diz ao `sed` para imprimir a linha

Portanto, quando você executa o comando `sed -n 2p arquivo.txt`, o `sed` lê o arquivo `arquivo.txt`, pula para a segunda linha e a imprime. Se o arquivo tiver menos de duas linhas, nada será impresso.

## <a id="comandos-curl"></a>`curl`

O `curl` é uma ferramenta de linha de comando utilizada para tranferir dados de ou para um servidor, utilizando os protocolos suportados, como HTTP, HTTPS, FTP, entre outros. Com o `curl`, você pode baixar arquivos, fazer requisições a APIs web, enviar dados para servidores e muito mais.

**Opções Comuns**

- `-O`**,** `--remote-name`**:** esta opção diz ao `curl` para salvar o arquivo baixado com o mesmo nome do arquivo remoto
- `-X`**,** `--request`**:** esta opção permite especificar o método HTTP a ser usado na requisição
- `-H`**.** `--header`**:** esta opção permite adicionar cabeçalhos HTTP personalizados à requisição
- `-d`**,** `--data`**:** está opção permite enviar dados no corpo da requisição, principalmente usado em requisições POST

Essas são algumas das opções mais comuns do `curl`, e elas podem ser combinadas conforme necessário para atender aos requisitos específicos de sua aplicação ou uso.

**Exemplos**

1. **Fazer uma requisição HTTP GET para uma URL**

```bash
$ curl https://example.com
```
2. **Baixar um arquivo para o diretório atual:**

```bash
$ curl -O https://example.com/file.txt
```

Isso baixará o arquivo `file.txt` do URL especificado e o salvará no diretório atual com o mesmo nome

3. **Fazer uma requisição POST com dados JSON:**

```bash
$ curl -X POST -d '{"key": "value"}' -H "Content-Type: application/json" https://api.example.com
```

O `curl` é uma ferramenta podera e altamente flexível, com muitas opções e recursos. Você pode verificar a documentação oficial ou usar `curl --help` para obter mais informações sobre como usá-lo.

**Exemplos Interessantes**

```bash
$ curl $< protocolo >://$< host >:$< porta >/$< restante da URL > -X GET -H "Content-Type: application/json" -H 'Authorization: Bearer $< token >' -d '{"key": value}'
```

No exemplo acima, estamos:

- Utilizando o protocolo `protocolo`
- A requisição está sendo feita para o host `host` (para fazermos uma requisição para um host local, usamos `localhost`), utilizando a porta `porta`
- É um método HTTP `GET` (logo, o protocolo deve ser algo que se adeque a isso)
- É uma requisição que possui um cabeçalho HTTP personalizado, que específica que dados JSON serão utilizados (`"Content-Type: application/json"`). Não esquecer que o protocolo deve se adequar a isso
- No cabeçalho também está especificado a forma de autenticação (`Authorization: Bearer $< token >`)
- O corpo da requisição é composto por `'{"key": "value"}'`

## <a id="comandos-strip"></a>`strip`

O comando strip é uma ferramenta utilizada para remover informações desnecessárias de arquivos binários, como executáveis e bibliotecas compartilhadas. Ele é frequentemente usado para reduzir o tamanho dos arquivos, removendo símbolos de depuração e outras informações que não são essenciais para a execução do programa.

Quando você executa o strip em um arquivo binário, ele remove seções de depuração, tabelas de símbolos e outras informações que são úteis apenas durante o desenvolvimento e a depuração do software. Isso pode reduzir significamente o tamanho do arquivo final, tornando-o mais eficiente em termos de armazenamento e distribuição.

No entanto, é importante observar que o strip pode não ser capaz de reduzir o tamanho de todos os arquivos binários da mesma forma. Às vezes, o tamanho do arquivo pode até aumentar após a remoção das informações de depuração. Isso pode ocorrer por uma variedade de razções, incluindo otimizações de código, inclusão de dependências adicionais ou outras mudanças na estrutura do arquivo durante o processo de stripping.

## <a id="comandos-upx"></a>`upx`

O UPX (Ultimate Packer for eXecutables) é uma ferramenta de compactação de executáveis de código aberto. É usado para reduzir o tamanho de arquivos executáveis, tornando-os mais fáceis de distribuir, e em alguns casos, mais rápidos de carregar devido ao menor tamanho no disco. UPX suporta uma grande variedade de formatos de arquivo de executáveis em diferentes sistemas operacionais, incluindo Windows, Linux e macOS.

Para usar o UPX, você primeiro precisa instalá-lo. Em sistemas baseados em Debian como Ubuntu, você pode instalá-lo via apt:

```bash
sudo apt install upx
```

Após a instalação, você pode usar o UPX para compactar um executável com um comando simples. Por exemplo:

```bash
upx -9 /path/to/your/executable
```

Onde `-9` indica o nível máximo de compactação. Você também pode descompactar arquivos que foram compactados com UPX usando:

```bash
upx -d /path/to/your/compressed/executable
```

O UPX é especialmente útil para desenvolvedores que desejam reduzir o tamanho de seus programas e scripts para facilitar a distribuição ou para economizar espaço em dispositivos com armazenamento limitado.

## <a id="comandos-strings"></a>`strings`

O comando `strings` em sistemas Unix-like é uma ferramenta muito útil para visualizar sequências de caracteres ASCII legíveis em arquivos binários. Ele é frequentemente usado para extrair texto de executáveis e outros arquivos binários que de outra foram seriam difíceis de analisar. Isso pode ser particulamente útil para fins de depuração ou para recuperar informações de arquivos quando o código fonte não está disponível.

**Sintaxe Básica**

Para usar o comando `strings`, você simplesmente passa o nome do arquivo como argumento.

```bash
$ strings $< executável >
```

Isso imprimirá toda as sequências de caracteres imprimíveis de comprimento mínimo padrão (geralmente 4 caracteres) encontradas no arquivo `executável`.

**Opções Comuns**

- `-n [tamanho]` **ou** `--bytes=[tamanho]`**:** define o comprimento mínimo da string a ser encontrada. Por exemplo, `string -n 6 arquivo` mostrará strings que tenham pelo menos 6 caracteres de comprimento
- `-a` **ou** `--all`**:** escaneia todo o arquivo, não apenas as seções de dados
- `-t [formato]` **ou** `--radix=[formato]`**:** adiciona um prefixo ao resultado indicando o deslocamento do arquivo onde a string foi encontrada. Os formatos podem ser `d` para decimal, `o` para octal, e `x` para hexadecimal
- `-o`**:** é equivalmente a usar `-t o`, que usa formato octal para deslocamentos

**Exemplos de Uso**

Se você quiser encontrar todas as strings de pelo menos 5 caracteres em um arquivo executável e ver onde estão localizadas no arquivo, você poderia usar:

```bash
strings -n 5 -t x meu_executável
```

Esse comando é uma maneira prática de inspecionar o conteúdo de arquivos quando você suspeita que eles contenham dados legíveis ou quando está investigando a funcionalidade ou possível comportamento malicioso de um software desconhecido.

## <a id="comandos-ldd"></a>`ldd`

O comando `ldd` é uma ferramenta utilizada em sistemas Unix e Linux para imprimir as dependências compartilhadas necessárias por um executável ou objeto compartilhado. Ele mostra as bibliotecas dinâmicas compartilhadas requeridas por um arquivo binário ou objeto compartilhado, juntamente com os caminhos para essas bibliotecas.

**Sintaxe Básica**

```bash
$ ldd [opções] arquivo
```

- `arquivo`**:** é o executável ou objeto compartilhado para o qual você deseja listar as dependências
- `opções`**:** são opções adicionais que você pode fornecer ao comando, como `-v` para uma saída mais detalhada

**Exemplos**

Se você quiser verificar as dependências compartilhadas de um executável chamado `meu_programa`, você pode executar:

```bash
$ ldd meu_programa
```

Isso mostrará todas as bibliotecas compartilhadas necessárias pelo `meu_programa`, juntamente com seus caminhos.

# <a id="observacoes-sistema-operacional"></a>Observações Sobre o Sistema Operacional

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="apt"></a>`apt`

O `apt` é um utilitário de linha de comando utilizado em sistemas operacionais baseados no Debian (como Ubuntu e Debian) para gerenciar pacotes. Ele é uma abreviação de "Advanced Package Tool" (Ferramenta de Pacote Avançada) e é usado para instalar, atualizar, remover e gerenciar pacotes de software no sistema operacional.

O `apt` simplifica o processo de instalação e manutenção de software, automatizando o donwload e a instalação de pacotes, além de gerenciar suas dependências. Ele permite que os usuários instalem novos programas, atualizem pacotes existentes para versões mais recentes e removam pacotes que não são mais necessários.

O `apt` é uma interface de usuário mais amigável para o sistema de gerenciamento de pacotes Debian (DPKG), tornando mais fácil para os usuários interagirem com o sistema gerenciamento de pacotes e manter seus sistemas atualizados e seguros.

# <a id="snap"></a>Snap

O Snap é um sistema de empacotamento de aplicativos desenvolvido pela Canonical, a mesma empresa por trás do Ubuntu. Ele permite que os desenvolvedores empacotem aplicativos juntamente com suas dependências em um único arquivo, chamado de "Snap", que pode ser distribuído e instalado em diferentes distribuições Linux.

O Snap é uma tecnologia de empacotamento de aplicativos que visa resolver alguns dos desafios associados à distribuição de software em Linux. Ele oferece algumas vantagens sobre os méetodos de empacotamento tradicionais, como:

1. **Confinamento de aplicativos:** os Snaps são empacotados com todas as suas dependências e são executados em um ambiente isolado, o que significa que não interferem com outros aplicativos ou o sistema operacional. Isso ajuda a garantir que os aplicativos permaneçam estáveis e seguros
2. **Atualizações automáticas:** os Snaps podem ser configurados para atualizar automaticamente para novas versões assim que estiverem disponíveis, garantindo que os usuários tenham sempre a versão mais recente do software
3. **Compatibilidade entre distribuições:** os Snaps podem ser instalados em diferentes distribuições Linux que suportam a tecnologia Snap, o que simplifica a distribuição de aplicativos e torna mais fácil para os desenvolvedores alcançarem um grande número de usuários
4. **Segurança:** devido ao seu ambiente de execução isolado, os Snaps são considerados mais seguros em comparação com aplicativos tradicionais, pois reduzem o impacto de vulnerabilidades de segurança

Em resumo, o Snap é uma tecnologia que visa simplificar a distribuição e o gerenciamento de aplicativos em Linux, fornecendo uma maneira fácil de empacotar, distribuir e manter aplicativos.

# <a id="vim"></a>`vim`

Para utilizar o `vim.tiny`, você precisa ter o `vim` instalado (`sudo apt install vim`).