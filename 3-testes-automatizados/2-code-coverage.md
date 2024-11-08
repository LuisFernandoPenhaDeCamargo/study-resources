# Code Coverage

Code Coverage (ou Cobertura de Código) é uma métrica que indica a porcentagem de código fonte que foi executada durante os testes. Ela mede quais linhas, funções, ou blocos do código foram "cobertos" durante uma execução de testes, ajudando a identificar partes do código que não foram testadas e podem, portanto, conter bugs ou falhas não detectadas.

# Principais Tipos de Cobertura

1. **Cobertura de linhas:** mede quais linhas de código foram executadas
2. **Cobertura de instruções:** mede quais instruções no código foram executadas
3. **Cobertura de funções:** verifica se todas os métodos/funções foram chamados ao menos uma vez
4. **Cobertura de blocos:** analisa blocos de código executáveis e verifica se cada bloco foi executado
5. **Cobertura de condições:** avalia se todas as condições (verdadeiras e falsas) em cada ponto de decisão foram verificadas

# Por que Code Coverage é Importante?

- **Confiabilidade dos testes:** uma cobertura alta sugere que uma grande parte do código foi testada, o que aumenta a confiança na qualidade dos testes
- **Detecção de código morto:** ajuda a identificar partes do código que nunca são executadas
- **Facilita refatorações:** com alta cobertura, refatorar o código se torna menos arriscado, pois testes já existem para confirmar que o comportamento continua correto
- **Identificação de falhas potenciais:** áreas sem cobertura de testes são potenciais pontos de erro que podem passar despercebidos

# Ferramentas de Code Coverage

No Node.js, algumas ferramentas populares para obter métricas de cobertura de código incluem:

1. **Istanbul:** usada para medir e reportar a cobertura de código
2. **c8:** fornece cobertura de código nativa para Node.js e é compatível com `async` e `await`
3. **Jest:** além de ser um framework de testes, inclui relatórios de cobertura

# Considerações

- **Cobertura não garante qualidade:** embora útil, uma cobertura de 100% não significa ausência de bugs; testes bem projetados são tão importantes quanto uma cobertura alta
- **Cobertura ideal:** depende do contexto; para muitos projetos, coberturas de 80-90% são geralmente adequadas

# Como Visualizar Relatórios de Code Coverage

Os relatórios de cobertura podem ser gerados em diferentes formatos (HTML, texto, JSON). O relatório HTML, por exemplo, permite visualizar a cobertura diretamente no navegador, destacando linhas de código que foram ou não testadas, o que facilita a revisão dos testes.

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

# [[Voltar para: Testes Automatizados]](./1-testes-automatizados.md)