async function exemploAssincrono() {
    return "Resultado";
}

console.log(exemploAssincrono()); // Output: Promise { 'Resultado' }

async function exemploComAwait() {
    let resultado = await new Promise(resolve => {
        setTimeout(() => {
            resolve("Resultado depois de 1 segundo.");
        }, 1000);
    });

    return resultado;
}

exemploComAwait().then(resultado => {
    console.log(resultado); // Output: Resultado depois de 1 segundo.
});

console.log(exemploComAwait()); // Output: Promise { <pending>}