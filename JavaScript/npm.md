# npm

### Sumário

- [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
- [Ato de Publicação](#ato-publicacao)
- [Erros Enfrentados](#erros-enfrentados)
    + [Ao Tentar Instalar as Dependências do Nosso Projeto](#ao-instalar-dependencias-projeto)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
    + [`npm login` x `npm adduser`](#comandos-utilizados-cli-npm-login-x-npm-adduser)
    + [`npm install`](#comandos-utilizados-cli-npm-install)
    + [`npm show $< nome do pacote > dependencies`](#comandos-utilizados-cli-npm-show-nome-pacote-dependencies)

# <a id="compatibilidade-nodejs-npm"></a>Compatibilidade Entre o Node.js e o npm

O Node.js e o npm estão relacionados, mas são dois componentes separados. O Node.js é um ambiente de tempo de execução JavaScript que permite executar código JavaScript no servidor, enquanto o npm é um gerenciador de pacotes para JavaScript.

O Node.js é instalado independentemente do npm e vice-versa. No entando, o npm é geralmente instalado automaticamente junto com o Node.js. Isso ocorre porque o npm faz faz parte da instalação padrão do Node.js desde a versão 0.6.3.

A compatibilidade entre as versões do Node.js e do npm não é tão rígida quanto parece. O npm é frequentemente atualizado de forma independente do Node.js para fornecer novos recursos, correções de bug e melhorias de desempenho. No entanto, em geral, é recomendável usar uma versão recente do npm com uma versão recente do Node.js para garantir a melhor experiência de desenvolvimento.

Você pode atualizar o npm para a versão mais recente usando o comando `npm install -g npm`, independente da versão do Node.js que você esteja usando.

# <a id="ato-publicacao"></a>Ato de Publicação

O ato de publicar um pacote, enquanto se utiliza uma versão do Node.js em uma máquina e, em seguida, executar esse pacote em uma máquina com uma versão diferente do Node.js, não deve ser um problema.

O npm é apenas usado para empacotar e distribuir o código-fonte do pacote. Uma vez publicado, o pacote é independente da versão do Node.js usada para publicá-lo (se atentando que quem o publica é o npm). O que importa é a compatibilidade do pacote com a versão do Node.js na máquina onde ele será executado.

Em resumo, desde que o pacote seja compatível com a versão do Node.js na máquina de destino, não deve haver problemas em publicar o pacote em uma versão diferente do Node.js. No entanto, é sempre uma prática recomendada testar o pacote em diferentes versões do Node.js para garantir a compatibilidade e o funcionamento adequado em diferentes ambientes de execução.

# <a id="erros-enfrentados"></a>Erros Enfrentados

## <a id="ao-instalar-dependencias-projeto"></a>Ao Tentar Instalar as Dependências do Nosso Projeto

As mensagens abaixo foram impressas ao se tentar instalar localmente as dependências do nosso projeto:

- Este foi o primeiro log de erro gerado:

```bash
Unhandled rejection Error: EACCES: permission denied, mkdir '/home/$< usuário >/.npm/_cacache/index-v5/af/03'

npm ERR! cb() never called!

npm ERR! This is an error with npm itself. Please report this error at:
npm ERR!     <https://npm.community>

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/$< usuário >/.npm/_logs/2024-05-22T16_33_47_021Z-debug.log
```

A suspeita caiu sobre a versão do npm (6.4.1)

- Atualizamos a versão do npm (10.5.0) e o seguinte log de erro foi gerado:

```bash
npm ERR! code EEXIST
npm ERR! syscall mkdir
npm ERR! path /home/$< usuário >/.npm/_cacache/content-v2/sha512/58/55
npm ERR! errno -13
npm ERR! EACCES: permission denied, mkdir '/home/$< usuário >/.npm/_cacache/content-v2/sha512/58/55'
npm ERR! File exists: /home/$< usuário >/.npm/_cacache/content-v2/sha512/58/55
npm ERR! Remove the existing file and try again, or run npm
npm ERR! with --force to overwrite files recklessly.

npm ERR! A complete log of this run can be found in: /home/$< usuário >/.npm/_logs/2024-05-22T16_46_32_366Z-debug-0.log
```

Acabou que, para resolver o problema, nós simplesmente deletamos o diretório "`_cacache`" e tentamos instalar as dependências novamente. Não lembro se acabei por alterar as permissões de algum diretório.

# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

### Sumário

- [`npm login` x `npm adduser`](#comandos-utilizados-cli-npm-login-x-npm-adduser)
- [`npm install`](#comandos-npm-install)
- [`npm show $< nome do pacote > dependencies`](#comandos-npm-show-nome-pacote-dependencies)

## <a id="comandos-utilizados-cli-npm-login-x-npm-adduser"></a>`npm login` x `npm adduser`

`npm login` e `npm adduser` são comandos do npm usados para autenticar-se em um registro npm. **Ambos os comandos realizam a mesma função de autenticação**, permitindo que você faça login em sua conta npm para publicar pacotes ou acessar pacotes privados. A escolha entre os dois depende da preferência pessoal, pois ambos executam a mesma ação.

## <a id="comandos-utilizados-cli-npm-install"></a>`npm install`

Quando você executa o comando `npm install` no diretório do seu projeto Node.js, o npm instala todas as dependências listadas no arquivo **package.json** localmente, ou seja, dentro do diretório do seu projeto. Essas dependências são instaladas no diretório **node_modules**.

O npm também cria (ou atualiza) o arquivo **package-lock.json**, que registra as versões exatas de todas as dependências instaladas, incluindo as dependências das dependências (e assim por diante). Isso garante que, mesmo que você execute o `npm install` em outro ambiente ou em outra máquina, as mesmas versões exatas das depedências sejam instaladas, garantindo consistência e reprodutibilidade.

Aleḿ disso, se você especificar a flag `--save` ou `--save-dev` junto com o comando `npm install`, o npm adicionará a dependência ao seu arquivo package.json como uma depedência de produção ou uma dependência de desenvolvimento, respectivamente. Por exemplo:

```bash
$ npm install lodash --save
```

Isso instalará o pacote lodash localmente no seu projeto e adicionará uma entrada no seu arquivo **package.json** sob a seção de dependências de produção.

Em resumo, o comando `npm install` é usado para instalar todas as dependências listadas no **package.json** localmente no diretório do seu projeto, garantindo que seu projeto tenha todas as bibliotecas necessárias para funcionar corretamente.

## <a id="comandos-utilizados-cli-npm-show-nome-pacote-dependencies"></a>`npm show $< nome do pacote > dependencies`

É utilizado para exibir as dependências do pacote `nome do pacote`. Isso pode ser útil para visualizar as dependências de um pacote npm antes de instalá-lo.

O comando `npm view $< nome do pacote > dependencies` possui a mesma finalidade que o comando `show`. Ambos os comandos são usados para visualizar as dependências de um pacote npm específico.