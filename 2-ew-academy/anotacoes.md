Não revisei a ortografia de nenhum conteúdo neste diretório. <F

# Anotações Soltas

- A importância de configurar o ambiente: debugging, live reload e testes
- A importância de testes na prevênção de retrabalho
- Produto minimamente viável - MVP. O propósito é validar uma ideia e depois recomeçar o projeto de forma correta, considerando arquitetura, aplicação de boas práticas, 
escalabilidade, etc

---

# Introdução aos Testes Automatizados em JavaScript

# Tipos de Testes: Testes Unitários, de Integração e End to End (E2E)

Desenvolvedores de software focados em criação de projeto.

- Testes unitários
- Testes de integração
- Testes end to end

Desenvolvedores de software focados em qualidade de software realizam as seguintes validações de sistema:

- Escalabilidade
- Tempo de resposta de API ou de renderização de páginas Web
- Usabilidade em geral
- Etc.

## Testes de Integração

Validam componentes isolados, ex: no contexto envolvendo uma API, um teste seria, bate na API e verifica que ela retornou o status 201; esse teste válida que a integração 
do Endpoint, Banco de Dados e outros, funcionam corretamente, pelo código retornado pelo Endpoint, mas não necessariamente, interações do usuário final.

## Testes E2E

Validam o que acontece após a ação, simulam o fluxo completo de usuário (do ponto de vista do usuário). Considerando o contexto acima:

- Bate na API, verifica que ela retornou status 201
- Bate no endpoint de listagem e verifica que agora possui um item

+ São os testes mais demorados porque dependem do ambiente estar com os dados corretos para você poder checar a última etapa
+ Observação interessante: caso em que você armazena o valor de um teste em uma variável global para utilizar em outro caso de teste

A última observação é uma forma de desenhar os testes E2E que evita a replicação de código. O ideal neste caso é juntar as duas formas (testes de integração e E2E), 
colocar todas as chamadas as rotas da API em funções separadas e cada teste que valide o fluxo do usuário pode fazer apenas a validação do retorno destas chamadas; 
evitando assim replicação de código.

- Em cenários de Web APIs, testes de integração e E2E acabam sendo a mesma coisa, porque eles testam os endpoints do ponto de vista do cliente
- Primeiro testes unitários e só depois, testes que validam comportamento de serviços ou iterações externas
- Testes unitários servem para validar o comportamento do seu código. Você parte do princípio que qualquer iteração externa, seja Banco de Dados, Web APIs, arquivos e 
outros já funcionam e não precisam ser validados
- Testes unitários fazem parte do conceito chave de como criar código fácil de manter e completamente desaclopado; são testes que podem validar funções individuais

## Resumo

- Testes de Integração: validam componentes e suas respectivas respostas
- Testes E2E: validam o fluxo do usuário e o que a sua iteração alterou no estado da entidade
- Ambos os testes acima validam a aplicação do ponto de vista do usuário
- Testes Unitários: validam como o nosso código se comporta sem depender de qualquer iteração extena e geralmente são usados para testar funções individuais em contraste 
à integração e E2E que testam fluxos completos

# Pirâmide ou Troféu de Testes?

Conceito utilizado no desenvolvimento de software pra representar a distribuição ideal de diferentes tipos de teste em um projeto, enquanto a pirâmide diz que devemos ter 
mais testes unitários, por eles serem mais baratos e granulares, o troféu fala que devemos ter mais testes de integração e menos testes E2E e unitários.

---

# Dominando Conceitos de Testes (Mocks, Stubs, Spies...)

# Entendendo Mocks

- Mock significa imitar ou simular algo
- Um simulado ou teste prático que imita um exame real por exemplo é um "Mock Exame"
- Stubs, spies e fake timers são parte do conceito de mock
- Mockar se refere a ação de simular algo, exemplo: Mocka a conexão ao banco de dados. Mockar significa que ao invés de esperar o resultado real a gente fixa o resultado que esperamos desses serviços e validamos como o nosso código se comporta
- Mocking é uma técnica usada para isolar uma função que tá sendo testada, substituindo qualquer iteração externa por versões simuladas. Isso é feito para garantir que o teste se concentre apenas na lógica da unidade de código em questão, ou seja, na função em questão, sem depender se é afetada pelas dependências externas do sistema como internet, disponibilidade do sistema operacional, disco ou memória
- Testes unitários devem ser 100% offline e não devem ter qualquer iteração externa
- Em testes unitários você parte do princípio que qualquer iteração externa ao seu código funciona, então você não bate em APIs ou banco de dados externos
- 3 A's (AAA) quando se trata de testes unitários
    + Arrange = Preparar
    + Act     = Executar
    + Assert  = Validar
- Mocks são simulações de funções que você pode fazer ao testar comportamento
- Os Mocks nos ajudam a isolar os nossos testes e evitar retrabalho a medida que você precisa avançar em próximos passos, em resumo, eles são formas de falar "olha, daqui para trás já foi validado por outros testes, eu vou usar apenas o necessário para testar essa etapa atual"

# Entendendo Stubs

- Mocks servem para simular cenários e uma das especialidades de Mocks são Stubs
- Stubs são usados para simular cenários de conexões externas seguindo a linha de que testes unitários devem ser 100% offline
- Com Stubs, simulamos por exemplo, os possíveis estados de uma API

# Entendendo Spies

Spies também fazem parte do mundo de Mocks e são usados para inspencionar quantas vezes uma função foi chamada, assim como conferir se os parâmetros estão corretos nessas chamadas.

Observe o cenário no qual você utiliza a biblioteca `crypto` e `fs` do Node.js para criar uma hash e escrever dados em um arquivo. Considerando isto, uma grande sacada é partir do princípio que o sistema operacional possui CPU disponível para criar o hash da senha, assim como possue armazenamento suficiente para salvar o arquivo em disco.

A ideia (estamos realizando testes unitários) é que o código é responsável apenas por garantir que os parâmetros serão enviados corretamente para essas funções. Em testes de integração ou E2E, por exemplo, você utiliza conexões externas normalmente e válida que o arquivo foi armazenado corretamente na pasta específica.

Mocks ajudam a aumentar a velocidade da execução da bateria de testes porque você trabalha com todas as chamadas de forma estática, você ganha a liberdade de implementar cenários onde o sistema poderia retornar um erro se faltasse disco e verificar como o seu código se comportaria em um erro, mas não necessariamente você precisa enviar a chamada original.

Uma boa definição para entender quando usar Mocks é quando você paga por uso de escrita ou leitura de banco de dados, ou quando você paga por requisições de APIs, ou precisa acessar 3 ou 4 APIs para chegar em um resultado. Uma vez que esses dados estão fixos você isola a complexidade da lógica do seu código, faz os tratamentos de erros adequados e a sua validação acontece de forma instantânea.

Verificar a quantidade de vezes que algo foi chamado é uma prática para loops, por exemplo, para garantir que a quantidade de vocês que você chamou é igual a quantidade de vezes que você gostaria de chamar.

# Entendendo FakeTimers

- Com fake timers você pode simular como o tempo está passando na máquina sem necessariamente aguardar por este tempo
- Naturalmente, se um teste unitário demora 10s para ser executado, você pode pressupor que algo está errado. Testes unitários não devem depender do relógio, ambiente ou qualquer iteração externa

# Entendendo Code Coverage

O Code Coverage mostra o que você não testou no seu código existente mas não te fala sobre possíveis erros ou validações que a sua aplicação esteja pendente de fazer.

# Entendendo Testes End to End

---

1,5 L

01:01

- O Mocha permite dar skips em testes (`it.skip`, por exemplo)
- O Mocha possui a função de Code Coverage?
    + Tá, Code Coverage é legal
    + Code Coverage não cobre erros (dur)
    + Mas teste a métrica gerada em caso de erro, pra verificar se a métrica mudou
- O Chai possui um "expect any" para eu validar o tipo mas não o valor? Seria algo tipo `.instaceOf`?
    + `instanceOf`
- Como ativar o modo debbuging?
- Extesão de linter (JS)
- O que a sintaxe `@type {import('jest').Config}` pontua?
- Testar a propriedade `name` da funções
    + Há funções que não possuem a propriedade `name`
- Qual a diferença de importar, por exemplo, `crypto` ou `node:crypto`?
- Especificadores de formato (`%s`, por exemplo)

Claro! Vamos usar a sintaxe `@type {import('module').Type}` em um exemplo simples, sem usar o Jest, para que você possa ver como funciona.

### Exemplo Simples com um Módulo Personalizado

Suponha que você tenha um módulo chamado `math.js` que exporta uma função para somar dois números. Você pode usar a anotação de tipo para definir o tipo da função que você está importando.

#### 1. Módulo `math.js`

```javascript
// math.js
/**
 * Soma dois números.
 * @param {number} a - O primeiro número.
 * @param {number} b - O segundo número.
 * @returns {number} A soma dos dois números.
 */
function sum(a, b) {
  return a + b;
}

module.exports = sum;
```

#### 2. Arquivo Principal `index.js`

Agora, no seu arquivo principal, você pode usar a anotação de tipo para garantir que a função `sum` seja corretamente importada.

```javascript
// @type {import('./math').sum} // Especifica que 'add' deve ser do tipo da função 'sum' importada

// Importa a função de soma do módulo math
const sum = require('./math');

/**
 * Usa a função de soma para calcular a soma de dois números.
 * @param {number} x - O primeiro número.
 * @param {number} y - O segundo número.
 * @returns {number} A soma de x e y.
 */
function calculateSum(x, y) {
  return sum(x, y); // Chama a função sum
}

// Executa a função e imprime o resultado
console.log(calculateSum(5, 10)); // Saída: 15
```

### Explicação do Exemplo

1. **Módulo `math.js`**:
   - Define uma função `sum` que recebe dois números e retorna a soma deles. A documentação em JSDoc especifica o tipo dos parâmetros e o tipo de retorno.

2. **Anotação de Tipo no `index.js`**:
   - A linha `// @type {import('./math').sum}` informa ao sistema de tipos (ou ao editor) que a variável `sum` deve ser do tipo da função exportada pelo módulo `math.js`. Isso ajuda a garantir que você está usando a função corretamente.

3. **Uso da Função**:
   - A função `calculateSum` utiliza a função `sum`, e você pode chamar `calculateSum(5, 10)` para calcular a soma de 5 e 10, imprimindo o resultado no console.

### Vantagens

- **Validação de Tipos**: A anotação de tipo permite que seu editor verifique se você está usando a função corretamente e se os tipos dos parâmetros estão corretos.
- **Autocompletar**: Quando você escreve `sum(`, o editor pode fornecer sugestões e informações sobre a função.

### Conclusão

Esse exemplo simples mostra como usar a sintaxe `@type {import('./module').Type}` em um contexto que não envolve Jest, permitindo que você veja como as anotações de tipo podem ajudar na validação e compreensão do código. Se precisar de mais esclarecimentos ou de outros exemplos, estou à disposição!