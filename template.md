# Template

Este arquivo específica as regras para formatar os documentos (arquivos) deste repositório, ele é útil na hora de padronizar novos conteúdos que serão adicionados a este repositório, sejam tópicos, subtópicos ou subseções dos subtópicos.

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

- Eu irei pesquisar todo o conteúdo novamente
- Cuidado para não tentar se aprofundar de forma exagerada no conteúdo (inicialmente), respeite a necessidade do contexto do momento
- **17h30:** commitar o código

# <a id="nomenclatura">Nomenclatura</a>

Nomes de diretórios deveram indicar o caminho relativo para eles e a barra ao final.

# <a id="topicos-subtopicos-secoes-subsecoes">Tópicos, Subtópicos, Seções e Subseções</a>

- Tópicos, subtópicos, seções e subseções seguiram as regras gramáticais de "título"
- Observe que ao listar tópicos, subtópicos, seções ou subseções em sumários, eles não precisam seguir as regras gramaticais de "título"
- Se atente que listas (enumeradas ou não) são uma coisa, o conjunto acima, outra

### Seções Comuns

- `## Principais Características`
- `## Principais Funções`
- `## Benefícios`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`

### Seções Comuns (Código)

- `### Sintaxe Básica`
    + Pontue os parâmetros na forma de uma lista, pontue também os seus tipos. Tudo dentro da subseção acima
    + Pontue o retorno, nomeie o item da lista como **Retorno**
- `## Principais Características`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`
- `## Exemplos Interessantes`

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

- O nome de classes, objetos, funções, métodos, variáveis e o texto de strings, em exemplos, devem estar em inglês (se possível)
- **Descrição da função ou método:** começa da seguinte forma, *"A função `$< nome da função >` é utilizada para ..."*, por exemplo
- **Sintaxe Básica:**
    + **Parâmetro:** não é necessário pontuar no nome do item o tipo do argumento, caso você vá fornecê-lo no texto que descreve o item
    + **Retorno:** se não foi pontuado inicialmente e eu não tiver a necessidade de saber o valor dele, não irei incluí-lo nas anotações
- **Log:** 
    + Para ilustrar a saída (impressão) de um exemplo, na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de *"`Output:`"*. Por exemplo: `console.log("Hello, world!"); // Output: Hello, world!` (JavaScript)
    + Se no mesmo bloco de código houver mais de uma linha de log, as alinhe (se fizer sentido) de acordo com a coluna da direita
    
- Se no mesmo bloco de código houver mais de uma demonstração de "saída", as alinhe de acordo com a coluna da direita;    
- Quando o comentário for muito grande, o coloque na linha acima da linha de código em questão ao invés de na mesma linha;
- Para valores de chave, quando eles forem uma string e você quiser indicar um espaçamento, você pode utilizar o underscore;
- Espaçamento de uma linha entre imports, declaração de variáveis, console logs e classes/funções/métodos.

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