# Sinon.JS

Sinon.JS é uma biblioteca para JavaScript que facilita a criação de espiões (spies), substitutos (stubs) e mocks, que são usados para testes unitários. É especialmente útil quando você precisa testar o comportamento de uma função ou módulo isoladamente, sem depender de suas dependências externas.

### Sumário

- [Principais Funções](#principais-funcoes)
- [Benefícios](#beneficios)
- [Exemplos](#exemplos)
- [Observações](#observacoes)
- [Conclusão](#conclusao)
- [Métodos e Propriedades](./metodos-propriedades.md)

# <a id="principais-funcoes">Principais Funções</a>

### 1. Espiões (spies)

- Monitoram as chamadas para funções existentes, registrando informações sobre cada chamada (como argumentos, valores de retorno e exceções lançadas)
- Útil para verificar se uma função foi chamada, quantas vezes foi chamada, com quais argumentos, etc.

### 2. Substitutos (stubs)

- Substituem funções existentes com funções que você controla completamente
- Permitem definir o comportamento de uma função (por exemplo, o valor de retorno ou se lança uma exceção)
- Útil para isolar a função que você está testando de suas dependências

### 3. Mocks

- São como substitutos, mas com a capacidade adicional de definir expectativas (como "está função deve ser chamada uma vez com esses argumentos")
- Útil para testes que verificam interações específicas entre diferentes partes do código

# <a id="beneficios">Benefícios</a>

- **Isolamento:** permite isolar a unidade de código que está sendo testada de suas depedências
- **Controle:** dá controle total sobre o comportamento de funções durante o teste
- **Flexibilidade:** suporta spies, stubs e mocks, permitindo diferentes níveis de verificação e controle conforme necessário
- **Diagnóstico:** as ferramentas de verificação do Sinon ajudam a diagnosticar problemas ao verificar se as funções são chamadas corretamente

# <a id="exemplos">Exemplos</a>

```JavaScript
// .mjs
import sinon from "sinon";

const myObj = {
    myMethod() {
        console.log("Method called.");
    },
    myOtherMethod() {
        return "Original value.";
    },
    myEmptyMethod() {},
};
// - Usando spies
const spy  = sinon.spy(myObj, "myMethod");

myObj.myMethod();                   // Ouput: Method called.

console.log(spy.called);            // Output: true
console.log(spy.callCount);         // Output: 1

// - Usando stubs
const stub = sinon.stub(myObj, "myOtherMethod").returns("Stubbed value.");

console.log(myObj.myOtherMethod()); // Output: Stubbed value.

// - Usando mocks
const mock = sinon.mock(myObj);

mock.expects("myEmptyMethod").once().withArgs("arg1", "arg2");
myObj.myEmptyMethod("arg1", "arg2");
mock.verify(); // Verifica se as expectativas foram atendidas, caso contrário, lança um erro.
```

# <a id="observacoes">Observações</>

- Você não pode chamar o método `spy`, `stub` ou `mock.expects` na mesma função/método
- Spies, stubs e mocks compartilham **alguns métodos e funcionalidades comuns**

# <a id="conclusao">Conclusão</a>

Sinon.JS é uma ferramenta poderosa para desenvolvedores que escrevem testes unitários em JavaScript. Ela complementa bibliotecas de testes como a Chai, fornecendo os meios para monitorar, controlar e verificar o comportamento de funções e interações no código, contribuindo para um conjunto de testes mais robusto e confiável.

# [[Próximo tópico: Desenvolvendo Testes para Funções]](../desenvolvendo-testes-funcoes.md)