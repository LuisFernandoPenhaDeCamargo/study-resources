# NaN (Not-a-Number)

`NaN` é uma propriedade do objeto global em JavaScript que representa um valor numérico que não pode ser interpretado como um número válido. Isso geralmente ocorre quando uma operação matemática falha ou quando se tenta converter uma string não númerica em um número.

# Principais Características

#### 1. Não é igual a si mesmo

Um fato curioso sobre o `NaN` é que ele é o único valor em JavaScript que **não é igual a si mesmo**. Isso significa que a comparação `NaN === NaN` (e a comparação `NaN == NaN`) retona `false`;

```JavaScript
console.log(NaN === NaN); // Output: false
```

#### 2. Verificando se um valor é `NaN`

Devido o comportamento incomum do `NaN`, não podemos usar o operador de igualdade para verificar se um valor é `NaN`. Em vez disso, usamos a função `Number.isNaN` ou `isNaN`.

- `Number.isNaN`**:** verifica se o valor é exatamente `NaN`
- `isNaN`**:** tenta converter o valor para um número antes de verificar se é `NaN`

```JavaScript
console.log(Number.isNaN(NaN)); // Output: true
console.log(isNaN('hello'));    // Output: true. Tenta converter "hello" em número
```

#### 3. Origem do `NaN`

O valor `NaN` pode surgir em várias situações:

- Operações aritméticas inválidas

```JavaScript
const result = 0 / 0;

console.log(result); // Output: NaN
```

- Tentativa de converter uma string não numérica para número

```JavaScript
const invalidNumber = Number('abc');

console.log(invalidNumber); // Output: NaN
```

#### 4. Diferença entre `isNaN` e `Number.isNaN`

A função `isNaN` tenta converter o valor passado antes de verificar se é `NaN`, o que pode levar a resultados inesperados. O método `Number.isNaN` é mais restrita e verifica diretamente se o valor é `NaN` sem conversão.

```JavaScript
console.log(isNaN('hello'));        // Output: true. Tenta converter 'hello'
console.log(Number.isNaN('hello')); // Output:  false. Não tenta converter
```

# Exemplo

```JavaScript
const value = 0 / 0; // Operação inválida que resulta em NaN.

if (Number.isNaN(value)) {
    console.log('The value is not a valid number'); // Output: The value is not a valid number
}
```

`NaN` é usado para representar erros numéricos em JavaScript, e entender seu comportamento é essencial para lidar corretamente com operações matemáticas e validação de dados numéricos.

# [[Próximo tópico: Infinity]](./7-infinity.md)