5️⃣ Como Funciona a Execução de Contêineres

Onde deve ficar? → Mover para a seção de "Execução de Contêineres" (nova subseção sugerida)
Justificativa: Esse tópico já se aproxima de um processo prático, quase operacional, e não é um "conceito fundamental" no mesmo nível que "O que é Docker" ou "Arquitetura Docker". Ele detalha o fluxo de execução de contêineres e, por isso, poderia ser parte de uma subseção prática dentro de Execução de Contêineres.
Nova localização sugerida:
css
Copiar código
└── 3-imagens-docker
└── 4-dockerfile
└── 5-rede-docker
└── 6-volumes-persistencia-dados
└── 7-execucao-conteineres 
    └── 1-como-funciona-a-execucao-de-conteineres.md
Ação: Mover para a subseção 7 - Execução de Contêineres.

6️⃣ Ciclo de Vida de um Contêiner (Criação, Execução, Pausa, Reinício, Remoção)

Onde deve ficar? → Mover para a seção de "Execução de Contêineres"
Justificativa: O ciclo de vida é parte essencial do processo de execução. Logo, faz mais sentido mover esse tópico para uma subseção específica chamada "Execução de Contêineres". Isso permitiria uma abordagem prática e detalhada.
Nova localização sugerida:
markdown
Copiar código
└── 7-execucao-conteineres
    └── 2-ciclo-vida-conteiner.md
Ação: Mover para a subseção 7 - Execução de Contêineres.


Excelente reflexão! Vamos analisar a seção de Conceitos Fundamentais no contexto de todo o repositório. O objetivo é garantir que não haja redundância e que cada seção tenha seu propósito bem definido. Vou avaliar cada tópico e sugerir se ele deve permanecer em Conceitos Fundamentais ou se faz mais sentido movê-lo para outra seção.

🧐 Análise Crítica Tópico a Tópico
1️⃣ O que é Docker e para que Serve?

Onde deve ficar? → Mantido em Conceitos Fundamentais
Justificativa: Esse é o ponto de partida para qualquer aprendizado sobre Docker. Não faz sentido mover para outra seção. Aqui é o lugar correto.
Ação: Manter no lugar atual.
2️⃣ Arquitetura Docker (Docker Engine, Daemon, CLI e Docker Desktop)

Onde deve ficar? → Mantido em Conceitos Fundamentais
Justificativa: A arquitetura é um conceito básico que ajuda a entender o funcionamento do Docker. Não faz sentido realocar isso para outra seção, já que é essencial para entender outras seções, como execução de contêineres e rede Docker.
Ação: Manter no lugar atual.
3️⃣ O que são Imagens e Contêineres (Conceito Geral)

Onde deve ficar? → Mantido em Conceitos Fundamentais
Justificativa: O conceito de imagens e contêineres é o cerne do Docker. Apesar de haver uma seção dedicada a Imagens Docker e outras seções relacionadas a contêineres, aqui o foco é o conceito geral. Na seção "Imagens Docker", você abordará comandos, práticas e o uso de imagens, mas aqui você estabelece o ponto de partida conceitual.
Ação: Manter no lugar atual.
Observação: No entanto, você pode adicionar uma referência cruzada (link) para a seção de Imagens Docker para que o leitor saiba onde aprofundar o tema.
4️⃣ Diferença entre Contêineres e Máquinas Virtuais (VMs)

Onde deve ficar? → Mantido em Conceitos Fundamentais
Justificativa: Essa comparação é uma dúvida recorrente para quem está começando com Docker. Colocá-la em outra seção (como "Execução de Contêineres") criaria confusão, pois trata de conceitos gerais, e não de execução prática.
Ação: Manter no lugar atual.
5️⃣ Como Funciona a Execução de Contêineres

Onde deve ficar? → Mover para a seção de "Execução de Contêineres" (nova subseção sugerida)
Justificativa: Esse tópico já se aproxima de um processo prático, quase operacional, e não é um "conceito fundamental" no mesmo nível que "O que é Docker" ou "Arquitetura Docker". Ele detalha o fluxo de execução de contêineres e, por isso, poderia ser parte de uma subseção prática dentro de Execução de Contêineres.
Nova localização sugerida:
css
Copiar código
└── 3-imagens-docker
└── 4-dockerfile
└── 5-rede-docker
└── 6-volumes-persistencia-dados
└── 7-execucao-conteineres 
    └── 1-como-funciona-a-execucao-de-conteineres.md
Ação: Mover para a subseção 7 - Execução de Contêineres.
6️⃣ Ciclo de Vida de um Contêiner (Criação, Execução, Pausa, Reinício, Remoção)

Onde deve ficar? → Mover para a seção de "Execução de Contêineres"
Justificativa: O ciclo de vida é parte essencial do processo de execução. Logo, faz mais sentido mover esse tópico para uma subseção específica chamada "Execução de Contêineres". Isso permitiria uma abordagem prática e detalhada.
Nova localização sugerida:
markdown
Copiar código
└── 7-execucao-conteineres
    └── 2-ciclo-vida-conteiner.md
Ação: Mover para a subseção 7 - Execução de Contêineres.
7️⃣ Camadas de Imagens Docker (Copy-on-Write)

Onde deve ficar? → Mover para a seção "Imagens Docker"
Justificativa: Esse tópico fala diretamente sobre imagens Docker, que têm uma seção própria. Como Copy-on-Write (CoW) é um comportamento intrínseco das imagens Docker, ele faz mais sentido dentro da seção Imagens Docker, possivelmente como uma subseção isolada.
Nova localização sugerida:
arduino
Copiar código
└── 3-imagens-docker
    └── 1-camadas-imagens-copy-on-write.md
Ação: Mover para a seção 3 - Imagens Docker.

8️⃣ Contêiner Efêmero vs Contêiner Persistente

Onde deve ficar? → Mover para a seção "Volumes e Persistência de Dados"
Justificativa: O conceito de efemeridade vs persistência se conecta diretamente com a necessidade de criar volumes. Faz sentido contextualizar isso dentro da seção Volumes e Persistência de Dados, já que a persistência dos dados é exatamente o que resolve o problema de "contêineres efêmeros".
Nova localização sugerida:
markdown
Copiar código
└── 6-volumes-persistencia-dados
    └── 1-efemero-vs-persistente.md
Ação: Mover para a seção 6 - Volumes e Persistência de Dados.

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