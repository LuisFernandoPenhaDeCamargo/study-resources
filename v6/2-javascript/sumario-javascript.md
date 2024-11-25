# Sumário de JavaScript

# Exemplos

### 1. Exemplo de uso com c8 e Mocha

Para gerar um relatório de cobertura com c8 e Mocha, pode-se adicionar um script no **package.json** assim:

```JSON
{
    "scripts": {
        "test": "c8 mocha './test/**/*.test.js'"
    }
}
```

Ao rodar `npm test`, o c8 executa os testes com Mocha e gera uma relatório de cobertura, permitindo visualizar as áreas cobertas e não cobertas no código.

Code Coverage é, assim, uma ferramenta essencial para garantir confiabilidade e a manutenção do código ao longo do ciclo de vida do desenvolvimento.

- Desenvolvendo Testes Unitários
- Dificuldades Encontradas

- [JavaScript](./1-javascript/javascript.md)
- [Eloquent JavaScript (4th Edition)]()

# [[ Voltar para a página inicial ]](../README.md)