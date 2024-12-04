# TODO

- Conseguir executar a BlackBox a partir do contêiner
- Documentar o processo de criação do contêiner da BlackBox
    + `ldd`
- Aplicar na rota da BlackBox o middleware responsável pelo CORS
    + 'Access-Control-Allow-Origin: https://orion.magicis.com.br:3030/'
    + 'Access-Control-Allow-Origin: https://orion.magicis.com.br:3020/'
    + 'Access-Control-Allow-Methods: POST'
- Fazer um script que seja executado pelo navegador e faça uma requisição para o Data-Server
- Consigo mover **/migrate.js** (Data-API) para **/services**?
- Adicionar o linter, verificar sobre o que se trata as configurações e configurá-lo

# Estudar (Itens Específicos)

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
- 

```Bash
$ docker run help
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
- Quando você insere uma URL no navegador, você obtém o código daquela URL e ele é executado localmente? Aonde o código fica salvo? Somente no processo?
- Como o código foi obtido através de um domínio, se este código faz uma requisição para outro domínio, o navegador percebe isso e é ai que é aplicado o CORS?
- O que é o CORS?
- O que é Preflight?
- O que é DNS?
- O que é um domínio?
- Droplet (DO) x EC2 (AWS)
- Sobre o que se trata "Boundary Tests"
- O que são Testes E2E?
- O que são Testes de Contatos?
- O que são Testes de Stress?
- O que são Testes de Carga?
- Quais são os "testes de segurança" existentes?
- O que são Testes de Intrusão?
- O que são Sistemas Embarcados?
- web3 é o mesmo que Blockchain?
- O que é Blockchain?

## JavaScript

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
- `node:http` x `node:http/2` x `node:https` x Express

# Estudar (Tópicos)

1. JavaScript
    + Eloquent JavaScript
    + Rocketseat
    + W3Schools
    + MDN
2. Docker
    + https://docs.docker.com/get-started/docker-overview/
    + https://docs.docker.com/guides/
    + https://docs.docker.com/guides/nodejs/
    + https://labs.play-with-docker.com/ (Ambiente de execução)
3. AWS
    + Serviços
    + Certificações
        - Certificação Cloud Practitioner
        - Certificação Developer Associate
        - Certificação Solutions Architect
4. NGINX
5. SQL
6. Python
7. Rust
8. Terraform
9. Grafana

# Organizar

1. Rotina de Sábado
2. Rotina de Domingo
3. Google Drive
4. Google Chrome
5. Notion

PIRATE KING - 17/09/2022
1. People love modesty, but they do not hire it
2. Make a strong impression with a single page
3. Make it easy to learn about you
4. Describe yourself with skills, not words
5. Make a preemptive strike  
    "Experience" before "Education".
6. Exagerate  
    Making up a baseless story is deception, but adding spices to your presentation is a tatic.
7. Quantify  
    However, have supporting claims.
8. Provide business context
9. Stay relevant  
    Put more emphasis on recent work.
10. Value yourself