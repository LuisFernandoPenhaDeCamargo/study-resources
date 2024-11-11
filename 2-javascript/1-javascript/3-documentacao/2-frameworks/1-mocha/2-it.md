# `it`

O método `it` é utilizado para definir um caso de teste individual dentro de uma suíte. Ele aceita uma descrição do teste e uma função que contém as instuções e expectativas do teste. Caso a função não seja fornecida, o teste será marcado como pendente.

### Sintaxe Básica

```JavaScript
it(description[, fn]);
```

- `description` **(string):** uma descrição breve do que o teste futuro deve verificar
- `fn` **(function):** a função que contém as asserções e lógica do teste. O teste é considerado pendente se essa função não for fornecida
- **Retorno:** `undefined`

# Exemplos

### 1. Exemplo simples

```JavaScript
import assert from 'node:assert';

describe('Mathematical operations', () => {
    // Exemplo de teste pendente.
    it('should multiply correctly');

    // Exemplo de teste com função de implementação.
    it('should add correctly', () => {
        assert.equal(1 + 1, 2);
    });
});
```

# [[Voltar para: Mocha]](./1-mocha.md)