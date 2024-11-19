# c8 x NYC

c8 e NYC são duas ferramentas populares para medição de cobertura de código em projetos JavaScript/Node.js, mas com algumas diferenças significativas.

# 1. NYC

## Descrição

NYC é a ferramenta de cobertura de código mais usada na comunidade Node.js e é o analisador de cobertura oficial do Istanbul, o que torna uma escolha amplamente suportada e bem documentada.

## Características

- Integra-se facilmente com a maioria dos frameworks de teste, como Mocha, Jest, e Jasmine
- Oferece diversas opções de relatório, incluindo HTML, texto e cobertura detalhada
- Alta compatibilidade com projetos em CommonJS (CJS)
- Pode ter desempenho reduzido ao lidar com projetos ESM ou ao executar testes que usem nativamente o módulo `node:test`

## Configuração

Requer alguma configuração adicional para funcionar bem com módulos ESM, especialmente em projetos complexos ou que utilizem `node:test`.

# 2. c8

## Descrição

c8 é uma ferramenta de cobertura de código mais recente, projetada para oferecer suporte nativo a ESM e compatibilidade com projetos modernos em Node.js.

## Características

- Leve e focada em compatibilidade com ESM, ideal para projetos que utilizam módulos ECMAScript (ESM) ou `node:test`
- Independe de Istanbul ou NYC, pois utiliza o mecanismo de cobertura nativo do V8 (motor do Node.js)
- Suporta relatórios básicos (HTML, texto) e possui uma configuração simples para projetos ESM
- Geralmente, é mais rápido em cenários que envolvem ESM e `node:test` devido à sua abordagem mais leve

# Qual Escolher?

- **Para projetos que utilizam ESM:** c8 é a melhor escolha, com suporte nativo e `node:test`, oferecendo melhor desempenho e configuração simplificada
- **Para projetos baseados em CJS ou que integram frameworks de teste mais antigos:** NYC é amplamente suportado e oferece funcionalidades avançadas de relatório, sendo uma opção sólida e estabelecida

A escolha entre NYC e c8 depende do tipo de projeto e das necessidades específicas de suporte a módulos e relatórios.

# Observações

Em projetos que utilizam tanto CJS quanto ESM, NYC pode não funcionar corretamente. Por outro lado, o c8 se mostrou funcional sem necessidade de configuração adicional. Além disso, c8 funcionou de forma adequada em conjunto com Mocha, SinonJS, Chai e esmock.

# [[ Voltar para: Ferramentas ]](./1-ferramentas.md)