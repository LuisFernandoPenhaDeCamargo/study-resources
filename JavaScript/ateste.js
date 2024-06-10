let arr = [1, 2, 3];
let newLength = arr.unshift({ teste: 1 }, 0, -1); // Adiciona 0 e -1 ao início do array
console.log(arr); // [0, -1, 1, 2, 3]
console.log(newLength); // 5, novo comprimento do array