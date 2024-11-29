# Entendendo Diretórios de Trabalho no Docker e a Palavra-chave `WORKDIR`

## Sumário

- [O que é um Diretório de Trabalho no Docker?](#o-que-eh-diretorio-trabalho-docker)
- [O que é a Palavra-Chave `WORKDIR`?](#o-que-eh-palavra-chave-workdir)
- [Exemplos Simples com `WORKDIR`](#exemplos-simples-workdir)
- [O que Acontece se o Diretório Não Existir](#o-que-acontece-diretorio-nao-existir)
- [Configuração de Múltiplos Diretórios de Trabalho](#configuracao-multiplos-diretorios-trabalho)
- [Boas Práticas ao Usar `WORKDIR`](#boas-praticas-usar-workdir)
- [Conclusão](#conclusao)

# <a id="o-que-eh-diretorio-trabalho-docker">O que é um Diretório de Trabalho no Docker?</a>

Um diretório de trabalho (work directory) no Docker é o local padrão dentro de um contêiner onde os comandos serão executados, a menos que especificado de outra forma. Pense nele como o "ponto de partida" para as operações de sua aplicação ou scripts.

- O diretório de trabalho pode ser configurado para que comandos como `RUN`, `CMD`, e `ENTRYPOINT` sejam executados a partir de um local específico
- Sem um diretório de trabalho configurado, o contêiner utiliza o diretório raiz (`/`) como padrão

# <a id="o-que-eh-palavra-chave-workdir">O que é a Palavra-Chave `WORKDIR`?</a>

A palavra-chave `WORKDIR` é uma instrução no Dockerfile usada para definir ou alterar o diretório de trabalho padrão dentro do contêiner.

- Essa configuração persiste para todos os comandos subsequentes no Dockerfile, até que seja alterada novamente
- Você pode criar e alternar entre mútiplos diretórios de trabalho, mas apenas um estará ativo por vez

### Sintaxe Básica

```Dockerfile
WORKDIR path
```

- `path`**:** o caminho absoluto ou relativo para o diretório desejado dentro do contêiner

# <a id="exemplos-simples-workdir">Exemplos Simples com `WORKDIR`</a>

Cenário: configurando o diretório de trabalho.

Imagine que você está configurando um contêiner para executar um binário chamado `app` localizado no diretório **/usr/src/app**. Sem o `WORKDIR`, seria necessário especificar o caminho completo ao executar o binário.

```Dockerfile
# Dockerfile.
FROM ubuntu:latest

# Definindo o diretório de trabalho.
WORKDIR /usr/src/app

# Copiando o binário para o contêiner.
COPY ./app /usr/src/app/

# Executando o binário.
CMD ["./app"]
```

Benefício: como o diretório de trabalho foi configurado, o comando `CMD` é executado no diretório **/usr/src/app**, permitindo que você chame o binário diretamente com `./app` ao invés de `/usr/src/app/app`.

# <a id="o-que-acontece-diretorio-nao-existir">O que Acontece se o Diretório Não Existir</a>

Se o caminho especificado no `WORKDIR` não existir, o Docker o criará automaticamente ao construir a imagem. Isso simplifica o processo de configuração, eliminando a necessidade de criar diretórios manualmente.

# <a id="configuracao-multiplos-diretorios-trabalho">Configuração de Múltiplos Diretórios de Trabalho</a>

Você pode definir múltiplos diretórios de trabalho em diferentes partes do Dockerfile. Cada instrução `WORKDIR` redefine o diretório ativo.

```Dockerfile
# Dockerfile.
FROM ubuntu:latest

# Primeiro diretório de trabalho.
WORKDIR /app

# Cria um subdiretório dentro /app
WORKDIR /app/data

# Cria um novo diretório independente.
WORKDIR /logs

# Copia um arquivo para /logs (diretório de trabalho atual)
COPY log.txt

# Retorna ao diretório /app
WORKDIR /app

# Executa comandos dentro de /app
RUN echo "We are in /app" > status.txt
```

# <a id="boas-praticas-usar-workdir">Boas Práticas ao Usar `WORKDIR`</a>

1. **Organize os diretórios:** use diretórios de trabalho para manter a aplicação e os dados organizados
2. **Evite múltiplos** `WORKDIR` **sem necessidade:** alterar constantemente o diretório pode dificultar a manutenção
3. **Combine com o comando** `COPY`**:** configure o `WORKDIR` antes de copiar arquivos ou configurar o ambiente

# <a id="conclusao">Conclusão</a>

A instrução `WORKDIR` é uma ferramenta poderosa para configurar o ambiente interno de um contêiner no Docker. Ela simplifica a execução de comandos, organiza os arquivos da aplicação e automatiza a criação de diretórios durante o build da imagem.

# [[ Voltar para: Docker ]](./1-docker.md)