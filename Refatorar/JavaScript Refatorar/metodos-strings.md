# Sumário.

- [`.trim()`](#trim);
- [`.padStart()`](#padstart);
- [`.toLowerCase()`](#tolowercase);
- [`.toUpperCase()`](#touppercase);
- [`.slice()`](#slice);
- [`.substring()`](#substring).

# Observações

**String original:** o default é ela não ser modificada.

# <a id = "trim"></a>`.trim()`

`.trim()` é um método utilizado para remover espaços em branco no início e no final de uma string. Espaços, tabulações e quebras de linha são considerados espaços em branco.

`string.trim()`

O método `.trim()` não aceita nenhum parâmetro.

Retorna uma nova string com os espaços em branco removidos do início e do final.

```JavaScript
const originalString = "   Hello, World!   ";
const trimmedString = originalString.trim();

console.log(trimmedString); // Saída: Hello, World!
```

No exemplo acima, `.trim()` remove os espaços em branco do início e do final da string, resultando em uma nova string sem espaços desnecessários.\
O método `.trim()` é frequentemente usado para limpar entradas de usuário, onde espaços extras podem ser inseridos acidentalmente.

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

# <a id = "touppercase"></a>`.toUpperCase()`

`.toUpperCase()` é um método usado para converter uma string em maiúsculas.

`string.toUpperCase();`

Não há parâmetros na assinatura do método, pois ele é aplicado diretamente a uma string.

Retorna uma nova string contendo todos os caracteres da string original convertidos para maiúsculas.

```JavaScript
const lowercaseString = "hello";
const uppercaseString = lowercaseString.toUpperCase();

console.log(uppercaseString); // Saída: HELLO
```

Neste exemplo, o método `.toUpperCase()` é aplicado à string `"hello"`, resultando em uma nova string "`HELLO`". A string original não é modificada; em vez disso, o método retorna uma nova string com os caracteres convertidos para maiúsculas.

# <a name = "slice"></a>`.slice()`

`.slice()` é um método utilizado para extrair uma parte de uma string ou array sem modificar o original.

`array.slice([inicio[, fim]])`
`string.slice([inicio[, fim]])`

- `inicio` **(opcional):** índice onde a extração deve começar. Se não especificado, a extração começa do ínicio do array ou da string;
- `fim` **(opcional):** índice onde a extração deve terminar (não inclusivo). Se não especificado, a extração continua até o final do array ou da string.

Retorna um novo array ou uma nova string contendo os elementos ou caracteres extraídos.

```JavaScript
const originalArray = [1, 2, 3, 4, 5];
const slicedArray = originalArray.slice(1, 4);

console.log(slicedArray);   // Saída: [2, 3, 4]
console.log(originalArray); // Saída: [1, 2, 3, 4, 5] (o array original não foi modificado).
```

```JavaScript
const originalString = "abcdef";
const slicedString = originalString.slice(1, 4);

console.log(slicedString);   // Saída: bcd
console.log(originalString); // Saída: abcdef (o string original não foi modificada).
```

O método `.slice()` é flexível e pode ser usado tanto em arrays quanto em strings, proporcionando uma maneira de extrair porções específicas sem alterar o objeto original.

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