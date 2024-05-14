fn main() {
  let x: u32 = 1;

  {
      let mut x = x; // O `x` do escopo interno consegue enxergar o valor de `x` do escopo externo. O `x` interno deixa de existir quando o escopo em que ela se encontra termina.
      x += 2;

      println!("x: {x}"); // Saída: 3
  }

  /* Caso fizessemos o seguite:
  let x = "Olá";
  A saída abaixo seria "Olá". Isso é permitido pois estamos declarando uma nova variável, por isso é permitido um novo valor de tipo diferente. Pelo o que eu entendi, **a ideia do sombreamento é reutilizar o valor, apesar do tipo do valor acabar mudando**.
  */

  println!("x: {x}"); // Saída: 1
}