const elements = ["Fire", "Air", "Water"];
const elementsAndNullOrUndefined = ["Fire", , "Air", undefined, "Water", null];
const arrayOfArrays = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

// Unindo elementos com vírgula.
let result = elements.join();

console.log(result); // Output: Fire,Air,Water

// Sem separador (string vazia).
result = elements.join("");

console.log(result); // Output: FireAirWater

// Array com elementos vazios ou `undefined`.
result = elementsAndNullOrUndefined.join("|");

console.log(result); // Output: Fire||Water|

// Array de arrays.
result = arrayOfArrays.join("|");

console.log(result); // Output: 