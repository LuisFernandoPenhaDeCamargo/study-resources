# Nível Intermediário.

### Sumário

9. [Objetos em JavaScript](#objetos-em-javascript)
10. [Operador `...` (Spread e Rest)](#operador--spread-e-rest)
11. [Funções de ordem superior](#funcoes-de-ordem-superior)
12. [Promises](#promises)
13. [Event Loop](#event-loop)
14. [Async/Await](#asyncawait)
15. [Manipulação do DOM](#manipulacao-do-dom)
16. [Trabalhando com Arrays e Objetos (forEach, map, filter)](#trabalhando-com-arrays-e-objetos-foreach-map-filter)
17. [Herança e Prototypes](#heranca-e-prototypes)
18. [Closures](#closures)
19. [Tratadores de eventos e Event Delegation](#tratadores-de-eventos-e-event-delegation)

# <a name = "objetos-em-javascript"></a>Objetos em JavaScript

# <a name = "operador--spread-e-rest"></a>Operador `...` (Spread e Rest)

O operador `...` é um recurso poderoso em JavaScript que desempenha duas funções principais: espalhar elementos de arrays e objetos, conhecidos como "spread", e coletar argumentos em funções, chamado "rest". Foi introduzido no ECMAScript 6 (ES6).

### Operador de Espalhamento (Spread Operator).

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

### Operador de Coleta (Rest Parameter).

O operador `...` também é usado para coletar argumentos em funções, o que é conhecido como "rest", Isso permite que você capture um número variável de argumentos em uma matriz. Aqui estã um exemplo de uma função que usar o operador rest:

```JavaScript
function soma(...numeros) {
    return numeros.reduce((total, numero) => total + numero, 0);
}

const resultado = soma(1, 2, 3, 4, 5);

console.log(resultado); // Saída: 15
```

### Aplicações do Operador `...`.

O operador `...` é amplamente utilizado em JavaScript para simplificar a manipulação de dados em arrays e objetos. Suas aplicações incluem:

- Copiar arrays e objetos de forma eficiente;
- Mesclar vários arrays ou objetos em um novo;
- Espalhar elementos em funções e coletar argumentos;
- Extrair valores específicos de arrays e objetos;
- Simplificar a clonagem de estruturas de dados complexas.

Sobre a criação de copias, uma **cópia rasa** (**shallow copy**) significa que a nova estrutura de dados criada é uma cópia dos elementos do array original, mas não uma cópia dos próprios elementos. Portanto, se os elementos do array original forem **objetos ou estruturas de dados complexas**, ambos o array original e a cópia compartilharão referências aos mesmos objetos.\
Isso significa que, se você alterar um elemento (por exemplo, um objeto) no array original, essa alteração será refletida na cópia, e vice-versa, porque ambas as estruturas de dados se referem ao mesmo objeto. No entanto, se você substituir um elemento no array original ou na cópia por um novo valor (**não por modificação do valor existente**), isso não afetará a outra estrutura de dados. Um exemplo para ilustrar isso:

```JavaScript
const objeto = { nome: "Alice"};
const resultado = [objeto];
const copia = [...result];

console.log(objeto);            // Saída: { nome: 'Alice'}
console.log(resultado);         // Saída: [ { nome: 'Alice'} ]
console.log(copia);             // Saída: [ { nome: 'Alice'} ]

console.log(objeto.nome);       // Saída: Alice
console.log(resultado[0].nome); // Saída: Alice
console.log(copia[0].nome);     // Saída: Alice

// Alterando o valor no objeto original.
objeto.nome = "Bob";

console.log(objeto.nome);       // Saída: Bob
console.log(resultado[0].nome); // Saída: Bob
console.log(copia[0].nome);     // Saída: Bob (reflete a alteração)

resultado[0].nome = "Charlie";

console.log(objeto.nome);       //Saída: Charlie
console.log(resultado[0].nome); //Saída: Charlie
console.log(copia[0].nome);     //Saída: Charlie

// Substituindo o objeto no array original.
resultado[0] = { nome: "Dalton" };

console.log(objeto.nome);       //Saída: Charlie
console.log(resultado[0].nome); //Saída: Dalton
console.log(copia[0].nome);     //Saída: Charlie (não reflete a substituição)
```

A substituição em `result`, que envolve a substituição do objeto no array, desvincula a propriedade `nome` do objeto orginal que estava contido em `result`. O objeto original que foi substituído no array `result` não está mais relacionado à propriedade `nome` no objeto `objeto`.\
**Observe que a propriedade está vinculada entre todas as estruturas**. A substituição em si, em `result[0] = { nome: "Dalton" };`, atribui um novo objeto a ele, este objeto pode até possuir uma chave de mesmo nome que o objeto anterior, mas é **um objeto diferente**.

# <a name = "funcoes-de-ordem-superior"></a>Funções de ordem superior

# <a name = "promises"></a>Promises

# <a name = "event-loop"></a>Event Loop

# <a name = "asyncawait"></a>Async/Await

# <a name = "manipulacao-do-dom"></a>Manipulação do DOM

# <a name = "trabalhando-com-arrays-e-objetos-foreach-map-filter"></a>Trabalhando com Arrays e Objetos (forEach, map, filter)

# <a name = "heranca-e-prototypes"></a>Herança e Prototypes

# <a name = "closures"></a>Closures

# <a name = "tratadores-de-eventos-e-event-delegation"></a>Tratadores de eventos e Event Delegation