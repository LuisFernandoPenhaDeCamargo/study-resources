# Nível Avançado: Conceitos Mais Avançados

### Sumário

26. [Classes em JavaScript (Introduzidas no ES6)](#classes-em-javascript-introduzidas-no-es6)
27. [Desestruturação](#desestruturacao)
28. [Proxy e Reflect](#proxy-e-reflect)
29. [Currying e Composição de Funções](#currying-e-composicao-de-funcoes)
30. [WebSockets](#websockets)
31. [Web Workers](#web-workers)
32. [Métodos Avançados de Arrays (reduce, some, every)](#metodos-avancados-de-arrays-reduce-some-every)
33. [Manipulação de Strings Avançada](#manipulacao-de-strings-avancada)
34. [Uso de Modules (CommonJS, ES6 Modules)](#uso-de-modules-commonjs-es6-modules)
35. [Casos Específicos Interessantes](#casos-especificos-interessantes)
36. [Documentação de Métodos e Funções em JavaScript](#documentacao-de-metodos-e-funcoes-em-javascript)

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

# <a name = "documentacao-de-metodos-e-funcoes-em-javascript"></a>Documentação de Métodos e Funções em JavaScript

- `object`**:** o tipo do objeto no qual o método `method` está sendo aplicado;
- `method`**:** nome do método;
- `param`**:** nome do parâmetro;
- `param type`**:** tipo do parâmetro;
- `return type`**:** tipo do retorno.

`object.method(param1 : param1 type[, param2: param2 type[, param3: param3 type]]): return type`

Os colchetes na assinatura acima, indicam que os parâmetros (`param2` e `param3`) são opcionais. Eles estarem encadeado indica uma relação de interdependência entre eles.

- Caso você passe para `method` um argumento na posição do `param2`, você não precisa passar um argumento para a posição `param3`. Pois o `param2` está sendo fornecido e o `param3` é opcional;
- Caso você queria passar um argumento para a posição `param3`, você precisa passar um argumento para a posição do `param2`. O `param3` é dependente do `param2`, esta é uma característica dos colchetes em cadeado.

`object.method(param1 : param1 type[, param2: param2 type, param3: param3 type]): return type`

`param2` e `param3` estarem dentro dos mesmos colchetes indica que se você quiser passar um, você deve obrigatoriamente passar o outro também para `method`.

`object.method(param1 : param1 type[, param2: param2 type][, param3: param3 type]): return type`

`param2` e `param3` estarem em colchetes separados (que não estão encadeado), indica que ambos são opcionais e não dependentes, você poder fornecer somente um ou somente outro.

`object.method(param1 : param1 type, (param2: param2 type, param3: param3 type) => return2 type): return1 type`

Nesta forma de documentação, o segundo parâmetro é uma callback que tem como parâmetros `param2` e `param3`, e retorna `return2`. O `method` retorna `return1`.