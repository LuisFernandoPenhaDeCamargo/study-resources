# Comandos de Contêineres

## Sumário

- `docker run A< imagem >` – Cria e executa um contêiner a partir de uma imagem
- `docker run -it A< imagem > /bin/bahs` – Inicia um contêiner interativo com acesso ao shell Bash
- `docker ps` – Lista os contêineres em execução
- `docker ps -a` – Lista todos os contêineres (parados e ativos)
- `docker start A< id/nome >` – Inicia um contêiner parado
- `docker stop A< id/nome >` – Para um contêiner em execução
- `docker kill A< id/nome >` – Finaliza um contêiner forçadamente
- `docker restart A< id/nome >` – Reinicia um contêiner
- `docker rm A< id/nome >` – Remove um contêiner
- `docker logs A< id/nome >` – Visualiza logs do contêiner
- `docker exec -it A< id/nome > /bin/bash` – Acessa o terminal de um contêiner em execução
- `docker cp A< caminho-origem > A< caminho-destino >` – Copia arquivos entre contêiner e host
- `docker attach A< id/nome >` – Conecta-se ao terminal de um contêiner em execução
- `docker commit A< id/nome > A< nome da imagem >` – Cria uma imagem a partir de um contêiner existente

## [[ Voltar para: Docker ]](../docker.md)