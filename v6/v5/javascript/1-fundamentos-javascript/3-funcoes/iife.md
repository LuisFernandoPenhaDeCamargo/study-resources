# Immediately Invoked Function Expressions (IIFE)

**Immediately Invoked Function Expressions (IIFE)** são funções em JavaScript que são definidas e imediatamente executadas após sua criação. Elas são úteis para criar um escopo privado, evitando a contaminação do escopo global, especialmente quando se deseja isolar variáveis temporárias.

Uma IIFE é uma função que é executada imediatamente após sua definição. Isso é feito envolvendo a função entre parênteses e, em seguida, chamando-a imediatamente.

```JavaScript
(function() {
    // Código aqui dentro.
})();
```

ou com uma função de flecha:

```JavaScript
(() => {
    // Código aqui dentro.
})();
```

- **Parâmetros:** as IIFEs podem receber parâmetros da mesma forma que funções normais
- **Retorno:** elas podem retornar valores, mas como são autoexecutadas, o valor retornado geralmente é atribuído a uma variável ou processado imediatamente

# Benefícios

1. **Escopo privado:** variáveis dentro de uma IIFE não poluem o escopo global
2. **Execução Imediata:** ela é usada quando se deseja executar uma função imediatamente após sua definição
3. **Isolamento de código:** ideal para isolar partes do código, como bibliotecas, de modo que suas variáveis não interfiram com outros

# Exemplos

```JavaScript
// - Exemplo simples
(function() {
    console.log("IIFE executada!");
})();                // Output: IIFE executada!

// - Exemplo com parâmetros
(function(a, b) {
    console.log(a + b);
})(5, 7);            // Output: 12

// - Exemplo com retorno
const result = (function(a, b) {
    return a * b;
})(3, 4);

console.log(result); // Output: 12
```

As IIFEs são comumente usadas em padrões de design como o Module Pattern, para encapsular código em uma função autoexecutada, limitando o escopo das variáveis.

# [[Próximo tópico: Funções Anônimas]](./funcoes-anonimas.md)