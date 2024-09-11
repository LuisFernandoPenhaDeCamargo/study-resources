# Escopo

Em JavaScript, escopo refere-se ao contexto em que variáveis e funções são acessíveis e podem ser referenciadas. Existem diferentes tipos de escopo em JavaScript:

# Tipos de Escopo

### 1. Escopo Global

- Variáveis e funções declaradas fora de qualquer função ou bloco são acessíveis em qualquer parte do código
- No navegador, variáveis globais se tornam propriedades do objeto `window`

```JavaScript
let globalVar = "I'm global";

function globalFunction() {
    console.log(globalVar); // Acessível aqui.
}

globalFunction();           // Output: I'm global

console.log(globalVar);     // Acessível aqui também.
```

### 2. Escopo de Função

- Variáveis declaradas dentro de uma função só são acessíveis dentro dessa função
- Usado por `var`

```JavaScript
function myFunction() {
    var functionVar = "I'm in a function";

    console.log(functionVar); // Acessível aqui.
}

myFunction();                 // Output: I'm in a function

console.log(functionVar);     // Erro: functionVar não está definido.
```

### 3. Escopo de Bloco

- Variáveis declaradas dentro de um bloco `{}` (como em loops, condicionais, etc.) só são acessíveis dentro desse bloco
- Usado por `let` e `const`

```JavaScript
if (true) {
    let blockLet     = "I'm in a block";
    const blockConst = "I'm a constant in a block";
    var blockVar     = "I'm in a block and I'm acessible outside of it too"

    console.log(blockLet);   // Acessível aqui.
    console.log(blockConst); // Acessível aqui.
    console.log(blockVar);   // Acessível aqui.
}

console.log(blockLet);       // Erro: blockLet não está definido.
console.log(blockConst);     // Erro: blockConst não está definido.
console.log(blockVar);       // Acessível aqui, pois seu escopo é delimitado pelo Escopo de Função ou pelo Escopo Global.
```

### 4. Escopo Lexical

- Funções internas podem acessar variáveis do escopo externo em que foram definidas
- Isso é a base para closures

```JavaScript
function outerFunction() {
    let outerVar = "I'm outside";

    function innerFunction() {
        console.log(outerVar); // Acessível aqui.
    }

    innerFunction();
}

outerFunction();               // Output: I'm outside
```

# Principais Funções

- **Encapsulamento e isolamento:** o escopo ajuda a encapsular o código, prevenindo conflitos de nomes e melhorando a organização
- **Segurança:** variáveis no escopo adequado evitam que partes não intencionais do código as modifiquem
- **Gerenciamento de memória:** variáveis fora do escopo são elegíveis para coleta de lixo, ajudando na eficiência de memória

# Ferramentas e Abordagens

- **Closures:** funções que lembram o ambiente em que foram criadas. Será analisado com mais profundidade posteriormente
- **Hoisting:** comportamento de elevação das declarações de funções e variáveis para o topo do seu escopo
- **Strict Mode:** modo que aplica regras mais restritas, ajudando a evitar erros comuns relacionados ao escopo. Será analisado com mais profundidade posteriormente

Entender o escopo é fundamental para escrever código JavaScript eficiente e livre de bugs.

# [[Próximo tópico: Operadores]](./operadores.md)