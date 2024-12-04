# Code Coverage

Code Coverage (ou Cobertura de Código) é uma métrica que indica a porcentagem de código fonte executada durante os testes. Essa métrica avalia quais linhas, funções, ou blocos de código foram "cobertos" durante uma execução de testes, ajudando a identificar trechos não testados que podem conter bugs ou falhas não detectadas.

# Principais Tipos de Cobertura

1. **Cobertura de linhas:** mede quais linhas de código foram executadas
2. **Cobertura de instruções:** verifica quais instruções no código não foram executadas
3. **Cobertura de funções:** avalia se todas as funções/métodos foram chamadas pelo menos uma vez
4. **Cobertura de blocos:** analisa blocos de código executáveis e verifica se cada bloco foi testado
5. **Cobertura de condições:** mede se todas as condições (verdadeiras e falsas) em cada ponto de decisão foram verificadas

# Por que Code Coverage é Importante

- **Confiabilidade dos testes:** uma cobertura alta indica que grande parte do código foi testada, aumentando a confiança na qualidade do software
- **Detecção de código morto:** identifica trechos do código que nunca são executadas
- **Facilita refatorações:** com alta cobertura reduz o risco ao refatorar o código, pois testes confirmam que o comportamento esperado se mantém
- **Identificação de falhas potenciais:** áreas sem cobertura são potenciais pontos de erro que podem passar despercebidos

# Considerações

- **Cobertura não garante qualidade:** uma cobertura de 100% não significa ausência de bugs; a qualidade dos testes é tão importante quanto a extensão da cobertura
- **Cobertura ideal:** varia de acordo com o projeto, mas para muitos casos, coberturas entre 80% e 90% são adequadas e suficientes

# Como Visualizar Relatórios de Code Coverage

Relatórios de cobertura podem ser gerados em diversos formatos, como HTML, texto ou JSON. O formato HTML, por exemplo, permite visualizar a cobertura diretamento no navegador, destacando linhas de código testadas ou não, facilitando a análise e a revisão dos testes.

Code Coverage é, assim, uma ferramenta essencial para garantir confiabilidade e a manutenção do código ao longo do ciclo de vida do desenvolvimento.

# [[ Voltar para: Testes Automatizados ]](./1-testes-automatizados.md)