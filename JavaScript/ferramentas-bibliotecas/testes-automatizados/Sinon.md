# Sinon

Sinon é uma biblioteca para JavaScript que facilita a criação de espiões (spies), esboços (stubs) e mocks, que são usados para testes unitários. É especialmente útil quando você precisa testar o comportamento de uma função ou módulo isoladamente, sem depender de suas dependências externas.

## Principais Funções

### 1. Espiões (spies)

- Monitoram as chamadas para funções existentes, registrando informações sobre cada chamada (como argumentos, valores de retorno e exceções lançadas)
- Útil para verificar se uma função foi chamada, quantas vezes foi chamada, com quais argumentos, etc.

### <a id="stubs">2. Esboços (stubs)</a>

- Substituem funções existentes com funções que você controla completamente
- Permitem definir o comportamento de uma função (por exemplo, o valor de retorno ou se lança uma exceção)
- Útil para isolar a função que você está testando de suas dependências

### <a id="mocks">3. Mocks</a>

- São como esboços, mas com a capacidade adicional de definir expectativas (como está função deve ser chamada uma vez com esses argumentos)
- Útil para testes que verificam interações específicas entre diferentes partes do código

## Benefícios

- **Isolamento:** permite isolar a unidade de código que está sendo testada de suas depedências
- **Controle:** dá controle total sobre o comportamento de funções durante o teste
- **Flexibilidade:** suporta spies, stubs e mocks, permitindo diferentes níveis de verificação e controle conforme necessário
- **Diagnóstico:** as ferramentas de verificação do Sinon ajudam a diagnosticar problemas ao verificar se as funções são chamadas corretamente

## Exemplos

```JavaScript
const sinon = require("sinon");

const myObj = {
    myMethod: function () {
        console.log("Method called.");
    },
    myOtherMethod: function () {
        return "Original value.";
    },
    myEmptyMethod: function () {},
};
// - Usando spies
const spy = sinon.spy(myObj, "myMethod");

myObj.myMethod();           // Ouput: Method called.

console.log(spy.called);    // Output: true
console.log(spy.callCount); // Output: 1

// - Usando stubs
const stub = sinon.stub(myObj, "myOtherMethod").returns("Stubbed value.");

console.log(myObj.myOtherMethod()); // Output: Stubbed value.

// - Usando mocks
const mock = sinon.mock(myObj);

mock.expects("myEmptyMethod").once().withArgs("arg1", "arg2");
myObj.myEmptyMethod("arg1", "arg2");
mock.verify(); // Verifica se as expectativas foram atendidas, caso contrário, lança um erro.
```

## Observações

Você não pode chamar o método `spy`, `stub` ou `mock.expects` na mesma função.

## Conclusão

Sinon é uma ferramenta poderosa para desenvolvedores que escrevem testes unitários em JavaScript. Ela complementa bibliotecas de testes como a Chai, fornecendo os meios para monitorar, controlar e verificar o comportamento de funções e interações no código, contribuindo para um conjunto de testes mais robusto e confiável.

# Métodos e Propriedades

### Sumário

- [`stub`](#stub)
- [`returns`](#returns)
- [`resolves`](#resolves)
- [`rejects`](#rejects)
- [`returnsThis`](#returnsthis)
- [`restore`](#restore)
- [`calledOnce`](#calledonce)
- [`calledWith`](#calledwith)
- [`CalledOnceWith`](#calledoncewith)

## <a id="stub">`stub`</a>

O método `stub` é utilizado para **criar stubs em funções ou métodos**, permitindo que você controle o comportamento das funções durante os testes. Stubs são usados para substituir o comportamento real de uma função com um comportamento simulado.

### Sintaxe Básica

```JavaScript
sinon.stub([object [, method]]);
```

- `object`**:** o objeto que contém o método a ser substituído
- `method`**:** o nome do método a ser substituído
- **Retorno:** um objeto Stub

### Exemplo

```JavaScript
// Stub independente.
const sinon  = require("sinon");

const myStub = sinon.stub();

myStub.returns("Stubbed value.");

console.log(myStub()); // Output: Stubbed value.
```

## <a id="returns">`returns`</a>

O método `returns` é utilizado para **configurar um stub para retornar um valor específico de maneira síncrona**. Este método é útil quando você deseja substituir uma função que retorna um valor imediatamente (não uma promessa) em seus testes.

### Sintaxe Básica

```JavaScript
stub.returns(value);
```

- `value`**:** o valor que o método stubado deve retornar

## <a id="resolves">`resolves`</a>

O método `resolves` é utilizado com stubs do Sinon para **especificar que o stub deve retornar uma promise resolvida com um valor específico**. Este método é especialmente útil para testar funções assíncronas que retornam promises.

### Sintaxe Básica

```JavaScript
stub.resolves(value);
```

- `value`**:** o valor com o qual a promise deve ser resolvida. Por ser qualquer valor, incluindo objetos, strings, números, etc.

## <a id="rejects">`rejects`</a>

O método `rejects` é utilizado para **configurar um stub para retornar uma promise rejeitada com um valor específico**. Isso é útil para simular falhas em operações assíncronas durante testes.

### Sintaxe Básica

```JavaScript
stub.rejects(value);
```

- `value`**:** o valor com o qual a promessa será rejeitada. Este valor pode ser um objeto de erro, uma string, ou qualquer outro valor que você deseja que a promise rejeite

## <a id="returnsthis">`returnsThis`</a>

O método `returnsThis` é utilizado para **configurar um stub de forma que ele retorne o contexto (**`this`**) no qual foi chamado**. Este método é útil em situações onde a função stubada faz parte de um objeto e você deseja manter a cadeia de chamadas fluente (method chaining).

### Sintaxe Básica

```JavaScript
stub.returnThis();
```

## Exemplo

Vamos considerar uma classe `Car` que possui métodos que retornam o próprio objeto (`this`), permitindo a criação de uma cadeia de chamadas.

```JavaScript
class Car {
    constructor() {
        this.speed = 0;
    }

    accelerate(amount) {
        this.speed += amount;

        return this;
    }

    brake(amount) {
        this.speed -= amount;

        return this;
    }
}
```

Para testar a classe `Car` e stubar os métodos `accelerate` e `brake`.

```JavaScript
// Observe que você não pode usar a função `require` com um módulo ES, isto é só um exemplo.
const { expect } = require("chai");
const sinon      = require("sinon");

describe ("Car", () => {
    let car;

    beforeEach(() => {
        car = new Car();
    });

    it("deve permitir o encadeamento de métodos", () => {
        // Criar os stubs.
        const accelerateStub = sinon.stub(car, "accelerate").returnThis();
        const brakeStub      = sinon.stub(car, "brake").returnThis();

        // Usar os stubs.
        car.accelerate(10).brake(5);

        // Verificar se os stubs foram chamados corretamente.
        expect(accelerateStub.calledOnceWith(10)).to.be.true;
        expect(brakeStub.calledOnceWith(5)).to.be.true;

        // Restaurar os métodos originais após o teste.
        accelerateStub.restore();
        brakeStub.restore();
    });
});
```

1. **Criar os stubs:** usamos `sinon.stub(car, "accelerate").returnThis()` e `sinon.stub(car, "brake").returnThis()` para fazer com que esses métodos retornem o próprio objeto `car` ao serem chamados
2. **Usar os stubs:** chamamos os métodos stubados `car.accelerate(10).brake(5)` para verificar se o encadeamento de métodos funciona
3. **Verificar as chamadas:** usamos `expect` para verificar se os stubs foram chamados com os argumentos corretos
4. **Restaurar os métodos originais:** chamamos `accelerateStub.restore()` e `brakeStub.restore()` para restaurar os métodos originais após o teste

## Conclusão

O métodos `returnThis` é útil para testar métodos que retornam o contexto (`this`) para permitir encadeamento de métodos. Usando `returnThis`, você pode manter a fluidez das chamadas de métodos em seus testes, garantindo que a lógica de encadeamento funcione conforme esperado.

## <a id="restore">`restore`</a>

O método `restore` é utilizado para **restaurar o comportamento original de um stub, spy ou mock** criado pelo Sinon. Isso é útil para garantir que os testes não causem efeitos colaterais em outras partes do código.

### Sintaxe Básica

```JavaScript
stub.restore();
spy.restore();
mock.restore();
sinon.restore();
```

### Benefícios

Porque usar o `restore`:

1. **Limpeza e isolamento:** ao restaurar o método original, você garante que os testes não interfiram uns nos outros. Se você não restaurar o método, os efeitos do stub, por exemplo, podem vazar para outros testes, causando resultados inesperados e falhas difíceis de diagnosticar
2. **Manutenção do comportamento original:** restaurar o método garante que o comportamento original do método seja mantido para outros testes ou **partes do código** que não estejam relacionadas ao stub
3. **Boas práticas:** usar `restore` é uma prática recomendada em testes unitários para manter a integridade e previsibilidade dos testes. Isso torna os testes mais robustos e o código mais fácil de manter

### Observações

`sinon.restore` é utilizado para restaurar todos os stubs, mocks e spys de uma só vez. Este método é especialmente conveniente quando você possui uma grande quantidade de stubs, mocks e spys que precisam ser restaurados após os testes.

## <a id="calledonce">`calledOnce`</a>

A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`) que verifica se o stub foi chamado exatamente uma vez durante a execução do teste. Esta propriedade é útil para validar que uma função foi invocada uma única vez, garantindo assim que o comportamento esperado ocorreu apenas uma vez.

## <a id="calledwith">`calledWith`</a>

O método `calledWith` é utilizado para **verificar se o stub foi chamado com argumentos específicos durante a execução do teste**. Este método é útil para validar que uma função foi invocada com os parâmetros esperados, garantindo assim que o comportamento ocorreu de maneira prevista.

### Sintaxe Básica

```JavaScript
stub.calledWith(arg1, arg2, ...);
```

- `arg1, arg2, ...`**:** os argumentos que se espera que tenham sido passados para o stub durante a chamada

## <a id="calledoncewith">`CalledOnceWith`</a>

O método `calledOnceWith` é utilizado para **verificar se o stub foi chamado exatamente uma vez com argumentos específicos durante a execução do teste**. É uma asserção útil do Sinon.js que ajuda a garantir que suas funções são chamadas conforme esperado, aumentando a confiabilidade dos seus testes.

### Sintaxe Básica

```JavaScript
$< stub / spy >.calledOnceWith(arg1[, arg2[, ...argN]]);
```

- `arg1, arg2, argN`**:** os argumentos que o stub deve ter recebido na única chamada. Você pode passar quantos argumentos forem necessários para verificar se o stub foi chamado com esses valores específicos
- **Retorno:** retorna `true` se o stub tiver sido chamado exatamente uma vez com os argumentos especificados; caso contrário, retorna `false`