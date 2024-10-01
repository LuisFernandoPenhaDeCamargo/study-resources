# Infinity

`Infinity` é uma propriedade global em JavaScript que representa um valor numérico infinito. Ele é gerado quando uma operação excede o maior número representável em JavaScript, ou em operações como divisão por zero.

# Principais Características

### 1. Natureza do `Infinity`

- O valor de `Infinity` é maior que qualquer número finito
- `-Infinity` é menor que qualquer número finito

```JavaScript
console.log(Infinity > 1000000);   // Output: true Output: 
console.log(-Infinity < -1000000); // Output: true
```

### 2. Geração de `Infinity`

O valor `Infinity` pode ser gerado em várias situações, como:

- Divisão de um número por zero
- Um número muito grande que excede o valor máximo representável em JavaScript

```JavaScript
console.log(1 / 0);              // Output: Infinity
console.log(-1 / 0);             // Output: -Infinity
console.log(Math.pow(10, 1000)); // Output: Infinity. Excede o limite
console.log(0 / 0);
```

### 3. Verificando `Infinity`

Para verificar se um valor é infinito, pode-se usar o método `Number.isFinite`. Ela retorna `false` para `Infinity` e `-Infinity`

```JavaScript
console.log(Number.isFinite(Infinity));  // Output: false
console.log(Number.isFinite(-Infinity)); // Output: false
console.log(Number.isFinite(100));       // Output: true
```

### 4. Comparação com `Infinity`

- `Infinity` é maior que qualquer número finito e representa o maior valor possível
- `-Infinity` é menor que qualquer número finito e representa o menor valor possível
- `Infinity` é considerado igual a si mesmo

```JavaScript
console.log(Infinity === Infinity); // Output: true
console.log(Infinity > 999999);     // Output: true
console.log(-Infinity < -999999);   // Output: true
```

### 5. Operações envolvendo `Infinity`

- Adição ou subtração de `Infinity` com números retorna `Infinity`
- Multiplicação de `Infinity` por número finitos retorna `Infinity` (ou `-Infinity` para números negativos)
- Multiplicar `Infinity` por `0` resulta em `NaN`

```JavaScript
console.log(Infinity + 1);         // Output: Infinity
console.log(Infinity * 10);        // Output: Infinity
console.log(Infinity * -1);        // Output: -Infinity
console.log(Infinity * 0);         // Output: NaN
console.log(Infinity - Infinity);  // Output: NaN
```

# Exemplo

```JavaScript
const bigNumber = Math.pow(10, 1000); // Excede o limite numérico.

if (bigNumber === Infinity) {
    console.log('The number is too large to represent'); // Output: The number is too large to represent
}
```

# Resumo

# [[Próximo tópico: Escopo]](./8-escopo.md)