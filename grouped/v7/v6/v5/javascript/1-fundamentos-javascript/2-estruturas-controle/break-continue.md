# `break` e `continue`

O `break` e o `continue` são palavras-chaves que controlam o fluxo de execução dentro de laços de repetição. Eles permitem que você interrompa ou pule certas iterações de acordo com a lógica do seu programa.

## `break`

O `break` é uma instrução em JavaScript usada para interromper um laço de repetição ou um bloco `switch` antes que ele seja completado. Quando o `break` é encontrado, o controle do programa sai imediatamente da estrutura em execução.

```JavaScript
for(let i = 0; i < 10; i++) {
    if(i === 5) {
        break;
    }
    
    console.log(i);
}
/*
Output:
0
1
2
3
4
*/
```

## `continue`

O `continue` é uma instrução que faz com que a iteração atual de um laço seja interrompida e passe diretamente para a próxima iteração. Diferente do `break`, o `continue` não encerra o laço, ele apenas pula o restante do código na iteração atual e continua a execução a partir da próxima iteração.

```JavaScript
for(let i = 0; i < 10; i++) {
    if(i % 2 === 0) {
        continue;
    }

    console.log(i);
}
/*
Output:
1
3
5
7
9
*/
```

# Observações

Caso você tente utilizar o `break` ou o `continue` fora de um laço de repetição (o `break` também pode ser utilizado dentro de um `switch`), ocorrerá um erro:

- `break`**:** `SyntaxError: Illegal break statement`
- `continue`**:** `SyntaxError: Illegal continue statement: no surrounding iteration statement`

# [[Próximo tópico: Declaração de Funções]](../funcoes/declaracao-funcoes.md)