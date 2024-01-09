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

# Ordem de Estudo do Conteúdo

Markdown é uma linguagem de marcação, TermosTI é um tipo de glossário e o Template especifica como está formatado os arquivos no aspecto estrutural. Eles podem ser estudados e consultados fora da ordem. O Hardware.md também pode ser estudado sem seguir a ordem linear.

- [SistemaOperacional.md](SistemaOperacional.md#sumario)
    + Resumo do Conteúdo
    + Sistema Operacional
    + Kernel
    + Unix-like
        - Serviços
        - systemctl
        - Daemon
        - Execução em Primeiro e Segundo Plano
        - Caminho Absoluto e Caminho Relativo
        - Permissões de Acesso a Arquivos e Diretórios
        - Diretórios Específicos
    + Linux
        - GRUB
        - Diagrama de Inicialização de Um Sistema Computacional
        - LUKS
        - Shell
            + Bash
            + Scripts
    + Windows
        - Comandos do Terminal
        - Atalhos
        - Atalhos (Durante a Inicialização)
    
- [Shell.md](Terminal.md#shell)
- [LinguagensProgramacao](LinguagensProgramacao.md#linguagens-programacao)
- [Markdown.md](Markdown.md#markdown)
- [Git.md](Git.md#git)
- [Docker.md](Docker.md#docker)
- [TermosTI.md](TermosTI.md#termor-ti)
- [Hardware.md](Hardware.md#hardware)
    + Placa-mãe
    + FRAM
    + Partições x Volumes (No Contexto de Discos, Como Discos Rígidos)
    + HD Externo x Flash Drive (Dispositivo Inicializável)
- [Template.md](Template.md#template)

---

# Ordem de Estudo do Conteúdo

Sobre o que cada arquivo ou diretório trata, de forma resumida.

### Sistemas Operacionais

Os arquivos deste diretório tratam sobre aspectos de como um sistema computacional funciona e se comporta a partir da sua inicialização. Além de aspectos dos Sistemas Operacionais (SOs), incluindo algumas versões em particular:

- SOs Unix-like
- Linux
- Windows

### Redes

Discursa sobre o Endereço IP e sobre o Nome de Host.

### Shell

Este arquivo descreve algumas características do Shell (a interface de linha de comando que permite o usuário interagir com o sistema operacional atráves de comandos de texto), além de alguns comandos aceitos por ele.

# Notas para Mim Mesmo

**Arquivos a Analisar**

+ ./Sistemas\ Operacionais/SistemaOperacional.md
+ aplicacoes.md
+ Conceitos.md
+ Docker.md
+ Hardware.md
+ LinguagensProgramacao.md
+ Markdown.md
+ meu_servico.sh
+ Template.md
+ TermosTI.md

- Saiba dosar o quanto você deve imergir em uma tecnologia específica, para não se apronfundar sem necessidade, considerando que o mundo está inundado de informação
- Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

+ Aprender CI/CD e criar um pipeline de deploy
+ No contexto de APIs, teste de estresse (teste de volumetria, "quanto ele aguenta"), testes automatizados
+ Criar um serviço que abre as aplicações que eu uso assim que eu inicio o sistema
+ Criar um script que realiza commits antes de desligar a minha máquina
+ Criar um volume criptografado com o LUKS?
+ Criar uma aplicação e executá-la através do Docker
+ Criar um Banco na RDS em que a autenticação seja feita com um usuário IAM (https://repost.aws/knowledge-center/users-connect-rds-iam)