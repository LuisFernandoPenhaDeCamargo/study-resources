# Gerenciamento de Permissões de Execução em Contêineres Docker

Se o binário já possui permissão de execução no sistema de arquivos do seu host e você copia para dentro do contêiner usando o comando `COPY` ou `ADD`, o comportamento dependerá do sistema de arquivos utilizado no contêiner e da forma como o Docker lida com as permissões durante a cópia.

### 1. Permissões são preservadas por padrão

Ao usar `COPY` ou `ADD`, o Docker geralmente preserva as permissões do arquivo original, incluindo a permissão de execução, se ela já estiver configurada.

```Bash
$ chmod +x app # Concedendo permissão no host.
```

```Dockerfile
COPY ./app /usr/src/app
WORKDIR /usr/src/app
CMD ["./app"]
```

Nesse caso, como o binário já tem permissão de execução, não será necessário concedÊ-la novamente dentro do contêiner.

### 2. Casos onde a permissão pode ser perdida

- Se o arquivo é modificado ou recriado antes da cópia (por exemplo, em etapas de build automatizadas), as permissões podem ser resetadas
- Em alguns sistemas de arquivos ou situações específicas, as permissões podem não ser preservadas corretamente, o que exigiria o uso de `chmod` no contêiner

```Dockerfile
COPY ./app /usr/src/app/
WORKDIR /usr/src/app

# Concedendo permissão explicitamente.
RUN chmod +x ./app
CMD ["./app"]
```

# Melhor Prática

Mesmo que as permissões sejam preservadas na maioria dos casos, conceder explicitamente a permissão no Dockerfile garante consistência e evita erros inesperados ao mover entre sistemas diferentes.

```Dockerfile
RUN chmod +x ./app
```

Isso é especialmente importante se você compartilhar a imagem em ambientes variados ou se o arquivo for manipulado de formas que alterem as permissões no processo de build.

# [[ Voltar para: Docker ]](./1-docker.md)