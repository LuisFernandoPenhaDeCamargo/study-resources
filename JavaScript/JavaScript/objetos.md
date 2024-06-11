# Objetos (Ok)

### Sumário

- [Funções](#funcoes)
    + [`.bind()`](#funcoes-bind)
- [`JSON`](#json)
    + [`.stringify()`](#json-stringify)

# <a id="funcoes"></a>Funções

- Em JavaScript, funções são objetos, isso significa que elas possuem propriedades e métodos, assim como qualquer outro objeto
- Elas são um tipo especial de objeto, são objetos de primeira classe, o que significa que podem ser atribuídas a variáveis, passadas como argumentos para outras funções e retornadas por outras funções
- Além disso, elas têm propriedades e métodos próprios.

### Sumário

- [`.bind()`](#funcoes-bind)

## <a id="funcoes-bind"></a>`.bind()`

É utilizado para **criar uma nova função que, quando chamada, tem seu** `this` **setado para um valor específico**. Isso permite que você controle o contexto de execução da função, garantindo que ela sempre use o mesmo objeto como `this`, independentemente de como ou onde a função é chamada.

**Sintaxe Básica**

```JavaScript
funcao.bind(thisArg[, argumento1 [, argumento2 [, ...]]]);
```

- `thisArg`**:** o valor a ser passado como o `this` para a função quando a função é chamada. Em funções não estritas, `null` e `undefined` serão substituídos pelo objeto global (window em navegadores). Em funções estritas, o valor de `this` permanece como o valor especificado
- **"argumentos":** argumentos a serem pré-preenchidos na função vinculada

**Observações Importantes**

- **Criação de uma nova função:** `.bind()` não altera a função original. Em vez disso, ele cria uma nova função com o `this` pré-definido
- **Pré-preenchimento de argumentos:** você pode usar `.bind()` para pré-preencher alguns ou todos os argumentos de uma função. Isso é útil para criar funções de ordem superior
- **Contexto em funções de retorno de chamada:** `.bind()` é frequentemente usado para garantir que o contexto `this` seja preservado quando funções são passadas como callbacks

### Exemplos

```JavaScript
const pessoa = {
    nome: "Alice",
    saudacao: function() {
        console.log(`Hello, my name is ${this.nome}`);
    },
};

// `.bind()` para um objeto.
const saudacao = pessoa.saudacao.bind(pessoa);

saudacao(); // Output: Hello, my name is Alice

// `.bind()` com pré-preenchimento de argumentos.
function multiplica(a, b) {
    return a * b;
}

const dobrado = multiplica.bind(null, 2); // Preenche o primeiro argumento como 2.

console.log(dobrado(5)); // Output: 10

// `.bind()` em métodos de classes.
class Contador {
    constructor() {
        this.contador = 0;
        this.incrementa = this.incrementa.bind(this);
    }

    incrementa() {
        this.contador++

        console.log(this.contador);
    }
}

const contador = new Contador();

setTimeout(contador.incrementa, 1000); // Output: 1
```

### Comparação com `.call()` e `.apply()`

- `.bind()`**:** cria uma nova função com um contexto `this` específico e, opcionalmente, argumentos pré-preenchidos. Não chama a função imediatamente
- `.call()`**:** chama a função imediatamente com um contexto `this` específico e argumentos passados individualmente
- `.apply()`**:** chama a função imediatamente com um contexto `this` específico e argumentos passados como um array

```JavaScript
function saudacao(cumprimento, pontuacao) {
    console.log(cumprimento + ", " + this.usuario + pontuacao);
}

const objeto = { usuario: "Alice" };

saudacao.call(objeto, "Hello", "!");   // Output: Hello, Alice!
saudacao.apply(objeto, ["Hi", "..."]); // Output: Hi, Alice...

const saudacaoAlice = saudacao.bind(objeto, "Hey");

saudacaoAlice("?");                    // Output: Hey, Alice?
```

# <a id="json"></a>`JSON`

### Sumário

- [`.stringify()`](#json-stringify)

## <a id="json-stringify"></a>`.stringify()`

É utilizado para **converter objetos JavaScript em strings JSON**. Ele é amplamente utilizado para serializar dados para armazenamento ou transmissão em formatos compatíveis com JSON.

**Sintaxe Básica**

```JavaScript
JSON.stringify(valor[, replacer[, espacamento]]);
```

- `valor`**:** o valor a ser convertido em uma string JSON. Pode ser um **objeto**, **array**, **número**, **string**, **booleano** ou `null`
- `replacer` **:** uma **função** ou **array** que pode ser usada para selecionar ou alterar as propriedades que serão incluídas na string JSON. Se for uma função, recebe cada par chave-valro durante a serialização. Se for um array, apenas as propriedades cujos nomes estão neste array serão incluídas
- `espacamento `**:** um **número** ou **string** usado para adicionar espaçamento à string JSON para formatação legível. Se for um número, representa o número de espaços; se for uma string, essa string será usada como o espaço

**Observações Importantes**

- **Funções e valores** `undefined`**:** propriedades de objeto cujos valores são funções ou `undefined` são ignoradas durante a serialização
- **Ciclos de referência:** `.stringfy()` lança um erro se tentar serializar um objeto com referências circulares (um objeto que refere a si mesmo)

### Exemplos

```JavaScript
function exemplo() {};

const objeto = {
    nome: "Alice",
    undefined: undefined,
    idade: 25,
    funcao: exemplo,
    cidade: "New York",
};

// Exemplo básico.
let stringJson = JSON.stringify(objeto);

console.log(stringJson); // Output: {"nome":"Alice","idade":25,"cidade":"New York"}

// Com `replacer`.
stringJson = JSON.stringify(objeto, (chave, valor) => {
    if (chave === "idade") {
        return undefined;
    }

    return valor;
});

console.log(stringJson); // Output: {"nome":"Alice","idade":25,"cidade":"New York"}

// Com `space` para formatação legível.
stringJson = JSON.stringify(objeto, null, 2);

console.log(stringJson);
/*
Output:
{
    "nome":"Alice",
    "idade":25,
    "cidade":"New York"
}
*/

// Serializando Arrays.
const array = [1, "false", false];

stringJson = JSON.stringify(array);

console.log(stringJson); // Output: [1,"false",false]
```