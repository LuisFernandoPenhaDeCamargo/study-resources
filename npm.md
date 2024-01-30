# NPM

# Publicando um Pacote

Primeiramente vamos observar que a primeira vez que você publica um pacote, utilizando um usuário npm, ele será automaticamente privado, a não ser que você especifique o contrário. Você pode verificar a privacidade de um pacote, logando na sua conta e ao selecionar o seu pacote, em packages, você pode verificar a privacidade do pacote como um todo e até verificar a privacidade das versões.

Para logar no npm, você deve utilizar o `npm login`, será solicitado o seu usuário, a sua senha e o e-mail vinculado ao usuário. Todo usuário do npm é pago.

Na hora de publicar um pacote, o contexto que é analisado é o do seu repositório local, a estrutura do seu projeto localmente. Ele vai analisar o seu arquivo **package.json** para verificar o que você deseja publicar:

- A chave `name` especifica o nome do seu pacote. `@usuário\pacote`, `usuário` é quando o seu pacote é vinculado a um usuário npm
- A chave `version` especifica a versão do seu pacote, após utilizar um valor específico para a versão, o npm não permite que você utilize essa valor novamente, mesmo que você despublique o seu pacote\
    `número1.número2.número3-número4`**:** o npm considera como versão mais atual, aquela que possui o maior `número1` a esquerda, depois o maior `número2` ao meio, depois o maior `número3` antes do traço. O traço e o `número4` após ele são utilizados quando você quer publicar uma versão que não é considerada a latest, versões de release candidate, por exemplo
- A chave `bin` especifica um binário, é utilizada quando você quer publicar um executável
- A chave `files` especifica os arquivos que você deseja publicar, quando ela está presente, todos os arquivos que não estão presentes no valor dessa chave não são incluídos no pacote. Com exceção de arquivos que sempre são inclusos no seu pacote, como o **package.json** e o **README.md**

O arquivo **.gitignore** é considerado na hora de publicar pacotes, os arquivos ignorados não são incluídos em seu pacote, caso o seu projeto tenha um arquivo **.npmignore**, ele é utilizado no lugar do arquivo **.gitignore**. Ambos os arquivos não são incluídos no pacote.

A permissão que o usuário atual possui influência a publicação de pacotes. Eu precisei logar como super usuário para conseguir incluir o meu binário no pacote. Aparentemente as permissões são propagadas para o pacote.

+ `npm pack .`**:** empacota o projeto (você deve estar no nível superior do projeto), com isso, você pode verificar o que vai ser publicado quando você for realizar a ação de publicação
+ `npm i @usuário/pacote`**:** insta-la a versão atual (a de maior numeração) da categoria latest, no diretório atual
+ `npm install @usuário/pacote`**:** insta-la a versão atual (a de maior numeração) da categoria latest, no diretório atual. É intessante utilizar este comando para verificar qual pacote está sendo utilizado sem a especificação de versão, para confirmar se você publicou uma versão rc com sucesso (versões que não são da categoria latest não podem ser obtidas sem serem especificadas)
+ `npm i @usuário/pacote@versão`**:** instala a versão especificada do pacote. Para instalar versões rc, você precisa especifica-las
+ `npm install -g @usuário/pacote`**:** a opção `g` especifica que você quer instalar o pacote globalmente (há um diretório específico no qual ele será colocado). O diretório mencionado anteriormente depende da estrutura de arquivos, mas quando você utiliza o nvm, normalmente é algo do gênero **.nvm/versions/node/versão_do_node/lib/node_modules**
+ `npm list -g @usuário/pacote`**:** exibe aonde o pacote está instalado e qual é a versão dele (se ele estiver instalado globalmente, se atente a opção `g`)
+ `npm publish`**:** empacota o projeto e publica o pacote. Para publicar uma versão rc, você deve utilizar a opção `--tag` seguida do valor `rc`. Por exemplo, `npm publish --tag rc`
+ `npm unpublish @usuário/pacote@versão`**:** despublica a versão do pacote. **Tome cuidado, pois se você utilizar este comando sem uma** `versão`**, o pacote inteiro será despublicado**. Para pacotes que foram publicados a mais de 24 horas, você deve utilizar a opção `--force`

Se em seu **package.json**, o arquivo estiver especificado em `files`, ele será incluído em seu pacote, mesmo que esteja presente no **.gitignore** (ou no **.npmignore**). Caso ele for um executável, ele precisa estar incluso em `bin`.