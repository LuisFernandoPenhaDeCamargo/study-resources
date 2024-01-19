# Notas para Mim Mesmo

- Saiba dosar o quanto você deve imergir em uma tecnologia específica, para não se apronfundar sem necessidade, considerando que o mundo está inundado de informação
- Preciso ser mais organizado
- Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

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