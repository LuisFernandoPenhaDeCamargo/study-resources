# Gerenciamento e Configuração de Usuários no Docker

Dentro das imagens Docker existem usuários, assim como em um sistema operacional normal. Uma imagem Docker é essecialmente uma "fatia" de um sistema de arquivos, geralmente baseada em um sistema operacional Linux minimalista. Assim, ela herda o conceito de usuários, permissões e grupos.

# Detalhes sobre Usuários Dentro de Imagens Docker

### 1. Usuário padrão (root)

- Por padrão, a maioria das imagens Docker utiliza o usuário root para executar comandos no contêiner
- Isso é útil para flexibilidade durante o desenvolvimento, mas pode representar um risco de segurança em ambientes de produção, pois o root no contêiner tem permissões administrativas completas

### 2. Criação de outros usuários

- É possível criar e configurar usuários adicionais dentro da imagem Docker
- Isso pode ser feito no Dockerfile usando comandos como `RUN adduser` ou `RUN useradd` (dependendo do sistema base)

### 3. Alterando o usuário no contêiner

- A palavra-chave `USER` no Dockerfile define qual usuário será utilizado para executar os comandos a partir daquele ponto
- Exemplo:

```Dockerfile
RUN adduser --disabled-password myuser
USER myuser
```

- Essa prática é recomendada para limitar permissões e aumentar a segurança

### 4. Usuário do host x usuário do contêiner

- O usuário dentro do contêiner não está automaticamente relacionado ao usuário no host
- Quando os arquivos são criados dentro contêiner, eles podem pertencer ao ID de usuário (UID) configurado no contêiner, que pode não corresponder a um usuário no host

### 5. Especificando o usuário na execução

É possível especificar qual usuário executar no momento em que o contêiner é iniciado usando a flag `--user`

```Bash
$ docker run --user 1001 my-image
```

### 6. Segurança e usuários não-root

- Em ambientes de produção, é uma boa prática configurar e usar um usuário não-root para minimizar riscos de segurança
- Muitas imagens oficiais no Docker Hub incluem instruções ou já vêm configuradas para rodar com um usuário não-root

# Benefícios de Gerenciar Usuários em Imagens

- **Segurança:** reduz o impacto de possíveis vulnerabilidades, especialmente em sistemas em que o contêiner interage com recursos sensíveis
- **Controle:** permite ajustar permissões e o ambiente de execução para diferentes necessidades de aplicativos

# Exemplo de Configuração no Dockerfile

```Dockerfile
FROM ubuntu:latest

# Cria um novo usuário.
RUN useradd -m myuser

# Define o diretório de trabalho e altera o usuário.
WORKDIR /app
USER myuser

# Copia arquivos para o contêiner e executa comandos.
COPY . .
CMD ["bash"]
```

Nesse exemplo, todas as operações a partir do comando `USER myuser` serão realizadas com o usuário `myuser`.

# [[ Voltar para: Docker ]](./1-docker.md)