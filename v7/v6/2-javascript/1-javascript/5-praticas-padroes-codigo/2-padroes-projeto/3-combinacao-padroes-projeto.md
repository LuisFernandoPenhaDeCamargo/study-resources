# Combinação de Padrões de Projeto

É comum e até recomendável usar múltiplos padrões de projeto, especialmente em aplicações complexas. Cada padrão resolve problemas específicos, e combiná-los pode fortalecer a arquitetura, modularidade e manutenibilidade do código.

No contexto de um projeto Node.js, alguns padrões de projeto frequentemente combinados incluem:

1. **MVC (Model-View-Controller):** geralmente, esse padrão organiza a aplicação em camadas separadas para lógica de negócios (Model), gerenciamento de dados e exibição (View) e controle de fluxo (Controller). É comum ver MVC em frameworks como Express.js, principalmente em aplicações web
2. **Singleton:** muitas vezes usado para gerenciar conexões de banco de dados, onde é mais eficiente criar uma única instância de conexão que seja reutilizada ao longo do projeto
3. **Factory:** útil para criar objetos de forma padronizada. No Node.js, o padrão Factory pode ser visto em casos como criação de middleware, instâncias de serviços ou configurações específicas dependendo do ambiente
4. **Repository e Service Layer:** esses dois padrões organizam o acesso aos dados (Repository) e a lógica de negócios (Service Layer) em camadas separadas. Isso aumenta a coesão do código e permite melhor escalabilidade e manutenção

# Exemplos

### 1. Exemplo prático de combinação

Em uma aplicação Node.js típica com Express e MongoDB, você pode ver os seguintes padrões juntos:

- MVC para estrutura geral da aplicação
- Repository Pattern para abstrair o acesso ao banco de dados
- Service Layer para lógica de negócios
- Factory para instanciar objetos configuráveis, como clientes HTTP ou serviços externos
- Singleton para garantir uma única conexão com o banco de dados

A combinação de padrões diferentes permite um arquitetura sólida e flexível, pronta para crescer em complexidade e escala sem comprometer a manutenibilidade.

# [[ Voltar para: Práticas e Padrões de Código ]](../praticas-padroes-codigo.md)