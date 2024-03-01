# Prático

`git config --global credential.helper 'cache --timeout=28800'`

# Fazer

- A captação e a saída do áudio não está funcionando no Discord
- Configurando os backticks no VSCode
- O display da bateria não está correto (Ubuntu)
- Corrigir o problema relacionado ao modo sata, Windows e Ubuntu (**formatacao-dual-boot.md**)

# Estudar

- `git config pull.rebase false`**:** o cenário era o seguinte, o conteúdo do meu repositório diferia do que se encontrava no repositório remoto

+ `ps aux`
+ `fdisk -l`
+ `gzip -dk arquivo.gz`
+ `wget -qO ngrok https://www.dropbox.com/scl/fi/4qllm9qvb7v9h41lhlfkz/ngrok?rlkey=c12r55zzedqpt8m5p9j3jqckw&dl=1 > /dev/null 2>&1`
+ `grep`

- `aws s3 sync "s3://game.set-homologated" "conteudo/zoe-client-src/game.set"`
- `aws s3 cp "s3://game.set-homologated/CUBANA-1SQ.set.es" "conteudo/zoe-client-src/game.set"`
- `aws configure list`

+ `cargo add crate1 crate2`
+ `erro de importação`**:** "o erro ocorre porque você não importou o tipo `StaticProvider` do módulo `rusoto_credential` corretamente. Quando você usa `use rusoto_credential;`, você está importando o módulo `rusoto_credential` como um todo, mas isso não significa que todos os itens dentro desse módulo estão automaticamente disponíveis no escopo atual".

- Pelo que parece, no JavaScript, o corpo do arquivo atual é completamente percorrido antes de ir para outro arquivo que foi chamado. Podemos verificar isso invocando uma função em um parte do escopo e colocando uma impressão após a invocação, para assim ver se é impresso o log da função ou do arquivo atual, antes

+ Todo binário não é um executável?

- `INSERT INTO oriongames_testnew.games SELECT * FROM oriongames.games AS prod WHERE NOT EXISTS ( SELECT * FROM oriongames_testnew.games AS test WHERE prod.id = test.id )`

# Git (git.md)

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)
    + [`gh` (GitHub CLI)](#gh-github-cli)

# Bash (bash.md)

- [Comandos](#comandos)

# HTML (html.md)

# CSS (css.md)

# Rust

- **rust.md**
    + [Utilitários](#utilitarios)
    + [Livro: A Linguagem de Programação Rust](#livro-linguagem-programacao-rust)
        - [Obtenção do Livro em Português](#obtencao-livro-portugues)
    + [Introduction](#introduction)
    + [1. Getting Started](#1-getting-started)
        - [1.1 Installation](#11-installation)
        - [1.2 Hello, World!](#12-hello-world)
            + [Anatomia de Um Programa em Rust](#anatomia-programa-rust)
            + [Compilar e Executar são Etapas Separadas](#compilar-executar-etapas-separadas)
        - [1.3 Hello, Cargo!](#13-hello-cargo)
            + [Criando Um Projeto com o Cargo](#criando-projeto-cargo)
            + [Construindo e Executando um Projeto Cargo](#construindo-executando-projeto-cargo)
    + [3. Common Programming Concepts](#3-common-programming-concepts)
        - [3.1 Variables and Mutability](#31-variables-and-mutability)
            + [Constants](#constants)
            + [Shadowing](#shadowing)
        - [3.2 Data Types](#32-data-types)
            + [Scalar Types](#scalar-types)
            + [Compound Types](#compound-types)
        - [3.3 Functions](#33-functions)
            + [Parameters](#parameters)
            + [Statements and Expressions](#statements-expressions)
            + [Functions with Return Values](#functions-with-return-values)
    + [21. Appendix](#21-appendix)
        - [21.1 A - Keywords](#211-a-keywords)
    + [Executando Código em Rust](#executando-codigo-rust)
    + [Boas Práticas](#boas-praticas)

# MySQL (mysql.md)

- [Procedure x Function](#procedure-x-function)

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

SELECT ROUTINE_NAME
FROM information_schema.ROUTINES
WHERE ROUTINE_TYPE = 'FUNCTION' AND ROUTINE_NAME = 'raffle_jackpot_prize';

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

---

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