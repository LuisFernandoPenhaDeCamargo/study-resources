const axios = require("axios");

const source = axios.CancelToken.source();

//Cancela o token com um motivo opcional (aqui, "Motivo do cancelamento" é o motivo).
source.cancel("Motivo do cancelamento.");

console.log(source);
console.log("");
console.log("--------------------\n");
console.log(source.token);
console.log("");
console.log("--------------------\n");
console.log(source.token.promise);
console.log("");
console.log(source.token.reason);
console.log("");
console.log("--------------------\n");
console.log(source.token.reason.message);
console.log("");
console.log("--------------------\n");
//Para acessar o motivo do cancelamento, você pode usar source.token.reason.
console.log("source.token.reason:", source.token.reason);