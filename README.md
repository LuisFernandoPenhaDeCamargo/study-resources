# Notas para Mim Mesmo

- Saiba dosar o quanto você deve imergir em uma tecnologia específica, para não se apronfundar sem necessidade, considerando que o mundo está inundado de informação
- Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

- Criar um serviço que abre as aplicações que eu uso assim que eu inicio o sistema
- Criar uma aplicação e executá-la através do Docker
- Atualizar meu LinkedIn
- Colocar a Pós em dia
- Anotação sobre as irritações de pele
- Anotações sobre correr de tênis e sem meia

- Anotações sobre segurança e a quebra dela nos kits (Mauricio)
- O que nos disponibilizamos aos nossos clientes? (contexto da Orion)
- Como ocorre a quebra de segurança para furto do código do jogo ou dos arquivos da gráfica? (contexto da Orion)

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

Markdown é uma linguagem de marcação, TermosTI é um tipo de glossário e o Template especifica como está formatado os arquivos no aspecto estrutural. Eles podem ser estudados e consultados fora da ordem.

- [SistemaOperacional.md](SistemaOperacional.md#sistema-operacional)
    + Kernel
    + Unix-like
    + Serviços
    + systemctl
    + Daemon
    + LUKS
- [Terminal.md](Terminal.md#terminal)
- [Markdown.md](Markdown.md#markdown)
- [Git.md](Git.md#git)
- [Docker.md](Docker.md#docker)
- [TermosTI.md](TermosTI.md#termor-ti)
- [Template.md](Template.md#template)