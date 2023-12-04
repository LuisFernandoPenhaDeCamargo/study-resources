# Sumário.

- [`.padStart()`](#padstart);
- [`.toLowerCase()`](#tolowercase)
- [`.substring()`](#substring).

# <a id = "padstart"></a>`.padStart()`

O método `.padStart()` é usado para preencher o início de uma string com um caractere especificado até que a string alcance um determinado comprimento.

`str.padStart(targetLength [, padString]);`

- `targetLength`**:** o comprimento desejado da string resultante. Caso a string já possua um tamanho maior que o `targetLength`, o método não fará nada e a string permanecerá inalterada;
- `padString` **(opcional):** a string a ser adicionada. O padrão é um espaço em branco.\
    Mesmo que pelo impressão no interpretador você não consiga ver a alteração, você pode verificar a propriedade `.length` dela e verificar que ela realmente foi alterada.\
    Uma caso interessante é se você definir ela como uma string vazia `''`, nada acontece.

Retorna uma nova string com o comprimento desejado, preenchida com caracteres à esquerda.

```JavaScript
const originalString = "42";
const paddedString = originalString.padStart(5, "0");

console.log(paddedString); // Saída: 00042
```

# <a id = "tolowercase"></a>`.toLowerCase()`

O método `.toLowerCase()` é usado para converter todos os caracteres de uma string em minúsculas.

`string.toLowerCase();`

Não há parâmetros para o método. A chamada é feita diretamente em uma string existente.

Retorna uma nova string com todos os caracteres convertidos para minúsculas. A string original não é modificada.

```JavaScript
const originalString = "Hello, World!";
const lowerCaseString = originalString.toLowerCase();

console.log(lowerCaseString); // Saída: hello, world!
console.log(originalString);  // Saída: Hello, World!. A string original não foi modificada.
```

Neste exemplo, `.toLowerCase()` é chamado na string "`Hello, World!`", resultando em uma nova string "`hello, world!`". A string original não é alterada pelo método. Este método é utíl quando você precisa comparar strings sem diferenciar maiúsculas e minúsculas.

### Funções de transformação.

# <a id = "substring"></a>`.substring()`

O método `.substring()` retorna uma parte da string entre dois índices, começando do índice inicial até (mas não incluindo) o índice final.

`str.substring(startIndex[, endIndex]);`

- `startIndex` **(number: int):** o índice inicial a partir do qual extrair a substring;
- `headerName` **(number: int, opcional):** o índice (não incluído) até o qual extrair a substring. Se este parâmetro for omitido, a substring ser[a extraída até o final da string].

Retorna uma nova string contendo a parte da string original entre os índices especificados.

```JavaScript
const string = "Hello, World.";
const substring = string.substring(0, 5);

console.log(substring); // Saída: "Hello"
```