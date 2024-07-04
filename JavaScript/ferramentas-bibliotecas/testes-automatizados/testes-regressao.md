# Testes de Regressão

Testes de regressão são um tipo de teste de software que visa garantir que novas mudanças no código não introduzam novos defeitos em áreas que já funcionavam corretamente. Esses testes são executados após alterações no software, como correções de bugs, novas funcionalidades, ou refatorações, para verificar se o sistema ainda se comporta como esperado.

## Principais Características

### 1. Repetitivos

- São executados repetidamente ao longo do ciclo de desenvolvimento, especialmente após cada mudança no código
- Envolvem a execução de um conjunto de testes que foram anteriormente aprovados para garantir que o software ainda funciona conforme o esperado

### 2. Automatizados

- Frequentemente automatizados para garantir eficiência e consistência
- Ferramentas de automação de testes, como Selenium, Jenkins, JUnit, TestNG, entre outras, são comumente usadas para facilitar a execução de testes de regressão

### 3. Cobertura abrangente

- Devem cobrir todas as funcionalidades principais do sistema, além das áreas que foram diretamente afetadas pelas mudanças recentes
- Incluem testes de integração, testes de unidade e testes de sistema

### 4. Manutenção

- A suíte de testes de regressão deve ser mantida e atualizada regularmente para incluir novos casos de teste à medida que novas funcionalidades são adicionadas
- Testes obsoletos ou irrelevantes devem ser removidos para evitar falsos positivos ou falsos negativos


## Principais Funções

- **Verificar funcionalidades existentes:** reexecutar testes de funcionalidades que foram previamente aprovadas, como login de usuário, registro, operações de CRUD, etc
- **Testar correções de bugs:** verificar se um bug que foi corrigido não reaparece após novas alterações no código
- **Validar novas funcionalidades:** garantir que a adição de novas funcionalidades não quebre funcionalidades existentes
- **Testar integrações:** verificar se a integração entre diferentes módulos do sistema ainda funciona corretamente após mudanças no código

## Benefícios

- **Detecção precoce de defeitos:** identificar rapidamente se uma mudança introduziu novos defeitos
- **Confiança:** prover confiança de que as mudanças feita não quebraram funcionalidades existente
- **Manutenção contínua da qualidade:** garantir que o software continua a atender aos requisitos especificados ao longo do tempo

## Ferramentas e Abordagens

### 1. Ferramentas de automação de testes

- **Selenium:** automação de testes para aplicativos web
- **Jenkins:** integração contínua e entrega contínua, facilitando a execução automática de testes após cada build
- **JUnit e TestNG:** ferramentas de teste para aplicações Java que suportam a execução de testes automatizados

### 2. Ambientes de teste

- Utilização de ambientes de teste dedicados para garantir que as mudanças não afetem o ambiente de produção
- Ferramentas de containerização, como Docker, podem ajudar a replicar o ambiente de produção em um ambiente de teste

### 3. Suítes de testes automatizados

Criação e manutenção de suítes de testes automatizados que incluem casos de teste abrangentes para todas as funcionalidades principais do sistema.

## Conclusão

Considerando o contexto do subtópico (Testes Automatizados), os testes de regressão envolvem a reexecução de testes unitários e de integração existentes sempre que o código for alterado. Eles são essenciais para manter a qualidade e estabilidade de um software ao longo do seu ciclo de vida, ajudando a garantir que novas mudanças não introduzam **regressões**, ou seja, novos defeitos em funcionalidades que anteriormente funcionavam corretamente. A automação desses testes é uma prática comum para aumentar a eficiência e garantir uma cobertura de teste abrangente.