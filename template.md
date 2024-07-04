# Template

Este arquivo específica as regras para formatar os documentos (arquivos) deste repositório, ele é útil na hora de padronizar novos conteúdos que serão adicionados, sejam tópicos, subtópicos seções ou subseções.

### Sumário

- [Diretrizes](#diretrizes)
- [Nomenclatura](#nomenclatura)
- [Tópicos, Subtópicos, Seções e Subseções](#topicos-subtopicos-secoes-subsecoes)
- [Links de Referência](#links-referencia)
- [Listas](#listas)
- [Diretórios e Arquivos](#diretorios-arquivos)
- [Código](#codigo)
- [JavaScript](#javascript)
- [Template para Pesquisa (ChatGPT)](#chatgpt)

# <a id="diretrizes">Diretrizes</a>

Abaixo segue uma lista de diretrizes que eu sigo:

- Eu irei pesquisar todo o conteúdo deste repositório novamente. Estou refatorando os seguintes diretórios:
    + **v2**
    + **v3**
    + **Pos-graduacao**
- Cuidado para não tentar se aprofundar de forma exagerada no conteúdo (inicialmente), respeite a necessidade do contexto no momento
- **17h30:** commitar o código

# <a id="nomenclatura">Nomenclatura</a>

- **Diretórios:** nome de diretórios deveram indicar o caminho relativo para eles e a barra ao final

# <a id="topicos-subtopicos-secoes-subsecoes">Tópicos, Subtópicos, Seções e Subseções</a>

- Tópicos, subtópicos, seções e subseções seguiram as regras gramáticais de "títulos"
- Se atente que listas (enumeradas ou não) são uma coisa, o conjunto acima, outra
- Se for necessário, coloque o nome das "Subseções Comuns" plural

### Subseções Comuns

- `## Principais Características`
- `## Principais Funções`
- `## Benefícios`
- `## Ferramentas e Abordagens`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`
- `## Exemplo Interessante`/`## Exemplos Interessantes`
- `## Observações Importantes`
- `# Métodos e Propriedades`

### Exemplo

Abaixo temos um exemplo do que é um tópico, um subtópico e uma seção (contexto do JavaScript).

```Markdown
## Fundamentos de JavaScript (tópico)

### 1. Sintaxe e Tipos de Dados (subtópico)

- Variáveis (var, let, const) (seção)
- Tipos de dados primitivos (string, number, boolean, null, undefined, symbol) (seção)
- Operadores (aritméticos, comparação, lógicos) (seção)

(Markdown)
```

# <a id="links-referencia">Links de Referência</a>

- Não é necessário incluir o conteúdo em parênteses do tópico, subtópico, seção ou subseção no link de referência (ou utilizar somente ele). Por exemplo:  
    O link de referência da seção "IIFE (Immediately Invoked Function Expressions)" seria `iife` ou `immediately-invoked-function-expressions`, mas não `iife-immediately-invoked-function-expressions`.
- Se uma subseção faz parte de uma seção, ou se uma seção faz parte de um subtópico, ou se um subtópico faz parte de um tópico, você deve incluir no link de referência o valor do link de referência "superior" como prefixo. Por exemplo:  
    "`module`" é uma subseção da seção "Módulos Internos" e o link de referência de Módulos Internos é "`modulos-internos`". O link de referência de `module` ficará da seguinte forma então: `modulos-internos-module`, observe que o link de referência de Módulos Internos foi utilizado como prefixo no link de refência de `module`, o ponto é indicar uma hierarquia e evitar um possível conflito nos links de referência causados por repetição.

# <a id="listas">Listas</a>

- Quando o item listado possuir um nome, por exemplo:  
    *"- **Performance:** permite que o JavaScript inicie operações longas (como I/O de arquivos ou chamadas de rede) sem bloquear a thread principal, permitindo que operações continuem a ser executadas"*  
    O nome do item (também chamado de entrada da lista, ou item da lista), que neste caso é "Performance", deve estar em negrito assim como os dois pontos que o sucedem.
- Não utilizar pontuação no final dos itens

# <a id="diretorios-arquivos">Diretórios e Arquivos</a>

Abaixo, iremos exemplificar como eu vou representar a estrutura hierarquica do sistema de arquivos em exemplos.

```Bash
my-project/
└── src/
    ├── services/
    │   └── sensitive_data_getters.js
    ├── custom-tests/
    │   └── getAccessToken.test.js
    ├── index.js
    └── package.json
```

# <a id="codigo">Código</a>

## Template para Documentação

- O nome de classes, objetos, funções, métodos, variáveis e o texto de strings, em exemplos, devem estar em inglês (se possível)
- Quando a representação "`$<  >`" for utilizada, o texto dentro dela deverá estar em português (se possível), pois ele é uma explicação sobre um valor que será utilizado nesta posição
- **Descrição da função ou método:** começa da seguinte forma, *"A função `$< nome da função >` é utilizada para ..."*, por exemplo
- **Descrição de propriedades:** começa da seguinte forma, *"A propriedade `$< nome da propriedade >` é uma propriedade do ..."*. Por exemplo:
    + "A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`) que verifica ..."
    + "A propriedade `true` é uma propriedade de asserção do Chai que verifica ..."
- **Sintaxe Básica**  
    + **Parâmetro**
        - Pontue os parâmetros na forma de uma lista
        - Não é necessário pontuar no nome do item o tipo do argumento, caso você vá fornecê-lo no texto que descreve o item  
    + **Retorno**  
        - Pontue o nome deste item como *"Retorno"*
        - Se o retorno não foi pontuado inicialmente e eu não tiver a necessidade de saber o valor dele, não irei incluí-lo nas anotações


### Exemplos

### Logs

- Para ilustrar a saída (impressão), na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de *"`Output:`"*. Por exemplo: `console.log("Hello, world!"); // Output: Hello, world!` (JavaScript)
- Se no mesmo bloco de código houver mais de uma linha de log, as alinhe (se fizer sentido) de acordo com a coluna da direita

### Comentários

- Para comentários de múltiplas linhas, utilize um bloco de documentação, mas não insira nada em sua abertura ou fechamento. Por exemplo:

<a id="codigo-abertura-fechamento"></a>

```JavaScript
/*
- Primeira linha da documentação
- Segunda linha da documentação
(JavaScript)
*/
```

- Para comentários de múltiplas linhas que contém código, as linhas que não são código, deveram ser comentadas novamente. O objetivo é a facilidade ao descomentar a estrutura mais externa e poder simplesmente executar o que é código. Por exemplo:

```JavaScript
// myModule.mjs
// - Exportando uma função como padrão
export default function myFunction() {
    console.log("This is the default export function.");
}

/* Podemos remover esta estrutura (a barra seguida de asterisco) e a estrutura abaixo (o asterisco seguido de barra), para assim obter com facilidade um código pronto para ser executado.
// - Para exportar variáveis (ou objetos) como padrão de um módulo, você precisa declará-las antes de exportá-las. Por exemplo:
const myVariable = 42;
export default myVariable;

// O código acima está correto, o abaixo gera um erro.

export default const myVariable; // Você não pode nem utilizar as palavras-chave `var`, `let` e `const` após `default`.
*/
```

Normalmente, essas situações ocorrem quando o código que está comentado é um exemplo de código que ao ser executado gera um erro, por isso ele está comentado. Mas isso não quer dizer que não queremos facilidade no momento de descomentá-lo para observar o seu comportamento.

## Subseções Comuns

- `## Sintaxe Básica`
- `## Principais Características`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`
- `## Exemplo Interessante`/`## Exemplos Interessantes`
- `## Observações Importantes`

## Formatação do Código Fonte

### Espaçamento

- Pule uma linha entre a importação das depedências externas e a importação dos arquivos do projeto
- Pule uma linha entre a declaração de variáveis e as expressões
- Pule uma linha quando for realizar impressões
- Pule uma linha quando for retornar `response`s
- Dependências externas, arquivos do projeto, variáveis, expressões, logs e `response`s podem ser agrupados se forem da mesma "categoria". Por exemplo: um bloco de logs

### Comentários

- Quando o comentário for muito grande, o coloque na linha acima da linha de código em questão ao invés de colocá-lo na mesma linha   
- Para comentários de múltiplas linhas, utilize um bloco de documentação, mas não insira nada em sua [abertura ou fechamento](#codigo-abertura-fechamento)

# <a id="javascript">JavaScript</a>

- **Funções anônimas:** deveram ter um espaço entre a palavra-chave `function` e os parênteses

# <a id="chatgpt">Template para Pesquisa (ChatGPT)</a>

1. A pergunta utilizada para gerar uma lista de tópicos e subtópicos que iram me ajudar a estruturar o conhecimento que eu quero pontuar segue o seguinte formato, *"crie uma lista de tópicos a se estudar para dominar JavaScript"*, por exemplo
2. Modelo de pergunta para pesquisar funções ou métodos:

```
$< nome da função ou método >:
- Sintaxe Básica
    - Parâmetros
    - Retorno
```