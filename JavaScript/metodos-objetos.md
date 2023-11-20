# Sumário

[`.bind()`](#bind).

# <a id = "bind"></a>`.bind()`

O método `bind()` é um método de objetos (os objetos em questão são funções, ou seja, um método de funções), ele cria uma nova função que, quando chamada, tem uma palavra-chave `this` predefinida com um valor específico, e alguns argumentos iniciais também podem ser fixados.\
Cria uma nova função **vinculada a um determinado objeto ou valor** para a palavra-chave `this`.

`function.bind(thisArg[, arg1[, arg2[, ...]]]);`

- `thisArg`**:** o valor a ser usado como `this` quando uma nova função é chamada;
- `arg1`, `arg2`, `...` **(opcionais):** argumentos que serão fixados à frente daqueles fornecidos quando a nova função é chamada.

Retorna uma nova função com a palavra-chave `this` predefinida e, opcionalmente, alguns argumentos fixados.

```JavaScript
const objeto = {
    valor: "batata",
    imprimeValor: function () {
      const valor = "cenoura";
      console.log(this.valor);
    }
};
const novaImprimeValor = objeto.imprimeValor;
/* O que você está fazendo na linha de cima está ilustrado basicamente abaixo:
const novaImprimeValor = function () {
    const valor = "cenoura";
    console.log(this.valor);
}
*/

objeto.imprimeValor();  // Saída: batata
/* O "(this.valor)" se refere ao "valor" definido no objeto, não na função, por conta da palavra-chave "this". "this" se refere ao "objeto".
Se ao invés de "console.log(this.valor)", estivesse "console.log(valor)", ai sim a saída seria "cenoura".*/
novaImprimeValor();     // Saída: undefined
/* Considerando a ilustração que foi feita acima do que realmente a atribuição representa, podemos perceber que "novaImprimeValor()" não está vinculada a nenhum objeto, então não possui valor para o "this", por isso a saída é "undefined".*/

const novaImprimeValorBind = objeto.imprimeValor.bind(objeto);

novaImprimeValorBind(); // Saída: batata
// Pois o método ".bind()" vincula o objeto "objeto" a "novaImprimeValorBind()", fazendo com que ela possui valor "this".

objeto.valor = "abobrinha";

objeto.imprimeValor();  // Saída: abobrinha
novaImprimeValor();     // Saída: undefined
novaImprimeValorBind(); // Saída: abobrinha
// Lembrando que a criação foi feita por atribuição, considerando que são objetos, a criação é feita por referência e não por cópia.

const objeto2 = {
    valor: "berinjela",
    imprimeValor: function () {
        console.log(this.valor);
    }
}

objeto2.imprimeValor(); // Saída: 

objeto2.imprimeValor = objeto2.imprimeValor.bind(objeto);

objeto2.imprimeValor(); // Saída:
```