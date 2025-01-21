3859

```Bash
# Verificação de sucesso ou falha baseado na saída do comando.
# Especificar a imagem 24.04 (pessoal)
# Especificar a imagem 18.04 (servidores)
```

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

**Versão do modelo:** ChatGPT Jan 2025  

As ferramentas **`apt`**, **`dpkg`** e **`snap`** são utilizadas para instalar, gerenciar e remover pacotes no Ubuntu, mas possuem funções e características diferentes.  

---

### 🛠️ **1. `apt` (Advanced Package Tool)**  
O **`apt`** é um **gerenciador de pacotes avançado** que facilita a instalação e manutenção de software a partir dos repositórios oficiais ou personalizados do sistema.

- **Características principais:**
  - Trabalha como uma interface para o **`dpkg`**, adicionando funcionalidades como resolução automática de dependências.
  - Permite buscar, instalar, atualizar e remover pacotes diretamente dos repositórios configurados.
  - Suporta repositórios PPA (Personal Package Archives).

- **Comandos comuns:**
  - Atualizar lista de pacotes:  
    ```bash
    sudo apt update
    ```
  - Instalar um pacote:  
    ```bash
    sudo apt install <pacote>
    ```
  - Atualizar pacotes instalados:  
    ```bash
    sudo apt upgrade
    ```
  - Remover um pacote:  
    ```bash
    sudo apt remove <pacote>
    ```

- **Exemplo de uso:**  
  ```bash
  sudo apt install vim
  ```

---

### 🧩 **2. `dpkg` (Debian Package Manager)**  
O **`dpkg`** é o **gerenciador de pacotes de baixo nível** do sistema, responsável por manipular diretamente pacotes `.deb` no Ubuntu e Debian.

- **Características principais:**
  - Não gerencia dependências automaticamente (diferente do `apt`).
  - É usado principalmente para instalar pacotes locais `.deb`.
  - É útil para administração manual e resolução de problemas em pacotes.

- **Comandos comuns:**
  - Instalar um pacote `.deb`:  
    ```bash
    sudo dpkg -i <arquivo.deb>
    ```
  - Remover um pacote:  
    ```bash
    sudo dpkg -r <pacote>
    ```
  - Listar pacotes instalados:  
    ```bash
    dpkg -l
    ```

- **Exemplo de uso:**  
  ```bash
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  ```

---

### 📦 **3. `snap` (Snapcraft)**  
O **`snap`** é um **sistema de pacotes universal**, criado pela Canonical, que funciona de forma independente dos repositórios tradicionais do sistema.

- **Características principais:**
  - Pacotes **autossuficientes**, contendo todas as dependências necessárias.
  - Funciona em diferentes distribuições Linux (Ubuntu, Fedora, Arch, etc.).
  - Suporte a versões paralelas (você pode instalar várias versões de um mesmo pacote).
  - Segurança aprimorada por rodar os aplicativos em **sandbox**.

- **Comandos comuns:**
  - Instalar um pacote snap:  
    ```bash
    sudo snap install <pacote>
    ```
  - Atualizar pacotes snap:  
    ```bash
    sudo snap refresh
    ```
  - Listar pacotes instalados:  
    ```bash
    snap list
    ```
  - Remover um pacote snap:  
    ```bash
    sudo snap remove <pacote>
    ```

- **Exemplo de uso:**  
  ```bash
  sudo snap install vlc
  ```

---

### ⚡ **Diferenças principais**  

| Aspecto               | `apt`                      | `dpkg`                 | `snap`                       |
|-----------------------|----------------------------|------------------------|-----------------------------|
| **Gerenciamento**     | Gerencia dependências      | Manual, sem dependências | Inclui dependências no pacote |
| **Repositórios**      | Usa repositórios APT       | Não usa repositórios   | Usa o Snap Store             |
| **Sistema de pacotes**| `.deb`                    | `.deb`                 | Pacotes **snap**             |
| **Uso principal**     | Instalar pacotes com repositórios | Manipular pacotes locais | Pacotes universais e isolados |

---

### ✅ **Quando usar cada um?**
- **`apt`**: Para instalar e atualizar software diretamente dos repositórios oficiais.  
- **`dpkg`**: Para instalar ou manipular pacotes `.deb` locais, especialmente em casos específicos.  
- **`snap`**: Para aplicativos universais que não dependem do sistema operacional ou repositórios locais.  

Se precisar de mais detalhes, é só avisar! 😊

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

Configurar múltiplos sistemas operacionais no Acer Nitro 5 com **Windows 10**, **Ubuntu 24.04**, e **Arch Linux** é possível e prático, especialmente utilizando um gerenciador de boot como o **GRUB**. Aqui está um guia para ajudar:

---

### ⚠️ **Considerações Antes de Começar**:
1. **Backup**: Faça backup dos seus dados antes de qualquer alteração nas partições do disco.
2. **Tabela de Partição GPT**: Certifique-se de que o disco utiliza GPT e o modo de inicialização UEFI está habilitado. O Acer Nitro 5 normalmente é configurado para UEFI.
3. **Ordem de Instalação Recomendada**:
   - Instale o **Windows 10** primeiro (se ainda não estiver instalado).
   - Em seguida, instale o **Ubuntu** e configure o GRUB.
   - Por último, instale o **Arch Linux** e configure-o no GRUB já existente.

---

### 🛠️ **Passo a Passo para Configurar Múltiplos Boots**:

#### 1. **Instalar o Windows 10**
   - Use um pendrive bootável com a ISO do Windows 10.
   - Durante a instalação, crie uma partição para o Windows (exemplo: 100 GB para o sistema e mais para dados, conforme necessário).
   - O instalador do Windows automaticamente criará partições para o boot e o sistema.

#### 2. **Instalar o Ubuntu 24.04**
   - Crie um pendrive bootável com o Ubuntu (já feito com o **Startup Disk Creator** ou outro método).
   - No instalador do Ubuntu:
     - Escolha a opção "Instalar ao lado do Windows 10" (se o Windows já está instalado).
     - Configure as partições manualmente se preferir:
       - **/boot/efi**: 500 MB (pode usar a partição EFI criada pelo Windows).
       - **/ (root)**: Pelo menos 20 GB.
       - **/home**: Partição separada para seus arquivos pessoais (opcional, mas recomendado).
       - **Swap**: Opcional, mas útil se você não tiver muita RAM.
   - O Ubuntu configurará automaticamente o GRUB e detectará o Windows.

#### 3. **Instalar o Arch Linux**
   - Crie um pendrive bootável com o Arch Linux.
   - Siga as instruções de instalação do Arch (é necessário mais conhecimento técnico). Durante o particionamento:
     - Use a mesma partição **/boot/efi** (não formate).
     - Crie uma partição **/ (root)** para o Arch (mínimo de 20 GB).
     - Crie outras partições, como **/home**, se necessário.
   - Instale o **GRUB** no Arch Linux, mas não substitua a configuração existente do GRUB no Ubuntu. Em vez disso, edite o GRUB do Ubuntu para incluir o Arch Linux (ou atualize o GRUB no Ubuntu).

---

### 🛠️ **Configuração do GRUB**:
Após instalar os três sistemas, atualize o GRUB no Ubuntu para reconhecer todos os sistemas operacionais:

1. **Inicie no Ubuntu**.
2. Abra um terminal e atualize o GRUB:
   ```bash
   sudo update-grub
   ```
3. O GRUB deve detectar o Windows e o Arch Linux automaticamente. Se não detectar, adicione manualmente entradas no arquivo `/etc/grub.d/40_custom`.

---

### 🎯 **Dicas Importantes**:
- **UEFI vs Legacy**: Certifique-se de que todos os sistemas estão instalados em modo **UEFI** para evitar problemas de boot.
- **Particionamento**:
  - Reserve espaço suficiente para cada sistema operacional.
  - Utilize ferramentas como o **GParted** no Ubuntu para gerenciar partições.
- **Manutenção do GRUB**:
  - Sempre atualize o GRUB após instalar ou remover sistemas operacionais:
    ```bash
    sudo update-grub
    ```
  - O GRUB do Ubuntu é geralmente o mais fácil de gerenciar, então use-o como o gerenciador principal.

---

### ✅ **Resultado Final**:
Após a configuração:
1. Na inicialização, o GRUB exibirá as opções:
   - **Windows 10**
   - **Ubuntu 24.04**
   - **Arch Linux**
2. Selecione o sistema operacional desejado para iniciar.

Se precisar de mais ajuda com algum dos passos, como instalação do Arch ou configuração do GRUB, estou à disposição! 😊

# Guia de Formatação do Sistema Operacional

O propósito deste guia é ajudar a solucionar os problemas encontrados ao formatar o seu Sistema Operacional para que ele possa realizar um **dual boot do Windows 11 e do Ubuntu**.

O maior problema foi que ao tentar instalar o Ubuntu, o Windows já estava instalado, ele não aceita que o **Modo Sata** funcione com **Raid**. É importante pontuar que a marca do notebook é Dell e o modelo é o Acer Nitro 5. Processador Intel.

**Visão Geral**

A tecnologia de nome **Intel Rapid Storage Technology (RST)** é uma solução implementada em chips da Intel, em plataformas que suportam a RST e tem ela habilitada na BIOs do computador. Esta tecnologia permite que usuários agrupem e gerenciem vários discos rígidos como um único volume, essa funcionalidade é conhecida como **Redundant Array of Independent Disks (RAID)**.

No caso do notebook em questão, o modo sata dele estava configurado como **"entrar na Bios para verificar"**, para conseguirmos instalar o Ubuntu, nos tivemos que mudar o modo sata para **AHCI**.

Atualmente, se quisermos utilizar o Ubuntu, temos que configurar o modo sata como AHCI. Se quisermos utilizar o Windows, temos que configurar o modo sata como . Futuramente quero configurar o sistema de uma forma que eu não precise ficar alterando o modo sata.

### Sumário

- [Acessando a BIOs](#acessando-bios)
- [Acessando o "qual é o nome deste modo"](#)
- [Problema para Desativar o Modo de Segurança](#problema-desativar-modo-segurança)
- [Problema para Realizar o Boot de Um HD Externo](#problema-realizar-boot-hd-externo)
- [Problema ao Mudar o Modo Sata](#problema-mudar-modo-sata)
- [Ubuntu](#ubuntu)
    - [Configuração do Teclado](#configuração-teclado)
    - [Configuração do Idioma do Google Chrome](#configuração-idioma-google-chrome)
    - ["Static Noise When Not Playing Sounds"](#static-noise-when-not-playing-sounds)
    - [Programas Instalados](#programas-instalados)

## <a id="acessando-bios"></a>Acessando a BIOs

Aperte `F2` antes da inicialização do Sistema Operacional.

## <a id=""></a>Acessando o "qual é o nome deste modo"

## <a id="problema-desativar-modo-segurança"></a>Problema para Desativar o Modo de Segurança

## <a id="problema-realizar-boot-hd-externo"></a>Problema para Realizar o Boot de Um HD Externo

## <a id="problema-mudar-modo-sata"></a>Problema ao Mudar o Modo Sata

Na Bios, aperte as teclas `Ctrl + S` para que a opção de configuração do modo sata apareça.

## <a id = "ubuntu"></a>Ubuntu

### <a id="configuração-teclado"></a>Configuração do Teclado

O formato "ABNT2" no Windows, é o equivalente ao "Português (Brasil)" no Ubuntu.

### <a id="configuração-idioma-google-chrome"></a>Configuração do Idioma do Google Chrome

O Chrome utiliza o idioma do Ubuntu como o idioma da sua configuração. Se você quiser que a configuração do Chrome apareça em português, você deve configurar o seu Sistema Operacional para utilizar o idioma em portuguẽs.

Para instala-lo, você utiliza o comando `sudo apt install language-pack-pt`.

### <a id = "#static-noise-when-not-playing-sounds"></a>"Static Noise When Not Playing Sounds"

No meu caso, quando o fone de ouvido estava conectado, mas não havia nenhum áudio sendo reproduzido, um som de estática ficava sendo emitido. Neste caso era por conta de uma configuração de economia de energia da distribuição Linux em questão.

Em algumas distribuições, o modo de economia de energia é habilitado em todos os periféricos por padrão para conservar a bateria do notebook e de outros sistemas dependentes de bateria. Enquanto isso não afeta o desempenho do sistema, pode haver efeitos colaterais, um bom exemplo é o mal funcionamento do dispositivo de áudio.

**"Disable Power Saving Mode in snd_hda_intel"**

Para verificar se a economia de energia está habilitada, verifique a saída do comando

```bash
cat /sys/module/snd_hda_intel/parameters/power_save
```

Se a saída for `1`, o modo de economia de energia está habilitado e deve ser desativado. Para fazer isso você deve executar o comando

```bash
echo 0 > /sys/module/snd_hda_intel/parameters/power_save
```

Observe que você provavelmente precisará de permissões de super usuário para executar o comando acima.

### <a id="programas-instalados"></a>Programas Instalados

Aqui eu estou mantendo uma lista dos programas que eu utilizo e a ordem na qual eu os instalei, do primeio ao último. Antes de mais nada eu atualizei o `apt` (`sudo apt update`).

- `wget`
- **Google Chrome:** utilize o `wget` para obter o **.deb** e o instale com `dpkg`
- **Git:** `sudo apt install git`
- **VS Code:** foi um processo um pouco mais extenso, o pesquise no GPT
- **Discord:** `sudo snap install discord`
- **Rust:** ocorreu um erro ao tentar instalá-lo no Ubuntu 22.04 (jammy). Tivemos que instalar o `curl` pelo `apt` para conseguir instala-lo (também foi necessário especificar o pwd do curl "`/usr/bin/curl comando`")
    + `gcc`**:** instale o compilador C, se necessário

Sim, conflitos entre sistemas operacionais podem ocorrer, especialmente em situações específicas como o uso de configurações de disco que não são compatíveis com todos os sistemas, como **RAID**. Abaixo, explico os possíveis problemas e como evitá-los:

---

### ⚠️ **Principais Causas de Conflitos**:
1. **Configurações de RAID no Windows**:
   - Por padrão, o Windows pode configurar o armazenamento em RAID (Redundant Array of Independent Disks) ao invés de AHCI (Advanced Host Controller Interface). Muitas distribuições Linux, incluindo Ubuntu, não reconhecem discos configurados em RAID sem drivers adicionais.
   - Solução: Configure o armazenamento no BIOS/UEFI como **AHCI** antes de instalar o Linux.

2. **Partição EFI compartilhada**:
   - Todos os sistemas UEFI compartilham a mesma partição EFI para armazenar os arquivos de boot. Conflitos podem ocorrer se um sistema sobrescrever os arquivos de outro.
   - Solução: Sempre atualize o GRUB no sistema Linux principal (geralmente Ubuntu) após instalar outros sistemas.

3. **Fast Boot e Secure Boot**:
   - O **Fast Boot** (Inicialização Rápida) do Windows pode bloquear o acesso aos discos por outros sistemas operacionais.
   - O **Secure Boot** (Inicialização Segura) pode impedir que Linux funcione corretamente.
   - Solução:
     - Desative o **Fast Boot** no Windows.
     - Desative ou configure o **Secure Boot** no BIOS/UEFI para permitir a inicialização de distribuições Linux.

4. **Gerenciadores de Boot**:
   - O Windows tem seu próprio gerenciador de boot que pode sobrescrever o GRUB se o Windows for atualizado.
   - Solução: Reinstale ou atualize o GRUB após atualizações importantes no Windows.

---

### 🛠️ **Como Evitar Problemas no Acer Nitro 5**:
1. **Configuração do BIOS/UEFI**:
   - Acesse o BIOS pressionando **F2** ou **Del** durante a inicialização.
   - Configure:
     - **SATA Mode**: **AHCI** (não RAID).
     - **Secure Boot**: Desativado (ou configurado para aceitar assinaturas de Linux).
     - **UEFI Boot**: Habilitado.
   - Salve as alterações e reinicie.

2. **Instalação do Windows**:
   - Instale o Windows primeiro em uma partição separada.
   - Certifique-se de deixar espaço livre para os outros sistemas.

3. **Instalação do Ubuntu e Arch**:
   - Use a partição **/boot/efi** já criada pelo Windows (não formate).
   - Sempre atualize o GRUB após instalar qualquer sistema Linux:
     ```bash
     sudo update-grub
     ```

4. **Gerenciamento de RAID (se necessário)**:
   - Caso precise usar RAID, pode ser necessário instalar drivers específicos no Ubuntu:
     ```bash
     sudo apt install mdadm
     ```
   - O Arch Linux também suporta RAID, mas a configuração é manual e complexa.

---

### 💡 **Testando e Corrigindo Problemas**:
- **Verifique o modo SATA**: Se o Linux não detecta o disco, verifique se está configurado como **RAID**.
- **Corrigindo GRUB**: Se o GRUB for sobrescrito pelo Windows:
  1. Inicie com um pendrive Linux.
  2. Reinstale o GRUB:
     ```bash
     sudo mount /dev/sdXn /mnt  # Substitua por sua partição Linux
     sudo grub-install --efi-directory=/mnt/boot/efi
     sudo update-grub
     ```

---

### 🚨 **Dicas Finais**:
- **Teste em um Ambiente Virtual**: Antes de fazer alterações definitivas, experimente configurar múltiplos sistemas em uma máquina virtual.
- **Documente suas Partições**: Anote os pontos de montagem e tamanhos para evitar sobrescritas acidentais.

Se precisar de ajuda com a configuração específica do BIOS ou no GRUB, é só avisar! 😊

O **Windows** não obriga o uso de **RAID**, mas alguns laptops e desktops modernos vêm configurados de fábrica no modo RAID. Isso é especialmente comum em máquinas que utilizam tecnologias como Intel RST (Rapid Storage Technology). Felizmente, você pode mudar para **AHCI** sem precisar reinstalar o Windows, embora seja necessário tomar alguns cuidados.

---

### ✅ **Como Verificar e Alterar RAID para AHCI no Windows**:

#### 1. **Verificar o Modo Atual do Disco no Ubuntu (ou Windows)**:
   No Ubuntu, execute o seguinte comando no terminal:
   ```bash
   sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT
   ```
   Ou verifique o modo no **BIOS/UEFI**:
   - Acesse o BIOS pressionando **F2** ou **Del** ao iniciar o computador.
   - Encontre a configuração do disco (geralmente na aba "SATA Configuration" ou "Storage Configuration").
   - Verifique se o modo está configurado como **RAID**, **AHCI** ou **IDE**.

#### 2. **Alterar para AHCI no Windows** (se necessário):
   - Antes de mudar no BIOS, habilite o driver AHCI no Windows:
     1. Pressione **Win + R** e digite `msconfig`.
     2. Vá para a aba **Inicialização** e marque a opção **Inicialização segura**.
     3. Clique em **OK** e reinicie o computador.
   - Entre no BIOS e altere o modo de RAID para **AHCI**.
   - Inicie novamente o Windows. Ele reconhecerá o novo modo e instalará os drivers AHCI automaticamente.
   - Desative a **Inicialização segura** em `msconfig` após o sucesso.

---

### 🛠️ **Testando o Modo AHCI/RAID em uma VM no Ubuntu 24**:

No Ubuntu, você pode usar ferramentas como **VirtualBox** ou **QEMU/KVM** para simular modos de disco diferentes (AHCI, RAID, etc.).

#### **Usando VirtualBox**:
1. **Instale o VirtualBox**:
   ```bash
   sudo apt update
   sudo apt install virtualbox
   ```
2. **Crie uma Nova Máquina Virtual**:
   - Escolha **Windows 10** como sistema operacional.
   - Configure um disco virtual (exemplo: 50 GB, dinâmico).
3. **Configurar o Modo de Disco**:
   - Acesse as configurações da máquina virtual:
     - Vá para **Configurações > Armazenamento > Controlador SATA**.
     - O controlador SATA simula o modo AHCI por padrão.
   - Para simular RAID:
     - Adicione discos adicionais e use o gerenciador de RAID do Windows ou de uma ferramenta como o **mdadm** no Linux.

4. **Inicie a Máquina Virtual**:
   - Instale o Windows e veja como ele reconhece o disco.
   - Teste alterando o modo do controlador SATA no VirtualBox.

#### **Usando QEMU/KVM**:
1. **Instale QEMU/KVM**:
   ```bash
   sudo apt update
   sudo apt install qemu qemu-kvm virt-manager
   ```
2. **Crie uma Máquina Virtual**:
   - Use o **Virt-Manager** para configurar a máquina virtual.
   - Escolha o disco virtual e configure o controlador como **SATA** (AHCI) ou outro.

3. **Teste RAID**:
   - Adicione discos virtuais adicionais e configure RAID com ferramentas do sistema operacional.

---

### ⚠️ **Cuidados ao Testar e Migrar**:
- **RAID vs AHCI**: Certifique-se de que todos os sistemas (Windows, Linux) são compatíveis com o modo escolhido.
- **Backup**: Sempre faça backup antes de alterar modos de disco.
- **Desempenho**: Para uso geral, **AHCI** é mais adequado. RAID é útil apenas em configurações com múltiplos discos para redundância ou desempenho.

Se precisar de ajuda com os comandos ou configuração de VMs, posso detalhar! 😊

Ventoy para criar pendrives multiboot

Infelizmente, não é possível simplesmente adicionar múltiplas ISOs (como Ubuntu e Arch Linux) a um pendrive criado com ferramentas como o **Startup Disk Creator**, pois esse tipo de ferramenta formata o pendrive para ser bootável com apenas uma ISO por vez. No entanto, você pode criar um **pendrive multiboot** para incluir várias ISOs no mesmo dispositivo, permitindo escolher qual sistema operacional instalar no boot.

---

### 🔧 **Como criar um pendrive multiboot**:

1. **Ferramentas para Multiboot**:  
   Utilize ferramentas específicas para criar pendrives com várias ISOs, como:
   - **Ventoy**: Uma das melhores ferramentas para multiboot. Com o Ventoy, você pode simplesmente copiar as ISOs diretamente para o pendrive.
   - **YUMI (Your Universal Multiboot Installer)**: Outra opção popular para criar pendrives multiboot.
   - **MultiBootUSB**: Uma ferramenta menos conhecida, mas funcional.

2. **Instalando o Ventoy**:
   O Ventoy é altamente recomendado pela facilidade de uso. Aqui está como configurá-lo:

   **No Linux (Ubuntu ou derivados):**
   ```bash
   sudo apt install wget
   wget https://github.com/ventoy/Ventoy/releases/download/v1.0.xx/ventoy-x.x.x-linux.tar.gz
   tar -xzvf ventoy-x.x.x-linux.tar.gz
   cd ventoy-x.x.x
   sudo ./VentoyGUI.x86_64
   ```
   **No Windows:**
   - Baixe o Ventoy no [site oficial](https://www.ventoy.net/en/index.html).
   - Execute o programa e instale no pendrive.

3. **Preparando o Pendrive**:
   - Após instalar o Ventoy no pendrive, basta **copiar diretamente as ISOs** (como `ubuntu-24.04.iso` e `archlinux.iso`) para o pendrive.
   - Não é necessário formatar ou fazer configurações adicionais.

4. **No Boot**:
   - Reinicie o computador e selecione o pendrive como dispositivo de boot.
   - O Ventoy exibirá um menu com as ISOs disponíveis. Escolha a ISO desejada para iniciar a instalação.

---

### ✅ **Vantagens do Ventoy**:
- **Suporte a múltiplas ISOs**: Não precisa recriar o pendrive para adicionar novas ISOs.
- **Fácil de usar**: Basta copiar as ISOs diretamente.
- **Compatibilidade ampla**: Funciona com quase todos os sistemas operacionais populares.

Se precisar de ajuda com o processo ou encontrar dificuldades, é só avisar! 😊

sobre o Ventoy:

$ wget https://github.com/ventoy/Ventoy/releases/download/v1.0.xx/ventoy-x.x.x-linux.tar.gz
--2025-01-21 14:00:22--  https://github.com/ventoy/Ventoy/releases/download/v1.0.xx/ventoy-x.x.x-linux.tar.gz
Resolvendo github.com (github.com)... 20.201.28.151
Conectando-se a github.com (github.com)|20.201.28.151|:443... conectado.
A requisição HTTP foi enviada, aguardando resposta... 404 Not Found
2025-01-21 14:00:22 ERRO 404: Not Found.

O erro `404 Not Found` indica que o arquivo ou URL que você tentou acessar não existe mais ou foi movido. No caso do Ventoy, o link genérico com `v1.0.xx` não aponta para uma versão específica, então o arquivo correto não pode ser encontrado.

### ✅ **Como Resolver**:
Você precisa baixar a versão mais recente do Ventoy com o número exato da versão. Aqui está o que fazer:

---

### 1. **Verifique a Página Oficial do Ventoy**:
- Acesse o repositório oficial do Ventoy no GitHub:  
  [https://github.com/ventoy/Ventoy/releases](https://github.com/ventoy/Ventoy/releases)
- Encontre a versão mais recente disponível.

---

### 2. **Baixe o Arquivo Corretamente**:
Substitua o `v1.0.xx` pelo número da versão mais recente. Por exemplo, se a versão atual for `1.0.99`, você usaria:

```bash
wget https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-linux.tar.gz
```

---

### 3. **Extraia o Arquivo e Instale**:
Após baixar o arquivo, use os seguintes comandos:
```bash
# Extraia o arquivo tar.gz
tar -xzf ventoy-1.0.99-linux.tar.gz

# Navegue até o diretório extraído
cd ventoy-1.0.99

# Execute o script de instalação (substitua '/dev/sdX' pelo seu pendrive)
sudo ./Ventoy2Disk.sh -i /dev/sdX
```

---

### 4. **Identifique o Nome do Pendrive**:
Certifique-se de identificar o nome correto do seu pendrive antes de executar o script. Use o comando:
```bash
lsblk
```
O pendrive geralmente aparece como algo como `/dev/sdb` ou `/dev/sdc`. **Certifique-se de escolher o dispositivo correto, pois todos os dados serão apagados!**

Se precisar de ajuda para identificar o pendrive ou entender o processo, estou aqui! 😊

/dev/sdb is already mounted, please umount it first!

O erro indica que o pendrive que você está tentando usar já está montado no sistema. Para prosseguir com a instalação do Ventoy, você precisa desmontá-lo primeiro.

---

### ✅ **Passos para Resolver o Erro**:

1. **Verifique as Partições Montadas**:
   Use o comando abaixo para ver quais partições estão montadas:
   ```bash
   lsblk
   ```
   Procure o dispositivo `/dev/sdb` e suas partições, como `/dev/sdb1`, que estará listado junto com o ponto de montagem (como `/media/username/pendrive`).

2. **Desmonte o Pendrive**:
   Use o comando `umount` para desmontar as partições montadas:
   ```bash
   sudo umount /dev/sdb1
   ```
   Se houver mais de uma partição montada no pendrive, desmonte-as também:
   ```bash
   sudo umount /dev/sdb2
   ```

3. **Confirme que Está Desmontado**:
   Verifique novamente com `lsblk` se o pendrive não está mais montado (a coluna "MOUNTPOINT" deve estar vazia para `/dev/sdb`).

4. **Reexecute o Script do Ventoy**:
   Agora, você pode executar o script do Ventoy normalmente:
   ```bash
   sudo ./Ventoy2Disk.sh -i /dev/sdb
   ```

---

### ⚠️ **Dicas de Segurança**:
- Certifique-se de que `/dev/sdb` é realmente o seu pendrive, para evitar apagar acidentalmente o disco errado.
- Se o sistema continuar montando automaticamente o pendrive, você pode desativar a montagem automática temporariamente nas configurações do sistema ou usar o seguinte comando antes de conectar o dispositivo:
  ```bash
  sudo systemctl stop udisks2
  ```
  Após terminar o processo, ative novamente:
  ```bash
  sudo systemctl start udisks2
  ```

Se precisar de mais assistência, posso ajudar em qualquer etapa! 😊

Para instalar o VirtualBox no Ubuntu 24.04 e configurá-lo para testar a instalação de múltiplos sistemas operacionais, siga os passos abaixo:

---

### 🛠️ **Passo 1: Adicionar o Repositório do VirtualBox**

1. **Atualize os pacotes do sistema:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Adicione a chave GPG para autenticar os pacotes:**
   ```bash
   wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo gpg --dearmor -o /usr/share/keyrings/virtualbox.gpg
   ```

3. **Adicione o repositório do VirtualBox:**
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
   ```

---

### 🛠️ **Passo 2: Instalar o VirtualBox**

1. **Atualize a lista de pacotes:**
   ```bash
   sudo apt update
   ```

2. **Instale a versão mais recente do VirtualBox:**
   ```bash
   sudo apt install virtualbox-7.0 -y
   ```

3. **Verifique a instalação:**
   Execute o comando abaixo para verificar a versão instalada:
   ```bash
   vboxmanage --version
   ```

---

### 🛠️ **Passo 3: Baixar e Instalar o Extension Pack (Opcional)**

O Extension Pack adiciona funcionalidades extras, como suporte a USB 2.0/3.0 e RDP.

1. **Baixe o Extension Pack:**
   ```bash
   wget https://download.virtualbox.org/virtualbox/7.0.10/Oracle_VM_VirtualBox_Extension_Pack-7.0.10.vbox-extpack
   ```

2. **Instale o Extension Pack:**
   ```bash
   sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.10.vbox-extpack
   ```

3. **Aceite os termos de licença quando solicitado.**

---

### 🛠️ **Passo 4: Configurar as Máquinas Virtuais**

1. **Crie uma VM para cada sistema operacional:**
   - Abra o VirtualBox (`virtualbox` no terminal ou pela interface gráfica).
   - Clique em **"Novo"** para criar uma nova máquina virtual.
   - Configure o nome, tipo e versão do sistema operacional (Ubuntu, Windows, etc.).
   - Altere os recursos, como memória RAM e tamanho de disco, conforme necessário.

2. **Anexe os ISOs dos sistemas operacionais:**
   - No menu de configurações da VM, vá para **Armazenamento**.
   - Clique no ícone de disco e selecione o arquivo ISO correspondente.

3. **Inicie a instalação do SO na VM.**

---

### ⚙️ **Dicas para Configurações de Múltiplos Sistemas Operacionais**

- **Testando RAID/AHCI:** Durante a instalação do Windows, você pode configurar o modo de armazenamento para simular RAID ou AHCI na seção de **Configurações -> Sistema -> Chipset**.
- **Rede:** Configure as VMs para usar **rede bridge** ou NAT para simular diferentes ambientes de rede.
- **Snapshots:** Use **snapshots** para salvar o estado das VMs antes de realizar alterações significativas.

---

### 🐧 **Testando VMs com Ubuntu, Arch e Windows**

- Ubuntu e Arch podem ser instalados diretamente a partir de seus ISOs sem problemas.
- Para o Windows, lembre-se de baixar o ISO oficial do site da Microsoft e adicionar drivers no modo correto (AHCI ou RAID).

Pronto! Agora você pode testar as configurações de múltiplos sistemas operacionais no seu VirtualBox. 😊

Se o uso de `tr` não resolveu o problema, existem alguns pontos a serem considerados para investigar e corrigir a situação:

---

### Possíveis Motivos e Soluções

#### 1. **Expansão Tardia do `command_output`**
Se `command_output` contiver uma saída longa ou complexa (com espaços, caracteres especiais ou quebras de linha), ao usá-lo diretamente em `log_message`, a string pode ser expandida de maneira inesperada.

- **Solução:** Certifique-se de encapsular o valor de `command_output` em aspas para evitar interpretações inesperadas:
  ```bash
  log_message "Why? \"${command_output}\""
  ```

---

#### 2. **Caracteres Invisíveis na Saída**
Às vezes, a saída pode conter caracteres não visíveis (como `\r` ou `\t`), que afetam o formato sem serem imediatamente aparentes.

- **Solução:** Use `cat -A` para verificar a saída real de `command_output`:
  ```bash
  echo "${command_output}" | cat -A
  ```

Se você encontrar caracteres como `^M` ou `$`, isso indica a presença de `\r` ou outras quebras de linha invisíveis.

- **Correção:** Use `tr` para remover caracteres invisíveis:
  ```bash
  command_output=$(echo "${command_output}" | tr -d '\r\n\t')
  ```

---

#### 3. **Execução do `validate_success`**
O comportamento da função `validate_success` pode estar alterando a saída de `command_output` antes de você manipulá-la.

- **Solução:** Adicione um debug antes e depois de `tr` para inspecionar o conteúdo de `command_output`:
  ```bash
  log_message "Original command output: ${command_output}"
  command_output=$(echo "${command_output}" | tr -d '\r\n\t')
  log_message "Sanitized command output: ${command_output}"
  ```

Isso ajuda a confirmar se o `tr` está funcionando corretamente e se está sendo aplicado na variável correta.

---

#### 4. **Formato da Saída de `snap install`**
O comando `snap install multipass` pode gerar saídas em múltiplas linhas ou incluir mensagens de erro no `stderr`.

- **Solução:** Redirecione tanto o `stdout` quanto o `stderr` para capturar e processar a saída:
  ```bash
  validate_success 'sudo snap install multipass 2>&1'
  ```

Certifique-se de que `command_output` está capturando toda a saída.

---

#### 5. **Uso de `log_message`**
Se o problema estiver no `log_message`, certifique-se de que ele está formatando corretamente a string.

- **Solução:** Substitua temporariamente `log_message` por `echo` para verificar se há interferência:
  ```bash
  echo "Why? ${command_output}"
  ```

Se `echo` funcionar corretamente, reveja como `log_message` está manipulando as variáveis.

---

### Depuração Final
1. Verifique o conteúdo completo de `command_output`:
   ```bash
   echo "${command_output}" | cat -A
   ```

2. Aplique `tr` para limpar caracteres indesejados:
   ```bash
   command_output=$(echo "${command_output}" | tr -d '\r\n\t')
   ```

3. Substitua `log_message` por `echo` para isolar o problema.

Com isso, você deve conseguir identificar e resolver a causa exata do comportamento.
