# npm

### Sumário

- [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
- [Ato de Publicação](#ato-publicacao)
- [npm Logs](#npm-logs)
    + [`npm WARN`](#npm-logs-npm-warn)
- [Erros Enfrentados](#erros-enfrentados)
    + [Ao Tentar Instalar as Dependências do Nosso Projeto](#ao-instalar-dependencias-projeto)
- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
    + [`npm login` x `npm adduser`](#comandos-utilizados-cli-npm-login-x-npm-adduser)
    + [`npm install`](#comandos-utilizados-cli-npm-install)
        - [Opção `--unsafe-perm`](#comandos-utilizados-cli-npm-install-opcao-unsafe-perm)
    + [`npm show $< nome do pacote > version`](#comandos-utilizados-cli-npm-show-nome-pacote-version)
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

# <a id="npm-logs"></a>npm Logs

## <a id="npm-logs-npm-warn"></a>`npm WARN`

Os avisos (`npm WARN`) exibidos pelo npm indicam possíveis problemas que podem não ser críticos, mas que podem afetar o funcionamento do pacote ou do ambiente. Esses avisos podem ocorrer por vários motivos, como dependências ausentes, versões incompatíveis ou práticas não recomendadas.

Para resolver esses avisos, você pode investigar o motivo específico de cada um e aplicar as correções necessárias. Aqui estão alguns exemplos comuns de avisos do npm e como resolvê-los:

1. **Aviso de dependência ausente:** `npm WARN some-package@1.0.0 requires a peer of another-package@^2.0.0 but none is installed. You must install peer dependencies yourself`
    - **Solução:** instale a dependência indicada, `npm install another-package@^2.0.0`
2. **Aviso de versão incompatível:** `npm WARN deprecated package-name@1.0.0: This package is deprecated, use another-package instead.`
    - **Solução:** atualize o pacote para a versão recomendada ou subtitua-o pelo pacote alternativo, `npm install another-package`
3. **Aviso de uso de versão desatualizada do Node.js ou npm:** `npm WARN npm@5.0.0 requires a peer of node@>=6.0.0 but node@4.0.0 is installed.`
    - **Solução:** atualize o Node.js ou npm para a versão recomendada, `nvm install 6.0.0`
4. **Aviso de licença faltando:** `npm WARN package-name@1.0.0 No license field.`
    - **Solução:** adicione um campo de licença no **package.json**

```json
{
    "name": "package-name",
    "version": "1.0.0",
    "license": "MIT"
}
```

5. **Aviso de pacote desatualizado:** `npm WARN deprecated package-name@1.0.0: This package has been deprecated.`
    - **Solução:** verifique se já uma versão mais recente ou um pacote alternativo e faça a atualização, `npm install package-name@latest`
6. `npm WARN old lockfile`

Este aviso geralmente indica que o arquivo **package-lock.json** foi gerado por uma versão mais antiga do npm e pode não estar em conformidade com a versão atual do npm que você está utilizando. Isso pode levar a inconsistências ou problemas durante a instalação dos pacotes.

**Como Resolver o** `npm WARN old lockfile`

Para resolver este aviso, você deve atualizar o arquivo **package-lock.json** para garantir que ele esteja no formato correto para a versão atual do npm.

- **Atualize o package-lock.json:**
    + Remova o arquivo **package-lock.json** antigo
    + Execute `npm install` para gerar um novo **package-lock.json** com a versão atual do npm

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
- [`npm install`](#comandos-utilizados-cli-npm-install)
    + [Opção `--unsafe-perm`](#comandos-utilizados-cli-npm-install-opcao-unsafe-perm)
- [`npm show $< nome do pacote > version`](#comandos-utilizados-cli-npm-show-nome-pacote-version)
- [`npm show $< nome do pacote > dependencies`](#comandos-utilizados-cli-npm-show-nome-pacote-dependencies)

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

### <a id="comandos-utilizados-cli-npm-install-opcao-unsafe-perm"></a>Opção `--unsafe-perm`

É usada para **permitir que os scripts de instalação sejam executados com as permissões do usuário que iniciou o comando** `npm install`.

**Contexto de Uso**

Quando o npm instala pacotes globalmente (`-g`) ou em algumas circunstâncias de instalações locais, ele pode **alterar o usuário efetivo** (usando `nobody` ou outro usuário sem privilégios) para executar os scripts de instalação, mesmo que o processo npm seja iniciado como root. Isso é uma medida de segurança para impedir que scripts maliciosos façam alterações indesejadas no sistema.

No entanto, em alguns casos, especialmente quando scripts de instalação precisam fazer alterações que requerem permissões de root (como instalação de dependências em diretórios protegidos), é necessário permitir que esses scripts sejam executados com permissões elevadas.

## <a id="comandos-utilizados-cli-npm-show-nome-pacote-version"></a>`npm show $< nome do pacote > version`

O comando `npm show` (ou `npm info`) é utilizado para **exibir informações sobre um pacote específico**. Quando você deseja **obter a versão de um pacote específico, você pode usar esse comando com a propriedade** `version`.

**Sintaxe Básica**

```bash
$ npm show $< package name > version
```

- `npm show`**:** este comando exibe informações sobre um pacote
- `package name`**:** o nome do pacote sobre o qual você deseja obter informações
- `version`**:** a propriedade específica que você deseja consultar. Neste caso, `version` retorna a versão mais recente disponível do pacote (e que a tag seja latest)

## <a id="comandos-utilizados-cli-npm-show-nome-pacote-dependencies"></a>`npm show $< nome do pacote > dependencies`

É utilizado para exibir as dependências do pacote `nome do pacote`. Isso pode ser útil para visualizar as dependências de um pacote npm antes de instalá-lo.

O comando `npm view $< nome do pacote > dependencies` possui a mesma finalidade que o comando `show`. Ambos os comandos são usados para visualizar as dependências de um pacote npm específico.