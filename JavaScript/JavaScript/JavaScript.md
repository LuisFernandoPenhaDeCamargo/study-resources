# JavaScript (Ok)

### Sumário

- [Módulo x Biblioteca](#modulo-x-biblioteca)

# <a id="modulo-x-biblioteca"></a>Módulo x Biblioteca

### Módulo

Um módulo é um pedaço de código reutilizável que fornece funções, classes, objetos ou valores específicos. Em JavaScript, um módulo é um arquivo que exporta código para ser usado em outros arquivos.

**Características**

- **Granularidade:** normalmente focado em uma funcionalidade específica ou um pequeno conjunto de funcionalidades
- **Escopo:** um módulo é uma unidade de encapsulamento e pode ter seu próprio escopo. Tudo definido dentro de um módulo não interfere com o escopo global a menos que seja explicitamente exportado
- **Reutilização:** projetado para ser reutilizado em diferentes partes de uma aplicação ou em diferentes projetos

### Biblioteca

Uma biblioteca é uma coleção de módulos que fornecem uma ampla gama de funcionalidades relacionadas. Ela é mais abrangente e oferece uma coleção coesa de funções, métodos ou classes que são destinadas a serem usadas em conjunto para resolver problemas ou realizar tarefas específicas.

**Características**

- **Amplitude:** oferece uma coleção de funcionalidades que cobrem um domínio ou tarefa específicos, mas de forma mais abrangente do que um módulo individual
- **Coesão:** as funcionalidades fornecidas por uma biblioteca são geralmente relacionadas e trabalham bem juntas
- **Complexidade:** pode ser composta de muitos módulos e arquivos, cada um com responsabilidades específicas, mas combinados para fornecer funcionalidades robustas

### Comparação

| Característica | Módulo | Biblioteca |
|---|---|---|
| Escopo | Focado em funcionalidades específicas | Coleção de módulos relacionados |
| Reutilização | Pode ser reutilizado em diferentes contextos | Oferece um conjunto de funcionalidades coesas |
| Granularidade | Normalmente mais granular | Mais abrangente |
| Exemplo | `math.js` com funções de adição e subtração | Express para criação de servidores web |
| Complexidade | Menos complexo | Por ser bastante complexo, com muitos módulos |

### Conclusão

- **Módulo:** ideal para encapsular e reutilizar pequenas partes do código. Excelente para funções ou classes específicas
- **Biblioteca:** ideal para fornecer um conjunto coeso de funcionalidades que trabalham juntas para resolver problemas mais complexos. É composta por múltiplos módulos, oferecendo uma solução mais abrangente

Ambos são fundamentais para a organização e reutilização de código, mas são utilizados em diferentes níveis de abstração.