function contador() {
    let count = 0; // Variável capturada.

    return function() {
      count++; // A função de fechamento acessa a variável `count`.
      return count;
    }
}

/* Quando você atribui a `increment` o valor retornado pela chamada a `contador()`, increment agora é: 

function() {
    count++;
    return count;
}

pois `contador()` retorna uma função. Como podemos ver, essa função continua conseguindo acessar a variável `count`.*/
const increment = contador();

console.log(increment()); // Output: 1
console.log(increment()); // Output: 2
console.log(increment()); // Output: 3