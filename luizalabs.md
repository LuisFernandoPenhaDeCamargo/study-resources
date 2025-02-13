## Questões Técnicas Frequentes na Luizalabs

### 1. O que é uma "Entity Framework"?

O **Entity Framework** é um framework de mapeamento objeto-relacional (ORM, Object-Relational Mapper) desenvolvido pela Microsoft para a plataforma .NET. Ele permite que os desenvolvedores trabalhem com bancos de dados relacionais utilizando objetos .NET, eliminando a necessidade de escrever grande parte do código SQL manualmente.

Principais abordagens de uso:

1. Database First: o modelo de dados é gerado a partir de um banco de dados existente
2. Model First: o desenvolvedor cria um modelo conceitual, e o Entity Framework gera o banco de dados correspondente
3. Code First: o modelo é definido através de classes no código, e o banco de dados é gerado com base nessas definições

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

Conceito ou modelo conceitual.

### 8. APIs RESTful

APIs RESTful são interfaces de programação que seguem os princípios da arquitetura REST (Representational State Transfer). Elas permitem que sistemas se comuniquem pela internet de simples e escalável, utilizando o protocolo HTTP para operações como criar, ler, atualizar e deletar recursos.

Princípios Fundamentais das APIs RESTful:

1. Cliente-Servidor: separação entre o cliente (que consome a API) e o servidor (que fornece os recursos), permitindo que ambos evoluam independentemente
2. Sem estado (stateless): cada requisição do cliente ao servidor deve conter todas as informações necessárias para ser entendida e processada, sem depender de um estado armazenado no servidor
3. Cacheabilidade: as respostas devem indicar se podem ou não ser armazenadas em cache, para melhorar a eficiência e reduzir a carga no servidor
4. Interface uniforme: uso consistente de convenções, como métodos HTTP (GET, POST, PUT, DELETE) e códigos de status, para facilitar a compreensão e uso da API
5. Sistema em camadas: a arquitetura pode ser composta por camadas, como balanceadores de carga e servidores de cache, que são transparentes para o cliente
6. Código sob demanda (opcional): possibilidade de o servidor fornecer código executável ao cliente, como scripts JavaScript, para estender a funcionalidade

Benefícios das APIs RESTful

- Escalabilidade: devido à separação entre cliente e servidor e à ausência de estado, é mais fácil escalar aplicações que utilizam APIs RESTful
- Flexibilidade: a interface uniforme permite que diferentes clientes interajam com a API de maneira consistente
- Desempenho: a possibilidade de cachear respostas melhora o desempenho e reduz a latência

APIs RESTful são amplamente utilizadas no desenvolvimento de aplicações web e móveis devido à sua simplicidade e eficiência. Elas facilitam a integração entre diferentes sistemas e plataformas, promovendo uma comunicação padronizada e eficaz.

https://aws.amazon.com/what-is/restful-api/?utm_source=chatgpt.com

### 9. O que seria o discovery de um produto?

O Product Discovery é um processo fundamental no desenvolvimento de produtos que visa compreender profundamente as necessidades dos usuários e validar ideias antes de iniciar a fase de desenvolvimento. Esse processo busca garantir que o produto final seja útil, desejável e viável, minimizando riscos e evitando desperdício de recursos.

Principais etapas do Product Discovery:

1. Alinhamento: definir claramente os objetivos do produto e alinhar as expectativas entre todos os stackeholders envolvidos no projeto
2. Pesquisa: coletar dados qualitativos e quantitativos sobre o mercado, concorrentes e, principalmente, sobre os usuários, utilizando técnicas como entrevistas, questionários e análise de comportamento
3. Ideação: gerar e explorar diversas soluções potenciais para atender às necessidades identificadas, promovendo sessções de brainstorming e outras dinâmicas criativas
4. Prototipação: desenvolver versões simplificadas do produto ou de suas funcionalidades principais para testar e validar as ideias com usuários reais
5. Validação: testar os protótipos com usuários finais, coletando feedbacks para refinar e ajustar as soluções antes de avançar para o desenvolvimento completo

Benefícios do Product Discovery

- Redução de riscos: identificar e mitigar potenciais falhas ou inadequações do produto antes de investir significativamente em seu desenvolvimento
- Foco no usuário: garantir que o produto atenda às reais necessidades e desejos dos usuários, aumentando a satisfação e a adoção
- Eficiência de recursos: evitar desperdícios ao direcionar esforços apenas para soluções validadas e com maior potencial de sucesso no mercado

Ao implementar o Product Discovery, as equipes de produto podem desenvolver soluções mais alinhadas às demandas do mercado e dos usuários, aumentando as chances de sucesso e relevância no mercado competitivo atual.

### 10. Arquitetura Hexagonal

A Arquitetura hexagonal, também conhecida como Arquitetura de Portas e Adaptadores (Ports and Adapters), é um padrão arquitetural proposto por Alistair Cockburn em meados dos anos 1990. Seu objetivo é criar sistemas com alto grau de coesão e baixo aclopamento, facilitando a manutenção, testabilidade e independência de tecnologias específicas.

Princípios fundamentais:

- Isolamento da lógica de negócio: a lógica central do aplicativo é isolada do mundo exterior, permitindo que mudanças nas interfaces externas não afetem o núcleo do sistema
- Portas (interfaces): definem pontos de entrada e saída para a comunicação com a aplicação. As portas de entrada representam os serviços oferecidos pelo sistema ao mundo exterior, enquanto as portas de saída representam os serviços que o sistema requer de componentes externos
- Adaptadores: servem como intermediários que traduzem as interações entre o núcleo da aplicação e os componentes externos, como interfaces de usuário, banco de dados ou outros sistemas. Isso permite que diferentes tecnologias ou interfaces sejam conectadas sem impactar a lógica de negócio

Benefícios:

- Facilidade de testes: a separação clara entre a lógica de negócio e as dependências externas facilia a criação de testes unitários e de integração, permitindo a substituição de componentes reais por mocks ou stubs durante os testes
- Flexibilidade e manutenibilidade: a independência em relação a tecnologias específicas permite que componentes externos, como banco de dados ou interfaces de usuário, sejam substituídos ou atualizados sem necessitar de alteraçõs na lógica central da aplicação
- Evolução tecnológica: a arquitetura facilita a adaptação a novas tecnologias ou requisitos, pois os adaptadores podem ser modificados ou substituídos conforme necessários, sem impactar o núcleo do sistema

A Arquitetura Hexagonal promove um design de software que prioriza a separação de preocupações e a inversão de dependências, resultando em sistemas mais robustos, flexíveis e fáceis de manter.

https://docs.aws.amazon.com/pt_br/prescriptive-guidance/latest/cloud-design-patterns/hexagonal-architecture.html?utm_source=chatgpt.com

### Mais duvidas sobre a arquitetura hexagonal?

### 12. BDD

O Behavior-Driven Development, ou Desenvolvimento Orientado pelo Comportamento, é uma abordagem de desenvolvimento de software que enfatiza a colaboração entre desenvolvedores, testadores e stakeholders para garantir que o software atenda aos requisitos de negócios. Baseado nos princípios do Test-Driven Development (TDD) e do Domain-Driven Design (DDD), o BDD utiliza uma linguagem natural e clara para descrever o comportamento do sistema, facilitando a comunicação entre todas as partes envolvidas no projeto.

Principais características do BDD:

- Cenários em linguagem natural: o BDD utiliza uma linguagem específica de domínio (DSL) com construções em linguagem natural (por exemplo, sentenças semelhantes ao inglês) para expressar o comportamento e os resultados esperados. Isso promove uma compreensão compartilhada entre desenvolvedores, testadores e representantes do cliente
- Ferramentas de suporte: existem diversas ferramentas que auxiliam na implementação do BDD, como o Cucumber, que permite a execução de testes de aceitação escritos em texto voltado para o negócio. O Cucumber suporta várias linguagens de programação e utiliza a linguagem Gherkin para definir casos de teste de forma legível para humanos

Benefícios do BDD:

- Melhoria na comunicação: ao utilizar uma linguagem comum e compreensível, o BDD facilita a colaboração entre todos os stakeholders, garantindo que todos tenham uma compreensão clara dos requisitos e do comportamento esperado do sistema
- Desenvolvimento guiado pelo comportamento: focar no comportamento do software ajuda a alinhar o desenvolvimento com os objetivos de negócios e as necessidades dos usuários, resultando em um produto mais relevante e eficaz
- Facilidade de manutenção: a especificação clara do comportamento esperado facilita a identificação de problemas e a manutenção do código, além de servir como documentação viva do sistema

Em resumo, o BDD é uma prática que integra regras de negócios com linguagem de programação, focando no comportamento do software e promovendo uma colaboração eficaz entre equipes envolvidas no desenvolvimento.

### 13. ARNs

As Amazon Resources Names (ARNs) são identificadores exclusivos que a AWS utiliza para nomear e referenciar seus recursos de forma inequívoca. Elas são essenciais para especificar recursos em políticas do IAM, tags de serviços como o Amazon RDS e em chamadas de API.

Estrutura de um ARN:

A estrutura geral de um ARN é composta pelos seguintes componentes, separados por dois-pontos (:):

- arn: prefixo que indica que se trata de um ARN
- partition: a partição no qual o recurso está localizado. Para a maioria das regiões da AWS, é aws
- service: o namespace do serviço AWS ao qual o recurso pertence (por exemplo, s3, para o Amazon S3, ec2 para o Amazon EC2)
- account-id: o ID da conta AWS que possui o recurso. Este componente também pode ser omitido em alguns casos
- resource: o identificador específico do recruso, que pode incluir informações adicionais, como o tipo de recurso e um identificador específico

A sintaxe exate de um ARN pode variar dependendo do serviço e do tipo de recurso. Por exemplo, para um bucket do Amazon S3, o ARN pode ser:

arn:aws:s3:::nome-do-bucket

Para uma instância do Amazon EC2:

arn:aws:ec2:us-east-1:123456789012:instance/i-1234567890abcdef0

Os ARNs são fundamentais para identificar recursos de forma única na AWS, permitindo que você espeficique recursos de maneira precisa em políticas de controle de acesso, chamadas de API e outras operações dentro do ecossistema AWS.

###

"é mais sobre protocolos, ex, comunicações HTTP são sincronas, enquanto o Redis pode utilizar canais de comunicação para enviar a mensagem, sendo que se a pessoa vai utilizá-la neste momentou ou não é outra história; o que permite desaclopamento?

A comunicação entre sistemas pode ser classificada como síncrona ou assíncrona, dependendo da necessidade de uma resposta imediata e da forma como os componentes interagem.

Comunicação síncrona:

Na comunicação síncrona, o emissor envia uma solicitação e aguarda uma resposta imediata do receptor, mantendo ambos os lados em sincronia durante a interação. Um exemplo típico é o protocolo HTTP, onde o cliente faz uma requisição ao servidor e espera pela resposta antes de prosseguir. Essa abordagem é direta e simples, mas pode levar a bloqueios ou atrasos se o receptor demorar para reponder ou estiver indisponível.

Comunicação assíncrona:

Na comunicação assíncrona, o emissor envia uma mensagem sem esperar uma resposta imediata, permitindo que ambos os lados operem de forma independente. Isso é comum em sistemas que utilizam filas de mensagens ou mecanismos de publicação/assinatura (Pub/Sub). Por exemplo, o Redis oferece um recurso de Pub/Sub que permite que mensagens sejam publicadas em canais e entregues aos assinantes interessados. Nesse modelo, o emissor não precisa saber se há assinantes ativos no momento da publicação, promovendo um baixo acoplamento entre os componentes do sistema.

Desacoplamento:

A comunicação assíncrona facilita o desacoplamento entre os componentes, pois eles não dependem da disponibilidade imediata uns dos outros para funcionar. Isso melhora a escalabilidade e a resiliência do sistema, permitindo que diferentes partes operem e sejam atualizadas de forma independente. Por outro lado, a comunicação síncrona pode levar a um acoplamento mais forte, já que os componentes dependem de respostas imediatas para continuar suas operações.

Em resumo, a escolha entre comunicação síncrona e assíncrona depende dos requisitos específicos do sistema, como a necessidade de respostas imediatas, tolerância a falhas e o nível de acoplamento desejado entre os componentes. 

###

+ Redis
    - O termo é pub/sub?
+ DDD
+ Gherkin
+ Redis

https://aws.amazon.com/pt/compare/the-difference-between-rabbitmq-and-redis/

https://www.estrategiaconcursos.com.br/blog/engenharia-software-diagramas-estruturais-uml/

### Meu dia a dia?

+ Não utilizamos metodologias agéis
    - Tudo é prioridade? Nã, mas uma necessidade atravessa a outra sim (depende)
+ strict mode
+ JS
+ Bash
    - Py
    - Rust
+ arns
+ Axios
+ Express
    - Config
+ Babel
+ C8
+ Mocha
+ Chai
+ SinonJS
+ esmock

###

|.NET            |JavaScript| Categora/Propósito  |
|----------------|----------|---------------------|
|Entity Framework|Sequelize |         ORM         |
|                |  Umzug   |Controle de migrações|