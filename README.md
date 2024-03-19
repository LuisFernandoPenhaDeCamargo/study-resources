# Prático

`git config --global credential.helper 'cache --timeout=28800'`

# Notas para Mim Mesmo

- Saiba dosar o quanto você deve imergir em uma tecnologia específica, para não se apronfundar sem necessidade, considerando que o mundo está inundado de informação
- Preciso ser mais organizado
- Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

# Fazer

- A captação e a saída do áudio não está funcionando no Discord
- Configurando os backticks no VSCode
- O display da bateria não está correto (Ubuntu)
- Corrigir o problema relacionado ao modo sata, Windows e Ubuntu (**formatacao-dual-boot.md**)

# Estudar

+ `console.log("typeof:", Object.prototype.toString.call(machine));`
+ `console.log(Object.getOwnPropertyNames(machine));`
+ Diferença entre aspas simples e aspas duplas
+ Pelo que parece, no JavaScript, o corpo do arquivo atual é completamente percorrido antes de ir para outro arquivo que foi chamado. Podemos verificar isso invocando uma função em um parte do escopo e colocando uma impressão após a invocação, para assim ver se é impresso o log da função ou do arquivo atual, antes

- `INSERT INTO oriongames_testnew.games SELECT * FROM oriongames.games AS prod WHERE NOT EXISTS ( SELECT * FROM oriongames_testnew.games AS test WHERE prod.id = test.id )`
- `SELECT ROUTINE_NAME FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA = 'nome_do_banco_de_dados' AND ROUTINE_TYPE = 'FUNCTION' AND ROUTINE_NAME = nome_da_função';`
- `SELECT ROUTINE_NAME FROM information_schema.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION' AND ROUTINE_NAME = 'raffle_jackpot_prize';`
- `SHOW CREATE PROCEDURE nome_da_procedure;`
- `SHOW CREATE FUNCTION nome_da_função;`
- `SELECT nome_da_função();`
- `DROP PROCEDURE IF EXISTS nome_da_procedure;`
- `DECLARE CURSOR FOR`, `OPEN`, `FETCH` e `CLOSE`
- `DECLARE EXIT HANDLER FOR 1329 SELECT '0';`
- Funções não permitem que você realize a operação SELECT nas suas variáveis, então para ver o comportamento de uma, você pode torna-la uma procedure

+ Criar do zero uma instância no ec2
    - Colocar o nginx para rodar junto com a API em Node.js
    - Instalar https na instância
    - Ativar a atualização do certificado ssl de forma automática
+ Estudar sobre a AWS e seus serviços
    - s3
    - ec2
    - route53
    - ecr
+ Estudar o redirecionamento de DNS
+ Estudar git flow, trunk based (dois formatos de fluxo)
+ Todo binário não é um executável?
+ Aprender CI/CD e criar um pipeline de deploy
+ No contexto de APIs, teste de estresse (teste de volumetria, "quanto ele aguenta"), testes automatizados
+ Criar um serviço que abre as aplicações que eu uso assim que eu inicio o sistema
+ Criar um script que realiza commits antes de desligar a minha máquina
+ Criar um volume criptografado com o LUKS?
+ Criar uma aplicação e executá-la através do Docker
+ Criar um Banco na RDS em que a autenticação seja feita com um usuário IAM (https://repost.aws/knowledge-center/users-connect-rds-iam)

# Git (git.md)

- [Primeiro `commit`](#primeiro-commit)
- [Armazenando Suas Credenciais](#armazenando-suas-credenciais)
    + [`gh` (GitHub CLI)](#gh-github-cli)
- [Comandos](#comandos)

# Bash (bash.md)

- [Comandos](#comandos)
- [Ferramentas de Linha de Comando](#ferramentas-linha-comando)
    + [`wget`](#wget)
    + [`systemctl`](#systemctl)
    + [`aws`](#aws)
- [Gerenciadores de Pacote](#gerenciadores-pacote)
    + [`cargo`](#cargo)

# HTML (html.md)

# CSS (css.md)

# Rust

- **rust.md**
    + [Projetos](#projetos)
    + [Utilitários](#utilitarios)
    + [Livro: A Linguagem de Programação Rust](#livro-linguagem-programacao-rust)
        - [Obtenção do Livro em Português](#obtencao-livro-portugues)
    + [Introduction](#introduction)
    + [1. Getting Started](#1-getting-started)
        - [1.1 Installation](#11-installation)
        - [1.2 Hello, World!](#12-hello-world)
            + [Anatomy of a Rust Program](#anatomy-rust-program)
        - [1.3 Hello, Cargo!](#13-hello-cargo)
            + [Creating a Project with Cargo](#creating-project-cargo)
            + [Building and Running a Cargo Project](#building-and-running-cargo-project)
            + [Rust e o Seu Ponto de Entrada](#ponto-de-entrada)
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
        - [3.4 Comments](#34-comments)
        - [3.5 Control Flow](#35-control-flow)
    + [4. Understanding Ownership](#4-understanding-ownership)
        - [4.1 What is Ownership?](#41-what-is-ownership)
            + [The Stack and the Heap](#stack-heap)
            + [Ownership Rules](#ownership-rules)
            + [Variable Scope](#variable-scope)
            + [The String Type](#the-string-type)
            + [Memory and Allocation](#memory-and-allocation)
            + [Pontos Adicionais](#pontos-adicionais-ownership)
        - [4.2 References and Borrowing](#42-references-and-borrowing)
            + [Mutable References](#mutable-references)
            + [Dangling References](#dangling-references)
            + [The Rules of References](#rules-of-references)
            + [Pontos Adicionais](#pontos-adicionais-references)
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