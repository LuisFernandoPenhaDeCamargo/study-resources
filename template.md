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
- Se for necessário, coloque o nome das "Seções Comuns" plural

### Seções Comuns

- `## Principais Características`
- `## Principais Funções`
- `## Benefícios`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`
- `# Métodos e Propriedades`
    + `### Sumário`

### Exemplos

Abaixo, temos um exemplo do que é um tópico e um subtópico (contexto do JavaScript):

### 1. Sintaxe e Tipos de Dados (Tópico)

- Variáveis (var, let, const) (Subtópico)
- Tipos de dados primitivos (string, number, boolean, null, undefined, symbol) (Subtópico)
- Operadores (aritméticos, comparação, lógicos) (Subtópico)

# <a id="links-referencia">Links de Referência</a>

- Não é necessário incluir o conteúdo em parênteses do tópico, subtópico, seção ou subseção (ou utilizar somente ele) no link de referência. Por exemplo:  
    O link de referência deste subtópico "IIFE (Immediately Invoked Function Expressions)" seria `iife` ou `immediately-invoked-function-expressions`, mas não `iife-immediately-invoked-function-expressions`.
- Se uma subseção faz parte de uma seção, ou se uma seção faz parte de um subtópico, ou se um subtópico faz parte de um tópico, você deve incluir no link de referência o valor do link de referência superior como prefixo. Por exemplo:  
    `module` é uma seção do subtópico "Módulos Internos" e o link de referência de Módulos Internos é "`modulos-internos`". O link de referência do `module` ficará da seguinte forma então: `modulos-internos-module`, observe que o link de referência de Módulos Internos foi utilizado como prefixo no link de refência do `module`, o ponto é indicar uma hierarquia e evitar um possível conflito nos links de referência causados por repetição.

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

### Template para Documentação

- O nome de classes, objetos, funções, métodos, variáveis e o texto de strings, em exemplos, devem estar em inglês (se possível)
- **Descrição da função ou método:** começa da seguinte forma, *"A função `$< nome da função >` é utilizada para ..."*, por exemplo
- **Descrição de propriedades:** começa da seguinte forma, *"A propriedade `$< nome da propriedade >` é uma propriedade do ..."*
- **Sintaxe Básica**  
    + **Parâmetro**
        - Pontue os parâmetros na forma de uma lista
        - Não é necessário pontuar no nome do item o tipo do argumento, caso você vá fornecê-lo no texto que descreve o item  
    + **Retorno**  
        - Pontue o nome deste item como *"Retorno"*
        - Se o retorno não foi pontuado inicialmente e eu não tiver a necessidade de saber o valor dele, não irei incluí-lo nas anotações

### Seções Comuns

- `## Sintaxe Básica`
- `## Principais Características`
- `## Exemplo`
- `## Observações`
- `## Conclusão`
- `## Exemplos Interessantes`

### Formatação do Código Fonte

- **Espaçamento**
    + Pule uma linha entre a importação das depedências externas e a importação dos arquivos do projeto
    + Pule uma linha entre a declaração de variáveis e as expressões
    + Pule uma linha quando for realizar impressões
    + Pule uma linha quando for retornar `response`s
    + Dependências externas, arquivos do projeto, variáveis, expressões, logs e `response`s podem ser agrupados se forem da mesma "categoria". Por exemplo: um bloco de logs
- **Logs**
    + Para ilustrar a saída (impressão) de um exemplo, na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de *"`Output:`"*. Por exemplo: `console.log("Hello, world!"); // Output: Hello, world!` (JavaScript)
    + Se no mesmo bloco de código houver mais de uma linha de log, as alinhe (se fizer sentido) de acordo com a coluna da direita
- **Comentários**
    + Quando o comentário for muito grande, o coloque na linha acima da linha de código em questão ao invés de colocá-lo na mesma linha
    + Para comentários de múltiplas linhas, utilize um bloco de documentação, mas não insira nada em sua abertura ou fechamento. Por exemplo:

```JavaScript
/*
- Primeira linha da documentação
- Segunda linha da documentação
*/
```

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