# Template.

## `nomeDaFuncao(não incluir os parâmetros no título)`

Descrição da função. Se na sua descrição o retorno ficar claro, não precisa incluir "Retorna ..." mais abaixo.

Mais detalhes sobre a função.

```
- Código exemplificando o seu uso;
- Aqui devemos incluir todos os seus parâmetros. Utilizar nomes intuitivos.
```

Descrição de seus parâmetros:\
parâmetro (se é opcional ou não): descrição.

Retorna ...

Lista de nomes de objetos:

- array;

Lista de nomes de parâmetros:

- objeto;
- .

# Funções de array.

## `.map()`

É usada para percorrer todos os elementos de um array e aplicar uma função em cada elemento, **gerando um novo array** com os resultados das chamadas de função. A função que você fornece como argumento para o `.map()` é chamada para cada elemento do array e permite que você transforme ou processe cada delemento individualmente.

```JavaScript
const novoArray = arrayOriginal.map(funcaoDeMapeamento(elemento, indice, arrayOriginal) => {
  //Código que processa o elemento e retorna um novo valor.
});
```

- `arraOriginal`: o array original que você deseja percorrer;
- `funcaoDeMapeamento()`: função chamada para cada elementos do array. Ela pode receber três argumentos:
  - `elemento`: elemento atual sendo processado;
  - `indice` (opcional): o índice do elemento atual;
  - `arrayOriginal` (opcional): o array original que está sendo percorrido.
- `novoArray`: o novo array gerado pelo `.map()`.

Exemplo interessante:

```JavaScript
const array = [{}, {}, {}];

const novoArray = array.map(indice => "?,?,?,?,?"); //Os três objetos literais vazios (cada um deles) foram substituídos pela string ?,?,?,?,? no novoArray.

console.log(array);     //[ {}, {}, {} ]
console.log(novoArray); //[ '?,?,?,?,?', '?,?,?,?,?', '?,?,?,?,?' ]
```

## `.join()`

É usada para criar uma **nova string juntando todos os elementos de um array em uma única string, separando-os por um delimitador específico** que você fornece como argumento.

`array.join(delimitador);`

- `array`: o array cujos elementos você deseja unir em uma única string;
- `delimitador` (opcional): o **caractere** ou **string** que será usado como separador entre os elementos no resultado. Este argumento é opcional; se não for fornecido, os elementos do array serão separados por vírgulas por padrão.

## `.reduce()`

É usada para reduzir (ou acumular) todos os elementos de um array em um único valor. Ele executa uma função de callback em cada elemento do array, acumulando um valor final à medida que percorre os elementos.

`array.reduce(callback(accumulator, currentValue, currnetIndex, array), initialValue);`

- `array`: o array que você deseja reduzir;
- `callback`: uma função de callback que é chamada para cada elemento no array. Ela recebe quatro argumentos:
    - `accumulator`: o valor acumulado até o momento;
    - `currentValue`: o valor do elemento atual no array;
    - `cirrentIndex` (opcional): o índice do elemento atual;
    - `array` (opcional): o array original que está sendo percorrido.
- `initialValue` (opcional): um valor inicial para o acumulador. Se não for fornecido, o primeiro elemento do array será usado como valor inicial e a redução começará a partir do segundo elemento.

## `.concat()`

É usada para concatenar dois ou mais arrays ou valores em um novo array, sem modificar os arrays originais.