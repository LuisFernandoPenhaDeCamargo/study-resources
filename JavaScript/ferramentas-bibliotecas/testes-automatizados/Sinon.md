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

- [stub](#stub)
- [restore](#restore)
- [resolves](#resolves)
- [rejects](#rejects)
- [calledOnce](#calledonce)
- [`calledWith`](#calledwith)

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
const sinon = require("sinon");

const myStub = sinon.stub();

myStub.returns("stubbed value");

console.log(myStub()); // Output: stubbed value
```

## <a id="restore">`restore`</a>

O método `restore` é utilizado para **restaurar o comportamento original de um stub, spy ou mock** criado pelo Sinon. Isso é útil para garantir que os testes não causem efeitos colaterais em outras partes do código.

### Sintaxe Básica

```JavaScript
stub.restore();
spy.restore();
mock.restore();
```

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

- `value`**:** o valor com o qual a promessa será rejeitada. Este valor pode ser um objeto de erro, uma string, ou qualquer outro valor que você deseja que a promise rejeite.

## <a id="calledonce">`calledOnce`</a>

A propriedade `calledOnce` é uma propriedade do stub do Sinon (`stub.calledOnce`), que verifica se o stub foi chamado exatamente uma vez durante a execução do teste. Esta propriedade é útil para validar que uma função foi invocada uma única vez, garantindo assim que o comportamento esperado ocorreu apenas uma vez.

## <a id="calledwith">`calledWith`</a>

O método `calledWith` é utilizado para **verificar se o stub foi chamado com argumentos específicos durante a execução do teste**. Este método é útil para validar que uma função foi invocada com os parâmetros esperados, garantindo assim que o comportamento ocorreu de maneira prevista.

### Sintaxe Básica

```JavaScript
stub.calledWith(arg1, arg2, ...);
```

- `arg1, arg2, ...`**:** os argumentos que se espera que tenham sido passados para o stub durante a chamada