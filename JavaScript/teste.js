function Pessoa(nome, idade) {
    this.nome = nome;
    this.idade = idade;
}

Pessoa.prototype.toString = function() {
    return `${this.nome}, ${this.idade} anos`;
};

const pessoa = new Pessoa("João", 30);
console.log(pessoa.toString()); // Output: "João, 30 anos".