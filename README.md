# README

Este repositório tem como objetivo auxiliar o estudo de certas tecnologias relacionadas a TI. Abaixo segue uma lista com as tecnologias, especificando qual é o arquivo que fala sobre elas, além de uma breve descrição do que você encontrará naquele arquivo e um sumário dos tópicos.

## ./Diretorio-heterogeneo

- **Linux (Linux.md):** SO
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
        - [~/]
        - [/proc](#sistema-hierarquico-arquivos-proc)
    + [systemctl](#systemctl)
        - [Comandos Utilizados Através do CLI](#systemctl-comandos-utilizados-cli)
            + [`daemon-reload`](#systemctl-comandos-utilizados-cli-daemon-reload)
            + [`status`](#systemctl-comandos-utilizados-cli-status)
    + [Snap](#snap)
    + [GLIBC](#glibc)
- **Bash (Bash.md)**: interpretador de comandos e linguagem de script
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [`apt`](#apt)
    + [`vim`](#vim)
    + [`redis-cli`](#redis-cli)
        - [`redis-cli-ping`](#redis-cli-ping)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
        - [`lsb_release -a`](#comandos-utilizados-cli-lsb-release)
        - [`sudo -E`](#comandos-utilizados-cli-sudo-e)
        - [`sudo apt update`](#comandos-utilizados-cli-sudo-apt-update)
        - [`sudo apt upgrade`](#comandos-utilizados-cli-sudo-apt-upgrade)
        - [`ssh`](#comandos-utilizados-cli-ssh)
        - [`arp`](#comandos-utilizados-cli-arp)
        - [`pgrep`](#comandos-utilizados-cli-pgrep)
        - [`kill`](#comandos-utilizados-cli-kill)
        - [`cat`](#comandos-utilizados-cli-cat)
        - [`tr`](#comandos-utilizados-cli-tr)
        - [`sed`](#comandos-utilizados-cli-sed)
        - [`curl`](#comandos-utilizados-cli-curl)
        - [`strip`](#comandos-utilizados-cli-strip)
        - [`upx`](#comandos-utilizados-cli-upx)
        - [`strings`](#comandos-utilizados-cli-strings)
        - [`ldd`](#comandos-utilizados-cli-ldd)
- **.service (ponto-service.md):**
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Arquivo de Serviço](#arquivo-servico)
        - [Seções](#arquivo-servico-secoes)
            + [Unit](#arquivo-servico-secoes-unit)
            + [Service](#arquivo-servico-secoes-service)
            + [Install](#arquivo-servico-secoes-install)
            + [Timer](#arquivo-servico-secoes-timer)
            + [Socket](#arquivo-servico-secoes-socket)
            + [Mount](#arquivo-servico-secoes-mount)
            + [Path](#arquivo-servico-secoes-path)
            + [Scope](#arquivo-servico-secoes-scope)
            + [Swap](#arquivo-servico-secoes-swap)
    + [Arquivo de Ambiente](#arquivo-ambiente)
- **VM (VM.md):** como criar e utilizar uma VM
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Criando uma VM](#criando-vm)
- **VPN (VPN.md):** como utilizar uma VPN
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Configurando a VPN](#configurando-vpn)
- **Redes (redes.md):**
    + [Interfaces de Rede](#interfaces-rede)
    + [Requisições de Outra Máquina Para Um Localhost](#requisições-outra-maquina-localhost)
- **Configurando a Minha Máquina (configurando-maquina.md):** arquivo que lista as ferramentas que eu utilizo, pretendo criar um script de configuração de ambiente
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Projeto de Script de Configuração de Ambiente](#projeto-script-configuracao-ambiente)
- **Markdown (Markdown.md):** linguagem de marcação
    + [Quebra de Linha](#quebra-linha)
- **AWS (AWS.md):**
    + [Amazon EC2](#amazon-ec2)
        - [Substituindo o Código em Execução no EC2](#amazon-ec2-substituindo-codigo-execucao-ec2)
    + [AWS Secrets Manager](#aws-secrets-manager)

## ./JavaScript

- **JavaScript (JavaScript.md):** linguagem de programação
    + [Operadores](#operadores)
        - [`new`](#operadores-new)
        - [`typeof`](#operadores-typeof)
    + [Objetos](#objetos)
        - [Definindo Métodos em Objetos](#objetos-definindo-metodos-objetos)
        - [`Object`](#objetos-object)
            + [`.toString()`](#objetos-object-tostring)
            + [`.prototype.toString.call()`](#objetos-object-prototype-tostring-call)
        - [`Date`](#objetos-date)
    + [Métodos](#metodos)
        - [Array](#metodos-array)
            + [array.every()](#metodos-array-every)
            + [`array.forEach()`](#metodos-array-foreach)
    + [Função de Flecha](#funcao-flecha)
    + [Closures](#closures)
    + [Época Unix](#epoca-unix)
- **Node.js (Nodejs.md):** engine, runtime, ambiente de execução JavaScript
    + [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
    + [Ato de Publicação](#ato-publicacao)
    + [`npx`](#npx)
    + [Node 22.1.0 e a Criação de Executáveis Únicos](#node-22-criacao-executaveis-unicos)
        - [Assets](#node-22-criacao-executaveis-unicos-assets)
        - [Suporte Para o Snapshot de Inicialização](#node-22-criacao-executaveis-unicos-suporte-snapshot-inicializacao)
        - [Suporte Para o Cache de Código V8](#node-22-criacao-executaveis-unicos-suporte-cache-codigo-v8)
        - [No Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado)
            + [`sea.isSea()`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-issea)
            + [`sea.getAsset(key[,encoding])`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getasset)
            + [`sea.getAssetAsBlob(key[, options])`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getassetasblob)
            + [`sea.getRawAsset(key)`](#node-22-criacao-executaveis-unicos-script-principal-injetado-sea-getrawasset)
            + [`require(id)` No Script Principal Injetado Não é Baseado em Arquivo](#node-22-criacao-executaveis-unicos-script-principal-injetado-requireid-script-principal-injetado-nao-eh-baseado-arquivo)
            + [`__filename` e `module.filename` No Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado-filename-module-filename-script-principal-injetado)
            + [`__dirname` no Script Principal Injetado](#node-22-criacao-executaveis-unicos-script-principal-injetado-dirname-script-principal-injetado)
    + [Notas](#node-22-criacao-de-executaveis-unicos-script-principal-injetado-notas)
    + [Testando esta Feature](#node-22-criacao-executaveis-unicos-script-principal-injetado-testando-feature)
    + [Conclusão](#node-22-criacao-executaveis-unicos-script-principal-injetado-conclusao)
- **package.json (packagejson.md):** arquivo de metadados
    + [Chaves](#chaves)
        - [`main`](#chaves-main)
        - [`bin`](#chaves-bin)
        - [`scripts`](#chaves-scripts)
            + [Chaves da chave `scripts`](#chaves-scripts-chaves-chave-scripts)
        - [`files`](#chaves-files)
    + [Dependências Utilizadas por Um Pacote](#dependencias-utilizadas-pacote)
        - [Operadores de Versão](#dependencias-utilizadas-pacote-operadores-versao)
        - [Patch](#dependencias-utilizadas-pacote-patch)
    + [package.json x package-lock.json](#packagejson-x-package-lockjson)
- **npm (npm.md):** gerenciador de pacotes
    + [Compatibilidade Entre o Node.js e o npm](#compatibilidade-nodejs-npm)
    + [Ato de Publicação](#ato-publicacao)
    + [Erros Enfrentados](#erros-enfrentados)
        - [Ao Tentar Instalar as Dependências do Nosso Projeto](#ao-instalar-dependencias-projeto)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
        - [`npm login` x `npm adduser`](#comandos-utilizados-cli-npm-login-x-npm-adduser)
        - [`npm install`](#comandos-utilizados-cli-npm-install)
        - [`npm show $< nome do pacote > dependencies`](#comandos-utilizados-cli-npm-show-nome-pacote-dependencies)
- **NVM (NVM.md):** gerenciador de versões para Node.js
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Instalação](#instalacao)
        - [Observações Interessantes](#instalacao-observacoes-interessantes)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [Desinstalando o NVM](#desinstalando-nvm)
    + [Desinstalação de Pacotes](#desinstalacao-pacotes)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
        - [`ls-remote`](#comandos-utilizados-cli-ls-remote)
- **Bibliotecas/**
    + `cluster` **(cluster.md):** utilizada para criar processos filhos
    + `moment` **(moment.md):** utilizada na manipulação de datas
    + Express **(Express.md):** utilizada na criação de servidores HTTP
        - [Métodos](#metodos)
            + [app.listen()](#metodos-app-listen)
    + **Axios (axios.md):**
        - [Métodos](#metodos)
            + [`axios.post()`](#metodos-axios-post)
    + **Sequelize (sequelize.md):** utilizada na manipulação de banco de dados SQL
        - [Tipos de Coluna](#tipos-coluna)
        - [Métodos](#metodos)
            + [`queryInterface.addColumn()`](#metodos-queryinterface-addcolumn)
            + [`queryInterface.removeColumn()`](#metodos-queryinterface-removecolumn)
            + [`Model.create()`](#metodos-model-create)
            + [`Model.findOne()`](#metodos-model-findone)
            + [`Model.update()`](#metodos-model-update)
    + `umzug` **(umzug.md):** utilizada no controle de migrações
- **Pacotes/**
    + **PM2 (PM2.md):** gerenciador de processos
        - [Contexto: SO Utilizado](#contexto-so-utilizado)
        - [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
        - [Anotações](#anotacoes)
        - [Arquivos Relacionados](#arquivos-relacionados)
            + [dump.pm2](#arquivos-relacionados-dump-pm2)
        - [Informações Sobre os Aplicativos em Execução](#informacoes-aplicativos-execucao)
            + [`status`](#informacoes-aplicativos-execucao-status)
        - [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
            + [`list`](#comandos-utilizados-cli-list)
            + [`describe $< ID >`](#comandos-utilizados-cli-describe)
            + [`env $< ID >`](#comandos-utilizados-cli-env)
            + [`reload`](#comandos-utilizados-cli-reload)
            + [`kill`](#comandos-utilizados-cli-kill)
            + [`save`](#comandos-utilizados-cli-save)
            + [`resurrect`](#comandos-utilizados-cli-ressurect)
            + [`delete`](#comandos-utilizados-cli-delete)
    + **JavaScript obfuscator (JavaScript-obfuscator.md):** utilizado na ofuscação de código JavaScript
    + `pkg` **(pkg.md):** utilizado para compilar o código-fonte Node.js em um binário executável
        - [Dependências Externas](#dependencias-externas)
        - [`pkg` x Nexe](#"pkg-x-nexe")
        - [Segurança](#seguranca)
        - [Arquivo de Serviço e PM2](#arquivo-serviço-e-pm2)
        - [Compilando o seu Código-fonte com o `pkg`](#compilando-codigo-fonte-pkg)
            + [Especificação de Target](#compilando-codigo-fonte-pkg-especificacao-target)
            + [Observações Importantes](#compilando-codigo-fonte-pkg-observacoes-importantes)
                - [Recursos Não Sendo Incluídos no Compilado](#compilando-codigo-fonte-pkg-observacoes-importantes-recursos-nao-incluidos-compilado)
                - [`pkg` e o JavaScript obfuscator](#compilando-codigo-fonte-pkg-observacoes-importantes-pkg-javascript-obfuscator)
                - [`devDependencies`](#compilando-codigo-fonte-pkg-observacoes-importantes-devdependencies)
    + **Nexe (nexe.md):** utilizado para compilar o código-fonte Node.js em um binário executável
        - [Dependências Externas](#dependencias-externas)
        - [`pkg` x Nexe](#"pkg-x-nexe")
        - [Segurança](#seguranca)
        - [Compilando o seu Código-fonte com o Nexe](#compilando-codigo-fonte-nexe)
            + [Especificação de Target](#compilando-codigo-fonte-nexe-especificacao-target)
            + [Observações Importantes](#compilando-codigo-fonte-nexe-observacoes-importantes)
                - [Configurações de Compilação Ideais](#compilando-codigo-fonte-nexe-observacoes-importantes-configuracoes-compilacao-ideais)
                - [Recursos Não Sendo Incluídos no Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-recursos-nao-incluidos-compilado)
                - [Problemas ao Tentar Comprimir o Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-tentar-comprimir-compilado)
                - [Problemas de Segurança](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-seguranca)
                - [Problemas de Depêndencias Externas](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-dependencias-externas)
                - [Problemas com o PM2](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-pm2)
    + `node-gyp` **(node-gyp.md):** ferramenta de compilação para módulos nativos do Node.js
    + **NPX (NPX.md):** executor de pacotes do NPM
- **ateste.js:** arquivo utilizado para testes

## ./Python

- **Python (Python.md):** linguagem de programação
    + [Anotações](#anotacoes)
- `pyenv` **(pyenv.md):** gerenciador de versões para Python
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Instalação](#instalacao)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
        - [`install --list`](#comandos-utilizados-cli-install-list)
        - [`versions`](#comandos-utilizados-cli-versions)
        - [`local`](#comandos-utilizados-cli-local)
        - [`shell $< versão >`](#comandos-utilizados-cli-shell)

## Template (template.md)

Template de estrutura a tentar seguir em relação as anotações do conteúdo estudado.

### Sumário

- [Template](#template)
    + [Prático](#pratico)
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Instalação](#instalacao)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [Anotações](#anotacoes)
    + [Arquivos Relacionados](#arquivos-relacionados)
    + [Erros Enfrentados](#erros-enfrentados)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
- [Formatação do Documento](#formatacao-documento)
    + [Código](#formatacao-documento-codigo)
    + [Subtópicos](#formatacao-documento-subtopicos)
    + [Nomenclatura](#formatacao-documento-nomenclatura)
    + [Negrito](#formatacao-documento-negrito)
- [Key Words](#formatacao-documento-key-words)

## MariaDB (Diretorio-heterogeneo/mariadb.md)

## Segurança (Diretorio-heterogeneo/seguranca.md)

Arquivo que trata de formas de proteger o seu código-fonte.

### Sumário

- [Técnicas de Ofuscação de Código](#tecnicas-ofuscacao-codigo)

## Termos Utilizados na Área de TI (Diretorio-heterogeneo/termos-TI.md)

Explicação do significado dos termos utilizados com frequência na área de TI.

### Sumário

- [blob e glob](#blob-glob)
- [CLI](#cli)
- [CWD](#cwd)
- [foo](#foo)
- [Linter](#linter)
- [LTS](#lts)
- [Snapshot](#snapshot)
- [SO](#so)

# Anotações Não Alocadas

- No final das contas, seja interpretada ou compilada, a CPU lê código de máquina, o que acaba por se tornar um processo
- WSS é um protocolo, assim como o HTTPS e o HTTP

# Estudar

## Bash

## JavaScript/Node.js/npm/nvm/PM2

- Criar um exemplo de exportação/importação com o código abaixo:

```JavaScript
const nome1 = "Maria";
export default nome1;

export const nome2 = "João";
```

## MariaDB

- Tipos de coluna
- `ALTER TABLE $< tabela > MODIFY COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > ADD COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > ADD COLUMN $< coluna > JSON;`
- `ALTER TABLE $< tabela > DROP COLUMN $< coluna >;`
- `SHOW GRANTES FOR $< usuário >@$< host >`
- `GRANT SYSTEM_USER ON *.* TO '$< usuário >'@'$< host >'`

## AWS

- O que é a AWS?
- s3
- ec2
- route53
- ecr

## Python

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

## Tópicos Não Classificados

- Todo binário não é um executável?
- **PirateSoftware (Streamer):** habilitar a verificação de dois fatores ("Two Factor") sempre que possível nos seus programas
    + Como este tipo de verificação funciona?
    + Quais as vantagens que ela trás?
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