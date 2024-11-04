**Mensagens de erro** seguem o seguinte formato, "`[ A< nome da função ou método/nome do arquivo > ${error.name} ], ${error.message}`", sendo que o template literal, a técnica de interpolação de expressão, a propriedade `name` e a propriedade `message` do objeto `error`, fazem parte do JavaScript, para outras linguagens siga a mesma ideia, mas utilizando das propriedades da linguagem em questão.

## Espaçamento

- Pule uma linha:
    + Entre a importação de uma depedência externa e a importação de um arquivo do projeto
    + Entre uma declaração e o restante do código
    + Entre uma expressão e o restante do código
    + Entre uma impressão e o restante do código
    + Entre um retorno e o restante do código
    + Entre uma resposta (`response`s, em Javascript, por exemplo) e o restante do código
- Dependências externas, arquivos do projeto, variáveis, expressões, impressões e respostas podem ser agrupados quando pertencem à mesma categoria. Por exemplo, um bloco de impressões
- Alinhe as atribuições e os valores das propriedades de acordo com a coluna mais à direita dentro do mesmo escopo

## Comentários

- Os comentários devem ser posicionados acima da linha ou do bloco de código que estão documentando
- Para comentários de múltiplas linhas, utilize um bloco de documentação sem adicionar qualquer texto na abertura ou no fechamento. Por exemplo:

```JavaScript
/*
Exemplo em JavaScript.
- Primeira linha da documentação
- Segunda linha da documentação
*/
```

- Para comentários de múltiplas linhas que contêm código, as linhas que não são código devem ser comentadas novamente. Isso facilita a desativação do comentário externo, permitindo a execução do código interno sem problemas. Por exemplo:

```JavaScript
/*
Exemplo em JavaScript.
my-module.mjs
- Exportando uma função como padrão
*/
export default function myFunction() {
    console.log("This is the default export function");
}

/*
// Podemos remover a estrutura acima (barra seguida de asterisco) e a estrutura abaixo (asterisco seguido de barra) para obter, de forma prática, um código pronto para execução.
// - Para exportar variáveis (ou objetos) como padrão de um módulo, é necessário declará-las antes de exportá-las. Por exemplo:
const myVariable = 42;

export default myVariable;
// O código acima está correto, enquanto o código abaixo gera um erro.
export default const myOtherVariable; // Não é permitido utilizar as palavras-chave `var`, `let` ou `const` após `default`.
*/
```

Normalmente, essa situação ocorre quando o código comentado é um exemplo que, ao ser executado, gera um erro, por isso está comentado. No entanto, isso não significa que não desejamos facilitar o processo de descomentá-lo para observar seu comportamento.