# Formatação do Código-fonte

Diretrizes para padronizar a formatação do código-fonte, abragendo nomes, espaçamento, alinhamento, estrutura de blocos e estilo de escrita, com foco na legibilidade e consistência.

### 1. Nomes de classes, objetos, funções, métodos, propriedades e variáveis

- Utilize `camelCase` para nomes de objetos, funções, métodos, propriedades e variáveis
- Utilize `PascalCase` para classes
- Nomes de constantes devem ser escritos em `UPPER_CASE`, com palavras separadas por underscores

### 2. Strings

Utilize aspas simples (`'`) para strings, a menos que seja necessário usar outra estrutura para evitar caracteres de escape.

### 3. Identação e espaçamento

- Coloque apenas uma instrução por linha para maior clareza
- Separe blocos de código (como funções e classes) com uma linha em branco para facilitar a leitura
- Pule uma linha entre:
    + Importações externas, de módulos nativos e de arquivos do projeto
    + Declarações, expressões, impressões, retornos e respostas
- Agrupe itens da mesma categoria para clareza visual
- Alinhe declarações e atribuições dentro do mesmo escopo pelo sinal de igualdade (`=`)

### 4. Parênteses e chaves

- **Parênteses:** utilize-os sempre para delimitar condições, mesmo que o operador de precedência permita omiti-los. Exemplo:

```JavaScript
// Exemplo em JavaScript.

if ((a > b) && (b < c)) { ... }
```

- **Chaves:** abra as chaves (`{`) na mesma linha da declaração, mantendo-as alinhadas com o bloco correspondente. Exemplo:

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
    'item3'           // Não pontue a vírgula ao final do último elemento do array.
];

const obj   = {
    'key1': 'value1',
    'key2': 'value2',
    'key3': 'value3', // Pontue a vírgula ao final do último par de chave-valor de um objeto.
};
```

### 6. Comentários

- Insira comentários no mesmo nível da linha de código (se possível), com uma linha de espaço entre o código e o comentário
- Alinhe comentários à direta, caso isso facilite a compreensão. Respeite o escopo correspondente sempre que possível, mas desconsidere-o se isso melhorar o entendimento

### 7. Limite de linha

Limite o comprimento de cada linha de código a 80 caracteres, quando possível, para facilitar a leitura em dispositivos menores.

### 8. Mensagens de erro

Para mensagens de erro, utilize o formato `[ A< nome da função ou método > A< nome do erro > ], A< mensagem de erro >`.

# [[ Voltar para: Código ]](./1-codigo.md)