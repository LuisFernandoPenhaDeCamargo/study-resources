# Nível Intermediário.

### Sumário

10. [Objetos em JavaScript](#objetos-em-javascript)
11. [Operador `...` (Spread e Rest)](#operador--spread-e-rest)
    - Operador de Espalhamento (Spread Operator)
    - Operador de Coleta (Rest Parameter)
    - Aplicações do Operador `...`
    - Shallow Copy
12. [Funções de ordem superior](#funcoes-de-ordem-superior)
13. [Promises](#promises)
14. [Event Loop](#event-loop)
15. [Async/Await](#asyncawait)
16. [Manipulação do DOM](#manipulacao-do-dom)
17. [Trabalhando com Arrays e Objetos (forEach, map, filter)](#trabalhando-com-arrays-e-objetos-foreach-map-filter)
18. [Herança e Prototypes](#heranca-e-prototypes)
19. [Closures](#closures)
20. [Tratadores de eventos e Event Delegation](#tratadores-de-eventos-e-event-delegation)

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

# <a name = "funcoes-de-ordem-superior"></a>Funções de ordem superior

# <a name = "promises"></a>Promises

# <a name = "event-loop"></a>Event Loop

# <a name = "asyncawait"></a>Async/Await

# <a name = "manipulacao-do-dom"></a>Manipulação do DOM

# <a name = "trabalhando-com-arrays-e-objetos-foreach-map-filter"></a>Trabalhando com Arrays e Objetos (forEach, map, filter)

# <a name = "heranca-e-prototypes"></a>Herança e Prototypes

# <a name = "closures"></a>Closures

# <a name = "tratadores-de-eventos-e-event-delegation"></a>Tratadores de eventos e Event Delegation