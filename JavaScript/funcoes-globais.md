# Sumário

[`decodeURIComponent()`](#decodeuricomponent).

# <a id = "decodeuricomponent"></a>`decodeURIComponent()`

`decodeURIComponent()` é usado para decodificar um componente Uniform Resource Identifier (URI) que foi codificado usando `encondeURIComponent()`.

`decodeURIComponent(encodedURI);`

`encodedURI` **(string):** a string que representa o componente URI codificado que você deseja decodificar.

Retorna uma string que representa o URI decodificado.

```JavaScript
const encodedURI = "https%3A%2F%2Fwww.example.com%2Fpath%3Fquery%3Dvalue";
const decodedURI = decodedURIComponent(encodedURI);

console.log(decodedURI); // Saída: "https://www.example.com/path?query=value"
```

Neste exemplo, `decodeURIComponent()` é usado para converter uma string URI codificada de volta a sua forma legível.