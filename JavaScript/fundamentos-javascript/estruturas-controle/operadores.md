# Operadores

Para compreender melhor como os operadores abaixo funcionam, antes era necessário entender o conceito de "condicionais", por isso eles foram pontuados aqui.

## Operador Condicional (Ternário)

O operador condicional é o único operador JavaScript que possui três operandos. Este operador é frequentemente utilizado como um atalho para a instrução `if`.

- `?`**:** operador condicional (ternário)

```JavaScript
const age = 18;
// | condição (`(age >= 18)`) | operador ternário (`?`) | valor de retorno se a condição for verdadeira (`"YES"`) | dois pontos (`:`) | valor de retorno se a condição for falsa (`"No"`)
const canVote = (age >= 18) ? "Yes" : "No";

console.log(canVote); // Output: Yes
```

## Operador de coalescência nula

O operador de coalescência nula é utilizado para fornecer um valor padrão quando uma variável é `null` ou `undefined`. Ele é útil quando você quer garantir que uma variável tenha um valor, mesmo que ela não esteja definida.

- `??`**:** operador de coalescência nula

```JavaScript
const result = value1 ?? value2;
```

- Se `value1` não for `null` nem `undefined`, `result` será igual a `value1`
- Se `value1` for `null` ou `undefined`, `result` será igual a `value2`

Por exemplo:

```JavaScript
let name;
const defaultName = "Visitor";
let nameDisplayed = name ?? defaultName;

console.log(nameDisplayed); // Output: Visitor

name = "Alice";
nameDisplayed = name ?? defaultName;

console.log(nameDisplayed); // Output: Alice
```

[Laços de Repetição -->](./lacos-repeticao.md)