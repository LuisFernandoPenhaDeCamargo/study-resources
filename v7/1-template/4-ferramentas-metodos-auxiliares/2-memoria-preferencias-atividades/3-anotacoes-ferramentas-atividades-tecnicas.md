# Anotações sobre Ferramentas e Atividades Técnicas

Este documento contém o histórico sobre ferramentas, técnicas e atividades técnicas específicas.

# Ambiente de Testes Unitários com JavaScript

### 1. Ferramentas utilizadas

O usuário trabalha com Mocha, Sinon.JS, Chai e esmock para criação de testes unitários em JavaScript

- **Objetivo:** compreender e aplicar mocks, stubs e spies em métodos, especialmente em ESM
- **Aprendizado sobre esmock:** o esmock permite manipulação de namespaces de exportação padrão, possibilitando a substituição de exportações nomeadas nos testes

### 2. Testando módulos com diferentes tipos de exportação

Exportação de objetos vs exportação de funções: o usuário testa módulos que exportam objetos e percebe diferenças de comportamento em comparação com módulos que exportam funções. Ele nota que importar um objeto pode alterar o comportamento de stubs, especialmente para objetos instanciados na importação.

### 3. Mocking de métodos que retornam objetos complexos

Criação manual de stubs: em métodos como `createHash` (módulo Crypto) e `createClient` (módulo Node-Redis), onde os métodos retornam objetos, o usuário cria stubs manuais para simular o comportamento completo dos objetos e seus métodos associados, evitando o uso direto dos métodos construtores.

### 4. Considerações para testes em scripts sem exportações

Testando scripts executados diretamente: o usuário possui scripts sem exportações diretas, que executam o necessário imediatamente, e busca entender como aplicar testes unitários a esse tipo de código.

### 5. Substituição de módulos em testes unitários

Uso de esmock para substituir módulos: para evitar conflitos causados pela substituição global de métodos, como `fs.readFileSync` (cuja substituição interfere no funcionamento normal do Node.js), o usuário considera o esmock para substituir o módulo File System diretamente no módulo que está sendo testado.

# Outros Interesses Técnicos

### 1. Comparação de alocação de memória entre JavaScript e outras linguagens

Interesse em explorar as diferenças na alocação de memória em JavaScript em comparação com outras linguagens de programação.

### 2. Método `constructor` e herança em JavaScript

Exploração do `constructor` no contexto de herança: o usuário explora o funcionamento do método `constructor` em JavaScript, especialmente dentro do conceito de herança, e entende que o `sinon.stub` não atua da mesma forma no `constructor` que em outros métodos.

### 3. Migrações de banco de dados com Umzug e `SequelizeStorage`

Uso e testes para migrações: ao lidar com migrações de banco de dados, o usuário utiliza o módulo Umzug com `SequelizeStorage` para armazenar o estado das migrações. Ele está interessado em sugerir e criar testes unitários para o módulo que executa e registra as migrações no banco.

# [[ Voltar para: Memória de Preferências e Atividades (ChatGPT) ]](./1-memoria-preferencias-atividades.md)