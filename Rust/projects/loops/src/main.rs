fn main() {
    let mut count = 0;

    let result = 'counting_up: loop {
        println!("count = {count}");

        let mut remaining = 10;

        loop {
            println!("remaining = {remaining}");

            if remaining == 9 {
                break;
            }

            if count == 2 {
                break 'counting_up "Valor de Retorno";
            }

            remaining -= 1;
        }

        count += 1;
    };

    println!("End count = {count}");

    println!("Mesmo utilizando o rótulo, você pode possuir um valor de retorno: {result}");
}