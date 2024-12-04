# O que é Docker?

Docker é uma plataforma de software que permite criar, gerenciar e executar contêineres — ambientes isolados e portáteis que contêm tudo o que é necessário para executar uma aplicação, incluindo o código, bibliotecas, dependências e configurações. Ele facilita o desenvolvimento, a implantação e a execução de aplicativos de maneira consistente, independentemente do ambiente.

# Componentes Principais do Docker

### 1. Contêineres

Unidades lever e portáteis que empacotam a aplicação e suas dependências. São isolados, mas compartilham o mesmo kernel do sistema operacional

### 2. Imagens

Modelos imutáveis usados para criar contêineres. Uma imagem define o ambiente necessário para executar a aplicação e pode ser criada a partir de um arquivo chamado Dockerfile.

### 3. Dockerfile

Um arquivo de texto com instruções para construir uma imagem Docker. Ele especifica o sistema operacional base, as dependências, os comandos a serem executados e outros detalhes necessários.

### 4. Docker Engine

O núcleo do Docker que gerencia a criação, execução e destruição do contêineres.

### 5. Docker Hub

Um repositório online para armazenar e compartilhar imagens Docker, funcionando como uma "loja" de contêineres.

# Benefícios do Docker

### 1. Portabilidade

Os contêineres podem ser executados em qualquer ambiente que tenha o Docker instalado, garantindo consistência entre ambientes de desenvolvimento, teste e produção.

### 2. Eficiência de recursos

Os contêineres compartilham o mesmo kernel do sistema operacional, tornando-os mais leves e rápidos do que máquinas virtuais (VMs).

### 3. Isolamento

Cada contêiner opera de forma isolada, evitando conflitos entre dependências e aumentando a segurança.

### 4. Escalabilidade

Permite criar e gerenciar vários contêineres facilmente, ideal para arquiteturas de microsserviços.

### 5. Integração com CI/CD

Facilita pipelines de integração e entrega contínua, permitindo testar e implantar rapidamente.

# Uso Comum do Docker

- Empacotar e distribuir aplicações
- Testar aplicações em ambientes idênticos aos de produção
- Construir e gerenciar microsserviços
- Configurar ambientes de desenvolvimento rapidamente

# [[ Voltar para: Docker ]](./1-docker.md)