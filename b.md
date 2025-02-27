### 1. O que é uma "Entity Framework"?

O **Entity Framework** é um framework de mapeamento objeto-relacional (ORM, Object-Relational Mapper) desenvolvido pela Microsoft para a plataforma .NET. Ele permite que os desenvolvedores trabalhem com bancos de dados relacionais utilizando objetos .NET, eliminando a necessidade de escrever grande parte do código SQL manualmente.

Principais abordagens de uso:

1. Database First: o modelo de dados é gerado a partir de um banco de dados existente
2. Model First: o desenvolvedor cria um modelo conceitual, e o Entity Framework gera o banco de dados correspondente
3. Code First: o modelo é definido através de classes no código, e o banco de dados é gerado com base nessas definições

JS - Sequelize
JS - Umzug: controle de migrações

### 2. O que é e como é o fluxo de conexão com um banco NoSQL qualquer?

A conexão com um banco de dados NoSQL envolve etapas que podem variar conforme o tipo específico de banco de dados em uso, como MongoDB, Cassandra ou Redis. No entando, de maneira geral, o fluxo de conexão segue os seguintes passos:

1. Instalação da biblioteca cliente: cada banco de dados NoSQL possui bibliotecas clientes específicas para diferentes linguagens de programação. Por exemplo, para conectar-se ao MongoDB usando Node.js, você utilizaria o pacote mongodb. A instalação geralmente é feita através de um gerenciador de pacotes adequado à linguagem em uso
2. Configuração dos parâmetros de conexão: defina os parâmetros necessários para estabelecer a conexão, como o endereço do servidor (hostname ou IP), porta, credenciais de autenticação (usuário e senha) e o nome do banco de dados. Essas informações são essenciais para que a aplicação possa localizar e se autenticar no banco de dados
3. Esbelecimento da conexão: utilize a biblioteca cliente para iniciar a conexão com o bando de dados, fornecendo os parâmetros configurados anteriormente. Esse processo pode envolver a criação de uma instância de cliente ou a chamada de uma função de conexão específica, dependendo da biblioteca e da linguagem de programação utilizadas
4. Operações de leitura e escrita: após a conexão ser estabelecida com sucesso, a aplicação pode realizar operações de leitura e escrita no banco de dados. Isso inclui a inserção, consulta, atualização e exclusão de dados, conforme as necessidades da aplicação
5. Encerramento da conexão: após concluir as operações necessárias, é importante fechar a conexão com o banco de dados para liberar recursos. Isso pode ser feito chamando um método de encerramento ou desconexão fornecido pela biblioteca cliente

É importante norta que, embora esse seja o fluxo geral, cada banco de dados NoSQL pode ter particularidades em seu processo de conexão e operação. Recomenda-se consultar a documentação oficial do banco de dados específico para obter instruções detalhadas e melhores práticas.

### 3. SQL vs NoSQL

A escolha entre bancos de dados SQL e NoSQL depende das necessidades específicas do seu projeto. A seguir, apresentamos uma comparação entre esses dois tipos de banco de dados:

- SQL (relacionais): utilizam uma estrutura de tabelas com linhas e colunas, sendo ideais para dados altamente estruturados e que requerem integridade referencial
- NoSQL (não relacionais): adotam diferentes modelos de armazenamento, como documentos, chave-valor, colunas ou grafos, oferecendo flexibilidade para dados sem estrutura definida ou que mudam com frequência

Esquema:

- SQL: possuem esquemas rígidos que definem claramente a estrutura dos dados, garantindo consistência
- NoSQL: oferecem esquemas dinâmicos, permitindo a inserção de dados sem estrutura predefinida, o que facilita adaptações a mudanças nos requisitos dos dados

Escalabilidade:

- SQL: escalam verticalmente, ou seja, melhoram o desempenho com a adição de recursos ao servidor existente
- NoSQL: escalam horizontalmente, distribuindo a carga entre vários servidores, o que é vantajoso para aplicações que lidam com grandes volumes de dados e alta taxa de acessos

Transações:

- SQL: suportam transações ACID (Atomicidade, Consistência, Isolamento, Durabilidade), garantindo operações confiáveis e consistentes, essenciais para aplicações financeiras e de contabilidade
- NoSQL: alguns oferecem suporte a transações, mas geralmente priorizam a disponibilidade e a escalabilidade, podendo sacrificar a consistência imediata em favor da eventual

Casos de uso:

- SQL: indicados para aplicações que requerem consultas complexas, transações multi-linhas e uma estrutura de dados bem definidas
- NoSQL: adequados para aplicações que lidam com grandes volumes de dados não estruturados ou semi-estruturados, como redes sociais, sistemas de gerenciamento de conteúdo e big data

https://www.ibm.com/think/topics/sql-vs-nosql?utm_source=chatgpt.com

### 4. Transações (SQL)

Em SQL, uma transação é uma unidade lógica de processamento que agrupa uma ou mais operações (com inserções, atualizações ou deleções) em um bloco indivisível. O objetivo é garantir que todas as operações sejam concluídas com sucesso ou, em caso de falha, que nenhuma modificação seja aplicada ao banco de dados, mantendo assim a integridade e a consistência de dados.

As transações seguem o conceito ACID, que assegura:

- Atomicidade: todas as operações da transação são concluídas integralmente ou nenhuma é aplicada
- Consistência: a transação leva o banco de dados de um estado consistente a outro estado consistente
- Isolamento: as operações de transação são isoladas de outras transações, evitando interferências
- Durabilidade: após a confirmação da transação, as alterações são permanentes, mesmo em caso de falhas no sistema

No SQL Server, por exemplo, o controle de transações é realizado utilizando os comandos:

- BEGIN TRANSACTION: inicia uma nova transação
- COMMIT TRANSACTION: confirma todas as operações realizadas durante a transação, tornando-as permanentes no banco de dados
- ROLLBACK TRANSACTION: desfaz todas as operações realizadas desde o ínicio da transação, retornando o banco de dados ao estado anterior

Por exemplo, ao transferir fundos entre duas contas bancárias, uma transação garantiria que o débito de uma conta e o crédito de outra ocorram integralmente. Se qualquer parte do processo falhar, nenhuma alteração seria aplicada, evitando inconsistências nos dados.

No MariaDB, o comportamento padrão para transações depende do mecanismo de armazenamento utilizado. Os dois mecanismos mais comuns são o InooDB e o MyISAM.

- InnoDB: este é o mecanismo de armazenamento transacional padrão no MariaDB. Nele, cda instrução SQL é tratada como uma transação individual que é automaticamente confirmada após sua execução, a menos que você inicie explicitamente uma transação com o comando START TRANSACTION ou BEGIN. Nesse caso, você precisa confirmar (COMMIT) ou reverter (ROLLBACK) as alterações manualmente
- MyISAM: este mecanismo não suporta transações. Cada instrução é executada e confirmada imediatamente, sem a possibilidade de controle transacional

Portanto, no caso do InnoDB, se você não iniciar explicitamente uma transação, cada instrução SQL é automaticamente confirmada, o que significa que elas não estão implicitamente envolvidas em uma transação maior. Para agrupar múltiplas instruções em uma única transação, é necessário iniciá-la explicitamente.

No mecanismo de armazenamento MyISAM, cada operação é executada de forma independente e confirmada imediatamente após sua execução. No entando, o MyISAM não oferece suporte a transações ACID, o que significa que não garante propriedades de atomicidade, consistência, isolamento e durabilidade. Isso implica que, em caso de falha durante uma operação, o MyISAM não possui mecanismos para reverter alterações parciais, podendo resultar em inconsistências nos dados.

https://expressvps.com.br/glossario/o-que-e-myisam-mysql-storage-engine/?utm_source=chatgpt.com

### 5. Como eu posso testar a integração de banco?

Utilizando um banco de dados real com um ambiente de testes controlado. As principais estratégias são:

1. Criar um banco de testes separado
    - Configurar um banco dedicado apenas para os testes (exemplo: test_db)
    - Popular esse banco com dados iniciais previsíveis
    - Garantir que ele possa ser recriado/resetado antes de cada teste
2. Utilizar contêineres com Docker
    - Criar um ambiente efêmero para os testes usando docker-compose
    - Após os testes, destruir o contêiner para evitar resíduos
3. Rodar testes em um banco de dados em memória (se aplicável)
    - Para bancos como SQLite, que suportam execução em memória (:memory:)
    - Ideal para testes rápidos sem necessidade de um banco físico
4. Restaurar um snapshot do banco antes dos testes
    - Criar um dump dp banco antes dos testes e restaurá-lo a cada execução
    - Garante consistência no ambiente de testes

Usar uma cópia do banco de produção pode ser uma opção, mas é preciso anonimizar dados sensíveis e evitar que testes alterem registros reais.

### 6. Como você converte dados de entrada para saída usando json?

Para converter dados de entrada em JSON e processá-los para obter uma saída desejada, você pode seguir os seguintes passos:

1. Leitura dos dados de entrada: obtenha os dados de entrada que deseja processsar
2. Conversão para JSON: utilize uma biblioteca ou função apropriada na linguagem de programação que está utilizando para converter os dados de entrada em um objeto JSON
3. Processamento dos dados: manipule o objeto JSON conforme necessário para alcançar a saída desejada
4. Conversão para o formato de saída: converta o objeto JSON processsado de volta para o formato de saída desejado, como uma string JSON ou outro formato específico

Exemplo em JavaScript:

Suponha que você tenha um objeto JavaScript e deseja convertê-lo em uma string JSON:

```javascript
// Dados de entrada: um objeto JavaScript.
const dadosEntrada = {
    nome: "Fulano",
    idade: 30,
    cidade: "São Paulo",
};

// Conversão para JSON.
const jsonStr = JSON.stringify(dadosEntrada);

// jsonStr agora é uma string JSON: '{"nome":"Fulano","idade":30,"cidade":"São Paulo"}'.
```

Para o processo inverso, ou seja, converter uma string JSON de volta para um objeto JavaScript:

```javascript
// String JSON de entrada.
const jsonStr = '{"nome":"Fulano","idade":30,"cidade":"São Paulo"}';

// Conversão de JSON para objetos JavaScript.
const dadosSaida = JSON.parse(jsonStr);

// dadosSaida agora é um objeto JavaScript: {nome: "Fulano", idade: 30, cidade: "São Paulo"}.
```

### 7. CRUD

CRUD é um acrônimo que representa as quatro operações básicas utilizadas em sistemas de gerenciamento de dados: Create (Criar), Read (Ler), Update (Atualizar) e Delete (Excluir). essas operações são fundamentais para a manipulação e gestão de informações em bancos de dados e outras formas de armazenamento persistente.

Detalhamento das Operações CRUD:

1. Create (criar): refere-se à inserção de novos dados no sistema. Em termos de banco de dados relacional, isso corresponde à operação SQL INSERT
2. Read (ler): envolve a leitura ou recuperação de dados existentes. No contexto SQL, é realizado através da instrução SELECT
3. Update (atualizar): consiste na modificação de dados já armazenados. Utiliza-se a instrução SQL UPDATE para essa finalidade
4. Delete (excluir): diz respeito à remoção de dados do sistema, geralmente executada com a instrução SQL DELETE

Essas operações são essenciais para o gerenciamento de dados em aplicações que utilizam bancos de dados relacionais, mas também se aplicam a outros tipos de armazenamento, como bancos de dados NoSQL, sistemas de arquivos e APIs RESTful

No contexto de APIs RESTful, as operações CRUD são mapeadas para os métodos HTTP da seguinte forma:

- Create: POST
- Read: GET
- Update: PUT ou PATCH
- Delete: DELETE

Compreender e implementar corretamente as operações CRUD é fundamental para o desenvolvimento de aplicações robustas e eficientes, garantindo uma interação adequada com os sistemas de armazenamento de dados.

### 8.

#

Glassdor - luisfernandopenhadecamargo@gmail.com

Teste era um crud + agendador de tarefas
Segundo teve o desafio tecnico onde pediram para fazer um projeto com 2 endpoints, onde um processava os dados de um txt legado para salvar em um banco de dados e outra para fazer o consumo com filtros. Toda a api deveria estar coberta com testes.
Me pediram pra explicar o que eu fazia durante o dia no meu trabalho e pra explicar tecnicamente alguns conceitos do que eu faço.
discutimos todo o processo entre um discovery e a entrega de um produto em produção. Falamos sobre varios temas técnicos, entramos en detalhes de tecnologas e metodologias. Passaram dever de casa, API Restful, bem simples se não me engano arquitetura hexagonal e BDD são obrigatórios.

Sobre a vaga
Buscamos desenvolvedor(a) backend .Net Pleno, para atuar em nosso software da tribo Fiscal e de Controladoria.

Todo o ecossistema foi modernizado, trata-se de Apps robustas com tecnologia de ponta, tudo em cloud, com arquitetura distribuída de alto desempenho com um desafio de grande throughput. Nosso time é 100% remoto com pessoas de vários lugares do país

Se você é apaixonado(a) pelo o que faz, estuda sempre, forma talentos e trabalha em equipe essa vaga é para você!



Aqui suas atividades serão:



Ser um analista de sistemas/negócio/qualidade, e não só um desenvolvedor;
Trabalhar com tecnologias de ponta para novos projetos, com mente aberta para suportar legados em linguagens ultrapassadas;
Codar com eficiência e qualidade, com visão 360º a fim de evitar impactos negativos em processos que já funcionam;
Desenvolver testes unitários, de integração e/ou regressão para aumentar a produtividade e garantir a qualidade das alterações;
Estar disposto a aprender do mundo fiscal/tributário, compreendendo das regras e cálculos para interpretar e entender as alterações necessárias no fonte e não somente implementá-las;
Expor novas ideias, ter proatividade em propor mudanças que possam melhorar o processo de desenvolvimento ou a vida dos nossos clientes/stackholders;
Ser aberto e participar ativamente a mudanças e quebra de paradigmas, um de nossos lemas é "A única coisa que não muda é que tudo muda";
Estar alinhado a cultura e aos valores da empresa: Se sentir dono do projeto, acompanhando-o de ponta a ponta, desde a concepção até a entrega em produção no prazo definido com a qualidade esperada.


Para atuar nessa função, é essencial que você tenha:



Experiência em .Net;
Raciocínio rápido e lógica de programação;
Experiência em desenvolvimento de testes unitários;
Experiência em banco de dados relacional e não relacional (Oracle, MySQL, Postgree, MongoDB, Redis);
Vivência em ferramentas de repositórios de fonte (Git);
Fácil interpretação de diagramas e fluxogramas e conhecimento para desenhá-los (UML);


Diferenciais

Conhecimento em regras fiscais e tributárias;
Vivência em desenvolvimento de aplicações background (Rabbit MQ, Kafka, Pub/Sub).
Conhecimento em linguagens procedurais (VB6);
Conhecimento em ferramentas ágeis de desenvolvimento (Kanban);
Experiência com aplicações em nuvem (GCP, AWS, Azure);
Conhecimento Golang;

Bate papo técnico

Você + Time técnico

Nesta etapa, teremos um bate papo técnico onde abordaremos tópicos de tecnologia para conhecermos o seu background técnico.

Traga situações vividas

3206

repl

- Git

- git clone <URL>
- git branch
- git branch -a
- git checkout -b <nome-da-branch>
- git switch -c <nome-da-branch> (2.23.0)
- git add .
- git commit -m <mensagem>
- git config --global user.email <email>
- git config --global user.name "<nome>"
- git config --list
- PR

- npm login
- npm whoami
---

Notebook (Orion Gaming)

- Google Chrome
- Multipass
- VS Code
- Discord

+ Git
+ NVM
+ MariaDB

Como eu não conseguia mudar o modelo que realiza as respostas, vamos recomeçar daqui.

Repositório "Tech Compass"

Pilares a se considerar na hora da categorização:
- Os temas vão ser agrupados em categorias
- As categorias devem ser específicas
- Progressão linear, considerando o aumento de complexidade das categorias e "o que deveria ser aprendido antes do que"

TODO: revisar a gramática e a lógica das notas abaixo.

Tech Compass (Guia de elaboração do Repositório)

- Ponto de entrada (README): todas as seções, assuntos, poderão ser acessados a partir deste ponto;
- Dividir em seções:
    + "Modularidade: cada nota ou tutorial deve ser autocontido e escrito de forma que possa ser atualizado ou substituído sem impactar outras partes do repositório. Se necessário, usa arquivos separados para códigos de exemplo, scripts ou configurações"
    + "Padronize a terminologia e os exemplos: ao tratar de temas técnicos variados, mantenha uma terminologia consistente. Use exemplos e convenções que sejam claros e que possam ser facilmente compreendidos por você e seu irmão"
    + **"Feedback e revisões periódicas: estabeleça momentos para revisar o conteúdo, atualizá-lo conforme novas informações ou tecnologias surgem, e até mesmo solicitar feedback de quem utiliza o repositório. Isso mantém a qualidade e a relevância das informações"**
- Consistência na organização e na formatação
- "Exemplos práticos e exercícios: sempre que possível, acrescente exercícios ou desafios que permitam praticar o conteúdo apresentado. Essa abordagem ativa ajuda a fixar o conhecimento e torna o repositório um espaço dinâmico de aprendizado"

"Em resumo, um repositório didático e prático depende tanto da organização estrutural quanto da clareza e profundidade do conteúdo. Ao definir uma estrutura modular, usar um padrão consistente e incorporar elementos visuais e práticos, você cria uma ambiente de estudos que não só facilita a revisão, mas também a expansão e colaboração contínua."

> Nota: cada tema terá o seu próprio repositório para uma melhor modularização.

---

TODO: revisar a gramática e a lógica das notas abaixo.
> Nota: atenção aos "títulos" (posso chamar assim?) das estruturas que sucedem `###`

# Dúvidas Frequentes Relacionadas a Regras Gramáticais

## Dois Pontos

### "A primeira letra após os dois pontos deve ser maiúscula ou miniscúla?"

A utilização de maiúscula ou minúscula após os dois pontos depende do contexto e da função que a informação que se segue desempenha na frase.

- Uso de minúscula: se a informação que segue os dois pontos é uma explicação, enumeração ou complemento que integra a mesma frase, normalmente utiliza-se a letra minúscula. Exemplo: "Ele tinha três opções: correr, lutar ou fugir"
- Uso de maiúscula: a letra maiúscula deve ser empregada quando o que vem depois dos dois pontos constitui:
    + Uma citação direta ou discurso reproduzido integralmente. Exemplo: "Ele afirmou: 'Não podemos desistir agora'"
    + Uma enumeração de elementos que são, por sua natureza, nomes próprios ou quando cada item é apresentado como um enunciado extenso, muitas vezes com caráter explicativo ou descritivo que justifique sua autonomia. Exemplo: "Foram selecionados os seguintes alunos: João, Maria e Pedro."
    + Quando ocorre mudança de parágrafo após os dois pontos, por exemplo, no caso de diálogos: Exemplo:
    "Ela perguntou:
    — Você vai participar?"

## Listas e Pontuação

### "Ao final de itens de listas, devemos utilizar pontuação?"

A utilização de pontuação ao final de itens de listas depende do tipo de lista e do contexto em que ela é apresentada.

#### Listas Informais ou de Itens Curtos

- Itens isolados ou curtos: se a lista consiste em palavras, expressões ou itens que não formam frases completas, normalmente não é necessário usar pontuação ao final de cada item. Por exemplo:
    + Maçã
    + Banana
    + Uva
- Consistência visual: em listas informais (como listas de compras ou tópicos curtos), muitos autores optam por não pontuar cada item para manter a "limpeza" visual do texto

#### Listas Formais ou com Itens Completos

- Itens que são frases completas: quando os itens da lista constituem orações completas, recomenda-se usar pontuação que indique a separação entre os itens – geralmente ponto-e-vírgula – e finalizar o último item com ponto final. Exemplo:  
    É fundamental manter a organização:
    + Os relatórios devem ser enviados até sexta-feira;
    + As reuniões devem ser agendadas com antecedência;
    + E os feedbacks devem ser registrados formalmente.

Nesse caso, o ponto final no último item sinaliza o encerramento da lista e, por consequência, do período.

O Replit é uma plataforma online que oferece um ambiente de desenvolvimento integrado (IDE) para escrever e executar códigos. Ele suporta diversas linguagens de programação, incluindo Python, JavaScript, C+++, C#, HTML, e muito mais. 

---
---

# Lista de Aplicações que eu Utilizo

## Windows

- Google Chrome
- Discord

## Ubuntu

- Google Chrome
- Multipass
- VS Code
- Discord

# Formatando uma máquina

- Baixe a ISO (International Organization for Standardization, Organização Internacional de Padronização). Um arquivo ISO é uma imagem de disco, ou seja, uma cópia fiel de um disco óptico (CD/DVD), contendo todos os arquivos e estrutura do sistema
- Torne o pendrive bootável; você pode usar a Startup Disk Creator (está ferramenta já vem instalada dependendo da sua versão do Ubuntu, `usb-creator-gtk`) para isso. Esta ferramenta já copia a ISO para o pendrive
- Acesse o menu de boot (normalmente através do F2, F12 ou ESC) e selecione o pendrive para começar a formatação

### Estudar ###
`apt`
- `update`
- `upgrade`
  + flag `-y`
- `autoremove`
- `install`

`dpkg`
- flag `-i`

`snap`
- `install`
  + flag `--classic`

`apt` x `dkpg` x `snap`

`df`
- flag `-h`

- Como fazer funções?
Como funcionam as permissões, as exibidas pelo `ll` e modificadas através do `chmod`?

- Torne o pendrive bootável
- Acesse o menu de boot

# ---

multipass launch[ --disk <tamanho_em_gb>G][ --name <nome_da_vm>][ <versão_do_so>]
multipass list
multipass stop
multipass delete <nome_da_vm>
multipass purge
multipass transfer <caminho_local> <nome_da_vm>:<caminho_destino>
multipass shell <nome_da_vm>

# ---

- Organizar minha rotina
- Organizar meu repositório "study-resources", futuro "Tech Compass" (tech-compass)
- Organizar minhas finanças
- Organizar minhas senhas (salvando-as no drive)
- Extrair o contéudo salvo na conversa comigo mesmo no Whatsapp, elaborá-lo e salvá-lo no local apropriado
- Organizar o meu drive
- Organizar meus favoritos (do navegador)
- Decidir aonde irei registrar as anotações sobre formatação do que é escrito no Tech Compass e elaborar as notas sobre títulos, incluindo definições de estruturas e quando utilizá-las
    + Após os dois pontos, a letra deve ser minúscula
    + Código nos exemplos deve estar em inglês
    + Bash: usar aspas simples caso as aspas duplas não forem necessárias
    + Bash: indicar comandos prefixando com o caractere `$` ou `#` (para root)
    + GPT: quando eu solicito uma revisão é do ponto de vista gramatical e lógico. Exemplo: "No contexto lógico e gramatical, você ajustaria algo no texto abaixo?"
- Decidir aonde irei pontuar o conteúdo sobre Bash e como irei estruturá-lo
- Criar as funções lambda para compactação dos dumps
- Decidir aonde irei pontuar as anotações sobre a S3 e elaborá-las, priorizando aquelas relacionadas a custo, sem esquecer as relacionadas às categorias de armazenamento (standard, glacier, etc)
- Decidir aonde irei pontuar as anotações sobre a Orion, elaborar as notas sobre o bucket criado por mim (orion-island-dumps) e o bucket orion-bks
- Criar um script para a instalação de programas no Windows, que será executado via PowerShell (basicamente uma transcrição do meu script feito em Bash)

# ---

# `||`

O operador lógico **OR** (`||`) é usado para executar um comando apenas se o comando anterior falhar (isto é, retornar um código de saída diferente de 0).

## Funcionamento

- Se o primeiro comando for bem-sucedido (código de saída `0`), o segundo comando **não será executado**
- Se o primeiro comando falhar (código de saída **diferente de** `0`), o segundo comando **será executado**

## Exemplos

### 1. Exemplo Simples

```bash
$ mkdir nova_pasta || echo 'Falha ao criar a pasta!'
```

Explicação:  
1. O comando `mkdir nova_pasta` tenta criar um diretório chamando `nova_pasta`
2. Se o diretório já existir (ou o comando falhar por outro motivo), o comando `echo 'Falha ao criar a pasta!'` será executado e exibirá a mensagem

### 2. Comando Alternativo

```bash
$ ls arquivo.txt || touch arquivo.txt
```

Explicação:  
1. O comando `ls arquivo.txt` tenta listar o `arquivo.txt`
2. Se o arquivo não existir, o comando `touch arquivo.txt` será executado para criá-lo

## Uso Comum

O operador `||` é frequentemente usado para tratar erros ou executar comandos alternativos quando o primeiro comando falha. É útil em scripts para criar fluxos de controle simples e robustos.