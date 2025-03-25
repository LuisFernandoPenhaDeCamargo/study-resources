# Escopo

Em JavaScript, escopo define a acessibilidade de variáveis e funções em diferentes partes do código. O escopo pode ser global ou local (de função ou de bloco). Vamos detalhar:

### 1. Escopo global

Variáveis e funções declaradas fora de qualquer função ou bloco pertencem ao escopo global e podem ser acessadas de qualquer parte do código.

```JavaScript
const message = 'Global Scope'; // Escopo global.

function displayMessage() {
    console.log(message); // Pode acessar a variável global.
}

displayMessage(); // Output: Global Scope
```

### 2. Escopo de função

Variáveis declaradas dentro de uma função têm escopo local e só podem ser acessadas dentro daquela função.

```JavaScript
function greet() {
    const message = 'Hello'; // Escopo local (da função).

    console.log(message);
}

greet();                 // Output: Hello

// console.log(message); // Output: ReferenceError: message is not defined
```

### 3. Escopo de bloco

Com o uso de `let` e `const`, variáveis podem ter escopo de bloco, sendo limitadas ao bloco `{}` em que foram declaradas, como em loops ou condicionais.

```JavaScript
if (true) {
    const message = 'Block Scope'; // Escopo de bloco.
    var blockVar  = "I'm in a block and I'm acessible outside of it too";

    console.log(message);  // Output: Block Scope
    console.log(blockVar); // Output: I'm in a block and I'm acessible outside of it too
}

// console.log(message);  // Output: ReferenceError: message is not defined
console.log(blockVar);    // Output: I'm in a block and I'm acessible outside of it too. Acessível aqui, pois seu escopo é delimitado pelo escopo global ou pelo escopo de função.
```

### Regras de escopo

- Variáveis no escopo mais interno podem acessar variáveis no escopo externo (chain de escopos)
- Escopos internos não podem ser acessados externamento

# Principais Funções

- **Encapsulamento e isolamento:** o escopo ajuda a encapsular o código, prevenindo conflitos de nomes e melhorando a organização
- **Segurança:** variáveis no escopo adequado evitam que partes não intencionais do código as modifiquem
- **Gerenciamento de memória:** variáveis fora do escopo são elegíveis para coleta de lixo, ajudando na eficiência de memória

# Ferramentas e Abordagens

- **Closures:** funções que lembram o ambiente em que foram criadas
- **Hoisting:** comportamento de elevação das declarações de funções e variáveis para o topo do seu escopo
- **Strict Mode:** modo que aplica regras mais restritas, ajudando a evitar erros comuns relacionados ao escopo

Entender o escopo é fundamental para escrever código JavaScript eficiente e livre de bugs.

# [[Voltar para: Fundamentos de JavaScript]](../fundamentos-javascript.md)