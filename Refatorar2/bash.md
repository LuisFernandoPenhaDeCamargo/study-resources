# Bash

### Sumário

- [Comandos](#comandos)
- [Ferramentas de Linha de Comando](#ferramentas-linha-comando-cli)
- [Gerenciadores de Pacote](#gerenciadores-pacote)

# <a id="comandos"></a>Comandos

### Sumário

- [`ps aux`](#ps-aux)
- [`pgrep`](#pgrep)
- [`kill`](#kill)
- [`cp`](#cp)
- [`scp`](#scp)
- [`mv`](#mv)
- [`rm`](#rm)
- [`gzip`](#gzip)
- [`find`](#find)
- [`grep`](#grep)
- [`fdisk`](#fdisk)

## <a id="ps-aux"></a>`ps aux`

O comando `ps aux` (ou `ps -aux`) é usado para listar todos os procesos em execução no sistema. Aqui está o significado de cada parte do comando:

- `ps`**:** é o comando usado para listar processos
- `aux`**:** são as opções que você passa para o comando `ps`. Elas têm os seguintes significados:
    + `a`**:** mostra os processos de todos os usuários
    + `u`**:** mostra detalhes estendidos sobre os processos
    + `x`**:** inclui processos sem terminais associados

Quando você executa `ps aux`, ele mostra uma lista detalhada de todos os processos em execução no sistema, incluindo o PID (identificador de processos), o usuário que iniciou o processo, o uso de CPU e memória, o tempo de execução, o comando que iniciou o processo, entre outras informações.

## <a id="pgrep"></a> `pgrep`

O comando `pgrep` é usado para pesquisar e listar processos com base em critérios de pesquisa, geralmente por nome de processo ou outros atributos. Ele retorna os IDs dos processos que correspondem aos critérios especificados.

Por exemplo, você pode usar `pgrep` para encontrar o ID de processo de um programa específico e, em seguida, usar esse ID para interagir com o processo de várias maneiras, como enviando sinais a ele.

**Sintaxe Básica**

```bash
pgrep [opções] nome_do_processo
```

Alguns exemplos de uso incluem:

- Para listar os IDs de processo de todos os processos com um determinado nome:

```bash
pgrep firefox
```

isso retornaria uma lista de IDs de processo de todos os processos chamados "firefox"

- Para listar os IDs de processo de um processo específico, caso haja vários processos com o mesmo nome, você pode usar opções para restringir a pesquisa:

```bash
pgrep -x firefox
```

A opção `-x` busca apenas processos com um nome exato correspondente a "firefox"

Existem várias outras opções disponíveis para refinar a pesquisa, como limitar a pesquisa a um usuário específico, exibir os nomes dos comandos completos, entre outras.

## <a id="kill"></a>`kill`

O comando `kill` é usado para enviar sinais para processos em execução no sistema. Ele permite que você termine um processo de forma manual, suspenda sua execução, reinicie ou envie outros sinais específicos a ele.

**Sintaxe Básica**

```bash
kill [opções] ID_do_processo
```

Por exemplo, para enviar o sinal padrão (SIGTERM) para encerrar um processo com um determinado ID, você pode usar:

```bash
kill 1234
```

Substitua `1234` pelo ID do processo que você deseja encerrar.

Aqui estão algumas opções comuns do comando `kill`:

- `9` **ou** `-SIGKILL`**:** força o encerramento imediato do processo, sem permitir que ele limpe seus recursos ou finalize suas tarefas em andamento. Este é um sinal de "desligamento forçado" e é frequentemente usado quando um processo não responde aos sinais de término padrão

Por exemplo:

```bash
kill -9 1234
```

- `-15` **ou** `SIGTERM`**:** este é o sinal padrão enviado pelo comando `kill`. Ele instrui o processo a encerrar suavemente, permitindo que ele termine suas tarefas em andamento e libere seus recursos

Por exemplo:

```bash
kill -15 1234
```

É importante notar que você precisa ter permissões adequadas para encerrar um processo. Em alguns casos, pode ser necessário executar o comando `kill` como super usuário. Certifique-se também de que você está encerrando o processo correto, pois encerrar processos indevidamente pode resultar em perda de dados ou corrupção do sistema.

## <a id="cp"></a>`cp`

O comando `cp` é usado para copiar arquivos e diretórios no Linux.

**Sintaxe Básica**

```bash
cp [opções] origem destino
```

- `origem`**:** o caminho para o arquivo ou diretório que você deseja copiar
- `destino`**:** o caminho para onde você deseja copiar o arquivo ou diretório

**Exemplos**

- Para copiar um arquivo chamado **arquivo.txt** do diretório atual para o diretório **/tmp**

```bash
cp arquivo.txt /tmp
```

- Para copiar um diretório chamado **meu_diretorio** e todo o seu conteúdo para outro diretório chamado **backup**, você usaria:

```bash
cp -r meu_diretorio backup
```

A opção `-r` é usada para copiar recursivamente todo o conteúdo do diretório.

**Opções Comuns**

- `-r`**:** copia diretórios de forma recursiva, ou seja, copia todo o conteúdo do diretório e seus subdiretórios
- `-v`**:** modo verbose, exibe informações detalhadas sobre o processo de cópia
- `-i`**:** pede confirmação antes de sobreescrever arquivos existentes
- `-a`**:** preserva permissões de arquivo, timestamps e outros atributos ao copiar

Certifique-se de ter permissões adequadas para acessar os arquivos de origem e gravar no diretório de destino, e tome cuidado ao usar a opções `-r` para copiar diretórios grandes ou profundos, pois pode levar tempo e recursos consideráveis.

## <a id="scp"></a>`scp`

O comando `scp` é usado para transferir arquivos entre computadores em uma rede. Ele é muito semelhante ao comando `cp`, mas funciona sobre uma conexão segura SSH (Secure Shell), o que significa que os arquivos são transferidos de forma segura, criptografada.

**Sintaxe Básica**

```Bash
scp [opções] arquivo_origem usuário@host:arquivo_destino
```

ou

```Bash
scp [opções] usuário@host:arquivo_origem arquivo_destino
```

- `arquivo_origem`**:** o caminho para o arquivo que você deseja copiar
- `usuário`**:** o nome do usuário no host remoto
- `host`**:** o endereço ip ou o nome do host do computador remoto
- `arquivo_destino`**:** o caminho para onde o arquivo será copiado no host remoto ou local

Por exemplo, se você deseja copiar um arquivo chamado **example.txt** do seu computador local para o diretório **/home/usuario** em um computador remoto com IP `192.168.1.100` e o nome de usuário `usuario`, você usaria o seguinte comando:

```Bash
scp example.txt usuario@192.168.1.100:/home/usuario
```

Se você deseja copiar um arquivo do host remoto para o seu computador local, basta trocar a ordem dos argumentos:

```Bash
scp usuario@192.168.1.100:/caminho/remoto/arquivo.txt /caminho/local/arquivo.txt
```

Lembre-se de que você pode precisar fornecer a senha do usuário remoto ou usar autenticação baseada em chaves SSH, dependendo da configuração do sistema. Além disso, você pode adicionar opções extras ao comando `scp` para controle mais avançado sobre a transferência, como definir portas, limitar a velocidade de transferência, etc.

## <a id="mv"></a>`mv`

O comando `mv` é usado para mover arquivos e diretórios de um local para outro no sistema de arquivos. Ele também pode ser usado para renomear arquivos e diretórios, já que a operação de mover um arquivo para um novo nome tem o efeito prático de renomeá-lo.

**Sintaxe Baśica**

```bash
mv [opções] origem destino
```

**Exemplos**

- Para mover um arquivo chamado **arquivo.txt** de um diretório para outro

```bash
mv arquivo.txt /caminho/do/novo/diretorio/
```

- Para renomear o arquivo ao movê-lo, você pode especificar o novo nome no destino:

```bash
mv arquivo.txt /caminho/do/novo/diretorio/novo_nome.txt
```

- Além disso, o comando `mv` pode ser usado para mover múltiplos arquivos para um diretório de destino:

```bash
mv arquivo1.txt arquivo2.txt /caminho/do/novo/diretorio/
```

**Opções Comuns**

- `-i`**:** solicita a confirmação antes de sobrescrever arquivos existentes
- `-v`**:** modo verbose, exibe uma mensagem para cada arquivo movido, mostrando seu nome e destino
- `-u`**:** atualiza apenas arquivos no destino se eles forem mais recentes do que os arquivos originais

Por exemplo, para mover um arquivo com confirmação e exebir mensagens verbose, você pode fazer:

```bash
mv -iv arquivo.txt /caminho/do/novo/diretorio/
```

Lembre-se de que o comando `mv` altera a localização dos arquivos no sistema de arquivos e, portanto, pode ter implicações importantes. Tenha cuidado ao usá-lo, especialmente com arquivos importanter ou sensíveis.

## <a id="rm"></a>`rm`

O comando `rm` é usado para remover arquivos ou diretórios no sistema Linux.

**Exemplos**

- Para remover um arquivo

```bash
rm arquivo
```

- Para remover vários arquivos

```bash
rm arquivo1 arquivo2 arquivo3
```

- Para remover um diretório vazio

```bash
rm -r diretório_vazio/
```

- Para remover um diretório e seu conteúdo recursivamente

```bash
rm -r diretório/
```

- Para remover arquivos sem confirmação (modo silencioso. Remove o arquivo mesmo se ele for protegido contra gravação)

```bash
rm -f arquivo
```

- Para remover um diretório e seu conteúdo sem confirmação (modo silencioso)

```bash
rm -rf diretório/
```

Tenha cuidado ao usar

## <a id="gzip"></a>`gzip`

O comando `gzip` é usado para compactar arquivos no formato GNU zip (gzip). Ele é frequentemente usado para comprimir arquivos para economizar espaço em disco ou para transferência mais rápida pela rede.

**Sintaxe Básica**

```bash
gzip [opções] arquivo
```

**Opções Comuns**

- `-d` **ou** `--decompress`**:** descompacta o arquivo compactado
- `-f` **ou** `--force`**:** força a compressão/descompressão, mesmo se o arquivo resultante já existir (sobrescreve)
- `-r` **ou** `--recursive`**:** comprime/descomprime recursivamente todos os arquivos em diretórios
- `-t` **ou** `--test`**:** testa a integridade do arquivo compactado
- `-v` **ou** `--verbose`**:** exibe mensagens detalhadas durante a operação
- `-k` **ou** `--keep`**:** mantém o arquivo original após compactá-lo. Normalmente, quando você comprime um arquivo usando `gzip`, o arquivo original é substituído pelo arquivo compactado

**Exemplos**

- Para compactar um arquivo chamado **arquivo.txt**

```bash
gzip arquivo.txt
```

Isso criará um arquivo compactado chamado **arquivo.txt.gz** e removerá o arquivo original

- Para compactar vários arquivos em um diretório

```bash
gzip -r diretorio
```

Isso compactará todos os arquivos no diretório `diretorio` e em seus subdiretórios recursivamente

- Para testar a integridade de um arquivo compactado

```bash
gzip -t arquivo.txt.gz
```

Isso verificará se o arquivo compactado `arquivo.txt.gz` está intacto e sem erros.

## <a id="find"></a>`find`

O comando `find` é uma ferramenta poderosa para buscar arquivos e diretórios em um sistema de arquivos Linux. Ele permite que você especifique critérios complexos para encontrar exatamente o que você está procurando.

**Sintaxe Básica**

```bash
find diretório -opções critérios_aqui
```

Aqui estão algumas opções e critérios comuns que você pode usar com o comando `find`:

**Opções**

- `-name padrão`**:** procura por arquivos ou diretórios com um nome específico
- `-type tipo`**:** procura por arquivos de um tipo específico, como `-type f` para arquivos regulares e `-type d` para diretórios
- `-iname padrão`**:** igual ai `-name`, mas não faz distinção entre maiúsculas e minúsculas
- `-maxdepth nível`**:** define o nível  máximo de profundidade para a busca em subdiretórios
- `-mindepth nível`**:** define o nível mínimo de profundidade para a busca em subdiretórios

**Critérios**

- `.`**:** representa o diretório atual
- `..`**:** representa o diretório pai
- `*`**:** corresponde a zero ou mais caracteres em um nome de arquivo
- `?`**:** corresponde a exatamente um caractere em um nome de arquivo

**Exemplos**

- Para encontrar todos os arquivos com a extensão **.txt** no diretório atual e em todos os subdiretórios

```bash
find . -type f -name "*.txt"
```

- Para encontrar todos os diretórios vazios no diretório atual e em todos os subdiretórios

```bash
find . -type d -empty
```

- Para encontrar todos os arquivos modificados nos últimos 7 dias

```bash
find . -type f -mtime -7
```

## <a id="grep"></a>`grep`

O comando `grep` ("Global Regular Expression Print", Impressão Global de Expressões Regulares) é uma ferramenta poderosa de busca de texto em sistemas Unix e Unix-like, como Linux. Ele é usado para pesquisar texto em arquivos ou em saídas de outros comandos.

**Sintaxe Básica**

```bash
grep [opções] padrão arquivo(s)
```

**Opções Comuns**

- `-i`**:** ignora diferenças entre maiúsculas e minúsculas ao fazer a correspondência
- `-r` **ou** `-R`**:** realiza uma pesquisa recursiva em diretórios
- `-n`**:** exibe números de linha juntamente com as correspondências
- `-v`**:** inverte a correspondência, exibindo linhas que não contêm o padrão
- `-l`**:** exibe apenas os nomes dos arquivos que contêm o padrão, não as linhas de correspondentes
- `-E`**:** usa expressões regulares estendidas (regex) para a correspondência
- `-w`**:** faz a correspondência apenas com palavras inteiras

**Exemplos**

- Para pesquisar por uma palavra em um arquivo

```bash
grep palavra arquivo.txt
```

Isso irá buscar todas as ocorrências da palavra `palavra` no arquivo `arquivo.txt`

- Para pesquisar por uma palavra em todos os arquivos de um diretório

```bash
grep -r palavra diretorio/
```

Isso irá buscar recursivamente todas as ocorrências da palavra `palavra` em todos os arquivos dentro do diretório `diretorio/`

- Para pesquisar por uma palavra ignorando diferenças entre maiúsculas e minúsculas

```bash
grep -i palavra arquivo.txt
```

Isso irá buscar todas as ocorrências da palavra `palavra`, ignorando se ela está em maiúsculas ou minúsculas, no arquivo `arquivo.txt`

- Para pesquisar por um padrão em múltiplos arquivos

```bash
grep "padrão" arquivo1.txt arquivo2.txt
``` 

Este comando procurará `padrão` nos arquivos `arquivo1.txt` e "`arquivo2.txt`

- Para pesquisar na saída de um comando (pipe)

```bash
comando | grep "padrão"
```

Este comando enviará a saída do `comando` para o `grep`, que procurará o `padrão` na saída

- Para contagem de ocorrências

```bash
grep -c "padrão" arquivo.txt
```

Este comando contará o número de ocorrências do `padrão` no arquivo

## <a id="fdisk"></a>`fdisk`

O comando `fdisk` é uma ferramenta de linha de comando usada para manipular a tabela de partições em sistemas Linux. Com ele, você pode criar, modificar, excluir, exibir e verificar partições em discos rígidos.

**Sintaxe Básica**

```bash
fdisk opções dispositivo
```

**Opções**

- `-l`**:** lista as partições em todos os dispositivos
- `-u`**:** exibe os tamanhos em setores (por padrão, os tamanhos são exibidos em cilindros)
- `-p`**:** usado com `-l` para exibir as partições em um formato mais legível para máquina
- `-s`**:** exibe o tamanho da partição especificada em setores
- `-t tipo`**:** especifica o tipo de tabela de partições a ser usada

Aqui está um exemplo básico do comando `fdisk`:

```bash
fdisk -l /dev/sda
```

Este comando listará todas as partições no dispositivo `dev/sda`.

Tenha muito cuidado ao usar o `fdisk`, pois ele pode alterar a estrutura da tabela de partições, o que pode resultar na perda de dados se não for usado corretamente. Certifique-se sempre de entender o que está fazendo antes de fazer qualquer alteração. Se não tiver certeza, é melhor buscar orientação adicional ou usar ferramentas mais amigáveis, como o `gparted`, que possui uma interface gráfica.

# <a id="ferramentas-linha-comando-cli"></a>Ferramentas de Linha de Comando (CLI)

Um CLI, uma ferramenta de linha de comando, são termos utilizados para se referir a programas ou utilitários que são executados a partir de um terminal ou prompt de comando e aceitam entrada do usuário na forma de comandos de texto.

### Sumário

- [`wget`](#wget)
- [`systemctl`](#systemctl)
- [`aws`](#aws)

# <a id="wget"></a>`wget`

O comando `wget` é uma ferramenta de linha de comando usada para baixar arquivos da web. Ela suporta o download de arquivos através de diversos protocolos, como HTTP. HTTPS e FTP. O `wget` é muito útil para automatizar o processo de download de arquivos ou recuperar recursos da web de forma rápida e fácil.

**Sintaxe Básica**

```bash
wget [opções] URL
```

**Opções Comuns**

- `-O arquivo`**:** especifica o nome do arquivo de destino
- `-P diretório`**:** especifica o diretório onde o arquivo será salvo
- `-q` **ou** `--quiet`**:** modo silencioso, não exibe saída no terminal
- `-c` **ou** `--continue`**:** continua um download parcial, caso ele tenha sido interrompido
- `-r` **ou** `-R`**:** baixa recursivamente, seguindo links para baixar todos os arquivos vinculados
- `-np` **ou** `--no-parent`**:** não segue links para diretórios acima do diretório inicial
- `-nc` **ou** `--no-clobber`**:** não sobrescreve arquivos existentes
- `-nv` **ou** `--no-verbose`**:** modo silencioso, exibindo apenas informações essenciais

**Exemplos**

- Para baixar um arquivo

```bash
wget https://exemplo.com/arquivo.txt
```

Isso baixará o arquivo `arquivo.txt` do servidor `https://exemplo.com` para o diretório atual

- Para baixar um arquivo e salvá-lo com um nome diferente

```bash
wget -O novo_nome.txt https://exemplo.com/arquivo.txt
```

Isso baixará o arquivo `arquivo.txt` do serivdor `https://exemplo.com` e o salvará como `novo_nome.txt` no diretório atual

- Para baixar um arquivo e salvá-lo em um diretório específico

```bash
wget -P /caminho/do/diretorio http://exemplo.com/arquivo.txt
```

Isso baixará o `arquivo.txt` do servidor `https://exemplo.com` e o salvará no diretório `/caminho/do/diretorio`

# <a id="systemctl"></a>`systemctl`

O `systemctl` é uma ferramenta de linha de comando que é parte do sistema de inicialização do systemd, um sistema de inicialização moderno, amplamente adotado por várias distribuições Linux. Ele é usado para controlar o sistema de inicialização e o gerenciamento de serviços.

Aqui estão algumas das principais funções que o `systemctl` pode realizar:

1. **Iniciar, parar e reiniciar serviços:** você pode iniciar um serviço usando `systemctl start nome_do_serviço`, pará-lo usando `systemctl stop nome_do_serviço` e reiniciá-lo usando `systemctl restart nome_do_serviço`
2. **Habilitar e desabilitar serviços durante a inicialização:** para habilitar um serviço para iniciar durante a inicialização, use `systemctl enable nome_do_serviço`. Para desabilitar um serviço para iniciar durante a inicialização, use `systemctl disable nome_do_serviço`
3. **Verificar o status de serviços:** use `systemctl status nome_do_serviço` para verificar o status de um serviço, incluindo se está em execução ou parado, e se ocorreram erros
4. **Listar serviços:** você pode listar todos os serviços disponíveis com `systemctl list-units --type=service`. Você também pode usar `systemctl list-units --type=service --all` para listar todos os serviços, incluindo aqueles que não estão em execução no momento
5. **Verificar os logs do sistema:** use `journalctl` em conjunto com o `systemctl` para verificar os logs do sistema relacionados aos serviços. Por exemplo, `journalctl -u nome_do_serviço` mostrará apenas os logs para o serviço especificado

Essas são apenas algumas das funcionalidades do `systemctl`. Ele é uma ferramenta poderosa para gerenciar serviços e o sistema de inicialização em sistemas Linux que usam o systemd como seu sistema de inicialização.

# <a id="aws"></a>`aws`

A AWS CLI (Interface de Linha de Comando da Amazon Web Services) é uma ferramenta de linha de comando que permite interagir com os serviços da AWS diretamente a partir do terminal. Com a AWS CLI, você pode realizar uma variedade de tarefas, como criar e gerenciar instâncias EC2, criar e gerenciar buckets no Amazon S3, configurar e gerenciar serviços de rede como o Amazon VPC, entre muitas outras.

A AWS CLI é uma ferramenta poderosa para automação, scripting e administração de recursos na AWS. Ela oferece uma interface unificada para acessar os serviços da AWS e é suportada em várias plataformas, incluindo Linux, macOS e Windows.

Aqui estão alguns dos principais recursos e funcionalidades da AWS CLI:

1. **Autenticação e configuração:** você pode configurar as credenciais de acesso à AWS e outras opções de configuração, como região padrão e formato de saída
2. **Chamadas de API:** a AWS CLI permite fazer chamadas diretas às APIs da AWS para realizar ações em seus recursos
3. **Listagem e descrição de recursos:** você pode listar e descrever recursos existentes em sua conta da AWS, como instâncias EC2, buckets S3, grupos de segurança, etc
4. **Criação e gerenciamento de recursos:** você pode criar e gerenciar recursos diretamente da linha de comando, como criar instâncias EC2, criar buckets, lançar stacks do CloudFormation, etc
5. **Filtragem e formação de saída:** a saída da AWS CLI pode ser formatada de várias maneiras para atender às suas necessidades, incluindo JSON, texto simples e tabelas

Para começar a usar a AWS CLI, você precisa instalá-la em seu sistema e configurar suas credenciais de acesso à AWS. Uma vez configurada, você pode começar a usar os comandos da AWS CLI para interagir com os serviços da AWS.

### Sumário

- [`aws configure list`](#aws-configure-list)
- [`aws s3 cp`](#aws-s3-cp)
- [`aws s3 sync`](#aws-s3-sync)

## <a id="aws-configure-list"></a>`aws configure list`

O comando `aws configure list` é usado para listar as configurações atuais do AWS CLI, incluindo o ID da chave de acesso, a chave de acesso secreta, a região e o formato de saída.

## <a id="aws-s3-cp"></a>`aws s3 cp`

O comando `aws s3 cp` é usado para copiar arquivos e diretórios entre o sistema de arquivos local e um bucket do Amazon S3, ou entre buckets do Amazon S3.

**Sintaxe Básica**

```bash
aws s3 cp "origem" "destino"
```

- `origem`**:** é o caminho para o arquivo ou diretório de origem
- `destino`**:** é o caminho para o arquivo ou diretório de destino

**Opções Comuns**

- `--recursive`**:** copia recursivamente todos os arquivos e subdiretórios
- `--acl`**:** define as permissões de acesso aos objetos copiados
- `--sse`**:** específica o tipo de criptografia de servidor usada durante a cópia
- `--exclude` **e** `--include`**:** específica padrões para excluir ou incluir determinados arquivos durante a cópia

**Exemplos**

- Para copiar um arquivo chamado `arquivo` do sistema de arquivos local para um bucket do Amazon S3

```bash
aws s3 cp "arquivo" "s3://bucket"
```

- Para copiar um arquivo da S3 para o sistema de arquivos local

```bash
aws s3 cp "s3://bucket/arquivo" .
```

## <a id ="aws-s3-sync"></a>`aws s3 sync`

O comando `aws s3 sync` é usado para sincronizar o conteúdo entre um diretório local e um bucket do Amazon S3 ou entre dois buckets do Amazon S3. Ele é uma maneira eficiente de garantir que os dados estejam consistentes entre um sistema de arquivos local e o armazenamento na nuvem do S3.

Se houver arquivos no diretório local que não existam no bucket S3, esses arquivos serão copiados para o bucket durante a sincronização, da mesma forma, se houver arquivos no bucket S3 que não existam no diretório local, esses arquivos serão copiados para o diretório local durante a sincronização. Ou seja, após a sincronização, o conteúdo do diretório local será o mesmo que o conteúdo do bucket S3, garantindo que ambos estejam em sincronia.

**Sintaxe Básica**

```bash
aws s3 sync "caminho_local" "s3://nome_do_bucket/caminho_no_bucket"
```

- `caminho_local`**:** é o diretório local que você deseja sincronizar com o S3
- `nome_do_bucket`**:** é o nome do bucket do Amazon S3
- `caminho_no_bucket`**:** é o caminho dentro do bucket onde você deseja sincronizar os arquivos

**Opções Comuns**

A opção `--delete` remove os arquivos no destino que não existem no ponto de origem durante a sincronização.

**Exemplos**

- Para sincronizar o conteúdo do diretório local `/caminho/local` com o bucket `meu-bucket` e o diretório `pasta-no-bucket`

```bash
aws s3 sync "/caminho/local" "s3://meu-bucket/pasta-no-bucket"
```

- Para remover os arquivo no destino (`s3://meu-bucket/pasta-no-bucket`) que não existem no ponto de origem (`/caminho/local`)

```bash
aws s3 sync "/caminho/local" "s3://meu-bucket/pasta-no-bucket" --delete
```

# <a id="gerenciadores-pacote"></a>Gerenciadores de Pacote

### Sumário

- [`cargo`](#cargo)

# <a id="cargo"></a>`cargo`

`cargo` é a ferramenta de gerenciamento de pacotes e construção para o ecossistema de desenvolvimento em Rust. É uma ferramenta poderosa que simplifica o processo de construção, testes e distribuição de aplicativos e bibliotecas escritos em Rust.

Aqui estão alguns dos principais recursos e funcionalidade do `cargo`:

1. **Gerenciamento de dependências:** o `cargo` facilita a gestão das dependências do seu projeto Rust. Você pode especificar as dependências do seu projeto no arquivo **Cargo.toml**, e o `cargo` cuidará de baixar e gerenciar essas dependências
2. **Construção de projetos:** o `cargo` é usado para compilar projetos em Rust. Ele detecta automaticamente os arquivos de origem no diretório do projeto e compila-os em binários executáveis ou bibliotecas compartilhadas, dependendo do tipo de projeto
3. **Testes automatizados:** o `cargo` inclui suporte embutido para testes automatizados. Você pode escrever tester unitários e de integração para o seu código em Rust e executá-los facilmente com o comando `cargo test`
4. **Geração de documentação:** o `cargo` pode ser usado para gerar documentação para o seu código em Rust. O comando `cargo doc` gera documentação HTML para todos os itens públicos no seu projeto, incluindo módulos, estruturas, enumerações e funções
5. **Publicação de pacotes:** se você estiver criando uma biblioteca em Rust que deseja compartilhar com outros desenvolvedores, o `cargo` facilita a publicação dessas bilbiotecas no repositório de pacotes crate.io. Você pode usar o comando `cargo publish` para publicar novas versões da sua biblioteca
6. **Ferramentas adicionais:** o `cargo` também inclui várias ferramentas adicionais, como `cargo fmt` para formatar automaticamente o código, `cargo clippy` para realizar análises estáticas de código e `cargo run` para executar o binário compilado

No geral, o `cargo` é uma ferramenta essencial para o desenvolvimento em Rust, simplificando o processo de construção, testes e distribuição de projetos. Ele é amplamente utilizado pela comunidade de desenvolvedores Rust e é recomendado para qualquer pessoa que esteja desenvolvendo em Rust.

### Sumário

- [`cargo add`](#cargo-add)
- [Erros de Importação](#erros-importação)

## <a id="cargo-add"></a>`cargo add`

Adiciona uma nova dependência ao seu projeto, adiciona a depêndencia ao  **Cargo.toml**.

**Sintaxe Básica**

```bash
cargo add crate1 crate2 ...
```

## <a id="erros-importação"></a>Erros de Importação

Vamos analisar o cenário real, "o erro ocorre porque você não importou o tipo `StaticProvider` do módulo `rusoto_credential` corretamente. Quando você usa `use rusoto_credential;`, você está importando o módulo `rusoto_credential` como um todo, **mas isso não significa que todos os itens dentro desse módulo estão automaticamente disponíveis no escopo atual**".

Então haverá casos em que mesmo que você importe a crate como um todo, você precise importar um recurso de forma explicíta para que eles estejam disponíveis no escopo em questão.

# Template

Template dos comandos: um resumo do comando, a "**Sintaxe Básica**", "**Opções Comuns**" e **Exemplos**.