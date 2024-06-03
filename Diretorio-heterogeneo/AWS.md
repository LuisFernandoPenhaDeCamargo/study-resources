# AWS

### Sumário

- [Amazon EC2](#amazon-ec2)
    + [Substituindo o Código em Execução no EC2](#amazon-ec2-substituindo-codigo-execucao-ec2)
- [AWS Secrets Manager](#aws-secrets-manager)

# <a id=""></a>Amazon EC2

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
cd /caminho/para/seu/codigo
git pull origin main
sudo systemctl restart nome-do-seu-servico
```

- **Execute o script remotamente:** use `ssh` para executar o script na instância da EC2, `ssh -i "sua-chave.pem" ec2-user@seu-endereco-ec2 'bash -s' > seu-script.sh`

3. **Uso de ferramentas de implantação**
    . ****
    . ****
    . ****
4. **Uso de pipelines de CI/CD**
    . ****
    . ****
    . ****
    . ****
    . ****
5. **Uso de Docker e Amazon ECS/EKS**
    . ****
    . ****
    . ****

**Considerações Finais**

- **Automatização:** automação é crucial para garantir implantações consistentes e reduzir a chance de erros humanos
- **Testes:** sempre teste novas versões de código em um ambiente de staging antes de implantar em produção
- **Monitoramento:** implemente monitoramento e logging para detectar problemas rapidamente após a implantação

Escolha o método que melhor se adapta à sua infraestrutura e necessidades operacionais. A automação através de pipelines CI/CD e o uso de containers são geralmente as melhores práticas para ambientes de produção.

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