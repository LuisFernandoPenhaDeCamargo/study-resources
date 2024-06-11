function saudacao(cumprimento, pontuacao) {
    console.log(cumprimento + ", " + this.usuario + pontuacao);
}

const objeto = { usuario: "Alice" };

saudacao.call(objeto, "Hello", "!");   // Output: 
saudacao.apply(objeto, ["Hi", "..."]); // Output: 

const saudacaoAlice = saudacao.bind(objeto, "Hey");

saudacaoAlice("?");                    // Output: