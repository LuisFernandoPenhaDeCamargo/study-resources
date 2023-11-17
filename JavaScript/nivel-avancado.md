# Nível Avançado: Conceitos Mais Avançados

### Sumário

24. [Classes em JavaScript (Introduzidas no ES6)](#classes-em-javascript-introduzidas-no-es6)
25. [Desestruturação](#desestruturacao)
26. [Proxy e Reflect](#proxy-e-reflect)
27. [Currying e Composição de Funções](#currying-e-composicao-de-funcoes)
28. [WebSockets](#websockets)
29. [Web Workers](#web-workers)
30. [Métodos Avançados de Arrays (reduce, some, every)](#metodos-avancados-de-arrays-reduce-some-every)
31. [Manipulação de Strings Avançada](#manipulacao-de-strings-avancada)
32. [Uso de Modules (CommonJS, ES6 Modules)](#uso-de-modules-commonjs-es6-modules)
33. [Casos Específicos Interessantes](#casos-especificos-interessantes)

# <a name = "classes-em-javascript-introduzidas-no-es6"></a> Classes em JavaScript (Introduzidas no ES6)

# <a name = "desestruturacao"></a> Desestruturação

No caso de desestruturação de arrays, você coloca colchetes à esquerda da variável e o JavaScript irá atribuir os valores correspondentes do array para as variáveis.

```JavaScript
const array = [1, 2, 3];
const [posicao0, posicao1, posicao2] = array;

console.log(posicao0); // Saída: 1
console.log(posicao1); // Saída: 2
console.log(posicao2); // Saída: 3

const [,posicao] = array;

console.log(posicao);  // Saída: 2 Você pode omitir valores para selecionar a posição (["espaço vazio", posicao]).
```

# <a name = "proxy-e-reflect"></a> Proxy e Reflect

# <a name = "currying-e-composicao-de-funcoes"></a> Currying e Composição de Funções

# <a name = "websockets"></a> WebSockets

# <a name = "web-workers"></a> Web Workers

# <a name = "metodos-avancados-de-arrays-reduce-some-every"></a> Métodos Avançados de Arrays (reduce, some, every)

# <a name = "manipulacao-de-strings-avancada"></a> Manipulação de Strings Avançada

# <a name = "uso-de-modules-commonjs-es6-modules"></a> Uso de Modules (CommonJS, ES6 Modules)

# <a name = "casos-especificos-interessantes"></a>Casos Específicos Interessantes

Considerando o middleware abaixo, que realiza o papel de autenticação.\
Se fizermos uma requisição que é tratada por este middleware, no seguinte formato:

```bash
curl rota -X metodoHTTP -H "Authorization: Bearer " -H "Content-Type: application/json" -d '{}'
```

O objetivo é verificar se é necessário verificar o comprimento do token (verificar se é um "token vazio").\
Para a requisição acima ou mesmo tentando enviar um token que é composto por um espaço em branco pelo Postman, em ambos os casos, o comprimento de `header` é `6`\
Quando enviamos, por exemplo, três espaços em branco, nada muda, mas para três espaços em branco e um `a`, o comprimento se torna `11`.\
O engraçado é que `Bearer` tem comprimento `6`, `   a`, `4`, então eu estimo que toda requisição tem um espaço em branco após o `Bearer`, que é desconsiderada. Na verdade, quando há somente espaços em branco a direita, parece que eles são todos desconsiderados.\
Se conclui então que não é plausível enviar um "token vazio".

```JavaScript
// Requisição com três espaços em branco.
module.exports = async function TokenAuthServerMiddleware(req, res, next) {  
  const header = req.header('Authorization')
  console.log("header:", header);    // Saída: header: Bearer
  console.log(`${header}a`);         // Saída: Bearera (se houvesse algum espaço em branco, o "a" apareceria depois deles).
  console.log(header.length);        // Saída: 6
  console.log(header === "Bearer "); // Saída: false
  if (!header || !header.startsWith('Bearer ')) {
    console.error('Invalid server authorization header', header)
    return res.status(403).json({ status: 'FORBIDDEN' })
  }
}
```

```JavaScript
// Exemplo para demonstrar como imprimir espaços em branco a direita.
const string = "   3espacaosembranco ";
const teste = `Teste${string}Teste`; // A impressão utiliza o conceito de Template Literals e a interpolação de valores.

console.log(teste); // Saída: Teste   3espacaosembranco Teste
```