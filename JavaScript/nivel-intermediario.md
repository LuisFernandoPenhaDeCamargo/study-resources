# Nível Intermediário.

### Sumário

14. [Objetos em JavaScript](#objetos-em-javascript)
15. [Operador `...` (Spread e Rest)](#operador--spread-e-rest)
    - Operador de Espalhamento (Spread Operator)
    - Operador de Coleta (Rest Parameter)
    - Aplicações do Operador `...`
    - Shallow Copy
16. [Funções de Ordem Superior](#funcoes-de-ordem-superior)
17. [Promises](#promises)
18. [Event Loop](#event-loop)
19. [Async/Await](#asyncawait)
20. [Manipulação do DOM](#manipulacao-do-dom)
21. [Trabalhando com Arrays e Objetos (forEach, map, filter)](#trabalhando-com-arrays-e-objetos-foreach-map-filter)
22. [Herança e Prototypes](#heranca-e-prototypes)
23. [Closures](#closures)
24. [Contexto](#contexto)
    - Escopo de Variáveis
    - Closures
    - Contexto de Execução
    - Contexto Lexical
    - `this` em Diferentes Contextos
    - Contexto no Event Loop
25. [Tratadores de eventos e Event Delegation](#tratadores-de-eventos-e-event-delegation)

# <a name = "objetos-em-javascript"></a>Objetos em JavaScript

# <a name = "operador--spread-e-rest"></a>Operador `...` (Spread e Rest)

O operador `...` é um recurso poderoso em JavaScript que desempenha duas funções principais: espalhar elementos de arrays e objetos, conhecidos como "spread", e coletar argumentos em funções, chamado "rest". Foi introduzido no ECMAScript 6 (ES6).

### Operador de Espalhamento (Spread Operator)

- **Espalhamento de Arrays:** com o operador de espalhamento, você pode copiar elementos de um array para outros. Isso é particularmente útil para criar cópias de arrays, mesclar arrays e adicionar ou remover elementos;
- **Espalhamento de Objetos:** você também pode usar o operador de espalhamento para criar cópias de objetos e mesclar propriedades de objetos em um novo objeto.

```JavaScript
// Espalhamento de Arrays.
const primeiroArray = [1, 2, 3];
const segundoArray = [4, 5, ...primeiroArray, 6, 7];

console.log(segundoArray); /* Saída: 
[
    4, 5, 1, 2,
    3, 6, 7
]
*/

// Espalhamento de Objetos.
const objetoOriginal = { a: 1, b: 2 };
const novoObjeto = { ...objetoOriginal, c: 3 };

console.log(novoObjeto);    // Saída: { a: 1, b: 2, c: 3 }

// Você também pode usar o Operador de Espalhamento para combinar propriedades de objetos diferentes.
const objeto1 = { a: 1, b: 2};
const objeto2 = { b: 3, c: 4};
const objeto3 = { ...objeto1, ...objeto2 };

console.log(objeto3);       // Saída: { a: 1, b: 3, c: 4 }

// Observe que, se houver propriedades com o mesmo nome em ambos os objetos, a última propriedade encontrada prevalecerá.
```

### Operador de Coleta (Rest Parameter)

O operador `...` também é usado para coletar argumentos em funções, o que é conhecido como "rest", Isso permite que você capture um número variável de argumentos em uma matriz. Aqui estã um exemplo de uma função que usar o operador rest:

```JavaScript
function soma(...numeros) {
    return numeros.reduce((total, numero) => total + numero, 0);
}

const resultado = soma(1, 2, 3, 4, 5);

console.log(resultado); // Saída: 15
```

### Aplicações do Operador `...`

O operador `...` é amplamente utilizado em JavaScript para simplificar a manipulação de dados em arrays e objetos. Suas aplicações incluem:

- Copiar arrays e objetos de forma eficiente;
- Mesclar vários arrays ou objetos em um novo;
- Espalhar elementos em funções e coletar argumentos;
- Extrair valores específicos de arrays e objetos;
- Simplificar a clonagem de estruturas de dados complexas.

### Shallow Copy

Sobre a criação de cópias, uma **cópia rasa** (**shallow copy**) significa que a nova estrutura de dados criada é uma cópia dos elementos do array original, mas não uma cópia dos próprios elementos, ela não clona os objetos ou arrays internos aninhados. Portanto, se os elementos do array original forem **objetos ou estruturas de dados complexas**, ambos o array original e a cópia compartilharão referências aos mesmos objetos.\
A cópia rasa é útil em muitos casos, especialmente quando você deseja economizar memória e manter a relação entre os objetos ou arrays originais e as cópias para algumas operações. No entanto, é importante entender quando a cópia rasa é apropriada e quando é necessário uma cópia profunda.
Se você alterar um elemento (por exemplo, um objeto) no array original, isso significa que essa alteração será refletida na cópia, e vice-versa, para objetos aninhados, porque ambas as estruturas de dados se referem ao mesmo objeto. No entanto, se você substituir um elemento no array original ou na cópia por um novo valor (**não por modificação do valor existente**), isso não afetará a outra estrutura de dados. Um exemplo para ilustrar isso:

```JavaScript
// Para evitar uma quantidade muito grande de linhas contendo console.log(), iremos modificar para este exemplo como representamos a impressão no terminal.

const objeto = { nome: "Alice" };
const copiaObjeto = { ...objeto };
const arrayObjeto = [objeto];
const copiaArrayObjeto = [...arrayObjeto];
// A ordem será, respectivamente, objeto, copiaObjeto, arrayObjeto e copiaArrayObjeto.
// Saida: { nome: "Alice" }, { nome: "Alice" }, [ { nome: "Alice" } ] e [ { nome: "Alice" } ]

objeto.nome = "Bob";
// Observe que copiaObjeto não é uma cópia rasa.
// Saida: { nome: "Bob" }, { nome: "Alice" }, [ { nome: "Bob" } ] e [ { nome: "Bob" } ]

arrayObjeto[0].nome = "Charlie";
// Como copiaObjeto não é uma cópia rasa, o valor da sua propriedade não será alterado, então iremos parar de exibi-la.
// Saida: { nome: "Charlie" }, [ { nome: "Charlie" } ] e [ { nome: "Charlie" } ] (reflete a alteração)

copiaArrayObjeto[0].nome = "Daniel";
// Independente do objeto que sofre a alteração, todos são modificados.
// Saida: { nome: "Daniel" }, [ { nome: "Daniel" } ] e [ { nome: "Daniel" } ]

arrayObjeto[1] = { nome: "Ethan" };
// Saida: { nome: "Daniel" }, [ { nome: "Daniel" }, { nome: "Ethan" } ] e [ { nome: "Daniel" } ]

objeto.nome = "Faith";
// Adicionar uma nova propriedade não afeta o fato que a primeira posição ainda se refere a mesma propriedade.
// Saida: { nome: "Faith" }, [ { nome: "Faith" }, { nome: "Ethan" } ] e [ { nome: "Faith" } ]

arrayObjeto[0] = { nome: "Grace" };
// Saida: { nome: "Faith" }, [ { nome: "Grace" }, { nome: "Ethan" } ] e [ { nome: "Faith" } ]

arrayObjeto[0].nome = "Hannah";
// Quando substituimos a primeira posição de arrayObjeto, o vínculo é desfeito, por que não foi uma modificação do objeto e sim uma substituição.
// Saida: { nome: "Faith" }, [ { nome: "Hannah" }, { nome: "Ethan" } ] e [ { nome: "Faith" } ] (não reflete a substituição)
```

A substituição em `arrayObjeto`, que envolve a substituição do objeto no array, desvincula a propriedade `nome` do objeto orginal que estava contido em `arrayObjeto`. O objeto original que foi substituído no array `arrayObjeto` não está mais relacionado à propriedade `nome` no objeto `objeto`.\
**Observe que a propriedade está vinculada entre todas as estruturas**. A substituição em si, em `arrayObjeto[0] = { nome: "Grace" }`, atribui um novo objeto a ele, este objeto pode até possuir uma chave de mesmo nome que o objeto anterior, mas é **um objeto diferente**.

É importante observar que isto se trata de elementos de estrutas complexas quando o próprio elemento é uma estrutura complexa. Quando tratamos de tipos primitivos ou quando o elemento é um tipo primitivo, uma cópia é gerada, não uma referência:

```JavaScript
let tipoPrimitivo1 = 1;
let tipoPrimitivo2 = tipoPrimitivo1;

tipoPrimitivo1 = 2;

console.log(tipoPrimitivo2); // Saída: 1 O tipoPrimitivo2 recebe uma cópia do valor de tipoPrimitivo1, não uma referência ao valor.

let objeto1 = { tipoPrimitivo: 1, objeto: { chave: 2 }};
let objeto2 = {...objeto1};
let objeto3 = objeto1;

objeto1.tipoPrimitivo = 100;
objeto1.objeto.chave = 200;

console.log(objeto1);        // Saida: { tipoPrimitivo: 100, objeto: { chave: 200 } }
console.log(objeto2);        /* Saida: { tipoPrimitivo: 1, objeto: { chave: 200 } } O primeiro elemento é um tipo primitivo, então uma cópia é gerada, o segundo, um objeto, então uma referência é realizada.*/
console.log(objeto3);        /* Saida: { tipoPrimitivo: 100, objeto: { chave: 200 } } O objeto3 foi criado utilizando o operador de atribuição e não o operador de espalhamento, então uma referência ao objeto1 como um todo é realizada.*/
```

# <a name = "funcoes-de-ordem-superior"></a>Funções de Ordem Superior

# <a name = "promises"></a>Promises

# <a name = "event-loop"></a>Event Loop

# <a name = "asyncawait"></a>Async/Await

Funções assíncronas sempre retornam Promises. Quando você declara uma função como `async`, ela automaticamente retorna uma Promise.\
Lembre-se de que, mesmo que você retorne um valor diretamente, **a função assíncrona irá implicitamente envolver esse valor em uma Promisse**. Portanto, quando você chama uma função assíncrona, você geralmente usa `.then()` ou `await` para acessar o resultado da Promise que ela retorna.

# <a name = "manipulacao-do-dom"></a>Manipulação do DOM

# <a name = "trabalhando-com-arrays-e-objetos-foreach-map-filter"></a>Trabalhando com Arrays e Objetos (forEach, map, filter)

# <a name = "heranca-e-prototypes"></a>Herança e Prototypes

# <a name = "closures"></a>Closures

No exemplo abaixo, vamos observar vários pontos importantes sobre a chamada de funções, o retorno de funções, callbacks e closures:

```JavaScript
class Exemplo {
    static funcao() {
        let body = [
            { "validation": "hash1", "game": "A" },
            { "validation": "hash2", "game": "B" },
            { "validation": "hash3", "game": "C" }
        ];
        try {
            const arrayValidacao = [
                { "validation": "hash1" },
                { "validation": "hash2" }
            ];

            if (arrayValidacao.length > 0) {
                body = body.filter(funcaoValidacao(arrayValidacao));
                /* É importante observar que funcaoValidacao não é uma callback, pois você não passa a função como argumento e sim o retorno dela, afinal você faz a chamada dela, ela está sendo passada com os parentêses e não sem eles:
                - .filter(funcaoValidacao): passando a própria função como argumento;
                - .filter(funcaoValidacao()): passando o que a função retorna como argumento.
                O uso de parênteses após o nome da função faz a chamada da função, enquanto sem os parênteses você está referenciando a pŕopria função.*/
                // console.log(body); Saída: [ { validation: 'hash3', game: 'C' } ]
            }
        }catch(err){
            console.error(err);
        }
    }
}

function funcaoValidacao(arrayValidacao) {
    // console.log(arrayValidacao); Saída: [ { validation: 'hash1' }, { validation: 'hash2' } ] O array foi recebido como argumento.
    return function (body) {
        // console.log(body);
        // console.log(arrayValidacao);
        /* Saída:
        { validation: 'hash1', game: 'A' }
        [ { validation: 'hash1' }, { validation: 'hash2' } ]
        { validation: 'hash2', game: 'B' }
        [ { validation: 'hash1' }, { validation: 'hash2' } ]
        { validation: 'hash3', game: 'C' }
        [ { validation: 'hash1' }, { validation: 'hash2' } ]
        A função anônima é uma callback que é aplicada a cada elemento do "body". A função recebe o elemento atual, por isso sabemos os valores do body.
        O valor do arrayValidacao é conhecido porque a função anônima é uma closure, uma função aninhada dentro de outra, a qual captura os valores das variáveis do escopo circundante, os valores das variáveis do escopo das funções externas.
        Closures são funções internas as quais capturam e retém o escopo em que foi criada, mesmo quando é chamada fora desse escopo. Uma observação importante é que closures lembram dos valores das variáveis no momento da sua criação (da criação da closure), se uma closure for chamada novamente mais para frente ela não possuirá o valor atualizado daquela variável.*/
      /*console.log(duplicateds.filter(function (duplicated) {
        return duplicated.validation === records.validation
      }).length == 0)*/
        return arrayValidacao.filter(function (elementoAtual) {
            // console.log(body);
            // console.log(elementoAtual);
            /* Saída: a função arrayValidacao.filter() aplica a callback para cada elemento do arrayValidacao.
            Observe que os espaços foram adicionados para auxiliar na compreensão assim como os tracejados.

            { validation: 'hash1' }
            { validation: 'hash1', game: 'A' } Isto é true.

            { validation: 'hash2' }
            { validation: 'hash1', game: 'A' } Isto é false.

            Então a primeira passagem da função arrayValidacao.filter() retorna o array "[ { validation: 'hash1' } ]", cujo o qual não possui o comprimento igual a zero:
            
            return [ { validation: 'hash1' } ].length == 0;
            
            é false, por isso o valor do body que está sendo percorrido por body.filter() não é adicionado ao array na função funcao().
            
            ----------------------------------

            { validation: 'hash1' }
            { validation: 'hash2', game: 'B' } Isto é false.

            { validation: 'hash2' }
            { validation: 'hash2', game: 'B' } Isto é true.

            return [ { validation: 'hash2' } ].length == 0;
            
            é false, novamente o valor do body que está sendo percorrido por body.filter() não é adicionado ao array na função funcao().

            ----------------------------------

            { validation: 'hash1' }
            { validation: 'hash3', game: 'C' } Isto é false.

            { validation: 'hash2' }
            { validation: 'hash3', game: 'C' } Isto é false.

            return [].length == 0;

            é true, por isso o valor do body que está sendo percorrido por body.filter() é adicionado ao array na função funcao().*/
            return elementoAtual.validation === body.validation
        })
        .length == 0;
    }
}

Exemplo.funcao();
```

# <a name = "contexto"></a>Contexto

### Escopo de Variáveis

- Definição e tipos de escopo (global, de função, de bloco);
- Como as variáveis são acessadas dentro de diferentes escopos.

### Closures

- Explicação do conceito de closures;
- Como as closures são formadas;
- Uso prático de closures.

### Contexto de Execução

- Fases do contexto de execução;
- Pilha de chamadas e execução de código.

### Contexto Lexical

- Definição de contexto lexical;
- Como as funções mantêm uma referência ao seu contexto léxico.

### `this` em Diferentes Contextos

- Comportamento da palavra-chave `this` em diferentes situações;
- Diferenças entre funções regulares e arrow functions.

### Contexto no Event Loop

- Como o contexto influencia operações assíncronas;
- Relação entre contextos e o Event Loop.

# <a name = "tratadores-de-eventos-e-event-delegation"></a>Tratadores de Eventos e Event Delegation