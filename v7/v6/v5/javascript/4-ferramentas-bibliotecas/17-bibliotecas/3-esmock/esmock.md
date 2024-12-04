# `esmock`

O `esmock` é uma ferramenta que facilita a simulação (mocking) de dependências em ESM. Ele útil quando você deseja substituir certas dependências em um módulo para testar uma função ou comportamento específico sem modificar o módulo original.

## Observações Importantes

- **Escopo de Módulo:** como `esmock` trabalha no nível de módulo, ele não pode substituir funções ou variáveis que estão no mesmo módulo. Apenas dependências importadas podem ser substituídas

### namespaces dos ESM são Imutáveis

Quando você tenta stubbar uma função importada de um ESM com o Sinon.JS, você recebe o seguinte erro: `TypeError: ES Modules cannot be stubbed`, porque o namespace é imutável. O `esmock` permite que nós importemos os ESM de modo que o namespace possa ser modificado, ele altera a forma como o Node.js os importa, fazendo assim que seja possível alterar o namespace.

Um exemplo simples, tendo em vista como o sistema hierárquico de arquivos funciona: arquivos podem ser lidos, sobrescritos e executados, tendo isso em mente, ESM importados são somente leitura, tanto que quando você tenta realizar a seguinte operação:

```JavaScript
// module1.mjs
export const var = "var";
export function helloWorld() {
    console.log("Hello, world!");
}

// module2.mjs
import * as alias from "./module1.mjs";

console.log(alias); // Output: [Module: null prototype] { var: 'var', helloWorld: [Function helloWorld] }

// alias.var = "New value."; // Um erro é lançado: `Exception during run: TypeError: Cannot assign to read only property 'var' of object [object Module]`
```

A mensagem de erro pontua que as propriedades são somente leitura, pois o namespace dos ESM são imutáveis. O `esmock` permite que as propriedades deixem de ser somente leitura, fazendo com que nós possamos sobrescrevê-las.

# Métodos e Propriedades

- [`esmock`](#esmock)
- [`purge`](#purge)

# <a id="esmock">`esmock`</a>

O método `esmock` é utilizado para **permitir a simulação (mocking) de uma dependência**.

### Sintaxe Básica

```JavaScript
const module = await esmock(modulePath, mockDependencies[, staticDependencies]);
```

- `modulePath`**:** uma string que representa o caminho para o módulo que você deseja testar
- `mockDependencies`**:** um objeto onde as chaves são os caminhos para os módulos que você deseja mockar (os que são importados pelo módulo que você deseja testar) e os valores são os mocks correspondentes. Esses mocks substituem as importações reais no módulo que você deseja testar
- `staticDependencies`**:** um objeto semelhante a mockDependencies, mas este objeto substitui as importações em todos os lugares ("mock definitions imported everywhere")
- **Retorno:** um objeto que representa o módulo importado com as dependências mockadas. Você pode usar as exportações deste módulo normalmente, mas elas utilizarão os mocks em vez das implementações reais das dependências

## Exemplo

```JavaScript
// module.mjs
import { externalFunction } from "./externalModule.mjs";

export function myFunction() {
    return externalFunction();
}

// module.test.mjs
import esmock               from "esmock";
import { strict as assert } from "assert";

const mockExternalFunction = () => "Mocked value.";
const module               = await esmock("./module.mjs", {
    "./externalModule.mjs": { externalFunction: mockExternalFunction }
});

assert.equal(module.myFunction(), "Mocked value.");

console.log("Test passed.");
```

1. O **module.mjs** importa a função `externalFunction` do **externalModule.mjs**
2. No arquivo de teste, `esmock` substitui `externalFunction` por `mockExternalFunction`
3. Quando `module.myFunction` é chamado, ele retorna `Mocked value.` em vez do valor original

# <a id="">`purge`</a>

O método `purge` é utilizado para **limpar os caches internos do** `esmock`, garantindo que qualquer estado ou configuração anterior seja removido antes de executar novos testes. Isso é útil para evitar que mocjs antigos interfiram em novos testes e garantir que cada teste tenha um ambiente limpo.

### Sintaxe Básica

```JavaScript
esmock.purge();
```