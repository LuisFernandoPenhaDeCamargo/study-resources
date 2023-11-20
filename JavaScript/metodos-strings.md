# Sumário.

### Funções de transformação.

[`.substring()`](#substring).

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