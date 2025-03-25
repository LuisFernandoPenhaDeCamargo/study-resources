# Mocha

### Sumário

- [Code Coverage](#code-coverage)
- [Guia de Flags Mocha]()

# <a id="code-coverage">Code Coverage</a>

O Mocha, por si só, não inclui funcionalidades de Code Coverage (cobertura de código). Ele é uma ferramenta de teste focada em fornecer uma estrutura de execução de testes, mas não calcula diretamente a cobertura de código.

Para adicionar essa funcionalidade de cobertura ao Mocha, é comum integrá-lo com outras bibliotecas, como o NYC (parte do pacote Istambul). O `nyc` é uma ferramenta popular para medir cobertura de código em testes JavaScript e funciona bem em conjunto com o Mocha.

# <a id=""></a>

A flag `--parallel` no Mocha é utilizada para executar testes de forma paralela, ou seja, distribuindo os testes entre múltiplos threads (ou workers). Isso pode acelerar significativamente a execução da suíte de testes, especialmente em projetos com muitas unidades de teste independentes.

# [[ Voltar para: Frameworks ]](./1-frameworks.md)