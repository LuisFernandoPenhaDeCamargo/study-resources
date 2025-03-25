# 1️⃣ Como Instalar o Docker (Linux)

## 🔧 Pré-requisitos

Antes de iniciar a instalação, certifique-se de que:

- Você possui **acesso root** ou privilégios de **sudo** no sistema
- O sistema operacional é compatível com o Docker (ex: Ubuntu, Debian, Fedora, CentOS)
- A conexão com a internet está disponível para baixar os pacotes

## 📥 Passo a Passo

### 1️⃣ Atualizar o Sistema

Atualize os pacotes existentes para garantir compatibilidade:

```Bash
$ sudo apt update && sudo apt upgrade -y
```

### 2️⃣ Instalar Dependências

Instale os pacotes necessários para o Docker:

```Bash
$ sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
```

### 3️⃣ Adicionar o Repositório do Docker

Adicione a chave GPG do Docker e o repositório oficial:

```Bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

```Bash
$ echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 4️⃣ Instalar o Docker

Atualize a lista de pacotes novamente e instale o Docker:

```Bash
$ sudo apt update
```

```Bash
$ sudo apt install -y docker-ce docker-ce-cli containerd.io
```

### 5️⃣ Verificar a Instalação

Confirme que o Docker foi instalado corretamente:

```Bash
$ docker --version
```

## 🧪 Testando o Docker

Execute o comando a seguir para testar se o Docker está funcionando corretamente:

```Bash
$ sudo docker run hello-world
```

Se o Docker estiver funcionando corretamente, você verá uma mensagem informando que a instalação aparenta estar funcionando corretamente, juntamente com os passos realizados para gerar essa mensagem.

## 🌟 Resumo

1. Atualize seu sistema e instale dependências
2. Adicione o repositório oficial do Docker
3. Instale o Docker e verifique a versão
4. Teste a instalação com o comando `sudo docker run hello-world`

> **Nota:** As instruções acima foram baseadas no Ubuntu, mas podem ser adaptadas para outras distribuições.

## [[ Voltar para: Instalação e Configuração ]](./instalacao-configuracao.md)