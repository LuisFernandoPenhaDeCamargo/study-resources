# Código

## Template para Documentação

- O nome de classes, objetos, funções, métodos, variáveis e o texto de strings, em exemplos, devem estar em inglês (se possível)
- Quando a representação "`$<  >`" for utilizada, o texto dentro dela deverá estar em português (se possível), pois ele é uma explicação sobre um valor que será utilizado nesta posição
- **Descrição da função ou método:** começa da seguinte forma, "A função `$< nome da função >` é utilizada para ...", por exemplo
- **Descrição de propriedades:** começa da seguinte forma, "A propriedade `$< nome da propriedade >` é uma propriedade do ...". Por exemplo:
    + "A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`) que verifica ..."
    + "A propriedade `true` é uma propriedade de asserção do Chai que verifica ..."
- Se eu pontuar sobre uma função (ou método) em um tópico que não se trata do módulo (ou objeto) associado a ele, também o insira na hora de citar a função (ou método). Por exemplo:  
    `.readFile` do módulo `fs`, seria citado como `fs.readFile` no módulo `util`

### Notação de Colchetes

Os colchetes em notações como

```JavaScript
funcao.bind(thisArg[, arg1 [, arg2 [, ...]]]);

// (Exemplo em JavaScript)
```

indicam que os parâmetros `arg1`, `arg2`, `...`, são **opcionais**, se você não fornecer esses argumentos, a função ainda funcionará corretamente, apenas sem os agumentos predefinidos.

- A presença de colchetes ao redor dos parâmetros, indica que você pode optar por não passar nenhum desses argumentos, ou pode passar alguns ou todos eles
- Os colchetes aninhados na notação indicam que, para fornecer um argumento que está mais internamente aninhado, você deve primeiro fornecer todos os argumentos que estão nos níveis mais externos
    + `thisArg`**:** obrigatório
    + `arg1`**:** opcional, mas só pode ser fornecido se `thisArg` também for fornecido
    + `arg2`**:** opcional, mas só pode ser fornecido se `thisArg` e `arg1` também forem fornecidos
    + `...`**:** opcionais, mas só podem ser fornecidos se `thisArg`, `arg1` e `arg2` também forem fornecidos

### Tópicos Comuns

Observe que a lista abaixo segue a ordem na qual os tópicos devem aparecer dentro de um documento.

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

### Logs

- Para ilustrar a saída (impressão), na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de *"`Output:`"*. Por exemplo:  
    `console.log("Hello, world!"); // Output: Hello, world!` (exemplo em JavaScript)
- Se no mesmo bloco de código houver mais de uma linha de log, as alinhe (se fizer sentido) de acordo com a coluna da direita

## Formatação do Código-fonte

- **Mensagens de erro** seguem o seguinte formato, "`[ $< nome da função ou método/ nome do arquivo > ${error.name} ], ${error.message}`", sendo que o template literal, a técnica de interpolação de expressão e a propriedade `message` do objeto `error`, fazem parte do JavaScript, para outras linguagens siga a mesma ideia, mas utilizando das propriedades da linguagem em questão

### Espaçamento

- Pule uma linha:
    + Entre a importação de uma depedências externa e a importação de um arquivo do projeto
    + Entre uma declaração e o restante do código
    + Entre uma expressão e o restante do código
    + Entre uma impressão e o restante do código
    + Entre um retorno e o restante do código
    + Entre uma resposta (`response`s) e o restante do código
- Dependências externas, arquivos do projeto, variáveis, expressões, logs e repostas, podem ser agrupados se forem da mesma "categoria". Por exemplo: um bloco de impressões

## Comentários

- Comentários deverão estar acima da linha de código (ou bloco de código) que está sendo documentada
- Para comentários de múltiplas linhas, utilize um bloco de documentação, mas não insira nada em sua abertura ou fechamento. Por exemplo:

```JavaScript
/*
- Primeira linha da documentação
- Segunda linha da documentação
(Exemplo em JavaScript)
*/
```

- Para comentários de múltiplas linhas que contém código, as linhas que não são código, deverão ser comentadas novamente. O objetivo é a facilidade ao descomentar a estrutura mais externa para poder executar o que é código. Por exemplo:

```JavaScript
// my-module.mjs
// - Exportando uma função como padrão
export default function myFunction() {
    console.log("This is the default export function.");
}

/* 
// Podemos remover a estrutura acima (a barra seguida de asterisco) e a estrutura abaixo (o asterisco seguido de barra), para assim obter com facilidade um código pronto para ser executado.
// - Para exportar variáveis (ou objetos) como padrão de um módulo, você precisa declará-las antes de exportá-las. Por exemplo:
const myVariable = 42;

export default myVariable;
// O código acima está correto, o abaixo gera um erro.
export default const myVariable; // Você não pode utilizar as palavras-chave `var`, `let` e `const` após `default`.
(Exemplo em JavaScript)
*/
```

Normalmente essa situação ocorre quando o código que está comentado é um exemplo que ao ser executado gera um erro, por isso ele está comentado. Mas isso não quer dizer que não queremos facilidade no momento de descomentá-lo para observar o seu comportamento.

[Markdown -->](./Markdown.md)