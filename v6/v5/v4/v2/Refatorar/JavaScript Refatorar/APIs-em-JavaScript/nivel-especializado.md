# Nível Especializado: Otimização e Técnicas Avançadas

### Sumário

17. [Cache de solicitações](#cache-de-solicitacoes)
18. [Otimização de consultas em APIs](#otimizacao-de-consultas-em-apis)
19. [Monitoramento e depuração de solicitações](#monitoramento-e-depuracao-de-solicitacoes)
20. [Uso de Docker para empacotar aplicações com Node.js](#uso-de-docker-para-empacotar-aplicacoes-com-nodejs)
21. [Integração contínua (CI) e implantação contínua (CD) para aplicações com APIs](#integracao-continua-ci-e-implantacao-continua-cd-para-aplicacoes-com-apis)
22. [AWS IAM (Identity and Access Management) e AWS S3 (Simple Storage Service)](#aws-iam-identity-and-access-management-e-aws-s3-simple-storage-service)

# <a name = "cache-de-solicitacoes"></a> Cache de solicitações

# <a name = "otimizacao-de-consultas-em-apis"></a> Otimização de consultas em APIs

# <a name = "monitoramento-e-depuracao-de-solicitacoes"></a> Monitoramento e depuração de solicitações

# <a name = "uso-de-docker-para-empacotar-aplicacoes-com-nodejs"></a> Uso de Docker para empacotar aplicações com Node.js

# <a name = "integracao-continua-ci-e-implantacao-continua-cd-para-aplicacoes-com-apis"></a> Integração contínua (CI) e implantação contínua (CD) para aplicações com APIs

# <a name = "aws-iam-identity-and-access-management-e-aws-s3-simple-storage-service"></a>AWS IAM (Identity and Access Management) e AWS S3 (Simple Storage Service)

IAM (Identity and Access Management) e S3 (Simples Storage Service) são serviços essenciais da Amazon Web Services (AWS) com finalidades distintas.

- **IAM:**
    - **Finalidade:** gerenciar identidades e controle de acesso na AWS;
    - **Principais funcionalidades:**
        - Criação e gerenciamento de usuários e grupos;
        - Atribuição de permissões específicas a usuários e grupos;
        - Gerenciamento de políticas de acesso;
        - Utilizado para autenticação e autorização de usuários e recursos na AWS.
- **S3:**
    - **Finalidade:**
    - **Principais funcionalidades:**
        - Armazenamento escalável e durável;
        - Acesso via API RESTful;
        - Suporte a versionamento de objetos;
        - Capacidade de configurar políticas de acesso;
        - Utilizado para armazenar e recuperar dados, como imagens, vídeos, documentos e backups.

Em resumo, o IAM cuida da segurança e controle de acesso dentro da sua conta AWS, enquanto o S3 fornece um serviço de armazenamento eficiente e escalável na nuvem. Muitas vezes, eles são usados em conjunto, onde o IAM é utilizado para controlar quem pode acessar ou modificar os recursos do S3.

O objeto abaixo representa uma política de controle de acesso no AWS Identity and Access Management (IAM). Cada objeto no array `statement` possui propriedades específicas que definem as permissões de acesso para diferentes ações em recursos específicos.

```JavaScript
module.exports = function GamesPolicyGenerator(bucketname, language, games, games_allowed) {
    let statement = [
        {
            Sid: "AllowUserToListObjects",
            Action: ["s3:ListBucket"],
            Effect: "Allow",
            Resource: ["arn:aws:s3:::*"]
        },
        {
            Sid: "AllowUserToReadRootObjects",
            Action: ["s3:GetObject"],
            Effect: "Allow",
            Resource: [
                'arn:aws:s3:::${bucketname}/version`,
                `arn:aws:s3:::${bucketname}/finish-update.sh`,
                `arn:aws:s3:::${bucketname}/finish-update-mexico.sh`,
                `arn:aws:s3:::${bucketname}/${language}/lobby.tar`,
                `arn:aws:s3:::${bucketname}/${language}/lobby-mexico.tar`,
                `arn:aws:s3:::${bucketname}/${language}/version`,
                `arn:aws:s3:::${bucketname}/utils/*`,
                `arn:aws:s3:::${bucketname}/${language}/network-setup.tar`,
            ]
        },
        {
            Sid: "AllowUserToReadGames",
            Action: ["s3:GetObject"],
            Effect: "Allow",
            Resource: games_allowed.map(element => `arn:aws:s3:::${bucketname}/${language}/${element}.tar`)
        }
    ]
}
```

- **Sid (Statement ID):**
    - **Descrição:** um identificador exclusivo para a declaração da política;
    - **Exemplo:** `AllowUserToListObjects`, `AllowUserToReadRootObjects`, `AllowUserToReadGames`.
- **Action:**
    - **Descrição:** ação ou conjunto de ações permitidas pela política. No contexto do AWS IAM, essas ações geralmente correspondem a operações que podem ser realizadas em recursos;
    - **Exemplo:** `["s3:ListBucket"]`, `["s3:GetObject"]`.
- **Effect:**
    - **Descrição:** o efeito da política, ou seja, se a alção especificada é permitida (`"Allow"`) ou negada (`"Deny"`);
    - **Exemplo:** `"Allow"`.
- **Resource:**
    - **Descrição:** os recursos aos quais a política se aplica. **No contexto do AWS S3**, esses recursos geralmente são identificados por seus **ARNs** (**Amazon Resource Names**);
    - **Exemplo:** `[\`arn:aws:s3:::*\`]`, `[\`arn:aws:s3:::${bucket\ame}/version\`]`.

Essas declarações de política são utilizadas para controlar quem (princípios) podem realizar quais ações em quais recursos no ambiente AWS. O uso de um SID exclusivo para cada declaração facilita a identificação e gerenciamento dessas políticas.\
Sobre o `Resource`, peguemo o caso do `["arn:aws:s3:::*"]`:

- **ARN:** Amazon Resource Name;
- **AWS:** Amazon Web Services;
- **S3:** Simples Storage Service.

A presença dos dois ponto (`:`) na estrutura do ARN serve para separar as partes essenciais do ARN. A estrutura geral de um ARN é:
`arn:partition:service:region:account-id:resource`

- `arn`**:** indica que é um Amazon Resource Name;
- `partition`**:** especifica a partoção AWS, que é uma divisão de serviços da AWS para fins de governança e compliance. As partições comuns incluem "aws" (a nuvem publica) e "aws-cn" (AWS na China);
- `service`**:** indica o serviço da AWS ao qual o recurso pertence (por exemplo, `s3` para o Amazon s3, `ec2` para o Amazon EC2, etc.);
- `region`**:** representa a região geográfica em que o recurso está localizado (por exemplo, `us-east-1` para a região Leste dos EUA, `eu-west-1` para a região da Europa Ocidenta, etc.). Nem todos os ARNs incluem a região;
- `account-id`**:** o ID da conta da AWS que possui o recurso;
- `resource`**:** identifica o recurso específico dentro do serviço.

Os dois pontos são usados para delimitar essas partes e garantir que a interpretação correta seja feita ao analisar o ARN.\
Considerando ainda que quando você cria um ARN, em muitos contextos, alguns campos como `region` e `account-id` podem ser preenchidos automaticamente com base na configuração da sua conta AWS ou contexto em que o ARN está sendo usado.\
Por exemplo, se você estiver criando um ARN para um recurso dentro da mesma conta e região que você está trabalhando, muitas vezes a região e o ID da conta serão automaticamente preenchidos com os valores correspondentes à sua configuração atual.\
No entanto, é sempre bom verificar a documentação específica do serviço da AWS ou da ferramenta que você está usando para garantir que todos os campos estejam corretos, especialmente se você estiver maipulando ARNs em um contexto mais avançado ou específico.

### Políticas Gerenciadas pela AWS x Políticas Personalizadas

Existem dois tipos principais de políticas no serviço IAM da AWS:

1. Políticas gerenciadas pela AWS:
    - Essas políticas são criadas e gerenciadas pela AWS;
    - A AWS fornece um conjunto de políticas predefinidas para serviços específicos;
    - As políticas gerenciadas pela AWS são mantidas e atualizadas pela AWS, e você não tem controle direto sobre sua definição.
2. Políticas personalizadas:
    - Essas políticas são criadas por você, oferecendo controle total sobre sua definição;
    - Você pode criar políticas personalizadas para atender a requisitos específicos da sua aplicação ou organização;
    - Políticas personalizadas podem ser anexadas a usuários, grupos ou funções no IAM.

Portanto, a diferença principal reside na origem e no controle das políticas. As gerenciadas pela AWS são fornecidas pela AWS, enquanto as políticas personalizadas são criadas e gerenciadas por você, oferecendo mais flexibilidade e personalização.

- sequelize.findOne();
- new Date();
- date.getTime();
- instanceof;
- Object Literal Module Pattern;
- Arquivo de indexação;
- SHOW CREATE TABLE;
- operações matemáticas envolvendo undefined;
- Tipos de dados em SQL;
- ERROR 1067 (42000): Invalid default value for coluna (erro SQL);
- Modificando mais de uma coluna de uma só vez;
- Erro: O MySQL considera '0000-00-00' como uma data inválida, pois não corresponde a uma data real no calendário Gregoriano;
- Removendo uma coluna de uma tabela;
- Toda vez que uma coluna é criada em uma tabela existente, o valor default dela é aplicado para todos os registro existentes?
- Porque o Takeshi não conseguiu acessar a minha máquina através do `ngrok http 8080`?
- zoe-game-api, `helpers/debug.js`:

```JavaScript
var util = require('util')

module.exports = function debug() {
	var d = process.env.DEBUG || process.env.TEST || false
	var final, messages, result = []
	if (d) {
		messages = Array.prototype.slice.call(arguments)
		messages.forEach(function (m) {
			if (Array.isArray(m) || typeof m == 'object') {
				result.push(util.inspect(m, {depth: null}).replace(/\s\s/g, ''))
			} else {
				result.push(m)
			}
		})
		console.log(result.join(' ').replace(/\n/g, ''))
	}
}
```

- `settings.accumulated_amount < settings.accumulated_min_amount * 1e6`?