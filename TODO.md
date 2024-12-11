# TODO

Este documento lista tópicos a serem estudados ou desenvolvidos.

- **Tópicos Não Classificados:** Ideias iniciais ou conceitos que ainda precisam ser organizados.
- **Tópicos Classificados:** Categorias organizadas com objetivos e contextos claros.

## Tópicos Não Classificados

- CORS
    + Como o código foi obtido através de um domínio, se este código faz uma requisição para outro domínio, o navegador percebe isso e é ai que é aplicado o CORS?
    + Quais são as flags relacionadas ao CORS?
- Quando você insere uma URL no navegador, você obtém o código daquela URL e ele é executado localmente? Aonde o código fica salvo? Somente no processo?
- O que é Preflight?
- O que é DNS?
- O que é um domínio?
- Droplet (DO) vs EC2 (AWS)
- O que são Sistemas Embarcados?
- web3 é o mesmo que Blockchain?
- O que é Blockchain?
- AWS
    + Serviços
- NGINX
- SQL
- Python
- Rust
- Terraform
- Grafana

## Tópicos Classificados

### Orion Games

- Conseguir executar a BlackBox a partir do contêiner
    + Fazer um script que seja executado pelo navegador e faça a requisição para o Data-Server
- Documentar o processo de criação do contêiner da BlackBox
- Consigo mover **/src/migrate.js** (Data-API) para **/src/services**?
- Adicionar um linter, verificar sobre o que se trata as suas configurações e configurá-lo

### Docker

- Considerando que uma imagem Docker é uma fatia de um sistema de arquivos. Ela já possui um sistema hierárquico de arquivos padrão?
- Se eu passo como argumento para o WORKDIR um diretório existente na imagem base; ele já existe, então eu irei modificá-lo?
- O que seria acessar arquivos de host no contêiner?
- Você consegue inserir, substituir e remover arquivos de um contêiner ou de uma imagem?
- Você consegue ler informações de arquivos dentro de contêiners?
- Quando você altera contêiners e não o Dockerfile, as mudanças não são persistentes, correto?
- Quando você copia arquivos para dentro de um Dockerfile, eles existem dentro do Dockerfile? Eu posso apagá-los do meus sistema hierárquico de arquivos, por exemplo?
- Aonde ficam armazenadas as imagens?
- Imagens são persistentes
- Contêiners são efêmeros por padrão
- Qual é o padrão em relação ao Docker, quando temos que executar um binário que não precisa ficar sendo executado o tempo todo?
- Instalando o Docker
- Erro

```Bash
docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied.
```

- `docker build`
- `docker run`
- `docker ps`
- `docker cp`
- `docker stop`
- `docker rm`
- `docker images`
- `docker rmi`
- `docker commit`

### Testes Automatizados

- O que são Testes E2E?
- O que são Testes de Contatos?
- O que são Testes de Stress?
- O que são Testes de Carga?
- Sobre o que se trata "Boundary Tests"
- Quais são os "testes de segurança" existentes?
- O que são Testes de Intrusão?

### JavaScript

- Flag `--exit` (Mocha)
- Flag `--watch` (Mocha)
- Cucumber
- Exclamação seguida de exclamação (`!!`) transforma o valor em booleano?
- Qual a diferença entre importar `crypto` ou `node:crypto`, por exemplo?
- Funções tem uma propriedade nome (`func.name`, por exemplo)?
    + Aparentemente, nem todas
- `fetch`
- Especificadores de formato (`%`, por exemplo)
- O que a sintaxe `@type {import('jest').Config}` pontua? (o foco é a sintaxe e não o Jest)
- `node:http` vs `node:http/2` vs `node:https` vs Express
- Eloquent JavaScript
- Rocketseat
- W3Schools
- MDN

### Markdown

- Como estruturar e organizar títulos em Markdown?
- O que é o arquivo **README**?
- O que é o arquivo **CONTRIBUTING**?
- O que é o arquivo **TODO**?

### Organizar

1. Rotina de Sábado
2. Rotina de Domingo
3. Google Drive
4. Google Chrome
5. Notion