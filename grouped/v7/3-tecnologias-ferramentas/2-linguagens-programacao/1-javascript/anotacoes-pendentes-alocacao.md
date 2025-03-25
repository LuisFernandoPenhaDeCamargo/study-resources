# Anotações Pendentes de Alocação

---
---

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

---
---

Sobre testes.

- Desenvolvendo Testes Unitários
- Dificuldades Encontradas

---
---

# [[ Voltar para: Sumário de JavaScript ]](./sumario-javascript.md)