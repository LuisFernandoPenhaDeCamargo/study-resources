# `it.skip`

O método `skip` é utilizado para desativar temporariamente um teste específico dentro de uma suite. Ele permite que você ignore a execução de um teste sem removê-lo do código, o que é útil para isolar partes do teste em desenvolvimento ou em casos onde o teste ainda não está pronto.

### Sintaxe Básica

```JavaScript
it.skip('test description', function() {
    // Código do teste.
});
```

- `test description` **(string):** uma descrição textual do que o teste deveria verificar
- `function` **(function):** a função contendo o código do teste a ser ignorado
- **Retorno:** `undefined` - o método não retorna valor; ele indica ao Mocha para pular o teste especificado durante a execução da suíte

# Exemplos

### 1. Exemplo simples

```JavaScript
// Exemplo não executável.

describe('example funcion', function() {
    it('should return true', function() {
        assert.equal(exampleFunc(), true);
    });

    it.skip('should return false', function() {
        assert.equal(exampleFunc(), false);
    });
});
```

Neste exemplo, o teste `should return false` será ignorado durante a execução, permitindo que apenas o primeiro teste seja executado.

# [[ Voltar para: Mocha ]](./1-mocha.md)