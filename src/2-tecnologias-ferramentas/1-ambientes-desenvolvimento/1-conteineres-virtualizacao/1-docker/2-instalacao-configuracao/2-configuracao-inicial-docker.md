# 2️⃣ Configuração Inicial do Docker (Permissões de Usuário, Grupos, etc.)

Após instalar o Docker, é importante realizar algumas configurações iniciais para garantir o funcionamento correto e a segurança do ambiente. Vale destacar que essas configurações são recomendadas, mas não obrigatórias. Você já possui o necessário para começar a utilizar o Docker em seu processo inicial de aprendizagem e pode realizar as configurações abaixo conforme adquirir mais familiaridade com o tema.

## 🔧 Permissões e Grupos

### 1️⃣ Verificar o Serviço do Docker

Certifique-se de que o serviço Docker está ativo e funcionando:

```Bash
$ systemctl status docker
```

Se não estiver em execução, inicie o serviço:

```Bash
$ systemctl start docker
```

Opcionalmente, configure o Docker para iniciar automaticamente com o sistema:

```Bash
$ systemctl enable docker
```

### 2️⃣ Adicionar Usuário ao Grupo Docker

Por padrão, é necessário usar `sudo` para executar comandos Docker. Para evitar isso e permitir que um usuário execute comandos diretamente, adicione-o ao grupo `docker`:

```Bash
$ sudo usermod -aG docker $USER
```

> **Nota:** Substitua `$USER` pelo nome do usuário, se necessário.

Após adicionar o usuário ao grupo, aplique a alteração:

```Bash
$ newgrp docker
```

⚠️ **Aviso de segurança:** adicionar usuários ao grupo `docker` concede privilégios equivalentes ao de root. Certifique-se de que apenas usuários confiáveis sejam incluídos no grupo.

### 3️⃣ Verificar a Configuração

Teste a configuração executando um comando Docker sem `sudo`:

```Bash
$ docker run hello-world
```

Se o comando funcionar corretamente, a configuração está concluída.

## 🛠️ Configurações Avançadas

### 1️⃣ Configurar o Proxy (se Necessário)

Se você estiver atrás de um proxy, crie ou edite o arquivo de configuração do Docker para definir as variáveis de ambiente:

```Bash
$ sudo mkdir -p /etc/systemd/system/docker.service.d
```

```Bash
$ sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
```

Adicione as seguintes linhas, ajustando conforme necessário:

```ini
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:8080"
Environment="HTTPS_PROXY=http://proxy.example.com:8080"
Environment="NO_PROXY=localhost,127.0.0.1"
```

Reinicie o serviço para aplicar as alterações:

```Bash
$ sudo systemctl daemon-reload
```

```Bash
$ sudo systemctl restart docker
```

### 2️⃣ Configurar Diretório de Armazenamento

Por padrão, o Docker armazena dados em **/var/lib/docker**. Se você desejar alterar essa localização (ex: para outro disco ou partição):

- Pare o serivço Docker:  

  ```Bash
  ```

## [[ Voltar para: Instalação e Configuração ]](./instalacao-configuracao.md)

Por padrão, o Docker armazena dados em `/var/lib/docker`. Se você desejar alterar essa localização (ex.: para outro disco ou partição):  

- Pare o serviço Docker:  

  ```bash
  sudo systemctl stop docker
  ```  

- Mova os dados para o novo diretório:  

  ```bash
  sudo mv /var/lib/docker /novo/caminho/docker
  ```  

- Configure o novo diretório editando o arquivo de configuração:  

  ```bash
  sudo nano /etc/docker/daemon.json
  ```  

  Adicione:  

  ```json
  {
    "data-root": "/novo/caminho/docker"
  }
  ```  

- Reinicie o serviço:  

  ```bash
  sudo systemctl start docker
  ```  

---

## 🔐 Configurações de Segurança  

1. **Limitar acesso ao Docker API Socket:**  
   O socket padrão `/var/run/docker.sock` concede acesso total ao Docker. Use permissões adequadas para limitar o acesso.  

2. **Habilitar Logs:**  
   Configure o Docker para registrar logs detalhados. Isso ajuda no monitoramento e na resolução de problemas.  

3. **Ativar AppArmor ou SELinux:**  
   Proteja os contêineres usando políticas de segurança adicionais, como AppArmor ou SELinux, dependendo da sua distribuição Linux.  

---

## 📚 Resumo  

1. **Ative e configure o serviço Docker:** Verifique se ele inicia automaticamente.  
2. **Permissões:** Adicione o usuário ao grupo `docker` para facilitar o uso.  
3. **Proxy e diretórios:** Ajuste conforme a infraestrutura.  
4. **Segurança:** Limite acessos e habilite medidas de proteção.  

Essas configurações garantem um ambiente funcional, seguro e otimizado para o uso do Docker.  

## [[ Voltar para: Instalação e Configuração ]](./instalacao-configuracao.md)  

---  

Ficou claro ou deseja incluir mais detalhes, como troubleshooting ou práticas específicas de segurança? 😊