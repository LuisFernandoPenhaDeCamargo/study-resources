# `it.todo`

O método `todo` é utilizado para criar testes pendentes, servindo como um marcador para testes que ainda não foram implementados. É útil para indicar testes planejados e ainda não escritos, permitindo que a equipe de desenvolvimento visualize os casos de teste que ainda precisam ser trabalhados.

### Sintaxe Básica

```JavaScript
it.todo(`test description`);
```

- `test description` **(string):** uma descrição breve do que o teste futuro deverá verificar
- **Retorno:** este método não retorna um valor; ao invés disso, ele marca o teste como "pendente" para sinalizar que ainda não foi implementado

# Exemplos

### 1. Exemplo simples

```JavaScript
// Exemplo não executável.

describe('Feature X', function() {
    it.todo('should do something important');
});
```

Nesse exemplo, `todo` marca um teste como pendente, deixando explícito que a funcionalidade `should do something important` será verificada no futuro.

# [[Voltar para: Mocha]](./1-mocha.md)