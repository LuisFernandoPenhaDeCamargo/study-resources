fn main() {
    // Código referente a mutabilidade de uma variável.
    /*let mut x = 5;

    println!("O valor de x é: {x}");

    x = 6;

    println!("O valor de x é: {x}");*/

    // Código referente a sombrear uma variável.
    let x = 5;
    let x = x + 1;

    {
        let x = x * 2;

        println!("O valor de x neste escopo é: {x}");
    }

    println!("O valor de x é: {x}");
}
