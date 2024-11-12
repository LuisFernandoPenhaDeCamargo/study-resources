# Padrões de Projeto x Metodologias de Desenvolvimento x Arquiteturas de Software

A distinção entre padrões de projeto, metodologias de desenvolvimento e arquiteturas de software é fundamental para entender como diferentes conceitos ajudam na construção de sistemas de softwares eficazes. Cada um desses termos se refere a diferentes aspectos do desenvolvimento de software e contribui de maneira única para o sucesso de um projeto.

# 1. Padrões de Projeto (Design Patterns)

Os padrões de projeto são soluções reutilizáveis e comprovadas para problemas recorrentes no design de software. Eles fornecem uma forma de estruturar e organizar código de maneira que seja escalável, reutilizável, e fácil de manter.

### Objetivo

Resolver problemas comuns de design de software.

### Exemplos

- **Singleton:** garante que uma classe tenha uma única instância e fornece um ponto global de acesso
- **Factory Method:** define uma interface para criar objetos, mas permite que subclasses alterem o tipo de objeto a ser criado
- **Observer:** permite que objetos (observadores) se inscrevam para receber atualizações de outros objetos (subject), sem precisar saber quem são os observadores
- **Strategy:** permite que um algoritmo seja selecionado em tempo de execução, permitindo que o comportamento de uma classe seja alterado sem modificar o código
- **Facade:** fornece uma interface simplificada para um conjunto de interfaces em um subsistema

### Quando usar

Quando você se depara com um problema de design repetitivo que pode ser resolvido com um padrão testado e comprovado.

# 2. Metodologias de Desenvolvimento

As metodologias de desenvolvimento são abordagens estruturadas que orientam o processo de desenvolvimento de software. Elas definem como o trabalho deve ser organizado, os fluxos de trabalho, e como as equipes devem colaborar e entregar o software.

### Objetivo

Melhorar a eficiência do desenvolvimento, a colaboração entre equipes e a entrega de software de qualidade.

### Exemplos

- **Ágil (Agile):** uma abordagem iterativa e incremental para o desenvolvimento de software, focada na colaboração, flexibilidade e entregar frequentes. Exemplos incluem Scrum e Kanban
    + **Scrum:** organiza o trabalho em sprints (ciclos de desenvolvimento) com reuniões diárias, e uma entrega na final de cada sprint
    + **Kanban:** foca no gerenciamento visual do fluxo de trabalho, onde as tarefas são movidas de uma coluna para outra até serem concluídas
- **Waterfall (Cascate):** um modelo sequencial de desenvolvimento, onde cada fase do projeto (planejamento, design, implementação, testes, manutenção) ocorre de forma linear e sem sobreposição
- **DevOps:** integra as equipes de desenvolvimento e operações para melhorar a colaboração e acelerar o ciclo de vida do software, desde o desenvolvimento até a produção
- **Extreme Programming (XP):** foca na programação de alta qualidade, com práticas de desenvolvimento orientado a testes, programação em par e integração contínua

### Quando usar

Dependendo do projeto, a metodologia ideal varia. Projetos complexos com requisitos inconstantes podem se beneficiar de metodologias ágeis, enquanto projetos bem definidos podem ser mais adequados ao modelo Waterfall.

# 3. Arquiteturas de Software

Arquiteturas de software se referem à estrutura geral de um sistema, incluindo as interações entre diferentes componentes, módulos e subsistemas. Elas são mais focadas em como o sistema é estruturado do que em como ele será desenvolvido.

### Objetivo

Estabelecer a estrutura técnica e de comunicação do sistema, garantindo escalabilidade, performance e manutenção a longo prazo.

### Exemplos

- **Arquitetura Monolítica:** toda a aplicação é construída como uma única unidade. Esse padrão pe mais simples, mas pode ser mais difícil de escalar e manter conforme o sistema cresce
- **Arquitetura de Microserviços:** o sistema é dividido em pequenos serviços independentes, cada um com sua própria lógica de negócio e banco de dados. Facilita a escalabilidade, mas pode aumentar a complexidade na integração
- **Arquitetura Serverless:** divide a aplicação em funções pequenas e independentes, que são executadas em resposta a eventos. As funções são escaladas automaticamente
- **Arquitetura Orientada a Eventos:** sistema baseado na comunicação assíncrona, onde componentes reagem a eventos disparados pro outros sistemas ou serviços
- **Arquitetura em Camadas (Layered Architecture):** organiza o sistema em camadas distintas, como apresentação, lógica de negócios e acesso a dados. Facilita a separação de preocupações

### Quando usar

A arquitetura é escolhida com base em fatores como a complexidade do sistema, os requisitos de escalabilidade, a necessidade de resiliência, e o orçamento do projeto.

# Diferenças e Relações

- **Padrões de Projeto:** são abordagens reutilizáveis que ajudam a resolver problemas de design dentro de uma arquitetura específica. Eles são implementados no nível de código e fornecem soluções para problemas comuns durante o desenvolvimento
- **Metodologias de Desenvolvimento:** são práticas de trabalho que orientam como o desenvolvimento deve ser conduzido. Elas afetam a organização do time e o processo de entrega de software, mas não dizem diretamente como o sistema é estruturado ou como ele será codificado
- **Arquiteturas de Software:** definem a estrutura geral do sistema, incluindo componentes principais, seus relacionamentos e como eles se comunicam. Elas fornecem o esqueleto de alto nível para a construção do software

# Exemplo de Integração

Em um sistema Node.js que utiliza microserviços, você pode adotar a metodologia ágil (Scrum) para desenvolver os serviços de maneira incremental, enquanto utiliza o padrão Strategy para permitir que os microserviços escolham diferentes algoritmos de processamento dependendo das condições em tempo de execução. A arquitetura de microserviços vai garantir que cada parte do sistema possa ser escalada independentemente, enquanto a metodologia ágil permitirá entregas frequentes e adaptações rápidas.

# Conclusão

Esses três conceitos - padrões de projeto, metodologias de desenvolvimento, e arquiteturas de software - são interdependentes, mas cada uma aborda uma parte diferente do ciclo de vida do software. Juntos, eles ajudam as equipes a criar sistemas mais escaláveis, de fácil manutenção e mais eficientes, garantindo uma boa experiência tanto para os desenvolvedores quanto para os usuários finais.

# [[Voltar para: Práticas e Padrões de Código]](../1-praticas-padroes-codigo.md)