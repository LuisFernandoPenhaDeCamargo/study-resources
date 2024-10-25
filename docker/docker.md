# Docker

### 1. O que é Docker?

Docker é uma plataforma que permite criar, empacotar e executar aplicações em **containers**. Containers são ambientes isolados que incluem tudo o que uma aplicação precisa para rodar, como código, dependências e configurações. Eles são mais leves e eficientes do que máquinas virtuais porque compartilham o kernel do sistema operacional.

### 2. Por que usar Docker?

Docker facilita o desenvolvimento e a implantação de aplicações porque:

- **Elimina problemas de compatibilidade:** a aplicação roda da mesma forma em qualquer lugar, pois os containers contêm tudo o que a aplicação precisa
- **Isolamento:** cada container é isolado e pode ter suas próprias configurações, dependências e bibliotecas
- **Escabilidade:** facilita a escalabilidade de aplicações em ambientes de produção

### 3. Principais componentes do Docker

- **Imagem:** uma imagem Docker é um "modelo" que contém o código e as dependências necessárias para rodar uma aplicação. Você cria containers a partir de imagens
- **Container:** um container é uma instância de uma imagem em execução. Cada vez que você inicia uma imagem, você cria um container
- **Dockerfile:** é um arquivo de texto que define uma imagem. Nele, você descreve tudo o que precisa ser instalado e configurado para que a aplicação funcione
- **Docker Hub:** um repositório onde você pode buscar imagens prontas para uso (como banco de dados, servidores web, etc.)

### 4. Principais comandos para começar

Aqui estão alguns comandos básicos para você praticar:

- `docker --version`**:** verifica a versão do Docker instalada
- `docker pull A< nome da imagem >`**:** faz o download de uma imagem do Docker Hub
- `docker run A< nome da imagem >`**:** cria e inicia um container a partir de uma imagem
- `docker ps`**:** lista dos os containers em execução
- `docker stop A< id do container >`**:** para um container em execução
- `docker rm A< id do container >`**:** remove um container
- `docker rmi A< nome da imagem >`**:** remove uma imagem

### 5. Exemplo

Para começar, podemos rodar um container bem simples com uma imagem oficial do Docker. Por exemplo:

1. **Baixe a imagem do Nginx (um servidor web leve):**

```Bash
$docker pull nginx
```

2. **Rode o container:**

```Bash
$docker run -d -p 8080:80 nginx
```

Esse comando cria um container e mapeia a porta 8080 do seu sistema para a porta 80 do container (onde o Nginx está rodando). Se você acessar `http://localhost:8080` no navegador, verá o Nginx rodando.