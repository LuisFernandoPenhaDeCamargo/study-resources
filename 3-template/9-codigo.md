# Código

Este documento apresenta diretrizes para documentação e formatação de código, com orientações específicas para nomenclatura, estrutura e uso de espaços.

# Template para Documentação

- Utilize inglês para nomes de classes, objetos, funções, métodos, variáveis e strings em exemplos
- Quando utilizar a notação `A<>`, inclua texto explicativo em português dentro dos colchetes angulares, para identificar o valor esperado naquela posição
- Ao citar um método fora do contexto de seu objeto ou módulo, inclua a referência completa. Exemplo: `fs.readFile` em vez de `readFile` quando o contexto não for o módulo `fs`
- Comentários devem ser alinhados à direita, caso isso facilite o entendimento. Neste caso não considere o escopo
- As saídas devem ser alinhadas à direita. O escopo deve ser desconsiderado apenas se isso facilitar o entendimento
- Indique que se trata de uma saída com a estrutura "Output"

## Estrutura de Documentação de Métodos e Funções

1. **Descrição:** use o formato "O método `A< nome do método >` é utilizado para **A< descrição do método >**"
    - Para **propriedades**: "A propriedade `A< nome da propriedade >` é uma propriedade..."
    - Para **módulos nativos**: "O `A< nome do módulo >` é um módulo nativo que fornece **A< descrição do módulo >**"
2. **Sintaxe Básica:** inclua uma seção para sintaxe básica, exceto quando o título já indique isso
3. **Parâmetros:** "`A< parâmetro >`**:** A< descrição >"
4. **Retorno:** detalhe o valor retornado, quando aplicável. "**Retorno:** A< descrição >"
5. Principais Características
6. Opções Comuns
7. Exemplos
8. Observações
9. Dificuldades Encontradas
10. Exemplos Interessantes
11. Observações Importantes
12. Conclusão/Resumo

## Notação de Colchetes

Em documentações, utiliza-se a notação de colchetes (`[]`) para indicar que determinados parâmetros são opcionais em uma função ou método. Esse formato permite descrever a ordem e a opcionalidade de parâmetros de forma clara e padronizada.

Os colchetes indicam que o parâmetro dentro deles pode ser omitido sem causar erro de execução.

```JavaScript
// Exemplo em JavaScript.

optionalExample(mandatoryParameter[, optionalParameter]);
```

Em notações aninhadas, cada camada de colchetes indica que os parâmetros internos só podem ser utilizados quando os externos já tiverem sido fornecidos.

```JavaScript
// Exemplo em JavaScript.

func.bind(thisArg[, arg1[, arg2[, ...]]]);
```

- `thisArg` é obrigatório
- `arg1` é opcional, mas só pode ser fornecido se `thisArg` já estiver definido
- `arg2` e argumentos adicionais também são opcionais, mas só podem ser passados se `thisArg` e `arg1` forem fornecidos previamente

# Formatação do Código-fonte

### 1. Nomes de variáveis e funções

- Utilize `camelCase` para nomes de variáveis e funções
- Utilize `PascalCase` para classes
- Nomes de constantes devem ser escritos em `UPPER_CASE`, com palavras separadas por underscores

### 2. Strings

Utilize aspas simples (`'`) para strings, a menos que seja necessário usar outra estrutura para evitar caracteres de escape

### 3. Identação e espaçamento

- Coloque apenas uma instrução por linha para maior clareza
- Separe blocos de código (como funções e classes) com uma linha em branco para facilitar a leitura
- Pule uma linha entre:
    + Importações externas, de módulos nativos e de arquivos do projeto
    + Declarações, expressões, impressões, retornos e respostas
- Agrupe itens da mesma categoria para clareza visual

### 4. Parênteses e chaves

- **Parênteses:** utilize-os sempre para delimitar condições, mesmo que o operador de precedência permita omiti-los. Exemplo

```JavaScript
// Exemplo em JavaScript.

if ((a > b) && (b < c)) { ... }
```

- **Chaves:** abra as chaves `{` na mesma linha da declaração, mantendo-as alinhadas com o bloco correspondente. Exemplo:

```JavaScript
// Exemplo em JavaScript.

function example() {
    if (condition) {
        // Bloco de código.
    }
}
```

### 5. Formatação de arrays ou objetos

Para arrays ou objetos de múltiplas linhas, alinhe cada elemento em uma nova linha, com a vírgula ao final da linha. Exemplo:

```JavaScript
// Exemplo em JavaScript.

const array = [
    'item1',
    'item2',
    'item3'           // Não pontue a vírgula no último elemento do array.
];

const obj   = {
    'key1': 'value1',
    'key2': 'value2',
    'key3': 'value3', // Pontue a vírgula no último par de chave-valor de um objeto.
}
```

### 6. Comentários

- Insira comentários no mesmo nível da linha de código (se possível), com uma linha de espaço entre o código e o comentário
- Evite comentários redundantes; use-os para explicar blocos complexos ou lógicas incomuns
- Comentários devem ser alinhados à direita, caso isso facilite o entendimento. Neste caso não considere o escopo

### 7. Limite de linha

Limite o comprimento de cada linha de código a 80 caracteres, quando possível, para facilitar a leitura em dispositivos menores.

### 8. Mensagens de erro

Para mensagens de erro, utilize o formato `[ A< nome da função ou método > A< nome do erro > ], A< mensagem de erro >`.

# [[Próximo tópico: Markdown]](./10-markdown.md)