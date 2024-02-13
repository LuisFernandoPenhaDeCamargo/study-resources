# Fazer

- Como as minhas credenciais do Git estão configuradas para serem autenticadas na minha máquina na Orion?

# Git (git.md)

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)

# HTML (html.md)

# CSS (css.md)

# Guia de Formatação do Sistema Operacional (formatacao-dual-boot.md)

- [Acessando a BIOs](#acessando-bios)
- [Acessando o "qual é o nome deste modo"](#)
- [Problema para Desativar o Modo de Segurança](#problema-desativar-modo-segurança)
- [Problema para Realizar o Boot de Um HD Externo](#problema-realizar-boot-hd-externo)
- [Problema ao Mudar o Modo Sata](#problema-mudar-modo-sata)
- [Ubuntu](#ubuntu)
    - [Configuração do Teclado](#configuração-teclado)
    - [Configuração do Idioma do Google Chrome](#configuração-idioma-google-chrome)
    - [Programas Instalados](#programas-instalados)

# ---

# Notas para Mim Mesmo

- Saiba dosar o quanto você deve imergir em uma tecnologia específica, para não se apronfundar sem necessidade, considerando que o mundo está inundado de informação
- Preciso ser mais organizado
- Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

# Estudar

## JavaScript

- `typeof model.name`
- `console.log("typeof:", Object.prototype.toString.call(machine));`
- `console.log(Object.getOwnPropertyNames(machine));`
- Diferença entre aspas simples e aspas duplas

## MySQL

- `DECLARE CURSOR FOR`, `OPEN`, `FETCH` e `CLOSE`
- Procurando uma procedure no banco pelo CLI do SGBD

```sql
SHOW CREATE PROCEDURE nome_da_procedure;
```

- Excluindo uma procedure

```sql
DROP PROCEDURE IF EXISTS nome_da_procedure;
```

- Funções não permitem que você realize a operação SELECT nas suas variáveis, então para ver o comportamento de uma, você pode torna-la uma procedure
- Procurando uma função no banco pelo CLI do SGBD

```sql
SELECT
    ROUTINE_NAME
FROM
    information_schema.ROUTINES
WHERE
    ROUTINE_SCHEMA = 'nome_do_banco_de_dados'
    AND ROUTINE_TYPE = 'FUNCTION'
    AND ROUTINE_NAME = 'nome_da_função';
```

- Procurando uma função no banco pelo CLI do SGBD

```sql
SHOW CREATE FUNCTION nome_da_função;
```

- Executando uma função pelo CLI do SGBD

```sql
SELECT nome_da_função();
```

- `DECLARE EXIT HANDLER FOR 1329 SELECT '0';`

## Bash

- Verificando o status de um serviço

```bash
systemctl status mysql.service
```

- Interrompendo a execução de um serviço

```bash
sudo systemctl stop mysql
```

- Reiniciando um serviço

```bash
sudo systemctl restart mysql
```

## Git

- `git checkout -b dev/lfernando-rc master`
- `git checkout dev/lfernando`

# Sumário

## Rust

Este diretório contém um resumo com os pontos importantes e exemplos práticos do livro "The Rust Programming Language", além de anotações próprias que eu achei interessante ressaltar.

## JavaScript

Este diretório contém anotações teóricas e práticas referente a esta linguagem de programação, como conceitos, funções e bibliotecas.

## NPM (npm.md)

Este arquivo descreve como publicar um pacote e as dificuldades que eu encontrei para fazer isso.

## MySQL (mysql.md)

- Operadores\
    + % (Operador de Módulo)
- Funções
    + `rand()`
    + `UNIX_TIMESTAMP()`
- Criação de Funções

## Shell (shell.md)

- Alterando o Hostname no Ubuntu

---

# Conteúdo

Abaixo temos sobre o que cada arquivo ou diretório trata, de forma resumida.

### linguagens-programacao.md

Este arquivo discursa sobre conceitos utilizados em programação.

- Recursão
- Compilada x Interpretada

- Linguagem de Programação de Sistema
- Suporte a Concorrência e Paralelismo

### Sistemas Operacionais

Os arquivos deste diretório tratam sobre aspectos de como um sistema computacional funciona e se comporta a partir da sua inicialização. Além de aspectos dos Sistemas Operacionais (SOs), incluindo algumas versões em particular:

- SOs Unix-like
- Linux
- Windows

### redes.md

Este arquivo discursa sobre o Endereço IP e sobre o Nome de Host.

### shell.md

Este arquivo descreve algumas características do Shell (a interface de linha de comando que permite o usuário interagir com o sistema operacional atráves de comandos de texto), além de alguns comandos aceitos por ele.

### arquivos.md

Este arquivo explica sobre o que se trata certa extensões de arquivos.

### termosTI.md

Este arquivo explica o significado de termos encontrados com frequência na área de tecnologia.

CLI

### template.md

Este arquivo especifica como está formatado os arquivos no aspecto estrutural

### aplicacoes.md

Este arquivo contém comandos e observações sobre várias aplicações.

### configuracoes-ambiente-aplicacoes.md

Este arquivo especifica como eu gosto de configurar meu ambiente e suas aplicações, por exemplo, os ambientes de trabalho virtuais (virtual desktops) no Ubuntu.

#

**Arquivos a Analisar**

- linguagens-programacao.md
- ./Sistemas\ Operacionais/SistemaOperacional.md
- Conceitos.md
- Docker.md
- Git.md
- Hardware.md
- Markdown.md
- meu_servico.sh

+ Aprender CI/CD e criar um pipeline de deploy
+ No contexto de APIs, teste de estresse (teste de volumetria, "quanto ele aguenta"), testes automatizados
+ Criar um serviço que abre as aplicações que eu uso assim que eu inicio o sistema
+ Criar um script que realiza commits antes de desligar a minha máquina
+ Criar um volume criptografado com o LUKS?
+ Criar uma aplicação e executá-la através do Docker
+ Criar um Banco na RDS em que a autenticação seja feita com um usuário IAM (https://repost.aws/knowledge-center/users-connect-rds-iam)

- O que nos disponibilizamos aos nossos clientes? (contexto da Orion)

# Estudar

- Linux (Sistemas Operacionais Unix-like? Recomendação do Takeshi, é um tópico interessante para a Orion)
    + Estudar um pouco de bash script
- Criar do zero uma instância no ec2 (recomendação do Takeshi)
    + Colocar o nginx para rodar junto com a API em Node.js
    + Instalar https na instância
    + Ativar a atualização do certificado ssl de forma automática
- Estudar um pouco sobre a AWS e seus serviços (recomendação do Takeshi)
    + s3
    + ec2
    + route53
    + ecr
- Estudar o redirecionamento de DNS (recomendação do Takeshi)
- Estudar git flow, trunk based (dois formatos de fluxo, recomendação do Takeshi)
- Deploy
- O que um Gestor de Projetos faz?
- O que um DevOps faz?
- .yml
- JavaScript
- Shell
- Python
- PLpgSQL?
- Makefile?

# Anotações Ainda Não Alocadas

```JavaScript
`INSERT INTO placemachines
    (${Object.keys(machineObject)}, reactivated, active)
    VALUES
    (${Object.keys(machineObject).map(=>`?`)}, ${reactivated}, 1)
    ON DUPLICATE KEY UPDATE
    ${Object.keys(machineObject).map(k => ${k} = ?).join(',')}, reactivated = ${reactivated}, active = 1
`
```

Provavelmente deve ter um index UNIQUE na tabela.