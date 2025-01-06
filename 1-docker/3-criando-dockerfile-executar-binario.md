# Criando um Dockerfile para Executar um Binário

# Introdução

O Dockerfile é o arquivo de configuração que descreve como criar uma imagem Docker. Aqui, vamos aprender a criar um Dockerfile para configurar um ambiente que execute um binário.

# Estrutura do Dockerfile

```Dockerfile
# Seleciona a imagem base.
FROM ubuntu:20.04

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o binário para dentro da imagem.
COPY my_binary

# Dá permissão de execução ao binário.
RUN chmod +x my_binary

# Comando padrão para executar o binário.
CMD ["./my_binary"]
```

## Explicação dos Comandos

- `FROM ubuntu:20.04`**:** define a imagem base. Aqui usamos o Ubuntu 20.04, mas você pode escolher outro que seja adequado ao binário
- `WORKDIR /app`**:** define o diretório de trabalho dentro do contêiner onde os arquivos serão copiados e os comandos executados
- `COPY my_binary`**:** copia o binário do host para o diretório de trabalho do contêiner
- `RUN chmod +x my_binary`**:** garante que o binário tenha permissão de execução dentro do contêiner
- `CMD ["./my_binary"]`**:** especifica o comando padrão que será executado quando o contêiner for iniciado

# Construindo a Imagem

Com o Dockerfile pronto, o próximo passo é construir a imagem Docker:

```Bash
$ docker build -t my-binary-image .
```

- `-t my-binary-image`**:** define o nome da imagem criada
- O ponto (`.`) indica que o Dockerfile está no diretório atual

# Executando o Binário

Depois de criar a imagem, você pode executar o binário com o comando:

```Bash
$ docker run --rm my-binary-image
```

- `--rm`**:** remove o contêiner automaticamente após a execução

# Exemplos de Ajustes

- **Passando argumentos para o binário:** caso o binário aceite argumentos, você pode passá-los ao contêiner

```Bash
$ docker run --rm my-binary-image arg1 arg2
```

- **Montando volumes:** para acessar arquivos do host no contêiner

```Bash
$ docker run --rm -v $(pwd):/app my-binary-image
```

# Conclusão

Este é um exemplo básico que pode ser ajustado conforme as necessidades do binário ou do ambiente. Caso precise incluir dependências adicionais ou configurar variáveis de ambiente, basta adicionar os comandos necessários no Dockerfile.

# [[ Voltar para: Docker ]](./1-docker.md)