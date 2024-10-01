# `Error`

O objeto `Error` é utilizado para criar e manipular erros. Ele é parte fundamental do tratamento de exceções e pode ser usado para lançar erros personalizados, bem como para capturar e tratar erros que ocorrem durante a execução do código.

### Criando um Objeto

```JavaScript
// Você pode criar um objeto de erro usando o construtor.
const error =  new Error("Something went wrong!");
```

### Propriedades

- `message`**:** a mensagem de erro
- `name`**:** o nome do erro (por padrão, é `Error`)
- `stack`**:** um rastreamento da pilha de chamadas no momento em que o erro foi criado (essa propriedade é não padronizada, mas amplamente suportada)

### Tipos de Erros Incorporados

Além do tipo genérico `Error`, o JavaScript define vários tipos de erro incorporados que herdam de `Error`:

- `SyntaxError`**:** indica um erro de sintaxe
- `ReferenceError`**:** indica que uma referência inválida foi detectada
- `TypeError`**:** indica um erro quando um valor não é do tipo esperado
- `RangeError`**:** indica um erro quando um valor não está no conjunto ou intervalo permitido
- `URIError`**:** indica um erro ao codificar ou decodificar uma URI
- `EvalError`**:** indica um erro relacionado à função global `eval`

## Exemplos

- Exemplo de uso

```JavaScript
try {
    throw new Error("Something went wrong!");
} catch(error) {
    console.error(error.name);    // Output: Error
    console.error(error.message); // Output: Somethin went wrong!
    console.error(error.stack);   // Rastreamento da pilha.
}
```

- `SyntaxError`

```JavaScript
try {
    eval("foo bar"); // Código inválido.
} catch(error) {
    console.error(error); // Output: SyntaxError: Unexpected identifier
}
```

- `ReferenceError`

```JavaScript
try {
    console.log(x); // `x` não está definido.
} catch(error) {
    console.error(error); // Output: ReferenceError: x is not defined
}
```

- `TypeError`

```JavaScript
try {
    null.f(); // Tentar chamar uma função em `null`.
} catch(error) {
    console.error(error); // Output: TypeError: Cannot read properties of null (reading 'f')
}
```

## Observações

### Criando Erros Personalizados

Você pode criar suas próprias classes de erro personalizadas estendendo a classe `Error`.

```JavaScript
class CustomError extends Error {
    constructor(message) {
        super(message);
        this.name = "CustomError";
    }
}

try {
    throw new CustomError("This is a custom Error.");
} catch(error) {
    console.error(error.name);    // Output: CustomError
    console.error(error.message); // Output: This is a custom Error.
}
```

### Tratamento de Erros Assíncronos

Para tratar erros em funções assíncronas, use `try`/`catch` dentro de `async`/`await` ou manipule promessas com `catch`.

```JavaScript
async function fetchData() {
    try {
        const response = await fetch("https://api.example.com/data");
        const data     = await response.json();
    } catch(error) {
        console.error("Erro ao buscar dados:", error);
    }
}

fetchData();
```

## Conclusão

O objeto `Error` e suas subclasses são fundamentais para tratar erros em JavaScript. Eles permitem criar, lançar e capturar erros, proporcionando um meio eficaz de lidar com situações excepcionais no código. Além disso, sua capacidade de criar erros personalizados permite um tratamento de erro mais específico e detalhado, facilitando a depuração e a manutenção do código.

[`console` -->](./console.md)