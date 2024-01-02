# Notas para Mim Mesmo

Tecnologias a se estudar:

- JavaScript
- Shell
- Python
- PLpgSQL?
- Makefile?

# Anotações Ainda Não Alocadas

- Criação de tabelas
- Fazer com que Links não sejam clicáveis

---

Como eu vou organizar as minhas anotações? Vou criar um repositório para cada tecnologia?

---

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

---

Estudar:

- Contêiner
- Deploy
- Docker
- Linux (interessante para a Orion)
    + Entender bem o funcionamento de systemctl
    + Entender o funcionamento de luks
    + Focar um pouco em bash script
    + Criar do zero uma instância no ec2
    + Colocar o nginx para rodar junto com o API em Node
    + Instalar https na instância
    + Ativar a atualização do certificado ssl de forma automâtica
    + Estudar um pouco sobre a AWS e Serviços
        - route53
        - s3
        - ec2
        - ecr
    + Estudar o redirecionamento de DNS
    + A ideia é antes de começar a mexer com o Docker, por exemplo, é fazer no braço o que ele faz para entender onde ele poderia te ajudar
    + Estudar git flow, trunk based (dois formatos de fluxo)

---

No contexto da área relacionada a tecnologia o que faz:

- Um Gestor de Projetos
- Um DevOps