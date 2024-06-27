# Template

Este arquivo específica as regras seguidas para formatar os documentos (arquivos) deste repositório, ele é útil na hora de padronizar novos conteúdos que serão adicionados a este repositório, sejam tópicos, subtópicos ou subseções dos subtópicos.

### Sumário

- [Diretrizes](#diretrizes)
- [Nomenclatura](#nomenclatura)
- [Tópicos, Subtópicos, Seções e Subseções](#topicos-subtopicos-secoes-subsecoes)
- [Listas](#listas)
- [Código](#codigo)
- [Diretórios e Arquivos](#diretorios-arquivos)
- [Template para Pesquisa (ChatGPT)](#template-pesquisa-chatgpt)

# <a id="diretrizes">Diretrizes</a>

- Eu irei pesquisar todo o conteúdo novamente
- Cuidado para não tentar se aprofundar de forma exagerada no conteúdo (inicialmente), respeite a necessidade do contexto do momento
- **17h30:** commitar o código

# <a id="nomenclatura">Nomenclatura</a>

Nomes de diretórios deveram indicar o caminho relativo para eles e a barra ao final.

# <a id="topicos-subtopicos-secoes-subsecoes">Tópicos, Subtópicos, Seções e Subseções</a>

### Seções Comuns

- `## Principais Características`
- `## Exemplo`/`## Exemplos`
- `## Observações`
- `## Conclusão`

### Exemplos

Abaixo, temos um exemplo do que é um tópico e um subtópico (contexto do JavaScript):

### 1. Sintaxe e Tipos de Dados (Tópico)

- Variáveis (var, let, const) (Subtópico)
- Tipos de dados primitivos (string, number, boolean, null, undefined, symbol) (Subtópico)
- Operadores (aritméticos, comparação, lógicos) (Subtópico)

# <a id="listas">Listas</a>

Quando o item listado possuir um nome, por exemplo:

- **Performance:** permite que o JavaScript inicie operações longas (como I/O de arquivos ou chamadas de rede) sem bloquear a thread principal, permitindo que operações continuem a ser executadas

O nome do item, também chamado de entrada da lista, ou também, item da lista, que neste caso é "Performance", deve estar em negrito, assim como os dois pontos que o sucedem.

# <a id="codigo">Código</a>

O nome de classes, funções, variáveis e o texto de strings, em exemplos, devem estar em inglês.

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

# <a id="template-pesquisa-chatgpt">Template para Pesquisa (ChatGPT)</a>

- A pergunta utilizada para gerar uma lista de tópicos e subtópicos que iram me ajudar a organizar como estruturar o conhecimento que eu quero pontuar segue o seguinte formato, por exemplo: "Crie uma lista de tópicos a se estudar para dominar JavaScript."
- A pergunta utilizada para pesquisar um conceito ou ferramenta segue o seguinte formato, por exemplo: "Ferramentas de Build e Automação: Webpack, o que é?". "Ferramentas de Build e Automação" é o tópico, "Webpack" é o subtópico e "o que é" a pergunta em si