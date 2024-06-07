# AWS

AWS (Amazon Web Services) é uma plataforma de serviços de computação em nuvem oferecida pela Amazon. Ela fornece uma ampla gama de serviços de computação, armazenamento, banco de dados, análise, aprendizado de máquina, Internet das Coisas (IoT), segurança, entre outros. Esses serviços permitem que empresas e desenvolvedores criem, implantem e gerenciem aplicativos e infraestruturas de maneira escalável e econômica.

**Principais Serviços da AWS**

1. **Computação:**
    - **Amazon EC2 (Elastic Compute Cloud):** instâncias de máquinas virtuais para executar aplicações
    - **AWS Lambda:** execução de código em resposta a eventos sem a necessidade de gerenciar servidores
2. **Armazenamento:**
    - **Amazon S3 (Simple Storage Service):** armazenamento de objetos com alta durabilidade e escabilidade
    - **Amazon EBS (Elastic Block Store):** armazenamento em bloco para uso com instâncias do EC2
3. **Banco de Dados:**
    - **Amazon RDS (Relational Database Service):** banco de dados gerenciado para MySQL, PostgreSQL, Oracle, SQL Server, entre outros
    - **Amazon DynamoDB:** banco de dados NoSQL rápido e flexível
4. **Rede e entrega de conteúdo:**
    - **Amazon VPC (Virtual Private Cloud):** rede isolada logicamente para provisionamento de recursos AWS
    - **Amazon CloudFront:** rede de entrega de conteúdo (CDN) para distribuição rápida de conteúdo
5. **Ferramentas de desenvolvimento:**
    - **AWS CodePipeline:** serviço de entrega contínua para automação de pipelines de lançamento
    - **AWS CodeBuild:** serviço de integração contínua para compilar código, executar testes e produzir pacotes de software prontos para implantação
6. **Segurança, identidade e conformidade:**
    - **AWS IAM (Identity and Access Management):** gerenciamento de usuários e permissões
    - **AWS KMS (Key Management Service):** criação e controle de chaves de criptografia
7. **Análise:**
    - **Amazon Redshift:** data warehouse rápido e escalável
    - **Amazon EMR (Elastic MapReduce):** processamento de grandes volumes de dados usando Hadoop, Spark, etc.
8. **Aprendizado de máquina:**
    - **Amazon SageMaker:** plataforma para construção, treinamento e implantação de modelos de machine learning
9. **Internet das Coisas (IoT):**
    - **AWS IoT Core:** conexão de dispositivos IoT à nuvem

**Vantagens da AWS**

- **Escalabilidade:** escala automaticamente de acordo com a demanda
- **Confiabilidade:** alta disponibilidade e recuperação de desastres
- **Segurança:** recursos robustos de segurança e conformidade
- **Economia:** pague apenas pelo que usar, com modelos de preços flexíveis
- **Variedade de serviços:** amplo conjunto de serviços para atender diversas necessidades de negócios e desenvolvedores

**Casos de Uso Comuns**

- Hospedagem de sites e aplicativos web
- Armazenamento e backup de dados
- Processamento e análise de grandes volumes de dados
- Desenvolvimento e testes de software
- Implementação de aplicativos de Internet das Coisas
- Treinamento e implantação de modelos de aprendizado de máquina

### Sumário

- [Amazon EC2](#amazon-ec2)
    + [Substituindo o Código em Execução no EC2](#amazon-ec2-substituindo-codigo-execucao-ec2)
- [Amazon S3](#amazon-s3)
- [AWS Secrets Manager](#aws-secrets-manager)

# <a id="amazon-ec2"></a>Amazon EC2

O Amazon EC2 (Elastic Compute Cloud) é um serviço da Amazon Web Services (AWS) que oferece capacidade de computação escalável na nuvem. Ele permite que os usuários criem e gerenciem instâncias de máquinas virtuais (VMs) na infraestrutura da AWS. O serviço é projetado para facilitar a escalabilidade e a flexibilidade, permitindo que os usuários ajustem os recursos computacionais conforme a demanda.

**Principais Características**

1. **Instâncias de máquina virtual:** os usuários podem lançar diferentes tipos de instâncias (tipos de VMs) que variam em termos de CPU, memória, armazenamento e capacidade de rede, adequadas para diferentes tipos de cargas de trabalho
2. **Elasticidade:** permite aumentar ou diminuir a capacidade de computação de acordo com a necessidade, pagando apenas pelos recursos utilizados
3. **Modelos de preço:**
    - **Sob demanda:** permite aumentar ou diminuir a capacidade de computação de acordo com a necessidade, pagando apenas pelos recursos utilizados
    - **Instâncias reservadas:** preços mais baixos em troca de um compromisso de uso por um ou três anos
    - **Instâncias spot:** compra de capacidade não utilizada a preços reduzidos, podendo ser interrompida pela AWS quando necessário
4. **Segurança:** oferece várias camadas de segurança, incluindo controle de acesso baseado em identidade (IAM), VPC (Virtual Private Cloud) para isolamento de rede e grupos de segurança para controle de tráfego
5. **Auto scaling:** ajusta automaticamente a quantidade de instâncias em reposta à demanda atual para manter a performance e controlar custos
6. **EBS (Elastic Block Store):** fornece armazenamento em bloco persistente para instâncias EC2, permitindo armazenamento de dados durável e escalável
7. **Modelos de instâncias:** diversos tipos de instâncias otimizadas para diferentes tipos de cargas de trabalho, como gerais, computação intensiva, memória intensiva, armazenamento otimizado, entre outros

**Usos Comuns**

- Hospedagem de aplicativos web e servidores
- Processamento de dados em grandes escala
- Execução de aplicações corporativas e bancárias
- Desenvolvimento e teste de software
- Análise de dados e machine learning
- Jogos online e plataformas de mídia

**Benefícios**

- **Flexibilidade:** variedade de tipos de instâncias e modelos de preço para diferentes necessidades
- **Escalabilidade:** facilidade para aumentar ou reduzir recursos conforme a demanda
- **Custo-beneficio:** pagamento baseado no uso real, com opções de preços reduzidos para compromissos de longo prazo
- **Integrado:** integração com outros serviços da AWS, como S3 (armazenamento), RDS (banco de dados) e Lambda (computação serverless)

O Amazon EC2 é um componente essencial da AWS, permitindo que empresas de todos os tamanhos implantem e gerenciem aplicações de forma eficiente e econômica na nuvem.

## <a id="amazon-ec2-substituindo-codigo-execucao-ec2"></a>Substituindo o Código em Execução no EC2

Substituir o código em execução em uma instância EC2 pode ser feito de várias maneiras, dependendo da configuração e do ambiente da sua aplicação. Aqui estão alguns métodos comuns:

1. **Atualização manual**
    1. **Conecte-se à instância EC2:** use SSH para se conectar à sua instância EC2, `ssh -i "sua-chave.pem" ec2-user@seu-endereco-ec2`
    2. **Faça backup do código atual:**  opcionalmente, faça um backup do código existente, `cp -r /caminho/para/seu/codigo /caminho/para/seu/backup`
    3. **Transfira o novo código** use `scp` ou `rsync` para copiar os arquivos do seu computador local para a instância EC2, `scp -i "sua-chave.pem" -r /caminho/para/novo/codigo ec2-user@seu-endereco-ec2:/caminho/para/seu/codigo`
    4. **Reinicie o serviço** se a aplicação estiver sendo executada como um serviço, reinicie-o, `sudo systemctl restart nome-do-servico`
2. **Uso de scripts de implantação**

- **Automatize com scripts:** crie scripts de shell para automatizar a substituição do código e reinicialização do serviço

```bash
#!/bin/bash
$ cd /caminho/para/seu/codigo
$ git pull origin main
$ sudo systemctl restart nome-do-seu-servico
```

- **Execute o script remotamente:** use `ssh` para executar o script na instância da EC2, `ssh -i "sua-chave.pem" ec2-user@seu-endereco-ec2 'bash -s' > seu-script.sh`

3. **Uso de ferramentas de implantação**

- **Utilize ferramentas como Ansible, Chef ou Puppet:** configure um playbook (Ansible) ou receita (Chef) para atualizar o código e gerenciar a aplicação
- **Exemplo de Ansible Playbook:**

```yaml
- hosts: seu-grupo-de-hosts
  tasks:
    - name: Atualizar o repositório de código
      git:
        repo: 'seu-repo-git'
        dest: '/caminho/para/seu/codigo'
        version: 'main'
    - name: Reiniciar o serviço
      service:
        name: 'nome-do-seu-servico'
        state: restarted
```

- **Execute o playbook:** `ansible-playbook -i inventario seu-playbook.yml`

4. **Uso de pipelines de CI/CD**

- **Configure um Pipeline de CI/CD (Continuous Integration/ Continuous Deployment):** use serviços como AWS CodePipeline, Jenkins, GitHub Actions, ou GitLab CI/CD
- **Exemplo com AWS CodePipeline:**

+ **Crie um repositório de código:** use AWS CodeCommit, GitHub, ou Bitbucket para armazenar seu código
+ **Configure CodeBuild:**
    - Crie um projeto CodeBuild que compilará e testará seu código
    - Defina um arquivo **buildspec.yml** para especificar as etapas de construção e implantação

```yaml
version: 0.2

phases:
    install:
        runtime-versions:
            nodejs: 14
    build:
        commands:
            - echo Build started on `date`
            - echo Compiling the Node.js code
            - npm install
            - npm run build
artifacts:
    files:
        - '**/*'
```

+ **Crie uma fase de implantação no CodePipeline:** adicione uma etapa de implantação que use AWS CodeDeploy ou scripts personalizados para substituir o código em execução na instância EC2
+ **Exemplo com AWS Code:**
    - Configure um aplicativo CodeDeploy e um grupo de implantação
    - Crie um arquivo **appspec.yml** no seu repositório de código para definir como o CodeDeploy deve implantar o aplicativo

```yaml
version: 0.0
os: Linux
files:
    - source: /
      destination: /caminho/para/seu/codigo
hooks:
    AfterInstall:
        - location: scripts/restart-server.sh
          timeout: 300
          runas: ec2-user
```

+ **Configure a Pipeline no CodePipeline:** adicione a origem (repositório de código), a fase de compilação (CodeBuild) e a fase de implantação (CodeDeploy)

5. **Uso de Docker e Amazon ECS/EKS**
    - **Containerize sua aplicação:** crie um **Dockerfile** para sua aplicação

```dockerfile
FROM node:14
WORKDIR /usr/scr/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "node", "app.js" ]
```

- **Crie uma imagem Docker e envie para o Amazon ECR:**

```bash
$ docker build -t seu-repo-ecr .
$ docker tag seu-repo-ecr:latest seu-id-de-conta.dkr.ecr.regiao.amazonaws.com/seu-repo-ecr:latest
$ $(aws ecr get-login-password --region regiao) | docker login --username AWS --password-stdin seu-id-de-conta.dkr.ecr.regiao.amazonaws.com
$ docker push seu-id-de-conta.drk.ecr.regiao.amazonaws.com/seu-repo-ecr:latest
```

- **Use Amazon ECS ou EKS para gerenciar Contêineres**
    +  Crie uma tarefa ECS ou um pod EKS que use a imagem Docker do ECR
    +  Configure um serviço ECS ou um deployment EKS para gerenciar a escalabilidade e disponibilidade do aplicativo

**Considerações Finais**

- **Automatização:** automação é crucial para garantir implantações consistentes e reduzir a chance de erros humanos
- **Testes:** sempre teste novas versões de código em um ambiente de staging antes de implantar em produção
- **Monitoramento:** implemente monitoramento e logging para detectar problemas rapidamente após a implantação

Escolha o método que melhor se adapta à sua infraestrutura e necessidades operacionais. A automação através de pipelines CI/CD e o uso de containers são geralmente as melhores práticas para ambientes de produção.

# <a id="amazon-s3"></a>Amazon S3

O Amazon S3 (Simple Storage Service) é um serviço de armazenamento de objetos oferecido pela AWS. Ele fornece uma interface web simples que pode ser usada para armazenar e recuperar qualquer quantidade de dados a qualquer momento, de qualquer lugar na web. O S3 foi projetado para ser altamente escalável, durável e seguro, o que tonar uma escolha popular para uma ampla varidade de casos de uso, incluindo backup e recuperação, arquivamento, big data, computação em nuvem, e muito mais.

**Principais Características**

1. **Armazenamento de objetos:** o S3 armazena dados como objetos dentro de buckets. Um objeto consiste em dados, metadados e uma chave única
2. **Buckets:** buckets são contêineres para objetos armazenados no S3. Cada objeto é identificado de forma exclusiva por uma chave dentro de um bucket
3. **Escalabilidade e disponibilidade:** o S3 é projetado para fornecer 99.999999999 (11 9's) de durabilidade e 99.99% de disponibilidade dos objetos durante um determinado ano
4. **Segurança:**
    - Suporte para controle de acesso detalhado usando AWS IAM, listas de controle de acesso (ACLs), e políticas de bucket
    - Suporte para criptografia de dados em repouso e trânsito
5. **Gestão de ciclo de vida:** políticas para automatizar a migração de dados para classes de armazenamento de custo mais baixo à medida que envelhecem
6. **Versão de objetos:** suporte para versionamento de objetos, permitindo manter múltiplas variantes de um objeto no mesmo bucket
7. **Replicação entre regiões:** suporte para replicação de objetos entre buckets em diferentes regiões da AWS para aumentar a durabilidade e a disponibilidade
8. **Classes de armazenamento:** várias classes de armazenamento para diferentes casos de uso e necessidades de custo:
    - **S3 Standard:** para dados acessados com mais frequência
    - **S3 Intelligent-Tiering:** move dados automaticamente entre duas camadas de acesso (frequente e infrequente)
    - **S3 Standard-IA (Infrequent Access):** para dados acessados menos frequentemente, mas que precisam estar disponíveis frequentemente
    - **S3 One Zone-IA:** similar ao Standard-IA, mas armazenado em uma única zona de disponibilidade
    - **S3 Glacier e S3 Glacier Deep Archive:** para arquivamento de longo prazo com tempos de recuperação variáveis
9. **:**

**Exemplos de Casos de Uso**

1. **Backup e recuperação:** armazenar backups de dados de forma segura e durável
2. **Armazenamento e distribuição de conteúdo:** hospedar arquivos de mídia, como vídeos, imagens e documentos, com distribuição global através do Amazon CloudFront
3. **Big Data e análise:** armazenar grandes volumes de dados para análise e processamento com serviços como Amazon EMR, AWS Glue, e Amazon RedShift
4. **Arquivamento de dados:** arquivar dados antigos ou menos acessados usando S3 Glacier e S3 Glacier Deep Archive para redução de custos
5. **Hospedagem de sites estáticos:** hospedar sites estáticos diretamente em buckets S3

# <a id="aws-secrets-manager"></a>AWS Secrets Manager

É um serviço que ajuda a proteger o acesso às suas aplicações, serviços e recursos de TI. Ele permite que você armazene, recupere e gerencie informações sensíveis, como senhas, chaves de API e credenciais de banco de dados de forma segura. Com o Secrets Manager, você pode centralizar e gerenciar seus segredos de forma consistente em diferentes serviços da AWS e em ambientes locais.

Aqui estão algumas características e funcionalidades chave do AWS Secrets Manager:

1. **Armazenamento de segredos:** o Secrets Manager fornece uma infraestrutura segura e escalável para armazenar seus segredos, incluindo criptografia em repouso e em trânsito
2. **Rotação:** ele oferece suporte integrado para a rotação automática de credenciais para serviços suportados, como Amazon RDS, Amazon Redshift e mais. Isso ajuda a melhorar a segurança atualizando regularmente as credenciais sem intervenção manual
3. **Integração:** você pode integrar o Secrets Manager com serviços da AWS, aplicativos e ferramentas de terceiros facilmente usando o Console de Gerenciamento da AWS, SDKs da AWS ou Interface de Linha de Comando (CLI)
4. **Controle de acesso:** o Secrets Manager permite que você gerencie o acesso aos seus segredos usando políticas do AWS Identity and Access Management (IAM), permitindo que você conceda acesso mínimo necessário a usuários e aplicativos
5. **Auditoria e monitoramento:** você pode monitorar e auditar o uso de segredos, permitindo que você armazene várias versões de um segredo e recupere versões específicas conforme necessário
6. **Versionamento:** o Secrets Manager suporta o versionamento de segredos, permitindo que você armazene várias versões de um segredo e recupere versões específicas conforme necessário

No geral, o AWS Secrets Manager simplifica o gerenciamento de informações sensíveis e ajuda a melhorar a segurança, reduzindo o risco de acesso não autorizado ou exposição.