# Código

## Template para Documentação

- O nome de classes, objetos, funções, métodos, variáveis e o texto de strings, em exemplos, devem estar em inglês (se possível)
- Quando a representação "`$<  >`" for utilizada, o texto dentro dela deverá estar em português (se possível), pois ele é uma explicação sobre um valor que será utilizado nesta posição
- **Descrição da função ou método:** começa da seguinte forma, "A função `$< nome da função >` é utilizada para ...", por exemplo
- **Descrição de propriedades:** começa da seguinte forma, "A propriedade `$< nome da propriedade >` é uma propriedade do ...". Por exemplo:
    + "A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`) que verifica ..."
    + "A propriedade `true` é uma propriedade de asserção do Chai que verifica ..."
- Observe que a lista abaixo segue a ordem na qual elas devem aparecer dentro de um documento

## Tópicos Comuns

- `Sintaxe Básica`
    + Se o título do tópico já for a "Sintaxe Básica", não é necessário fornecer este subtópico
    + **Parâmetro**
        - Pontue os parâmetros na forma de uma lista
        - Não é necessário pontuar no nome do item o tipo do argumento, caso você vá fornecê-lo no texto que descreve o item  
    + **Retorno**  
        - Pontue o nome deste item como *"Retorno"*
        - Se o retorno não foi pontuado inicialmente na pesquisa e eu não tiver a necessidade de saber o valor dele, não irei incluí-lo nas anotações
- `Principais Características`
- `Opções Comuns`
- `Exemplo`/`Exemplos`
- `Conclusão`
- `Observações`
- `Exemplo Interessante`/`Exemplos Interessantes`
- `Observações Importantes`

## Exemplos

### Logs

- Para ilustrar a saída (impressão), na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de *"`Output:`"*. Por exemplo:  
    `console.log("Hello, world!"); // Output: Hello, world!` (JavaScript)
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
// my-module.mjs
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

## Código

### Notação de Colchetes

Os colchetes em notações como

```JavaScript
funcao.bind(thisArg[, argumento1 [, argumento2 [, ...]]]);
```

indicam que os parâmetros `argumento1`, `argumento2`, `...`, são **opcionais**, se você não fornecer esses argumentos, a função ainda funcionará corretamente, apenas sem os agumentos predefinidos.

- A presença de colchetes ao redor dos parâmetros, indica que você pode optar por não passar nenhum desses argumentos, ou pode passar alguns ou todos eles
- Os colchetes aninhados na notação indicam que, para fornecer um argumento que está mais internamente aninhado, você deve primeiro fornecer todos os argumentos que estão nos níveis mais externos
    + `thisArg`**:** obrigatório
    + `argumento1`**:** opcional, mas só pode ser fornecido se `thisArg` também for fornecido
    + `argumento2`**:** opcional, mas só pode ser fornecido se `thisArg` e `argumento1` também forem fornecidos
    + `...`**:** opcionais, mas só podem ser fornecidos se `thisArg`, `argumento1` e `argumento2` também forem fornecidos

### Formatação

- **Mensagens de erro:** seguem o seguinte formato, "`[ $< nome da função ou método/ nome do arquivo > ERROR ], ${error.message}`", sendo que o template literal e `${error.message}` fazem parte da sintaxe específica do JavaScript, para outras linguagens, siga a mesma ideia, mas utilizando das propriedades da linguagem em questão

[Markdown -->](./Markdown.md)