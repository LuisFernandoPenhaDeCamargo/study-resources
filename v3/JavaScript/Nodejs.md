# Node.js

O Node.js é um runtime JavaScript, este arquivo irá pontuar pontos importantes sobre ele.

### Sumário

- [Fluxo de Execução do Node.js](#fluxo-execucao-nodejs)
- [Versões nas Quais foram Disponibilizadas Features Específicas](#versoes-features-especificas)
- [Verificando a Compatibilidade do seu Código com Diferentes Versões do Node.js](#verificando-compatibilidade-codigo-diferentes-versoes-nodejs)

# <a id="fluxo-execucao-nodejs">Fluxo de Execução do Node.js</a>

Quando você executa um código com Node.js, ele passa por várias etapas antes de ser carregado na memória e executado.

### 1. Leitura do arquivo de código

O Node.js lê o arquivo de código-fonte do sistema de arquivos como uma sequência de bytes (tipicamente como uma string de texto).

### 2. Parsing

O código-fonte JavaScript é então analisado pelo mecanismo V8 (o motor JavaScript usado pelo Node.js) para ser transformado em uma representação interna. Isso envolve a conversão do texto em tokens, análise sintática (parsing) para criar uma árvore de sintaxe abstrata (AST), e outras transformações necessárias para preparar o código para execução.

### 3. Compilação Just-In-Time (JIT)

O V8 compila o código JavaScript para bytecode. Bytecode é uma representação intermediária que é mais próxima do código de máquina, mas ainda é independente da arquitetura do hardware.

### 4. Execução

O bytecode gerado é então executado pela máquina virtual V8. Durante a execução, o V8 pode aplicar otimizações Just-In-Time para melhorar o desempenho do código. O JIT compila partes frequentemente executadas do bytecode diretamente em código de máquina nativo para o processador específico em uso, aumentando a velocidade de execução.

### 5. Carregamento em memória

Durante a execução, os dados e funções definidas pelo código estão carregados na memória. Isso inclui variáveis globais, funções objetos e outros recursos alocados durante a execução do programa.

### 6. Gerenciamento de memória

O V8 também gerencia a memória durante a execução do código, incluindo alocação e desalocação de memória, coleta de lixo (garbage collection), e otimizações de uso de memória.

### Resumo do Processo

- **Leitura:** o Node.js lê o arquivo de código-fonte
- **Parsing:** o código-fonte é convertido em uma árvore de sintaxe abstrata (AST)
- **Compilação JIT:** o AST é compilado em bytecode pelo V8
- **Execução:** o bytecode é executado pelo V8, com possíveis otimizações JIT para código de máquina nativo
- **Memória:** o código, variáveis e objetos são carregados e gerenciados na memória durante a execução

### Exemplo

```JavaScript
function saudacao(nome) {
    return `Hello, ${name}!`;
}

console.log(saudacao("Alice"));
```

1. **Leitura:** o Node.js lê o arquivo como uma string de texto
2. **Parsing:** o V8 analisa a string para criar a AST
3. **Compilação JIT:** o V8 compila a AST em bytecode
4. **Execução:** o V8 executa o bytecode, otimizando o código frequentemente executado em código de máquina nativo
5. **Memória:** a função `saudacao()` e a string `Hello, Alice!` são carregadas na memória

Este processo permite ao Node.js executar eficientemente o código JavaScript enquanto aplica otimizações durante a execução.

## Observações

**Nem todo código é convertido em código de máquina nativo**. Durante a execução, o código **pode ser uma mistura de bytecode e código de máquina**.

O processo pelo qual o V8 (e outros motores JavaScript) converte o código JavaScript em código de máquina é chamado de JIT, nesta abordagem, apenas os hotspots são transformados em código de máquina nativo, o restante do código permanece em bytecode até que o V8 decida que vale a pena otimizá-lo.

## Compilação JIT e Otimizações

### 1. Intepretação inicial

Quando você executa o código JavaScript, o V8 inicialmente interpreta o código e o converte em bytecode. O bytecode é uma forma intermediária entre o código-fonte e o código de máquina. Ele é mais eficientepara a execução do código-fonte, mas ainda não é tão rápido quanto código de máquina nativo.

### 2. Execução de bytecode

O V8 começa executando o bytecode. Esta etapa é rápida porque a tradução inicial para bytecode é relativamente rápida, permitindo que o código comece a ser executado rapidamente.

### 3. Monitoramento de hotspots

Durante a execução do bytecode, o V8 monitora quais partes do código são executadas com mais frequência. Essas partes do código são chamadas de "**hotspots**".

### 4. Otimização dos hotspots

Quando o V8 identifica um hotspot (um pedaço de código que é executado frequentemente), ele recompila essa parte do bytecode em código de máquina nativo. Essa otimização é feita porque o código de máquina nativo executa muito mais rapidamente do que o bytecode.

### 5. Fallback para bytecode

Se durante a execução do código otimizado o V8 descobre que algumas suposições feitas durante a otimização não são mais válidas (por exemplo, devido a tipos de dados dinâmicos que mudam), ele pode reverter para o bytecode e reotimizar conforme necessário.

### Vantagens da Abordagem JIT

- **Inicialização rápida:** como a tradução inicial para bytecode é rápida, o código começa a ser executado quase imediatamente
- **Otimização dinâmica:** ao monitorar a execução do código, o V8 pode aplicar otimizações apenas onde são mais necessárias, economizando recursos
- **Adaptação ao uso:** o código pode ser reotimizado com base no comportamento real durante a execução, permitindo melhor desempenho em situações variadas

## Exemplo

```JavaScript
function soma(a, b) {
    return a + b;
}

function raramenteUsado(x) {
    return x * 2;
}

for (let i = 0; i < 1000000; i++){
    soma(1, 2);
}

raramenteUsado(5);
```

### 1. Interpretação inicial

`soma()` e `raramenteUsado()` são convertidos em bytecode.

### 2. Execução do bytecode

- O loop `for` começa a executar e chama `soma()` repeditamente
- `soma()` é identificado como um hotspot porque é chamado muitas vezes
- `raramenteUsado()` é executado uma vez e não é identificado como um hotspot

### 3. Otimização dos hotspots

- O V8 recompila `soma()` em código de máquina nativo
- `raramenteUsado()` permanece em bytecode porque não é chamado frequentemente

### 4. Execução de código otimizado

- As chamadas subsequentes a `soma()` são executadas no código de máquina nativo
- A única chamada a `raramenteUsado()` é executada no bytecode

# <a id="versoes-features-especificas">Versões nas Quais foram Disponibilizadas Features Específicas</a>

### `try`/`catch`

O bloco `try`/`catch` é uma funcionalidade fundamental do JavaScript que existe desde o início do Node.js. Portanto, a funcionalidade `try`/`catch` está disponível desde a primeira versão do Node.js, ou seja, a partir da versão 0.1.14 lançada em 2009.

### Classes

As funcionalidades relacionadas a classes (introduzidas no ES6) foram suportadas a partir do Node.js 4.x. Esta versão trouxe suporte a várias funcionalidades do ES6, incluindo a definição de classes.

Introduzir suporte para a definição  de classes inclui suporte para:

- Definição de classes usando a palavra-chave `class`
- Construtores
- Métodos de instância
- Métodos estáticos
- Herança com extends

### `async`/`await`

As funcionalidades relacionadas ao `async`/`await` foram introduzidas no Node.js a partir da versão 7.6.0. No entanto, é importante observar alguns detalhes sobre essa introdução:

- **7.6.0:** `async`/`await` foi suportado nativamente sem a necessidade de flags experimentais. Contudo, a versão 7.x do Node.js foi uma versão de curta duração e não recomendada para produção
- **8.x:** a partir da versão 8.0.0, `async`/`await` é totalmente suportado e estável, e essa versão foi uma LTS, o que a torna recomendada para uso em produção

Portanto, para um uso estável e seguro de `async`/`await` em aplicações de produção, a partir do Node.js 8.x você pode usar essas funcionalidades de forma plena.

### `import`/`export`

A funcionalidades relacionadas ao `import`/`export` dos módulos ES6 foram introduzidas no Node.js de forma gradual.

- **8.5.0:** introduziu o suporte experimental para módulos ES6 usando a extensão **.mjs** e a flag `--experimental-modules`
- **12.x:** tornou o suporte a módulos ES6 **mais estável** e começou a permitir o uso dos módulos ES6 sem a flag experimental, mas ainda usando a extensão **.mjs** ou o campo `"type": "module"` no **package.json**
- **14.x (LTS):** tornou o suporte a módulos ES6 **estável**, mas você ainda precisa usar a extesão **.mjs** ou o campo `"type": "module"` no **package.json**

Para usar módulos ES6 (`import`/`export`) de maneira estável e prática, é recomendado usar o Node.js 14.x ou superior.

### Operador de Encapsulamento

O operador de encapsulamento foi introduzido no ES2022.

## ECMAScript 2015 (ES6)

As funcionalidades do ES6 foram introduzidas de forma incremental no Node.js. Aqui está um resumo das principais funcionalidades do ES6 e as versões do Node.js que as suportam:

### 0.12.x

- Promises
- Symbols

### 4.x

- Let e Const
- Template Literals
- Arrow Functions
- Classes
- Generators

### 6.x

- Destructuring
- Operadores Rest e Spread
- Default Parameters

### 12x

- `import`/`export` (Modules)

# <a id="verificando-compatibilidade-codigo-diferentes-versoes-nodejs">Verificando a Compatibilidade do seu Código com Diferentes Versões do Node.js</a>

Executar um código que funciona com uma versão específica do Node.js (como a 8.16.0) em uma versão do Node.js sem que erros sejam emitidos durante a execução inicial é um bom indicador de compatibilidade. No entanto, isso não garante que todas as funcionalidades do código sejam totalmente compatíveis com a versão superior. Aqui estão alguns pontos a considerar:

## Considerações Sobre Compatibilidade

### 1. Compatibilidade de APIs

Node.js mantém uma boa compatibilidade com versões anteriores, mas algumas APIs podem ser deprecadas ou removidas em versões futuras. Verifique as notas de versão e depreciações documentadas para garantir que nenhuma funcionalidade crítica do seu código esteja usando APIs que foram alteradas ou removidas.

### 2. Depedências externas

Se o seu projeto usa pacotes NPM, verifique se todas as dependências são compatíveis com a versão superior do Node.js. Algumas bibliotecas podem ter problemas de compatibilidade ou podem precisar de atualizações.

### 3. Testes de Unidade e Integração

Apenas carregar e executar o código sem erros não garante que todas as funcionalidades foram testadas. Execute testes de unidade e de integração abrangentes para garantir que todas as partes do seu código funcionam conforme esperado na nova versão do Node.js.

### 4. Funcionalidades específicas do Node.js

Algumas funcionalidades específicas do Node.js, como manipulação de sistema de arquivos, streams, e APIs nativas, podem ter mudanças de comportamento sutis entre versões. Teste essas funcionalidades para garantir que continuam a funcionar corretamente.

### 5. Desempenho e segurança

Embora o código possa funcionar sem erros, mudanças no desempenho e patches de segurança podem afetar o comportamento do aplicativo. Verifique se há melhorias ou alterações de desempenho e assegure-se de que todas as práticas de segunraça recomendadas são seguidas.

## Boas Práticas para Garantir Compatibilidade

### 1. Testes automatizados

Mantenha uma suíte de testes automatizados abrangente que cubra todas as partes críticas do seu aplicativo. Execute esses testes em diferentes versões do Node.js para detectar problemas de compatibilidade.

### 2. CI

Configure um pipeline de CI que execute seus testes em várias versões do Node.js. Ferramentas de CI, como GitHub Actions, Travis CI, ou CircleCi, permitem definir matrizes de build para testar em múltiplas versões.

### 3. Verificação de dependências

Use ferramentas como `npm outdated` e  `npm audit` para verificar e atualizar as dependências do seu projeto, garantindo que elas são compatíveis com versões mais recentes do Node.js.

### 4. Revisão de notas de versão

Sempre revise as notas de versão (release notes) das novas versões do Node.js para entender as mudanças e depreciações que possam afetar seu código.

## Resumo

Executar seu código em uma versão superior do Node.js sem erros iniciais é um bom sinal, mas não garante compatibilidade total. É essencial realizar testes abrangentes e revisar dependências e notas de versão para assegurar a compatibilidade completa e evitar problemas potenciais.