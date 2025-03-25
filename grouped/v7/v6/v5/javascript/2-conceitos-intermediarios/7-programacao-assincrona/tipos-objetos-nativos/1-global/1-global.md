# `global`

Em **Node.js**, `global` é o objeto que representa o escopo global do ambiente, similar ao objeto `window` nos navegadores. Todas as variáveis, funções e objetos definidos no escopo global podem ser acessados diretamente a partir do objeto `global` sem precisar referenciá-lo explicitamente.

# Principais Características

- **Objeto Global:** ele contém todos os elementos que são acessíveis globalmente em um script Node.js, como `setTimeout`, `setInterval`, entre outros
- **Acesso direto:** assim como em navegadores onde você pode acessar `window.setTimeout` ou simplesmente `setTimeout`, no Node.js você pode acessar `global.setTimeout` ou diretamente `setTimeout`
- **Adicionar variáveis ao escopo global:** é possível adicionar propriedades ao `global` para que elas sejam acessíveis em todo o script. No entanto, isso não é recomendado, pois pode causar confusão e conflitos com outras variáveis ou módulos
- **No navegador:** o equivalente a `global` no navegador é o objeto `window`, mas em Node.js, `global` é o objeto central do ambiente

Porém, em boas práticas de desenvolvimento, é recomendado evitar a utilização excessiva do `global`, preferindo manter variáveis e funções limitadas ao escopo necessário para minimizar efeitos colaterais indesejados.

# Exemplos

### 1. Acessando uma função global diretamente e através do objeto global

```JavaScript
// Acessando uma função global diretamente.
setTimeout(() => {
    console.log('Executed after 1 second');
}, 1000);

// Acessando através do objeto global.
setTimeout(() => {
    console.log('Executed through the global object');
}, 1000);
```

### 2. Adicionando variáveis ao escopo global

```JavaScript
global.myGlobalVariable = 'I am global';

console.log(global.myGlobalVariable); // Output: I am global
```

# Métodos

- [setInterval](./2-setinterval.md)

# [[Voltar para: Tipos de Objetos Nativos]](../tipos-objetos-nativos.md)