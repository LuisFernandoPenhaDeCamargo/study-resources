# `setInterval`

O método `setInterval` é utilizado para **executar repetidamente uma função ou código com um intervalo de tempo fixo entre cada execução**. A execução continuará até que o intervalo seja cancelado usando o método `clearInterval`.

### Sintaxe Básica

```JavaScript
setInterval(function, delay[, arg1[, arg2[, ...]]]);
```

- `function`**:** a função a ser executada repetidamente
- `delay`**:** o intervalo de tempo em milissegundos entre cada execução
- `arg1`, `arg2`, `...`**:** argumentos adicionais que podem ser passados para a função
- **Retorno:** retorna um identificador (`intervalID`) que pode ser usado para cancelar o intervalo com `clearInterval`

# Exemplo

```JavaScript
function sayHello() {
    console.log('Hello!');
}

// Executa a função `sayHello` a cada 2 segundos.
const intervalID = setInterval(sayHello, 2000);

// Cancela o intervalo após 10 segundos.
setTimeout(() => clearInterval(intervalID), 10000);
```

Neste exemplo, a função `sayHello` será chamada a cada 2 segundos, e após 10 segundos, o intervalo será cancelado com `clearInterval`.

# [[Voltar para: `global`]](./1-global.md)