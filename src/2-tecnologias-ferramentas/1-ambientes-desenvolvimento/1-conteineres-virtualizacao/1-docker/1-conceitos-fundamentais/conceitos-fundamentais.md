# 1️⃣ Conceitos Fundamentais

O objetivo desta seção é introduzir os principais conceitos teóricos relacionados ao Docker. Aqui, o usuário terá uma visão inicial sobre o que é Docker, sua utilidade, as diferenças em relação a outras tecnologias de conteinerização e como ele se insere no ecossistema de desenvolvimento e operações. Esta seção estabelece a base necessária para os tópicos mais práticos e aprofundados apresentados posteriormente.

## Sumário

1. [O que é Docker e para que Serve?](./1-docker.md)
2. [Arquitetura Docker (Docker Engine, Daemon, CLI e Docker Desktop)](./2-arquitetura-docker.md)
3. O que são Imagens e Contêineres (Conceito Geral)
4. Diferença entre Contêineres e Máquinas Virtuais (VMs)
5. Docker vs Outras Ferramentas de Conteinerização

## [[ Voltar para: Docker ]](../docker.md)

### 🔍 **Diferença entre Docker e Máquinas Virtuais (VMs)**
| **Critério**          | **Docker (Containers)**      | **Máquinas Virtuais (VMs)**     |
|----------------------|-----------------------------|-----------------------------------|
| **Isolamento**        | Compartilha o kernel do SO   | Possui sistema operacional próprio|
| **Desempenho**        | Leve e rápido                | Pesado e lento                    |
| **Portabilidade**     | Altamente portátil           | Precisa reconfigurar o ambiente   |
| **Tamanho da Imagem** | Menor (MBs)                  | Maior (GBs)                       |
| **Tempo de Inicialização** | Milissegundos           | Minutos                           |
| **Uso de Recursos**   | Usa menos CPU e memória      | Consome mais recursos             |