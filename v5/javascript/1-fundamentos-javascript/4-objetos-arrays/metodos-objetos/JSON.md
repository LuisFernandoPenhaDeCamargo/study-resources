# Métodos do `JSON`

### Sumário

- [`parse`](#parse)

# <a id="">`parse`</a>

O método `parse` é utilizado para **converter uma string JSON em um objeto JavaScript**.

```JavaScript
JSON.parse(text[, reviver]);
```

- `text`**:** a string JSON válida a ser convertida em um objeto
- `reviver`**:** uma função que transforma os resultados. Esta função é chamada para cada par chave-valor no objeto, e pode ser usada para transformar os valores
- **Retorno:** o objeto JavaScript correspondente à string JSON fornecida

## Observações

- Se a string passada para `parse` não for um JSON válido, um erro `SyntaxError` será lançado
- Funções (ou métodos) e `undefined` não são válidos em JSON e, portanto, serão ignorados durante a conversão

## Exemplos

```JavaScript
const jsonString = '{"name": "John", "age": 30, "city": "New York"}';

// - Exemplo simples
let obj          = JSON.parse(jsonString);

console.log(obj.name); // Output: John

// - Exemplo com `reviver`
obj              = JSON.parse(jsonString, (key, value) => {
    if (key === "age") {
        return undefined; // Exclui a chave `age` do objeto final.
    }
    return value;
})

console.log(obj);      // Output: { name: 'John', city: 'New York' }
```