# Bash

### Sumário

- [Comandos](#comandos)

# <a id="comandos"></a>Comandos

### Sumário

- [`pgrep`](#pgrep)
- [`kill`](#kill)
- [`cp`](#cp)
- [`scp`](#scp)
- [`mv`](#mv)

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

Por exemplo, para copiar um arquivo chamado **arquivo.txt** do diretório atual para o diretório **/tmp**, você usaria:

```bash
cp arquivo.txt /tmp
```

Para copiar um diretório chamado **meu_diretorio** e todo o seu conteúdo para outro diretório chamado **backup**, você usaria:

```bash
cp -r meu_diretorio backup
```

A opção `-r` é usada para copiar recursivamente todo o conteúdo do diretório.

Aqui estão algumas opções comuns que você pode usar com o comando `cp`:

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
scp example.txt usuairo@192.168.1.100:/home/usuario
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

Por exemplo, para mover um arquivo chamado **arquivo.txt** de um diretório para outro, você pode fazer:

```bash
mv arquivo.txt /caminho/do/novo/diretorio/
```

Se você deseja renomear o arquivo ao movê-lo, você pode especificar o novo nome no destino:

```bash
mv arquivo.txt /caminho/do/novo/diretorio/novo_nome.txt
```

Além disso, o comando `mv` pode ser usado para mover múltiplos arquivos para um diretório de destino:

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

# Template

Template dos comandos: um resumo do comando, a "**Sintaxe Básica**", "**Opções Comuns**" e exemplos.