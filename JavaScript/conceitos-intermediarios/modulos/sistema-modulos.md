# Sistema de Módulos

Um sistema de módulos é uma maneira de organizar e dividir o código em partes reutilizáveis e independentes, chamadas módulos. Esses módulos podem conter funções, objetos, classes ou qualquer outro código JavaScript e permitem que você isole funcionalidades específicas, facilitando a manutenção e reutilização de código em diferentes partes do projeto.

# O que Significa ser um Sistema de Módulos

Em JavaScript, o sistema de módulos define como diferentes arquivos e bibliotecas podem ser interconectados e reutilizados, carregando partes específicas do código de um módulo para outro. O uso de módulos evita o "global scope pollution", ou seja, impede que todas as variáveis e funções sejam expostas no escopo global, ajudando a evitar conflitos e bugs.

Os sistemas de módulos permitem:

- Dividir o código em partes menores, mais organizadas e testáveis
- Reutilizar módulos em diferentes partes da aplicação ou em projetos diferentes
- Controlar o que é exposto (exportado) e o que é mantido privado dentro de um módulo

Observer que tanto o CJS quanto o ESM são sistemas de módulos com características próprias, diferenciando-se em alguns pontos da sintaxe, funcionalidades disponíveis e aspectos de funcionamento.