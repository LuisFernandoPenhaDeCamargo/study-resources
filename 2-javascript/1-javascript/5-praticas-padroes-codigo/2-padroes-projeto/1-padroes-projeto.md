# O que são Padrões de Projeto?

Padrões de Projeto (Design Patterns) são soluções reutilizáveis para problemas recorrentes no desenvolvimento de software. São guias ou templates para resolver desafios comuns de forma estruturada e eficiente, ajudando a melhorar a organização, a manutenção e a extensibilidade do código. Padrões de Projeto não são pedaços de código prontos, mas diretrizes sobre como estruturar o código para solucionar problemas específicos de design e arquitetura.

# Classificação dos Padrões de Projeto

Os padrões de projeto são frequentemente categorizados em três tipos principais:

### 1. Padrões Criacionais

Focam em formas de criação de objetos, promovendo flexibilidade e reutilização de código. Exemplo:

- **Singleton:** garante que uma classe tenha apenas uma instância e fornece um ponto global de acesso a essa instância
- **Factory Method:** define uma interface para criar objetos, permitindo que as subclasses decidam qual classe instanciar

### 2. Padrões Estruturais

Facilitam a composição de classes e objetos, formando estruturas maiores e mais complexas de forma mais flexível. Exemplo:

- **Adapter:** permite que classes com interfaces incompatíveis trabalhem juntas, convertendo a interface de uma classe para a interface esperada por um cliente
- **Composite:** permite que objetos individuais e composições desses objetos sejam tratados de maneira uniforme

### 3. Padrões Comportamentais

Envolvem a interação e a comunicação entre objetos, focando em como as responsabilidades são distribuídas entre eles. Exemplo:

- **Observer:** define uma dependência um-para-muitos entre objetos, onde, quando um objeto muda de estado, todos os dependentes são notificados e atualizados automaticamente
- **Strategy:** define uma família de algoritmos, encapsula cada um e os torna intercambiáveis, permitindo que o algoritmo varie independentemente dos clientes que o utilizam

# Vantagens

- **Manutenibilidade:** estruturas consistentes tornam o código mais fácil de manter e expandir
- **Reusabilidade:** ao aplicar padrões, é possível reutilizar soluções testadas e conhecidas em outros contextos
- **Melhor comunicação entre equipes:** padrões estabelecidos são documentados e reconhecidos, facilitando a colaboração e o entendimento

# Exemplos

### 1. Exemplos no desenvolvimento

- Padrões de projeto como Observer são comuns em sistemas de eventos e em interfaces gráficas de usuário
- Singleton é útil para gerenciar acesso único a recursos compartilhados, como uma conexão a um banco de dados
- Facade simplifica o uso de sistemas complexos, criando uma interface de mais alto nível para módulos internos

Os padrões de projeto foram popularizados por livros como o "Design Patterns: Elements of Reusable Object-Oriented Software" do Gang of Four (GoF), e atualmente são aplicados em várias linguagens e frameworks, auxiliando desenvolvedoresna criação de soluções mais elegantes e robustas.

# [[Voltar para: Práticas e Padrões de Código]](../praticas-padroes-codigo.md)