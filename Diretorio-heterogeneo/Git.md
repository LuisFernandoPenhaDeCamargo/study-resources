# Git

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Realizando o Merge de Uma Branch Local com Uma Branch do Repositório Remoto](#realizando-merge-branch-local-branch-repositorio-remoto)
    + [Resoluções de Conflito de Merge](#realizando-merge-branch-local-branch-repositorio-remoto-resolucoes-conflito-merge)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
    + [`diff $< nome da branch com a qual você quer comparar a branch atual >` ](#comandos-utilizados-cli-diff)
    + [config --global -l](#comandos-utilizados-cli-config-global-l)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="realizando-merge-branch-local-branch-repositorio-remoto"></a>Realizando o Merge de Uma Branch Local com Uma Branch do Repositório Remoto

```bash
# Atualize as referências locais da branches remotas.
$ git fetch origin
$ git switch $< branch que terá as alterações incorporadas >
$ git pull origin $< branch que terá as alterações incorporadas >

$ git switch $< branch que irá incorporar as alterações >

$ git merge $< branch que terá as alterações incorporadas >

# Resolva quaisquer conflitos que possam surgir (se houver).

# Envie as mudanças para o repositório remoto.
$ git push origin $< branch que irá incorporar as alterações >
```

- `git fetch origin`**:** atualiza as referências locais das branches remotas
- `git switch $< branch que terá as mudanças incorporadas >`**:** muda para a branch que irá ter as suas alterações incorporadas (vamos chamá-la de A)
- `git pull origin $< branch que terá as mudanças incorporadas >`**:** atualiza a branch que irá ter as suas alterações incorporadas
- `git switch $< branch que irá incorporar as mudanças >`**:** muda para a branch que irá incorporar as alterações (que irá receber o merge, vamos chamá-la de B)
- `git merge $< branch que terá as mudanças incorporadas >`**:** faz o merge das mudanças da branch A na sua branch B. Se houver conflitos, você precisará resolvê-los
- `git push origin $< branch que irá incorporar as mudanças >`**:** envia as mudanças da sua branch para o repositório remoto

## <a id="realizando-merge-branch-local-branch-repositorio-remoto-resolucoes-conflito-merge"></a>Resoluções de Conflito de Merge

**Exemplos**

```bash
$ git merge $< branch que terá as alterações incorporadas >
Mesclagem automática de package.json
CONFLITO (conteúdo): conflito de mesclagem em package.json
Automatic merge failed; fix conflicts and then commit the result.
```

Quando você encontra conflitos durante um merge, o Git marca as áreas conflitantes nos arquivos afetados. Aqui estão os passos para resolver conflitos de merge:

1. **Identifique os arquivos em conflito:** o Git lista os arquivos com conflitos. Neste caso, **package.json** é o arquivo com conflito
2. **Abra o arquivo com conflito:** abra o arquivo **package.json** em seu editor de texto favorito
3. **Localize as marcas de conflito:** o Git adiciona marcas de conflito para indicar as áreas de conflito. Essas marcas têm a seguinte aparência:

```plaintext
<<<<<<< HEAD
[sua versão de código]
=======
[versão da outra branch]
>>>>>>> $< nome da branch que terá as suas alterações incorporadas >
```

4. **Resolva os conflitos:** edite o arquivo para resolver os conflitos. Você deve decidir qual parte do código manter, ou combinar as duas partes se necessário. Remova as marcas de conflito `<<<<<<<`, `=======`, e `>>>>>>>` após resolver o conflito
5. **Marque os conflitos como resolvido:** depois de resolver todos os conflitos no arquivo, marque-os como resolvido, `git add package.json`
6. **Finalize o merge:** após marcar todos os arquivos conflitantes como resolvidos, finalize o merge com um commit, `git commit`
7. `git commit`**:** quando você executa o `git commit` após resolver os conflitos, o Git geralmente abre o editor padrão (como o GNU nano, por exemplo) para que você possa escrever a mensagem de commit. Aqui estão os passos para concluir o commit no GNU nano:  
    Testar se eu utilizar o comando com a opção `-m`, eu consigo pular esta etapa
    1. **Escreva a mensagem de Commit:** no editor GNU nano, escreva uma mensagem de commit descritiva. Por exemplo: `Resolved merge conflicts between branch A and branch B`
    2. **Salvar e sair do GNU nano:** para salvar a mensagem de commit e sair do editor, siga estas instruções:
        - Pressione `Ctrl + O` para salvar o arquivo. Você verá uma linha na parte inferior do editor perguntando por confirmação para gravar o arquivo. Pressione `Enter` para confirmar
        - Pressione `Ctrl + X` para sair do editor GNU nano

# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

### Sumário

- [`diff $< nome da branch com a qual você quer comparar a branch atual >` ](#comandos-utilizados-cli-diff)
- [config --global -l](#comandos-utilizados-cli-config-global-l)

## <a id="comandos-utilizados-cli-diff"></a>`git diff $< nome da branch com a qual você quer comparar a branch atual >`

Você pode ver as diferenças da sua branch atual e uma branch específica (vamos chamá-la de "A") usando o comando `git diff`.

```bash
$ git diff A
```

Este comando mostrará todas as diferenças entre o estado atual da sua branch e o estado da branch A.

## <a id="comandos-utilizados-cli-config-global-l"></a>`git config --global -l`

É utilizado para **exibir a lista de todas as configurações globais do Git para o usuário atual**. Essas configurações são armazenadas no arquivo **~/.gitconfig** e afetam todos os repositórios do usuário.

**Saída Típica**

A saída por incluir várias configurações, como:

```bash
user.name=Your Name
user.email=youremail@example.com
color.ui=auto
core.editor=vim
core.autocrlf=input
credential.helper=cache
```

Aqui está uma breve explicação de algumas configurações comuns:

- `user.name`**:** o nome do usuário configurado globalmente. Esse nome será usado em todos os commits
- `user.email`**:** o e-mail do usuário configurado globalmente. Esse e-mail será usado em todos os commits
- `color.ui`**:** configuração para colorir a saída do Git. `auto` habilita a colorização quando o terminal suporta
- `core.editor`**:** o editor de texto padrão usado pelo Git. `vim` é um exemplo de um editor configurado
- `core.autocrlf`**:** configuração para converter automaticamente finais de linha. `input` converte CRLF para LF ao fazer commit
- `credential.helper`**:** configuração para cache de credenciais. `cache` armazena temporariamente as credenciais em memória