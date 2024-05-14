# README

Este repositório tem como objetivo auxiliar o estudo de certas tecnologias relacionadas a TI. Abaixo segue uma lista com as tecnologias, especificando qual é o arquivo que fala sobre elas, além de uma breve descrição do que você encontrará naquele arquivo e um sumário dos tópicos.

Também há os tópicos a se estudar.

## Linux (Diretorio-heterogeneo/linux.md)

Conceitos e observações sobre este sistema operacional.

### Sumário

- [GLIBC](#glib)
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [/proc](#sistema-hierarquico-arquivos-proc)

## Bash (Diretorio-heterogeneo/bash.md)

Ferramentas e comandos utilizados juntos desta interface de linha de comando.

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

## Markdown ((Diretorio-heterogeneo/markdown.md))

Conceitos e observações sobre esta linguagem de marcação.

### Sumário

- [Quebra de Linha](#quebra-linha)

## HTML (Diretorio-heterogeneo/html.md)

### Sumário

## CSS (Diretorio-heterogeneo/css.md)

### Sumário

## JavaScript (JavaScript/javascript.md)

Conceitos e observações sobre esta linguagem de programação.

### Sumário

- [Operadores](#operadores)
    + [`new`](#operadores-new)
    + [`typeof`](#operadores-typeof)
- [Objetos](#objetos)
    + [`Object`](#objetos-object)
        - [`.toString()`](#objetos-object-tostring)
    + [`Date`](#objetos-date)
- [Métodos](#metodos)
    + [Array](#metodos-array)
        - [array.every()](#metodos-array-every)
- [Função de Flecha](#funcao-flecha)
- [Closures](#closures)
- [Imports/Exports](#importsexports)
- [Bibliotecas](#bibliotecas)
    + [`cluster`](#bibliotecas-cluster)
    + [`moment`](#bibliotecas-moment)
    + [`express`](#bibliotecas-express)
        - [app.listen()](#bibliotecas-express-app-listen)
    + [`sequelize`](#bibliotecas-sequelize)
        - [Tipos de Coluna](#bibliotecas-sequelize-tipos-coluna)
            + [`TINYINT(1)`](#bibliotecas-sequelize-tipos-coluna-tinyint)
        - [`queryInterface.addColumn()`](#bibliotecas-sequelize-queryInterface-addcolumn)
        - [`queryInterface.removeColumn()`](#bibliotecas-sequelize-queryInterface-removecolumn)
        - [`Model.create()`](#bibliotecas-sequelize-model-create)
        - [`Model.findOne()`](#bibliotecas-sequelize-model-findOne)
    + [`umzug`](#bibliotecas-umzug)
- [`pm2`](#pm2)
    + [`pm2 list`](#pm2-pm2-list)
- [Época Unix](#epoca-unix)

## package.json (JavaScript/packagejson.md)

Conceitos e observações importantes sobre este arquivo.

### Sumário

- [Chaves](#chaves)
    + [`scripts`](#chaves-scripts)
        - [Chaves da chave `scripts`](#chaves-scripts-chaves-chave)
- [Dependências Utilizadas por Um Pacote](#dependencias-utilizadas-pacote)
    + [Operadores de Versão](#dependencias-utilizadas-pacote-operadores-versao)
    + [Patch](#dependencias-utilizadas-pacote-patch)
- [package.json x package-lock.json](#packagejson-x-package-lockjson)

## Node.js (JavaScript/nodejs.md)

Conceitos e observações importantes sobre este ambiente de execução.

### Sumário

- [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
- [Ato de Publicação](#ato-publicacao)
- [`npx`](#npx)
- [Node 22.1.0 e a Criação de Executáveis Únicos](#node-22-criacao-de-executaveis-unicos)
  + [Assets](#node-22-criacao-de-executaveis-unicos-assets)
  + [Suporte Para o Snapshot de Inicialização](#node-22-criacao-de-executaveis-unicos-suporte-snapshot-inicializacao)
  + [Suporte Para o Cache de Código V8](#node-22-criacao-de-executaveis-unicos-suporte-cache-codigo-v8)
  + [No Script Principal Injetado](#node-22-criacao-de-executaveis-unicos-script-principal-injetado)
    - [`sea.isSea()`](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-issea)
    - [`sea.getAsset(key[,encoding])`](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getasset)
    - [`sea.getAssetAsBlob(key[, options])`](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getassetasblob)
    - [`sea.getRawAsset(key)`](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-sea-getrawasset)
    - [`require(id)` No Script Principal Injetado Não é Baseado em Arquivo](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-requireid-script-principal-injetado-nao-eh-baseado-arquivo)
    - [`__filename` e `module.filename` No Script Principal Injetado](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-filename-module-filename-script-principal-injetado)
    - [`__dirname` no Script Principal Injetado](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-dirname-script-principal-injetado)
  + [Testando esta Feature](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-testando-feature)
  + [Conclusão](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-conclusao)

## npm (JavaScript/npm.md)

Gerenciador de pacotes para JavaScript.

### Sumário

- [Comandos](#comandos)
    + [`npm login` x `npm adduser`](#comandos-npm-login-x-npm-adduser)
    + [`npm install`](#comandos-npm-install)
    + [`npm show $< nome do pacote > dependencies`](#comandos-npm-show-nome-pacote-dependencies)
- [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
- [Ato de Publicação](#ato-publicacao)
- [`node-gyp`](#node-gyp)

## NVM (JavaScript/nvm.md)

Gerenciador de versões para Node.js.

### Sumário

- [Comandos](#comandos)
    + [`nvm ls-remote`](#comandos-nvm-ls-remote)
- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Instalando o NVM](#instalando-nvm)
- [Desinstalando o NVM](#desinstalando-nvm)

## Segurança (JavaScript/seguranca.md)

Arquivo que trata de pacotes utilizados na segurança em JavaScript.

### Sumário

- [Bibliotecas Utilizadas na Ofuscação de Código](#bibliotecas-utilizadas-ofuscacao-codigo)
    + [javascript-obfuscator](#bibliotecas-utilizadas-ofuscacao-codigo-javascript-obfuscator)

## Compilação

Arquivo que trata de pacotes utilizados na compilação de código-fonte Node.js.

### Sumário

## Python (Python/python.md)

Conceitos e observações sobre esta linguagem de programação.

### Sumário

- [Anotações Não Alocadas](#anotacoes-nao-alocadas)

## `pyenv` (Python/pyenv.md)

Gerenciador de versões para Python.

### Sumário

- [Comandos](#comandos)
    + [`pyenv versions`](#comandos-pyenv-versions)
    + [`pyenv install --list`](#comandos-pyenv-install-list)
    + [`pyenv local`](#comandos-pyenv-local)
    + [`pyenv shell $< versão >`](#comandos-pyenv-shell-versao)
- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Instalação](#instalacao)
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)

## AWS (Diretorio-heterogeneo/aws.md)

Arquivo que trata sobre a AWS e os serviços ofertados por ela.

### Sumário

- [AWS Secrets Manager](#aws-secrets-manager)

## MariaDB (Diretorio-heterogeneo/mariadb.md)

### Sumário

## VPN (Diretorio-heterogeneo/vpn.md)

Como configurar uma VPN e alguns pontos sobre ela.

### Sumário

- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Configurando a VPN](#configurando-vpn)

## .service (Diretorio-heterogeneo/ponto-service.md)

Arquivo que trata pontos interessantes dos **.service** (systemd).

### Sumário

- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Arquivo de Serviço](#arquivo-servico)
- [Arquivo de Ambiente](#arquivo-ambiente)

## Redes (Diretorio-heterogeneo/redes.md)

Arquivo que trata pontos relacionados a redes de computadores.

### Sumário

- [Interfaces de Rede](#interfaces-rede)
- [Requisições de Outra Máquina Para Um Localhost](#requisições-outra-maquina-localhost)

## Segurança (Diretorio-heterogeneo/seguranca.md)

Arquivo que trata de formas de proteger o seu código-fonte.

### Sumário

- [Técnicas de Ofuscação de Código](#tecnicas-ofuscacao-codigo)

## VM (Diretorio-heterogeneo/vm.md)

Como criar uma VM e alguns pontos sobre ela.

Arquivo que trata sobre 

### Sumário

- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Criando uma VM](#criando-vm)

## Termos Utilizados na Área de TI (Diretorio-heterogeneo/termos-TI.md)

Explicação do significado dos termos utilizados com frequência na área de TI.

### Sumário

- [blob e glob](#blob-glob)
- [CLI](#cli)
- [cwd](#cwd)
- [foo](#foo)
- [linter](#linter)
- [Snapshot](#snapshot)

## Template (Diretorio-heterogeneo/template.md)

Template de estrutura a tentar seguir em relação as anotações do conteúdo estudado.

### Sumário

- [Template](#template)
    + [Prático](#pratico)
    + [Comandos](#comandos)
    + [Anotações Não Alocadas](#anotacoes-nao-alocadas)
    + [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
    + [Instalação](#instalacao)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
- [Formatação do Documento](#formatacao-documento)
    + [Código](#formatacao-documento-codigo)
    + [Subtópicos](#formatacao-documento-subtopicos)
    + [Nomenclatura](#formatacao-documento-nomenclatura)
    + [Negrito](#formatacao-documento-negrito)
- [Key Words](#formatacao-documento-key-words)

## Configurando a Minha Máquina (Diretorio-heterogeneo/configurando-maquina.md)

Configurando o ambiente para que agrade o meu gosto pessoal, além de uma lista de ferramentas que eu utilizo com frequência.

### Sumário

- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Ferramentas Instaladas](#ferramentas-instaladas)
- [Projeto de Script de Configuração de Ambiente](#projeto-script-configuracao-ambiente)

# Anotações Não Alocadas

- No final das contas, seja interpretada ou compilada, a CPU lê código de máquina, o que acaba por se tornar um processo
- WSS é um protocolo, assim como o HTTPS e o HTTP

# Estudar

**Bash**

**JavaScript, npm e Nodejs**

- https://stackoverflow.com/questions/29283040/how-to-add-custom-certificate-authority-ca-to-nodejs

**pm2**

- `pm2 describe $< ID >`
- `pm2 env 0`
- `pm2 kill`
- `pm2 resurrect`
- `pm2 reload all`
- `pm2 delete`
- **dump.pm2**
- Cada processo do pm2 pode ser vinculado a um usuário?

**MariaDB**

- Tipos de coluna
- `ALTER TABLE $< tabela > MODIFY COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > ADD COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > ADD COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > DROP COLUMN $< coluna >;`
- `SHOW GRANTES FOR $< usuário >@$< host >`
- `GRANT SYSTEM_USER ON *.* TO '$< usuário >'@'$< host >'`

**AWS**

- s3
- ec2
- route53
- ecr

**Python**

- Classes
- `subprocess`
- `subprocess.check_output()`
- `decode()`
- `strip()`
- `subprocess.call()`
- `type()`
- `json`
- `json.loads()`
- `threading`
- `threading.Thread()`
- `traceback`
- `traceback.print_exc()`
- `os`
- `os.path.dirname()`
- "`__main__`", o que este tipo de sintaxe significa?

**Tópicos Não Classificados**

- Todo binário não é um executável?
- git flow, trunk based (dois formatos de fluxo)
- CI/CD
- Redirecionamento de DNS
- Certificados (utilizados em ssh, websockets)
- No contexto de APIs, testes de estresse (teste de volumetria, "quanto ele aguenta"), testes automatizados

# TODO

Refatorar, reorganizar os seguintes diretórios/arquivos, além de tentar realizar:

- refatorar.md
- Refatorar2
- Refatorar
- Rust
- images
- Criar do zero uma instância no **ec2**
    + Colocar o **nginx** para rodar junto com a API em Node.js
    + Instalar https na instância
    + Ativar a atualização do certificado ssl de forma automâtica
- Criar um pipeline de deploy
- Criar um serviço que abre as aplicações que eu uso assim que eu início o sistema
- Criar um script que realiza commits antes de desligar a minha máquina
- Criar uma aplicação e executá-la com o Docker
- Criar um banco na RDS em que a autenticação seja feita com um usuário IAM (https://repost.aws/knowledge-center/users-connect-rds-iam)
- Criar um volume criptografado com o LUKS