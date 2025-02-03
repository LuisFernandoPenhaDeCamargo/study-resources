TODO: revisar a gramática e a lógica das notas abaixo.

Tech Compass (Guia de elaboração do Repositório)

- Ponto de entrada (README): todas as seções, assuntos, poderão ser acessados a partir deste ponto;
- Dividir em seções:
    + "Modularidade: cada nota ou tutorial deve ser autocontido e escrito de forma que possa ser atualizado ou substituído sem impactar outras partes do repositório. Se necessário, usa arquivos separados para códigos de exemplo, scripts ou configurações"
    + "Padronize a terminologia e os exemplos: ao tratar de temas técnicos variados, mantenha uma terminologia consistente. Use exemplos e convenções que sejam claros e que possam ser facilmente compreendidos por você e seu irmão"
    + **"Feedback e revisões periódicas: estabeleça momentos para revisar o conteúdo, atualizá-lo conforme novas informações ou tecnologias surgem, e até mesmo solicitar feedback de quem utiliza o repositório. Isso mantém a qualidade e a relevância das informações"**
- Consistência na organização e na formatação
- "Exemplos práticos e exercícios: sempre que possível, acrescente exercícios ou desafios que permitam praticar o conteúdo apresentado. Essa abordagem ativa ajuda a fixar o conhecimento e torna o repositório um espaço dinâmico de aprendizado"

"Em resumo, um repositório didático e prático depende tanto da organização estrutural quanto da clareza e profundidade do conteúdo. Ao definir uma estrutura modular, usar um padrão consistente e incorporar elementos visuais e práticos, você cria uma ambiente de estudos que não só facilita a revisão, mas também a expansão e colaboração contínua."

> Nota: cada tema terá o seu próprio repositório para uma melhor modularização.

---

TODO: revisar a gramática e a lógica das notas abaixo.
> Nota: atenção aos "títulos" (posso chamar assim?) das estruturas que sucedem `###`

# Dúvidas Frequentes Relacionadas a Regras Gramáticais

## Dois Pontos

### "A primeira letra após os dois pontos deve ser maiúscula ou miniscúla?"

A utilização de maiúscula ou minúscula após os dois pontos depende do contexto e da função que a informação que se segue desempenha na frase.

- Uso de minúscula: se a informação que segue os dois pontos é uma explicação, enumeração ou complemento que integra a mesma frase, normalmente utiliza-se a letra minúscula. Exemplo: "Ele tinha três opções: correr, lutar ou fugir"
- Uso de maiúscula: a letra maiúscula deve ser empregada quando o que vem depois dos dois pontos constitui:
    + Uma citação direta ou discurso reproduzido integralmente. Exemplo: "Ele afirmou: 'Não podemos desistir agora'"
    + Uma enumeração de elementos que são, por sua natureza, nomes próprios ou quando cada item é apresentado como um enunciado extenso, muitas vezes com caráter explicativo ou descritivo que justifique sua autonomia. Exemplo: "Foram selecionados os seguintes alunos: João, Maria e Pedro."
    + Quando ocorre mudança de parágrafo após os dois pontos, por exemplo, no caso de diálogos: Exemplo:
    "Ela perguntou:
    — Você vai participar?"

## Listas e Pontuação

### "Ao final de itens de listas, devemos utilizar pontuação?"

A utilização de pontuação ao final de itens de listas depende do tipo de lista e do contexto em que ela é apresentada.

#### Listas Informais ou de Itens Curtos

- Itens isolados ou curtos: se a lista consiste em palavras, expressões ou itens que não formam frases completas, normalmente não é necessário usar pontuação ao final de cada item. Por exemplo:
    + Maçã
    + Banana
    + Uva
- Consistência visual: em listas informais (como listas de compras ou tópicos curtos), muitos autores optam por não pontuar cada item para manter a "limpeza" visual do texto

#### Listas Formais ou com Itens Completos

- Itens que são frases completas: quando os itens da lista constituem orações completas, recomenda-se usar pontuação que indique a separação entre os itens – geralmente ponto-e-vírgula – e finalizar o último item com ponto final. Exemplo:  
    É fundamental manter a organização:
    + Os relatórios devem ser enviados até sexta-feira;
    + As reuniões devem ser agendadas com antecedência;
    + E os feedbacks devem ser registrados formalmente.

Nesse caso, o ponto final no último item sinaliza o encerramento da lista e, por consequência, do período.

# ---

#!/bin/bash

# O primeiro passo é, provavelmente, se organizar, tanto quanto em relação a conteúdo, quanto em relação a formatação.

### Variáveis auxiliares ###
debug_mode_warning=1
debug_mode_stdout=1
stdout=''
stderr=''

### Funções ###
log_step_progress() {
    local middle_message=$1

    printf '%*s' 19 | tr ' ' '-' ; echo -n "${middle_message}" ; printf '%*s\n' 19 | tr ' ' '-'
}

log_function() {
    local log_message=$1
    local log_level="${2:-INFO}"

    echo -e "$(date '+[%Y-%m-%d %H:%M:%S]')[${log_level}] ${log_message}"
}

validate_success() {
    local command=$1
    local error_message=$2
    local debug_message=$3
    local warning_message=$4
    local command_exit_code=''
    local stderr_file=$(mktemp)

    stdout=$(eval "${command}" 2>"${stderr_file}")
    command_exit_code=$?
    stderr=$(<"${stderr_file}")
    rm -f "${stderr_file}"

    if [[ $command_exit_code -ne 0 ]]; then
        log_function "${error_message}${stderr}" 'ERROR'
        exit 1
    fi

    if [[ $debug_mode_warning -eq 1 && -n "${stderr}" ]]; then
        log_function "${warning_message}${stderr}" 'WARNING'
    fi

    if [[ $debug_mode_stdout -eq 1 && -n "${stdout}" ]]; then
        log_function "${debug_message}${stdout}" 'DEBUG'
    fi
}

#debug_mode_warning=0
#debug_mode_stdout=0

### Execução principal do script ###
#log_step_progress ' Preparando o ambiente para a instalação das aplicações '
#log_function 'sudo apt update'
#validate_success 'sudo apt update' 'Erro ao atualizar os índices de pacotes:' '\n'
#log_function 'sudo apt upgrade -y'
#validate_success 'sudo apt upgrade -y' 'Erro ao atualizar os pacotes:' '\n'

# Google Chrome
# TODO: é possível realizar o login nele através do script?
#log_function 'Baixando o Google Chrome\n'
#validate_success 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' '' '' '\n'
#log_step_progress '-------------- Instalando o Google Chrome --------------'
#validate_success 'sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt install -fy' '' '\n'
#log_function "$(google-chrome --version)\n"
#validate_success 'rm google-chrome-stable_current_amd64.deb'

# Multipass
#log_step_progress '---------------- Instalando o Multipass ----------------'
#validate_success 'sudo snap install multipass > /dev/null'
#log_function "$(echo 'Multipass ')$(multipass version | sed -z 's/\n.*//' | sed -E 's/^[^0-9]*//')\n"

# VS Code
#log_step_progress '----------------- Instalando o VS Code -----------------'
#validate_success 'sudo snap install code --classic > /dev/null'
#log_function "$(echo 'VS Code ')$(code --version | sed -z 's/\n.*//')\n"

# Discord
#log_step_progress '----------------- Instalando o Discord -----------------'
#validate_success 'sudo snap install discord > /dev/null'
#log_function "$(echo 'Discord ')$(snap info discord | grep installed | sed -E 's/^[^0-9]*//; s/([0-9]+(\.[0-9]+)*).*/\1/')\n"

# Git
#log_step_progress '------------------- Instalando o Git -------------------'
#validate_success 'sudo apt install git -y' 'Erro ao instalar o Git:' '\n'
#log_function "$(echo 'Git ')$(git --version | sed -E 's/^[^0-9]*//')\n"

# NVM
#log_step_progress '------------------- Instalando o NVM -------------------'
#validate_success 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash' '' '\n' '\n'
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#log_function "$(echo 'NVM ')$(nvm --version)\n"

# Node.js
# TODO: é possível realizar o login no NPM através do script?
#log_step_progress '----------------- Instalando o Node.js -----------------'
#nvm install --lts &> /dev/null
#log_function "$(echo 'Node.js ')$(node --version)"
#nvm install 8.16.0 &> /dev/null
#nvm use 8.16.0 > /dev/null
#log_function "$(echo 'Node.js ')$(node --version)\n"
# vim.tiny .bashrc
# rm -rf ~/.nvm && sudo apt remove --purge nvm

# Expect

# MariaDB
#log_step_progress '----------------- Instalando o MariaDB -----------------'
#validate_success 'sudo apt install mariadb-server -y' 'Erro ao instalar o MariaDB:'
#stdout="$(mariadb --version)"
#log_function "$(echo 'MariaDB ')$(echo ${stdout:13:28})"
# TODO: sudo mysql_secure_installation

# ---

sudo tail -f /var/log/mail.log

---

**Versão do modelo: GPT-4**

Sim, o **Postfix** é um servidor de e-mail (Mail Transfer Agent ou MTA), e ele é instalado automaticamente como backend para gerenciar o envio de e-mails em muitos sistemas quando você instala ferramentas como `mail`.

---

### O que está acontecendo
Quando você instalou a ferramenta `mail` no seu sistema, ela provavelmente configurou o **Postfix** como o servidor de e-mail padrão. Isso significa que, ao enviar um e-mail com o comando `mail`, é o **Postfix** que tenta realizar o envio.

Porém:
- O **Postfix** está configurado por padrão para enviar e-mails diretamente pela internet como se fosse um servidor de e-mails completo.
- Sem configuração adequada, o **Postfix** não está autenticando seus envios nem provando que o domínio `@lfernando` tem permissão para enviar mensagens.
- Serviços como Gmail recusam mensagens de servidores não autenticados, como no seu caso.

---

### Por que usar o Postfix por trás do comando `mail`?
O Postfix é projetado para gerenciar o envio de e-mails em servidores e está tentando funcionar como tal. Quando você instalou a ferramenta `mail`, ela só precisava de algo para enviar mensagens e usou o Postfix como o método padrão.

Se você não configurou nada, o Postfix está funcionando no **modo padrão** (out-of-the-box). Neste modo, ele:
- Usa o nome do servidor (`lfernando`) e o IP público da máquina para enviar e-mails.
- Não configura autenticação (SPF, DKIM, etc.), então os e-mails parecem suspeitos para provedores como Gmail.

---

### O que fazer agora?
Se você só quer enviar e-mails simples (e não configurar um servidor completo de e-mails), é melhor usar um **relé SMTP externo**, como o do Gmail ou outro provedor, em vez de depender do Postfix. Isso simplifica tudo.

#### Configurando o Postfix para usar o SMTP do Gmail:
1. **Edite a configuração do Postfix**:
   Abra o arquivo de configuração principal do Postfix (`/etc/postfix/main.cf`):
   ```bash
   sudo nano /etc/postfix/main.cf
   ```

2. **Adicione ou edite as seguintes linhas**:
   Essas linhas configuram o Postfix para usar o Gmail como um "relay" (enviar os e-mails através dos servidores do Gmail):
   ```
   relayhost = [smtp.gmail.com]:587
   smtp_sasl_auth_enable = yes
   smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
   smtp_sasl_security_options = noanonymous
   smtp_use_tls = yes
   smtp_tls_security_level = encrypt
   smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
   ```

3. **Crie o arquivo de senhas**:
   Crie o arquivo `/etc/postfix/sasl_passwd` com suas credenciais do Gmail:
   ```bash
   sudo nano /etc/postfix/sasl_passwd
   ```
   Adicione as seguintes linhas:
   ```
   [smtp.gmail.com]:587 your_email@gmail.com:your_password_or_app_password
   ```

4. **Proteja o arquivo de senhas**:
   Ajuste as permissões para que apenas o root possa acessá-lo:
   ```bash
   sudo chmod 600 /etc/postfix/sasl_passwd
   ```

5. **Converta o arquivo para um formato que o Postfix entenda**:
   ```bash
   sudo postmap /etc/postfix/sasl_passwd
   ```

6. **Reinicie o Postfix**:
   Após configurar tudo, reinicie o serviço:
   ```bash
   sudo systemctl restart postfix
   ```

7. **Teste o envio de e-mails**:
   Envie um e-mail para testar:
   ```bash
   echo "Test message body" | mail -s "Test Subject" recipient@example.com
   ```

---

### O que acontece com essa configuração?
- O **Postfix** usará o servidor SMTP do Gmail para enviar e-mails, em vez de tentar enviar diretamente.
- O Gmail autentica o envio, resolvendo problemas de SPF/DKIM.
- Você evita os bloqueios por provedores como o Gmail.

---

### Caso você não queira usar o Postfix:
Se você só precisa enviar alguns e-mails simples, considere usar ferramentas como:
- **`msmtp`**: Um cliente SMTP simples que envia e-mails sem precisar de um servidor completo como o Postfix.
- **Bibliotecas de programação** como `smtplib` no Python para enviar e-mails diretamente.

Isso elimina a complexidade de gerenciar um servidor de e-mails.

mas o servidor msmtp permite que eu envie e-mails para o gmail? O que eu preciso configurar? A quais vulnerabilidades eu estou expondo meu servidor ao instalar este tipo de ferramentas nele?

Jan 13 16:09:36 lfernando postfix/pickup[76081]: E7FB517812EF: uid=0 from=<root@lfernando>
Jan 13 16:09:36 lfernando postfix/cleanup[77580]: E7FB517812EF: message-id=<20250113190936.E7FB517812EF@lfernando.oriongames.intra>
Jan 13 16:09:36 lfernando postfix/qmgr[76082]: E7FB517812EF: from=<root@lfernando>, size=351, nrcpt=1 (queue active)
Jan 13 16:09:36 lfernando postfix/smtp[77582]: connect to gmail-smtp-in.l.google.com[2800:3f0:4003:c00::1a]:25: Network is unreachable
Jan 13 16:09:43 lfernando postfix/smtp[77582]: E7FB517812EF: to=<japa2604@gmail.com>, relay=gmail-smtp-in.l.google.com[64.233.186.27]:25, delay=6.9, delays=0/0/6.3/0.59, dsn=5.7.26, status=bounced (host gmail-smtp-in.l.google.com[64.233.186.27] said: 550-5.7.26 Your email has been blocked because the sender is unauthenticated. 550-5.7.26 Gmail requires all senders to authenticate with either SPF or DKIM. 550-5.7.26  550-5.7.26  Authentication results: 550-5.7.26  DKIM = did not pass 550-5.7.26  SPF [lfernando] with ip: [187.62.8.196] = did not pass 550-5.7.26  550-5.7.26  For instructions on setting up authentication, go to 550 5.7.26  https://support.google.com/mail/answer/81126#authentication 46e09a7af769-7231865d5f0si4622064a34.243 - gsmtp (in reply to end of DATA command))
Jan 13 16:09:43 lfernando postfix/cleanup[77580]: C9FD017812F0: message-id=<20250113190943.C9FD017812F0@lfernando.oriongames.intra>
Jan 13 16:09:43 lfernando postfix/bounce[77696]: E7FB517812EF: sender non-delivery notification: C9FD017812F0
Jan 13 16:09:43 lfernando postfix/qmgr[76082]: C9FD017812F0: from=<>, size=3479, nrcpt=1 (queue active)
Jan 13 16:09:43 lfernando postfix/qmgr[76082]: E7FB517812EF: removed
Jan 13 16:09:43 lfernando postfix/local[77697]: C9FD017812F0: to=<root@lfernando>, relay=local, delay=0.01, delays=0/0/0/0, dsn=2.0.0, status=sent (delivered to mailbox)
Jan 13 16:09:43 lfernando postfix/qmgr[76082]: C9FD017812F0: removed

- s3 controle de versão, custo
- tempo que o processo toma (dump), tem como verificar?

orion-bks tem controle de versão
  se deletarmos a atual, a próxima mais recente se torna a atual?
cd /home/zoe/dumps/                                                                                                                                                         
cat /usr/local/bin/orion-backup
orion-bkps 
o dump é sobreescrito
3859
erro 28
351854
5063368
delete from lanhouse_log where created < '2025-01-15';
delete from lanhouse_log where created < '2024-12-20';
delete from user_notificatios where date_time < '2024-01-01';
  SELECT COUNT(*) AS total from SequelizeMeta; 47
x  SELECT COUNT(*) AS total from authorization_tokens; 11
x  SELECT COUNT(*) AS total from big_winners; 176
x  SELECT COUNT(*) AS total from bill_validator_logs; 1507493
x  SELECT COUNT(*) AS total from bill_validators; 0
x  SELECT COUNT(*) AS total from cashier; 179567
x  SELECT COUNT(*) AS total from configs; 1
  SELECT COUNT(*) AS total from fingerprints; 4
x  SELECT COUNT(*) AS total from games; 132
x SELECT COUNT(*) AS total from lanhouse_log;
x  SELECT COUNT(*) AS total from machines; 11
  SELECT COUNT(*) AS total from players; 0
  SELECT COUNT(*) AS total from read_cashier; 1
  SELECT COUNT(*) AS total from read_days; 11
  SELECT COUNT(*) AS total from read_estatisticas; 5
  SELECT COUNT(*) AS total from read_time_cashier; 1
  SELECT COUNT(*) AS total from read_yesterday_cashier; 11
x  SELECT COUNT(*) AS total from remote_commands; 84
x  SELECT COUNT(*) AS total from remote_queries; 52
x  SELECT COUNT(*) AS total from settings; 1
x  SELECT COUNT(*) AS total from updater_logs; 1058
  SELECT COUNT(*) AS total from user_notificatios; 1695
  SELECT COUNT(*) AS total from user_sessions; 1
  SELECT COUNT(*) AS total from user_time_table; 0
  SELECT COUNT(*) AS total from users; 2

755 rwxr-xr-x - mantive essas permissões que são iguais do script antigo

ZTqFHh7paAY43eMF64dv

Para desinstalar o `mailutils` (e suas dependências como o `postfix`) manualmente, você pode seguir os passos abaixo. Vou fornecer comandos para remover completamente os pacotes e limpar arquivos de configuração residuais.

---

### **1. Remover o pacote `mailutils`**
Use o seguinte comando para remover o pacote `mailutils`:

```bash
sudo apt remove --purge -y mailutils
```

- **`remove`:** Remove o pacote instalado.
- **`--purge`:** Remove os arquivos de configuração associados ao pacote.
- **`-y`:** Aceita automaticamente a remoção.

---

### **2. Remover dependências não utilizadas**
Após remover o `mailutils`, pode haver dependências que foram instaladas automaticamente e não são mais necessárias. Para limpá-las, execute:

```bash
sudo apt autoremove --purge -y
```

---

### **3. Verificar se o `postfix` está instalado**
O `mailutils` pode instalar o `postfix` como dependência. Para garantir que o Postfix seja removido, execute:

```bash
sudo apt remove --purge -y postfix
```

---

### **4. Limpar pacotes residuais**
Se desejar garantir que nenhum pacote residual permaneça, execute:

```bash
sudo apt clean
sudo apt autoclean
```

---

### **5. Verificar se o `mail` foi removido**
O comando `mail` pode ainda estar acessível se houver outra ferramenta similar instalada. Para verificar, use:

```bash
command -v mail
```

- Se o comando não retornar nenhum caminho, significa que o `mail` foi completamente removido.

---

### **6. Reiniciar serviços (opcional)**
Se o Postfix ou outros serviços relacionados estiverem rodando, reinicie os serviços associados ao e-mail para garantir um ambiente limpo:

```bash
sudo systemctl stop postfix
sudo systemctl disable postfix
```

---

Com esses passos, você pode remover completamente o `mailutils` e testar a instalação a partir do seu script repetidamente.

sudo apt remove --purge -y mailutils && sudo apt autoremove --purge -y && sudo apt remove --purge -y postfix && sudo apt clean && sudo apt autoclean

#
#
#
#
#

### Versão do modelo: v2.0  

A mensagem de erro do **Postfix** indica dois problemas diferentes relacionados ao envio de e-mails via Gmail:

---

### **1. Erro de autenticação SASL (Username and Password not accepted)**
O erro:
```plaintext
SASL authentication failed; server smtp.gmail.com[64.233.186.109] said: 535-5.7.8 Username and Password not accepted.
```

#### **Possíveis causas:**
1. **Credenciais inválidas:**
   - O usuário e/ou a senha configurados estão incorretos.
2. **Falta de senha de aplicativo:**
   - O Gmail exige o uso de uma **senha de aplicativo** se a autenticação em duas etapas estiver ativada.
3. **Acesso por aplicativos menos seguros bloqueado:**
   - O Google desativou o acesso por aplicativos que não usam OAuth (como o Postfix) em contas que não têm senha de aplicativo.

#### **Soluções:**
- **Use uma senha de aplicativo:**  
  Gere uma senha no painel de segurança do Google:
  1. Vá para [Segurança do Google](https://myaccount.google.com/security).
  2. Ative a verificação em duas etapas (se ainda não estiver ativa).
  3. Em "Senhas de aplicativo", gere uma senha específica para o Postfix.

- **Atualize a configuração do Postfix:**
  Insira a senha gerada no arquivo de configuração do Postfix:
  ```bash
  nano /etc/postfix/sasl_passwd
  ```

  Exemplo de configuração:
  ```
  [smtp.gmail.com]:587    seu-email@gmail.com:senha-de-aplicativo
  ```

  Atualize o banco de dados:
  ```bash
  postmap /etc/postfix/sasl_passwd
  chmod 600 /etc/postfix/sasl_passwd*
  ```

- **Teste o envio novamente:**
  Reinicie o Postfix:
  ```bash
  sudo systemctl restart postfix
  ```

---

### **2. Erro de rede (Network is unreachable)**
O erro:
```plaintext
connect to smtp.gmail.com[2800:3f0:4003:c00::6c]:587: Network is unreachable
```

#### **Possíveis causas:**
1. **IPv6 não configurado corretamente:**  
   O Postfix está tentando se conectar ao servidor Gmail via IPv6, mas o servidor não consegue resolver ou alcançar o endereço.

2. **Firewall ou bloqueio de rede:**  
   Uma regra de firewall ou política de rede pode estar bloqueando conexões de saída para `smtp.gmail.com` na porta `587`.

#### **Soluções:**
- **Desativar o uso de IPv6 no Postfix:**  
  Edite o arquivo de configuração principal do Postfix:
  ```bash
  sudo nano /etc/postfix/main.cf
  ```

  Adicione ou ajuste esta linha:
  ```
  inet_protocols = ipv4
  ```

  Reinicie o Postfix:
  ```bash
  sudo systemctl restart postfix
  ```

- **Verifique a conectividade de rede:**
  Teste se a porta 587 está acessível:
  ```bash
  telnet smtp.gmail.com 587
  ```
  Se não houver resposta, revise as configurações do firewall:
  ```bash
  sudo ufw allow out on any to any port 587 proto tcp
  ```

---

### **3. Teste final**
Após corrigir os problemas de autenticação e conectividade:
1. Envie um e-mail de teste:
   ```bash
   echo "Testando Postfix com Gmail" | mail -s "Teste Postfix" luisfernandopenhadecamargo@gmail.com
   ```
2. Verifique os logs do Postfix:
   ```bash
   sudo tail -f /var/log/mail.log
   ```

Se o problema persistir, compartilhe os novos logs para análise.

https://myaccount.google.com/apppasswords?continue=https://myaccount.google.com/security?rapt%3DAEjHL4Pbfg40zHQ2fQNfCwuEh7nCW20vvXJNso0WHdZaU6Ke3aaK-PkN5Ythuu6cYHK4NI1Ha4KJzxlNg_fkYfx_KWfMuwROPAPrtAX2_IFwUO1csIKnjyE&pli=1&rapt=AEjHL4ON5HWaNPqoVIJTHyYEJJRCp4LT7zBi9HhtYVtVSJtsTNWBf60kXXkX5dP4NCuTi2Pwq0M-EEYRSHkPRyYVdPl0CO_4Opo8XdLZ4ikjoYNi_4QBIYE
xqci andy jvwg fsjs

root@lfernando:/home/luis# vim /etc/postfix/sasl_passwd
root@lfernando:/home/luis# postmap /etc/postfix/sasl_passwd
root@lfernando:/home/luis# sudo systemctl restart postfix
root@lfernando:/home/luis# echo "Testando Postfix com Gmail" | mail -s "Teste Postfix" luisfernandopenhadecamargo@gmail.com
root@lfernando:/home/luis# sudo tail -f /var/log/mail.log
Jan 13 17:45:48 lfernando postfix/postfix-script[91090]: stopping the Postfix mail system
Jan 13 17:45:48 lfernando postfix/master[85376]: terminating on signal 15
Jan 13 17:45:50 lfernando postfix/postfix-script[91724]: starting the Postfix mail system
Jan 13 17:45:50 lfernando postfix/master[91726]: daemon started -- version 3.6.4, configuration /etc/postfix
Jan 13 17:46:07 lfernando postfix/pickup[91727]: 4D7BD1781307: uid=0 from=<root@lfernando>
Jan 13 17:46:07 lfernando postfix/cleanup[91734]: 4D7BD1781307: message-id=<20250113204607.4D7BD1781307@lfernando.oriongames.intra>
Jan 13 17:46:07 lfernando postfix/qmgr[91728]: 4D7BD1781307: from=<root@lfernando>, size=398, nrcpt=1 (queue active)
Jan 13 17:46:09 lfernando postfix/smtp[91736]: 4D7BD1781307: SASL authentication failed; server smtp.gmail.com[64.233.186.109] said: 535-5.7.8 Username and Password not accepted. For more information, go to?535 5.7.8  https://support.google.com/mail/?p=BadCredentials 41be03b00d2f7-a31857cfb2bsm7235894a12.26 - gsmtp
Jan 13 17:46:09 lfernando postfix/smtp[91736]: connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable
Jan 13 17:46:09 lfernando postfix/smtp[91736]: 4D7BD1781307: to=<luisfernandopenhadecamargo@gmail.com>, relay=none, delay=2.5, delays=0.01/0.06/2.5/0, dsn=4.4.1, status=deferred (connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable)
^C
root@lfernando:/home/luis# vim /etc/postfix/sasl_passwd
root@lfernando:/home/luis# sudo systemctl restart postfix
root@lfernando:/home/luis# postmap /etc/postfix/sasl_passwd
root@lfernando:/home/luis# sudo systemctl restart postfix
root@lfernando:/home/luis# echo "Testando Postfix com Gmail" | mail -s "Teste Postfix" luisfernandopenhadecamargo@gmail.com
root@lfernando:/home/luis# sudo tail -f /var/log/mail.log
Jan 13 17:47:33 lfernando postfix/postfix-script[92491]: stopping the Postfix mail system
Jan 13 17:47:33 lfernando postfix/master[92475]: terminating on signal 15
Jan 13 17:47:36 lfernando postfix/postfix-script[93125]: starting the Postfix mail system
Jan 13 17:47:36 lfernando postfix/master[93127]: daemon started -- version 3.6.4, configuration /etc/postfix
Jan 13 17:47:39 lfernando postfix/pickup[93128]: E507F178130B: uid=0 from=<root@lfernando>
Jan 13 17:47:39 lfernando postfix/cleanup[93135]: E507F178130B: message-id=<20250113204739.E507F178130B@lfernando.oriongames.intra>
Jan 13 17:47:39 lfernando postfix/qmgr[93129]: E507F178130B: from=<root@lfernando>, size=398, nrcpt=1 (queue active)
Jan 13 17:47:41 lfernando postfix/smtp[93137]: E507F178130B: SASL authentication failed; server smtp.gmail.com[64.233.186.109] said: 535-5.7.8 Username and Password not accepted. For more information, go to?535 5.7.8  https://support.google.com/mail/?p=BadCredentials d2e1a72fcca58-72d4065c3a5sm6437929b3a.98 - gsmtp
Jan 13 17:47:41 lfernando postfix/smtp[93137]: connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable
Jan 13 17:47:41 lfernando postfix/smtp[93137]: E507F178130B: to=<luisfernandopenhadecamargo@gmail.com>, relay=none, delay=1.9, delays=0.02/0.06/1.8/0, dsn=4.4.1, status=deferred (connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable)
^C
root@lfernando:/home/luis#

echo "Teste de envio com Postfix e Gmail" | mail -s "Teste Postfix" luisfernandopenhadecamargo@gmail.com

Jan 14 09:43:11 lfernando postfix/pickup[7926]: C6DA917812FF: uid=0 from=<root@lfernando>
Jan 14 09:43:11 lfernando postfix/cleanup[8269]: C6DA917812FF: message-id=<20250114124311.C6DA917812FF@lfernando.oriongames.intra>
Jan 14 09:43:11 lfernando postfix/qmgr[7927]: C6DA917812FF: from=<root@lfernando>, size=406, nrcpt=1 (queue active)
Jan 14 09:43:14 lfernando postfix/smtp[8271]: C6DA917812FF: SASL authentication failed; server smtp.gmail.com[64.233.186.108] said: 535-5.7.8 Username and Password not accepted. For more information, go to?535 5.7.8  https://support.google.com/mail/?p=BadCredentials 41be03b00d2f7-a31d5da4f97sm8100354a12.55 - gsmtp
Jan 14 09:43:14 lfernando postfix/smtp[8271]: connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable
Jan 14 09:43:14 lfernando postfix/smtp[8271]: C6DA917812FF: to=<luisfernandopenhadecamargo@gmail.com>, relay=none, delay=2.4, delays=0.01/0.06/2.3/0, dsn=4.4.1, status=deferred (connect to smtp.gmail.com[2800:3f0:4003:c00::6d]:587: Network is unreachable)
