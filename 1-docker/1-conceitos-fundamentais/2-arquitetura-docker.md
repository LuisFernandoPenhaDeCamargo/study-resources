# 2️⃣ Arquitetura Docker (Docker Engine, Daemon, CLI e Docker Desktop)

A arquitetura do Docker é composta por vários componentes que trabalham juntos para criar, gerenciar e executar contêineres. Compreender essa estrutura é fundamental para entender o funcionamento interno do Docker e a interação entre suas partes.  

A seguir, os principais componentes da arquitetura Docker:

## 🔥 1. Docker Engine

O **Docker Engine** é a **plataforma principal** do Docker, responsável por executar e gerenciar contêineres. Ele é composto por três partes principais:

- **Docker Daemon:** Serviço que executa as operações principais, como criar, executar e monitorar contêineres
- **REST API:** Permite a comunicação entre o cliente (CLI ou outras ferramentas) e o Docker Daemon
- **Docker CLI (Interface de Linha de Comando):** Ferramenta de linha de comando usada para enviar comandos ao Docker Daemon

> **Resumindo:** O Docker Engine é o "motor" que faz o Docker funcionar. Ele ouve comandos do cliente (CLI) e os executa por meio do Daemon.

## 🔧 2. Docker Daemon (`dockerd`)

O **Docker Daemon** (`dockerd`) é o **coração do Docker**. Ele é responsável por executar e gerenciar operações relacionadas a contêineres, imagens, redes e volumes. Suas principais funções incluem:

- **Gerenciar contêineres** (iniciar, parar, pausar e remover contêineres)
- **Criar e gerenciar imagens Docker**
- **Controlar a rede dos contêineres**
- **Gerenciar volumes e armazenamento de dados persistentes**

O Daemon **funciona em segundo plano**, operando como um processo contínuo que escuta comandos enviados pela CLI ou por outras ferramentas que utilizam a API REST para comunicação.

> **Exemplo prático:** Quando o comando `docker run` é executado, a CLI envia uma solicitação ao Daemon via API. O Daemon, então, baixa ou busca a imagem necessária, cria o contêiner e executa o aplicativo.

Em resumo, o Daemon é quem faz o "trabalho pesado". Quando você envia um comando via **Docker CLI**, o Daemon processa e executa.

## 💻 3. Docker CLI (Interface de Linha de Comando)

A **Docker CLI** (`docker`) é a **interface de linha de comando** usada para interagir com o Docker de forma direta no terminal.

Com ela, você pode:

- **Criar e executar contêineres** (`docker run`)
- **Gerenciar imagens** (`docker build`, `docker pull`, `docker images`)
- **Visualizar contêineres ativos** (`docker ps`)
- **Manipular volumes e redes** (`docker volume`, `docker network`)

> **Resumindo:** O Docker CLI permite que o usuário "fale" com o Docker Daemon para realizar operações. Ele converte os comandos do terminal em solicitações enviadas para o Daemon por meio da API REST.

**Exemplo de comando comum:**

```Bash
$ docker run -d -p 8080:80 nginx
```

Esse comando faz o CLI enviar uma solicitação ao Daemon para:

1. **Baixar a imagem nginx** (caso ainda não esteja presente localmente)
2. **Criar um contêiner** usando a imagem
3. **Expor a porta 80 do contêiner** para a porta 8080 no seu sistema local

## 🖥️ 4. Docker Desktop

O **Docker Desktop** é uma aplicação necessária para utilizar o Docker em Windows e macOS, já que esses sistemas não possuem suporte nativo ao kernel Linux. No Linux o Docker pode ser executado de forma **nativa**, sem a necessidade do Docker Desktop.

O Docker Desktop contém:

- **Docker Engine** (Daemon, CLI e API REST)
- **Interface gráfica (GUI)** que facilita a visualização de contêineres, imagens e redes sem usar a CLI
- **Ferramentas adicionais:** Como Docker Compose, Kubernetes e recursos de configuração de ambiente

> **Importante:** No Windows e no macOS, o Docker Desktop executa o Docker Engine em uma máquina virtual leve, pois esses sistemas não possuem os recursos de isolamento de contêineres do kernel Linux.

## 🔍 Resumo Visual da Arquitetura Docker

```
Docker Engine
+-----------------------------------+
|  +-----------------------------+  |
|  |         Docker CLI          |  |
|  +-----------------------------+  |
|                |                  |
|     API REST (intermediária)      |
|                ↓                  |
|  +-----------------------------+  |
|  |        Docker Daemon        |  |
|  +-----------------------------+  |
|       |           |         |     |
|       ↓           ↓         ↓     |
| [Contêineres] [Imagens] [Volumes] |
+-----------------------------------+
```

## 📘 Comparação Resumida dos Componentes

| Componente     | Função Principal                                       | Quem Usa?                  |
|:---------------|:-------------------------------------------------------|:---------------------------|
| Docker Engine  | Conjunto que integra CLI, Daemon e API REST            | Usuário, Sistema           |
| Docker Daemon  | Controlar contêineres, imagens, redes e volumes        | Processo em segundo plano  |
| Docker CLI     | Enviar comandos para o Daemon via API REST             | Usuário (linha de comando) |
| Docker Desktop | Interface para instalar e usar Docker no Windows/macOS | Usuário (gráfico)          |

## 📝 Resumo Final

A **Arquitetura do Docker** se baseia na interação entre o **Docker CLI**, a **API REST** e o **Docker Daemon**. O usuário utiliza a CLI para enviar comandos, a API REST age como intermediária, permitindo a comunicação entre a CLI e o Daemon, e o Daemon executa as operações solicitadas. No Windows e macOS, o **Docker Desktop** facilita o uso do Docker ao fornecer uma interface gráfica.

## [[ Voltar para: Conceitos Fundamentais ]](./conceitos-fundamentais.md)