# Código

# Template para Documentação

- Os nomes de classes, objetos, funções, métodos, variáveis e o texto de strings nos exemplos devem estar em inglês, se possível
- Quando a representação "A< >" for utilizada, o texto dentro dela deverá estar em português, se possível, pois é uma explicação sobre um valor que será utilizado nessa posição
- Se um método for mencionado em um tópico que não se refere ao objeto (ou módulo) associado a ele, insira o nome do objeto (ou módulo) ao citar o método. Por exemplo:  
    O método `.readFile` do módulo `fs` seria citado como `fs.readFile` no módulo `util`.
- Alinhe a documentação das saídas (e os comentários, se fizer sentido) de acordo com a coluna mais à direita dentro do mesmo escopo

A documentação de um método (ou função), segue a seguinte ordem:

1. **Descrição:** "O método `A< nome do método >` é utilizado para **A< descrição do método >**"
    - **Descrição de propriedades:** "A propriedade `A< nome da propriedade >`" é uma propriedade do A< ... >". Por exemplo:  
        + "A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`) que verifica ..."
        + "A propriedade `true` é uma propriedade de asserção do Chai que verifica ..."
    - **Descrição de Módulos Nativos:** "O `A< nome do módulo >` é um módulo nativo do Node.js que fornece **A< descrição do que o módulo fornece >**". Por exemplo:
        + "O `url` é um módulo nativo do Node.js que fornece ..."
2. **Sintaxe básica:** "`### Sintaxe Básica`"
    - Se o título do tópico já for a "Sintaxe Básica", não é necessário incluir este subtópico novamente
3. **Parâmetros:** uma lista deles:  
    "- `A< parâmetro 1 >`**:** A< descrição do parâmetro 1 >"  
    "- `A< parâmetro 2 >`**:** A< descrição do parâmetro 2 >"  
    "- `A< ... >`**:** A< descrição dos outros parâmetros >"
    - Não é necessário indicar o tipo do argumento no nome do item, caso ele seja especificado na descrição do item
4. **Retorno:**  
    "- **Retorno:** A< descrição do valor retornado pelo método >"
    - Se o retorno não foi pontuado inicialmente na pesquisa e eu não precisar conhecer o valor dele, não o incluirei nas anotações
5. **Principais Características:** "`## Principais Características`"
6. **Opções Comuns:** "`## Opções Comuns`"
7. **Exemplo:** "`## Exemplo`"
8. **Observações:** "`##Observações`"
9. **Exemplo Interessante:** "`## Exemplo Interessante`"
10. **Observações Importantes:** "`## Observações Importantes`"
11. **Conclusão/Resumo:** "`## Conclusão`"/"`## Resumo`"

## Exemplo

```Markdown
<!-- Exemplo em Markdown. -->

O método `spy` é utilizado para **monitorar chamadas a outras funções**. Ele permite verificar como uma função foi chamada, quais argumentos foram passados, quantas vezes foi chamada, entre outros detalhes.

### Sintaxe Básica

´´´JavaScript
const spy = sinon.spy([object, ]method);
´´´

- `object`**:** o objeto que contém o método a ser espionado. Se não for fornecdio, o `spy` será aplicado diretamente à função fornecida
- `method`**:** a função ou método a ser espionado
- **Retorno:** uma função `spy` que pode ser usada para verificar chamadas, argumentos e outros detalhes sobre a função original. **O** `spy` **substitui o método original durante o teste, mas mantém a funcionalidade da função**

## Exemplo

´´´JavaScript
import sinon from "sinon";

// Função que será espionada.
function myFunction(a, b) {
    return a + b;
}

// - Criando um spy para a função `myFunction`
const spyFunction  = sinon.spy(myFunction);

// Chamando a função espionada.
spyFunction(1, 2);

// Verificando se o spy foi chamado.
console.log(spyFunction.called);         // Output: true
// Verificando o número de vezes em que o spy foi chamado.
console.log(spyFunction.callCount);      // Output: 1
// Verificando os argumentos com os quais o spy foi chamado.
console.log(spyFunction.firstCall.args); // Output: [ 1, 2 ]

// Objeto com método a ser espionado.
const obj          = {
    myMethod(a ,b) {
        return a + b;
    }
};

// - Criando um spy para o método `myMethod`
const spyObjMethod = sinon.spy(obj, "myMethod");

// Chamando o método espionado.
obj.myMethod(2, 3);

// Verificando se o spy foi chamado.
console.log(spyObjMethod.called);         // Output: true
// Verificando o número de vezes em que o spy foi chamado.
console.log(spyObjMethod.callCount);      // Output: 1
// Verificando os argumentos com os quais o spy foi chamado.
console.log(spyObjMethod.firstCall.args); // Output: [ 2, 3 ]

// Restaurar o método original.
spyObjMethod.restore();
´´´

Fique atento ao fato de que, ao chamarmos a função espionada, utilizamos `spyFunction`, enquanto para chamar o método espionado, utilizamos `obj.myMethod`. Portanto, quando se trata de funções (que não pertencem a um objeto), devemos invocar e inspecionar o espião criado (`spyFunction`). Já quando se trata de métodos (que pertencem a um objeto), devemos invocar o método espionado (`obj.myMethod`) e inspecionar o espião criado (`spyObjMethod`).

Invocar `spyObjMethod` também geraria os mesmos resultados, mas vamos definir como padrão seguir o exemplo acima.
```

[Sobre blocos de código e crases.](./Markdown.md#blocos-codigo-crases)

## Notação de Colchetes

Os colchetes em notações como

```JavaScript
// Exemplo em JavaScript.

funcao.bind(thisArg[, arg1 [, arg2 [, ...]]]);
```

indicam que os parâmetros `arg1`, `arg2`, `...`, são **opcionais**, se você não fornecer esses argumentos, a função ainda funcionará corretamente, apenas sem os agumentos predefinidos.

- A presença de colchetes ao redor dos parâmetros, indica que você pode optar por não passar nenhum desses argumentos, ou pode passar alguns ou todos eles
- Os colchetes aninhados na notação indicam que, para fornecer um argumento que está mais internamente aninhado, você deve primeiro fornecer todos os argumentos que estão nos níveis mais externos:
    + `thisArg`**:** obrigatório
    + `arg1`**:** opcional, mas só pode ser fornecido se `thisArg` também for fornecido
    + `arg2`**:** opcional, mas só pode ser fornecido se `thisArg` e `arg1` também forem fornecidos
    + `...`**:** opcionais, mas só podem ser fornecidos se `thisArg`, `arg1` e `arg2` também forem fornecidos

## Logs

- Para ilustrar a saída (impressão), na linha do log, insira ao seu final a simbologia utilizada para documentação, seguida de `Output:`. Por exemplo:  
    `console.log("Hello, world!"); // Output: Hello, world!` (exemplo em JavaScript)
- Se no mesmo bloco de código houver mais de uma linha de log, alinhe-as, se fizer sentido e se elas pertencerem ao mesmo escopo, de acordo com a coluna da direita

# Formatação do Código-fonte

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

# [[Próximo tópico: Markdown]](./Markdown.md)