# NPM

### Sumário

- [Publicando Um Pacote](#publicando-pacote)
- [Comandos](#comandos)

# <a id="publicando-pacote"></a>Publicando Um Pacote

Primeiramente vamos observar que a primeira vez que você publica um pacote, utilizando um usuário npm, ele será automaticamente privado, a não ser que você especifique o contrário. Você pode verificar a privacidade de um pacote logando na sua conta e ao selecionar o seu pacote, em packages, você pode verificar a privacidade do pacote como um todo e até verificar a privacidade das versões.

Para logar no npm, você deve utilizar o `npm login`, será solicitado o seu usuário, a sua senha e o e-mail vinculado ao usuário. Todo usuário do npm é pago.

Na hora de publicar um pacote, o contexto que é analisado é o do seu repositório local, a estrutura do seu projeto localmente. Ele vai analisar o seu arquivo **package.json** para verificar o que você deseja publicar:

- A chave `name` especifica o nome do seu pacote. `@usuário\pacote`, `@usuário` é quando o seu `pacote` é vinculado a um usuário npm
- A chave `version` especifica a versão do seu pacote, após utilizar um valor específico para a versão, o npm não permite que você utilize essa valor novamente, mesmo que você despublique o seu pacote
  `número1.número2.número3-número4`**:** o npm considera como a versão mais atual, aquela que possui o maior `número1` a esquerda, depois o maior `número2` ao meio, depois o maior `número3` antes do traço. O traço e o `número4` após ele são utilizados quando você quer publicar uma versão que não é considerada a latest, versões de release candidate, por exemplo
- A chave `bin` especifica um binário e é utilizada quando você quer publicar um executável
- A chave `files` especifica os arquivos que você deseja publicar, quando ela está presente, todos os arquivos que não estão presentes no valor dessa chave não são incluídos no pacote. Com exceção de arquivos que sempre são incluídos, como o **package.json** e o **README.md**

O arquivo **.gitignore** é considerado na hora de publicar pacotes, os arquivos ignorados não são incluídos em seu pacote. Caso o seu projeto tenha um arquivo **.npmignore**, ele é utilizado no lugar do arquivo **.gitignore**. Ambos os arquivos não são incluídos no pacote.

Se em seu **package.json**, o arquivo estiver especificado em `files`, ele será incluído em seu pacote, mesmo que esteja presente no **.gitignore** (ou no **.npmignore**). Caso ele for um executável, ele precisa estar incluso em `bin`.

# <a id="comandos"></a>Comandos

### Sumário

- [`npm i` ou `npm install`](#npm-i-install)
- [`npm list`](#npm-list)
- [`npm pack`](#npm-pack)
- [`npm publish`](#npm-publish)
- [`npm unpublish`](#npm-unpublish)

## <a id="npm-i-install"></a>`npm i` ou `npm install`

Instala um pacote npm.

**Sintaxe Básica**

```bash
npm i [opções] @usuário/pacote@versão_ou_tag
```

- `i` **ou** `install`**:** instá-la a última versão **latest** (tag default) localmente (no diretório atual), versões de outras tags só serão instaladas quando especificadas explicitamente
- `@usuário`**:** específica o usuário dono do pacote
- `pacote`**:** nome do pacote a ser instalado
- `@versão_ou_tag`**:** você pode especificar a versão a ser instalada ou pode utilizar uma tag. Por exemplo:
  + `npm i @zoeslots/zoe-game-api@2.5.0`, `npm i @zoeslots/zoe-game-api@2.5.0-rc`, `npm i @zoeslots/zoe-game-api@2.5.0-lfernando.3`
  + `npm i @zoeslots/zoe-game-api@rc`, `npm i @zoeslots/zoe-game-api@teste`
    Ao especificar uma tag ao invés de uma versão específica, você instalará a última versão daquela tag

**Opções Comuns**

- `-g`**:** instá-la o pacote globalmente (será instalado em um diretório específico)
  O diretório em questão depende do sistema hierarquico de arquivos. Por exemplo:
  + **/usr/lib/node_modules/usuário/pacote**
  + **.nvm/versions/node/versão_do_node/lib/node_modules** (quando você utiliza o nvm)
- `--unsafe-perm`**:** a opção `--unsafe-perm` é uma flag que pode ser utilizada com o comando `npm install` para influenciar **o comportamento de permissões** ao instalar pacotes. Quando você executa comandos npm (como `npm install`) que invocam scripts, o npm por padrão tenta executá-los com privilégios mínimos por razões de segurança. No entanto, há casos, especialmente ao instalar certos pacotes que necessitam de permissões eleveadas para executar seus scripts de instalação ou compilação, em que você precisa contornar essa restrição. Aí que entra o `--unsafe-perm`

É intessante utilizar este comando para verificar qual pacote está sendo utilizado sem a especificação de versão. Com isso você pode verificar se você publicou um pacote de outra tag com sucesso (versões que não são da categoria latest não podem ser obtidas sem serem especificadas)

### `--unsafe-perm`

**Quando Usar**

- **Instalação de pacotes com scripts de compilação:** alguns pacotes, especialmente aqueles que incluem código nativo, precisam compilar esse código durante a instalação. Esses processos de compilação podem necessitar de permissões elevadas para acesso a certas bibliotecas ou ferramentas no sistema
- **Scripts personalizados que requerem permissões elevadas:** se um pacote executa scripts personalizados que necessitam de acesso a recursos protegidos ou permissões elevadas para funcionar corretamente, `--unsafe-perm` permite que esses scripts sejam executados sem restrições

**Riscos de Usar**

O uso de `--unsafe-perm` pode expor seu sistema a riscos de segurança, pois permite a execução de scripts com privilégios elevados, potencialmente abrindo a porta para ações maliciosas se o pacote contiver código nocivo. É recomendável usar esta opção apenas quando você confia no pacote que está instalando e entende as implicações de segurança.

## <a id="npm-list"></a>`npm list`

Lista os pacotes instalados e a sua versão.

**Sintaxe Básica**

```bash
npm list [opções]
```

**Opções Comuns**

- `-g`**:** lista os pacotes instalados globalmente

**Exemplos**

- `npm list -g --depth=0`**:** lista os pacotes instalados globalmente e exibe somente a profundidade `0`

```bash
/usr/lib
├── @zoeslots/orion-cashier-updater@1.6.1
├── @zoeslots/zoe-data-api@3.1.7-lfernando.6
├── @zoeslots/zoe-game-api@2.5.0-lfernando.3
├── @zoeslots/zoe-terminal@2.0.0
├── @zoeslots/zoe-updater@1.6.1-rc
├── @zoeslots/zoe-watchdog@0.2.0                                         
├── forever@0.15.3
├── newrelic@5.2.1
├── npm@6.4.1
└── pm2@3.2.9
```

- `npm list -g @zoeslots/zoe-game-api`

```bash
/usr/lib
└── @zoeslots/zoe-game-api@2.5.0-lfernando.3
```

## <a id="npm-pack"></a>`npm pack`

Empacota o projeto (você deve estar na raíz do projeto), criando um arquivo **.tgz**, uma tarball.

**Sintaxe Básica**

```bash
npm pack .
```

Ao utilizá-lo você consegue verificar através do log exibido no console o que será publicado.

## <a id="npm-publish"></a>`npm publish`

Publica um pacote npm, empacota o projeto e o publica.

**Sintaxe Básica**

```bash
npm publish [opções]
```

**Opções Comuns**

- `--tag`**:** específica o nome da tag, a qual o pacote pertencerá. Por exemplo:
  `npm publish --tag teste`, `npm publish --tag rc`

## <a id="npm-unpublish"></a>`npm unpublish`

Despublica a `versão` do pacote. **Tome muito cuidado, pois ser você utilizar este comando sem uma** `versão`**, o pacote inteiro será despublicado**.

**Sintaxe Básica**

```bash
npm unpublish @usuário/pacote@versão
```

Se o pacote tiver sido publicado a mais de 24 horas, você deve utilizar a opção `--force`.