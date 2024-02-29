# Bash

### Sumário

- [Comandos](#comandos)

# <a id="comandos"></a>Comandos

### Sumário

- [`pgrep`](#pgrep)
- [`cp`](#cp)
- [`scp`](#scp)

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

# Template

Template dos comandos: um resumo do comando, a "**Sintaxe Básica**" e exemplos.