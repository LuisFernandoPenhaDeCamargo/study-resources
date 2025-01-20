# Formatando o role

Vou testar se o pendrive é bootável
Startup Disk Creator (ferramenta para criar um pendrive bootável em uma máquia com Linux)
Acesso ao menu de boot normalmente é feito através do f2, f12 ou esc
sudo apt update && sudo apt upgrade -y
ISO do Ubuntu
International Organization for Standardization (Organização Internacional de Padronização)
Um arquivo ISO é uma imagem de disco, ou seja, uma cópia fiel de um disco óptico (CD/DVD), contendo todos os arquivos e estrutura do sistema

# ---

https://calculator.aws/#/createCalculator/S3
https://aws.amazon.com/pt/s3/pricing/
https://aws.amazon.com/pt/s3/storage-classes/
https://us-east-1.console.aws.amazon.com/s3/buckets/orion-bkps?region=us-east-1&bucketType=general&tab=management

Ao criar um bucket na Amazon S3, existem várias considerações importantes para garantir que ele seja configurado corretamente, seguro e atenda às suas necessidades. Aqui estão os pontos-chave a se atentar:

### 1. **Nome do Bucket**
   - **Globally unique**: O nome do bucket deve ser único globalmente (não pode haver dois buckets com o mesmo nome em toda a AWS).
   - **Regras de nomenclatura**: O nome deve seguir as regras de nomenclatura da AWS:
     - Deve ter entre 3 e 63 caracteres.
     - Deve conter apenas letras minúsculas, números, hífens (-) e não pode começar ou terminar com um hífen.
     - Não pode conter sublinhados (`_`).
   
### 2. **Região (Region)**
   - **Proximidade geográfica**: Escolha a região onde o bucket será criado com base na localização dos seus usuários ou servidores. Isso ajuda a reduzir a latência e melhorar o desempenho.
   - **Custos de transferência de dados**: A transferência de dados entre regiões diferentes pode ser mais cara, por isso é bom escolher uma região próxima ao seu público-alvo ou infraestrutura.

### 3. **Permissões e Acesso**
   - **Controle de Acesso (IAM)**: Ao criar o bucket, defina quem terá acesso a ele. Utilize o AWS IAM (Identity and Access Management) para controlar o acesso aos recursos do S3.
     - **ACLs (Access Control Lists)** podem ser usadas para conceder permissões específicas de leitura e escrita.
     - **Políticas de bucket** podem ser usadas para gerenciar permissões em um nível mais granular.
   - **Bloqueio de acesso público**: É recomendável habilitar a opção de **bloquear todo o acesso público** por padrão, a menos que você tenha um caso específico para permitir o acesso público (ex: site estático). Isso impede que dados sensíveis sejam acidentalmente expostos.

### 4. **Versionamento**
   - **Versionamento**: Ativar o versionamento no seu bucket ajuda a manter várias versões de um mesmo objeto. Isso pode ser útil para recuperação de dados, controle de alterações e proteção contra exclusões acidentais.
   - **Custo de armazenamento adicional**: Lembre-se de que o versionamento pode aumentar os custos de armazenamento, pois as versões anteriores dos objetos continuam sendo armazenadas.

### 5. **Criptografia**
   - **Criptografia em repouso (Server-Side Encryption - SSE)**: Habilite a criptografia para proteger seus dados enquanto estão armazenados no S3. Você pode usar o **SSE-S3** (usando chaves gerenciadas pelo S3), **SSE-KMS** (usando o AWS Key Management Service) ou **SSE-C** (onde você gerencia as chaves de criptografia).
   - **Criptografia em trânsito**: O uso de **HTTPS** (TLS/SSL) é importante para proteger dados durante a transmissão.

### 6. **Política de Vida Útil (Lifecycle Policy)**
   - Defina políticas de ciclo de vida para gerenciar automaticamente o armazenamento de objetos em diferentes classes de armazenamento (como **S3 Standard**, **S3 Glacier**, etc.) e até mesmo excluir objetos após um certo período.
   - As políticas de ciclo de vida podem ajudar a reduzir custos ao mover dados menos acessados para classes de armazenamento mais baratas, como o **Glacier**.

### 7. **Logs de Acesso (Access Logs)**
   - Você pode habilitar os **logs de acesso ao bucket** para registrar todas as solicitações feitas ao bucket. Esses logs podem ser armazenados em outro bucket e usados para auditoria e monitoramento.

### 8. **Classificação de Dados (Storage Classes)**
   - Escolha a **classe de armazenamento** adequada para seus dados. As opções incluem:
     - **S3 Standard**: Para dados de acesso frequente.
     - **S3 Intelligent-Tiering**: Para dados com padrões de acesso desconhecidos.
     - **S3 Glacier**: Para armazenamento de longo prazo de dados frios e de recuperação rara.
     - **S3 Glacier Deep Archive**: Para dados que são acessados muito raramente e precisam de recuperação de longo prazo.

### 9. **Replicação (Cross-Region Replication - CRR ou Same-Region Replication - SRR)**
   - Se você precisar replicar dados entre regiões ou dentro da mesma região, você pode configurar **replicação de objetos**. Isso ajuda a garantir alta disponibilidade e redundância dos dados.
   - **Replicação entre regiões** pode ser útil em caso de desastres ou para melhorar a disponibilidade global dos dados.

### 10. **Notificações e Eventos**
   - Configure **notificações de eventos** para ser alertado quando certas ações ocorrerem no seu bucket (como quando objetos são criados, deletados ou modificados).
   - As notificações podem ser enviadas para o **SNS**, **SQS** ou **Lambda** para automação ou processamento adicional.

### 11. **Análise de Dados (S3 Analytics)**
   - Você pode ativar o **S3 Analytics** para analisar o padrão de acesso aos seus dados e, com base nisso, configurar políticas de ciclo de vida ou mover objetos para diferentes classes de armazenamento de forma mais eficiente.

### 12. **Custos**
   - Fique atento ao **uso de dados** e **transferência de dados**. Verifique regularmente os custos de armazenamento e transferências para garantir que sua solução seja econômica.
   - Utilize as ferramentas da AWS, como o **AWS Cost Explorer**, para monitorar e analisar os custos relacionados ao uso do S3.

### 13. **Compliance e Regulamentações**
   - Se sua empresa está sujeita a regulamentações de conformidade, como o GDPR, HIPAA ou outros, verifique se o S3 oferece as funcionalidades necessárias para atender a esses requisitos, como **controles de acesso**, **logs de auditoria** e **criptografia**.
   
### 14. **Backup e Recuperação**
   - Considere fazer **backup dos seus dados** e definir planos de recuperação de desastres. O S3 é resiliente, mas é sempre importante ter uma estratégia de backup adequada.

Ao configurar um bucket S3, a segurança, o controle de custos e a eficiência do armazenamento devem ser prioridades, além de garantir a fácil recuperação e manutenção dos dados ao longo do tempo.

# ---

3. **Gere uma senha de aplicativo (se não tiver feito ainda):**
   - Acesse [Senhas de aplicativo](https://myaccount.google.com/security) na sua conta Google.

Se precisar de ajuda com algum desses passos, estou aqui! 😊

# ---

Se o objetivo é apenas enviar notificações de falhas de scripts, usar o **Postfix** pode ser uma solução desnecessariamente complexa. Existem alternativas mais simples e diretas para envio de e-mails em casos de falha. Aqui estão algumas opções mais práticas:

---

### **1. Usar o `msmtp` para envio de e-mails simples**
O `msmtp` é uma ferramenta leve que pode ser usada diretamente em scripts para enviar e-mails via SMTP. Ele é fácil de configurar e perfeito para notificações.

#### **Configuração**
1. Instale o `msmtp`:
   ```bash
   sudo apt install msmtp
   ```

2. Crie um arquivo de configuração para o `msmtp`:
   ```bash
   sudo nano /etc/msmtprc
   ```

   Adicione o seguinte conteúdo:
   ```plaintext
   account default
   host smtp.gmail.com
   port 587
   auth on
   tls on
   tls_trust_file /etc/ssl/certs/ca-certificates.crt
   user seu-email@gmail.com
   password senha-de-aplicativo
   from seu-email@gmail.com
   logfile /var/log/msmtp.log
   ```

3. Ajuste as permissões do arquivo:
   ```bash
   sudo chmod 600 /etc/msmtprc
   ```

4. Envie um e-mail de teste:
   ```bash
   echo "Teste de notificação" | msmtp -s "Notificação de Falha" destinatario@gmail.com
   ```

---

### **2. Usar o `sendmail` diretamente**
O comando `sendmail` é simples e geralmente já está instalado em sistemas Linux. Configure-o para usar o Gmail como relay ou use o servidor local para envio.

#### **Exemplo de uso no script:**
```bash
#!/bin/bash

# Defina o destinatário
TO="destinatario@gmail.com"

# Defina a mensagem
MESSAGE="Subject: Falha no Script\n\nO script apresentou uma falha em $(date)."

# Envie o e-mail
echo -e "$MESSAGE" | sendmail $TO
```

Se você quiser usar o Gmail como relay, o `sendmail` precisará de configurações semelhantes ao `Postfix`.

---

### **3. Usar Python com `smtplib`**
Se você já está usando Python no seu sistema, enviar e-mails via script é uma ótima opção.

#### **Exemplo de script Python:**
```python
import smtplib
from email.mime.text import MIMEText

# Configurações do servidor SMTP
smtp_server = "smtp.gmail.com"
smtp_port = 587
email = "seu-email@gmail.com"
senha_app = "senha-de-aplicativo"

# Mensagem do e-mail
destinatario = "destinatario@gmail.com"
mensagem = MIMEText("O script apresentou uma falha.")
mensagem["Subject"] = "Notificação de Falha"
mensagem["From"] = email
mensagem["To"] = destinatario

# Enviar o e-mail
try:
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(email, senha_app)
        server.sendmail(email, destinatario, mensagem.as_string())
    print("E-mail enviado com sucesso!")
except Exception as e:
    print(f"Erro ao enviar o e-mail: {e}")
```

---

### **4. Usar ferramentas externas como `mailgun` ou `sendgrid`**
Essas ferramentas permitem o envio de e-mails via API, eliminando a necessidade de configurar servidores SMTP.

#### **Vantagens:**
- Simples de integrar via chamadas HTTP.
- Excelente suporte a notificações.
- Não requer manipulação direta de credenciais SMTP no servidor.

#### **Exemplo com `curl` e API de um serviço externo**:
```bash
curl -s --user 'api:YOUR_API_KEY' \
    https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages \
    -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
    -F to=destinatario@gmail.com \
    -F subject='Notificação de Falha' \
    -F text='O script apresentou uma falha.'
```

---

### **Recomendação Final**
Para simplicidade, **use `msmtp` ou Python com `smtplib`**. Ambos são fáceis de configurar e oferecem mais controle e segurança sem a complexidade do Postfix. Se sua equipe precisa de uma solução escalável, ferramentas externas como `Mailgun` ou `SendGrid` são ideais.

- sudo apt install msmtp
- vim /etc/msmtprc

```plaintext
account default
host smtp.gmail.com
port 587
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
user seu-email@gmail.com
password fqmtblimzsfxxtbr
from seu-email@gmail.com
logfile /var/log/msmtp.log
```

echo -e "Subject: Teste de Envio\n\nIsso é um teste do msmtp." | msmtp -v japa2604@gmail.com

# echo -e "Subject: Teste de Envio\n\nIsso é um teste do msmtp." | msmtp -v destinatario@gmail.com
carregado o arquivo de configuração do sistema /etc/msmtprc
ignorando o arquivo de configuração do usuário /root/.msmtprc: Arquivo ou diretório inexistente
retrocedendo para conta padrão
usando a conta default de /etc/msmtprc
host = smtp.gmail.com
port = 587
source ip = (não definido)
proxy host = (não definido)
proxy port = 0
socket = (não definido)
timeout = desligado
protocol = smtp
domain = localhost
auth = escolha
user = japa2604@gmail.com
password = *
passwordeval = (não definido)
ntlmdomain = (não definido)
tls = ligado
tls_starttls = ligado
tls_trust_file = /etc/ssl/certs/ca-certificates.crt
tls_crl_file = (não definido)
tls_fingerprint = (não definido)
tls_key_file = (não definido)
tls_cert_file = (não definido)
tls_certcheck = ligado
tls_min_dh_prime_bits = (não definido)
tls_priorities = (não definido)
tls_host_override = (não definido)
auto_from = desligado
maildomain = (não definido)
from = japa2604@gmail.com
set_from_header = auto
set_date_header = auto
remove_bcc_headers = ligado
undisclosed_recipients = desligado
dsn_notify = (não definido)
dsn_return = (não definido)
logfile = /var/log/msmtp.log
logfile_time_format = (não definido)
syslog = (não definido)
aliases = (não definido)
lendo destinatários da linha de comando
<-- 220 smtp.gmail.com ESMTP d2e1a72fcca58-72d40548a06sm7355966b3a.34 - gsmtp
--> EHLO localhost
<-- 250-smtp.gmail.com at your service, [187.62.8.196]
<-- 250-SIZE 35882577
<-- 250-8BITMIME
<-- 250-STARTTLS
<-- 250-ENHANCEDSTATUSCODES
<-- 250-PIPELINING
<-- 250-CHUNKING
<-- 250 SMTPUTF8
--> STARTTLS
<-- 220 2.0.0 Ready to start TLS
Parâmetros da sessão TLS:
    (TLS1.3)-(ECDHE-X25519)-(ECDSA-SECP256R1-SHA256)-(AES-256-GCM)
Informações do certificado TLS:
    Assunto:
        CN=smtp.gmail.com
    Emissor:
        C=US,O=Google Trust Services,CN=WR2
    Validade:
        Data de ativação: seg 09 dez 2024 05:37:17
        Data de expiração: seg 03 mar 2025 05:37:16
    Impressões digitais:
        SHA256: DC:62:BC:F5:19:04:D7:0F:B9:B3:E9:C4:95:E9:85:5D:68:78:B3:A7:E7:39:06:F3:68:C0:14:0B:FA:EC:A7:E7
        SHA1 (deprecated): FF:DF:02:0C:0D:43:40:EF:B8:F7:E6:CC:0E:27:74:CB:71:DF:4D:01
--> EHLO localhost
<-- 250-smtp.gmail.com at your service, [187.62.8.196]
<-- 250-SIZE 35882577
<-- 250-8BITMIME
<-- 250-AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH
<-- 250-ENHANCEDSTATUSCODES
<-- 250-PIPELINING
<-- 250-CHUNKING
<-- 250 SMTPUTF8
--> AUTH PLAIN AGphcGEyNjA0QGdtYWlsLmNvbQAyNjA0OTBBYiE=
<-- 535-5.7.8 Username and Password not accepted. For more information, go to
<-- 535 5.7.8  https://support.google.com/mail/?p=BadCredentials d2e1a72fcca58-72d40548a06sm7355966b3a.34 - gsmtp
msmtp: a autenticação falhou (método PLAIN)
msmtp: mensagem do servidor: 535-5.7.8 Username and Password not accepted. For more information, go to
msmtp: mensagem do servidor: 535 5.7.8  https://support.google.com/mail/?p=BadCredentials d2e1a72fcca58-72d40548a06sm7355966b3a.34 - gsmtp
msmtp: não foi possível enviar a mensagem (conta default de /etc/msmtprc)

Meu celular +55 (43) 9 8841-1258 é o responsável pela verificação em duas etapas. Muito cuidado antes de mudar de número.
fernando.penha@ - 260490Ab!

https://myaccount.google.com/security
- Conta Google - Segurança
- Ativar a "Verificação de duas etapas"
- Pesquisar por "senhas de app"
- Gerar uma para o aplicavito `msmtp`
zaqo uvet wrco qirs

/etc/msmtprc
apt remove --purge -y msmtp && apt autoremove --purge -y
    (o executável e o arquivo de configuração foram removidos)
 && sudo apt remove --purge -y postfix && sudo apt clean && sudo apt autoclean

echo "postfix postfix/mailname string $(hostname | sed -E 's/-.*//')" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

# TODO (LF):
# - Quando testarmos o script em mais servidores RC, ajustaremos o log para torná-lo mais enxuto
# - Conforme validarmos a necessidade de tabelas e colunas, atualizaremos o conteúdo a ser utilizado na criação do dump. O objetivo do dump é ser utilizado na regravação
# dos servidores <F estátistica
# - Criar uma aplicação que forneça os dados sensíveis para o script, para que eles não fiquem visíveis
# - Criar um script de configuração central, agrupando todas as instalações e configurações necessárias para o servidor

#documentar sistema de notificações <F
#documentar formato do log <F

Hit:1 http://br.archive.ubuntu.com/ubuntu bionic InRelease                                                                                                                                                                                      
Hit:2 http://br.archive.ubuntu.com/ubuntu bionic-updates InRelease                                                                                                                                                                              
Hit:4 http://br.archive.ubuntu.com/ubuntu bionic-backports InRelease                                                                                                                                                                            
Hit:5 https://deb.nodesource.com/node_8.x bionic InRelease                                                                                                                                                                                      
Ign:3 https://mirror.ufscar.br//mariadb/repo/10.2/ubuntu xenial InRelease                                                                                                                                                                       
Err:6 https://mirror.ufscar.br//mariadb/repo/10.2/ubuntu xenial Release                                                                                                                                                                         
  404  Not Found [IP: 200.133.224.1 443]                                                                                                                                                                                                        
Hit:7 http://security.ubuntu.com/ubuntu bionic-security InRelease                                                                                                                                                                               
Reading package lists... Done                                                                                                                                                                                                                   
E: The repository 'http://mirror.ufscar.br/mariadb/repo/10.2/ubuntu xenial Release' no longer has a Release file.                                                                                                                               
N: Updating from such a repository can't be done securely, and is therefore disabled by default.                                                                                                                                                
N: See apt-secure(8) manpage for repository creation and user configuration details.

The following packages have unmet dependencies:                                                                                                                                                                                                 
 friendly-recovery : Breaks: grub2 (< 1.99-12ubuntu4)                                                                                                                                                                                           
 msmtp : Depends: libgsasl7 (>= 1.1) but it is not going to be installed                                                                                                                                                                        
E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or specify a solution).

apt --fix-broken install

[3859][ERROR] upload failed: ../../../home/zoe/dumps/3859_2025-01-16_dump.sql.gz to s3://orion-island-dumps/3859_2025-01-16_dump.sql.gz An error occurred (AccessDenied) when calling the CreateMultipartUpload operation: User: arn:aws:iam::017881044583:user/place-3859 is not authorized to perform: s3:PutObject on resource: "arn:aws:s3:::orion-island-dumps/3859_2025-01-16_dump.sql.gz" because no identity-based policy allows the s3:PutObject action.

MEGAFLAG

tá faltando gerar vários arquivos pra depois juntar eles
se pá o mega juntado vai pra glacier? De quanto em quanto tempo eu mando tudo embora? Dá pra mandar pra DO eventulamente?
se pá o data-server que permite a criação de políticas para os servidores, pega as credenciais dele e cria uma pra poder utilizar nesse bucket (a minha conta não tem essa perm no IAM)

zoe-updater: self_updater package.json api logos services agent database
zoe-game-api: machines server raffle_prizes routes/index sensitive_data_getters
orion-data-api: .eslintrc settings.json launch migrate fix_transpiled_files client lanhouse_log models/index
orion-terminal: package client ecosystem.config
orion-data-server: server routes/index fake_middleware black_box stand PoolStand
updater: anotacoes game lib

3859 - do papai

3365 - ok
2634 5277122 73656
2639 15238758 832034
3799 1000719 65151
