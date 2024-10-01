# Sumário

- [`setInterval()`](#setinterval);
- [`decodeURIComponent()`](#decodeuricomponent).

# <a id = ""></a>`setInterval()`

`setInterval()` é uma função global que executa uma função ou avalia uma expressão em intervalos de tempo regulares, especificados em milissegundos.

`setInterval(callback, delay, ...args)`

- `callback` **(function):** uma função a ser executada a cada intervalo de tempo;
- `delay`**:** o número de milissegundos entre cada chamada da função;
- `...args` **(opcional):** argumentos adicionais que podem ser passados para a função.

Retorna um identificador que pode ser usado com `clearInterval()` para cancelar o intervalo

```JavaScript
function showTime() {
    const now = new Date();
    
    console.log(now.toLocaleTimeString());
}

// Executa a função showTime a cada 1 segundo (1000 milissegundos).
const intervalId = setInterval(showTime(), 1000);

// Após 5 segundos, cancela o intervalo.
setTimeout(() => {
    clearInterval(intervalId);

    console.log("Intervalo cancelado após 5 segundos.");
}, 5000);
```

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