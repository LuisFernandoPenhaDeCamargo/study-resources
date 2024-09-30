# Template Literals

Os Template Literals em JavaScript oferecem uma maneira simples e poderosa de trabalhar com strings, permitindo a interpolação de expressões e a criação de strings multilinha com mais facilidade. Eles são delimitados por crases (\`) em vez de aspas simples (`'`) ou duplas (`"`).

### Sintaxe Básica

```JavaScript
// Exemplo não executável.

`static text ${expression} more static text`
```

- `static text`**:** parte da string que permanece inalterada
- `${expression}`**:** expressão JavaScript que será avaliada e incluída na string resultante
- **Retorno:** uma string com o conteúdo das expressões interpoladas

# Principais Características

### 1. Interpolação de expressões

Permite incorporar expressões variáveis ou valores diretamente na string usando `${}`.

```JavaScript
const name = 'Alice';
const age  = 25;

console.log(`Hello, my name is ${name} and i have ${age} years`); // Output: Hello, my name is Alice and i have 25 years
```

### 2. Strings multilinhas

Template Literals permitem a criação de strings que podem se estender por várias linhas sem a necessidade de concatenação ou caracteres de nova linha especiais.

```JavaScript
const poem = `Roses are red,
Violets are blue,
JavaScript is amazing,
And you should learn too!
`;

console.log(poem);
/*
Output:
Roses are red,
Violets are blue,
JavaScript is amazing,
And you should learn too!
*/
```

### 3. Escapando caracteres

Use `\` para escapar crases (\`) ou `${}` se precisar usá-los como texto.

```JavaScript
const str = `This is a backtick: \` and this is a dollar sign: \$`;

console.log(str); // Output: This is a backtick: ` and this is a dollar sign: $
```

# Exemplo

```JavaScript
const product = 'Laptop';
const price   =  1999.99;

consoloe.log(`The price of ${product} is \$${price}`); // Output: The price of Laptop is $1999.99
```

# [[Voltar para: Fundamentos de JavaScript]](../fundamentos-javascript.md)