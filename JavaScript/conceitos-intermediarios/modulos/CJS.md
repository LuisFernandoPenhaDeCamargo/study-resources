# CJS

O CommonJS (CJS) é um sistema de módulos amplamente utilizado em ambientes como o Node.js. Antes da introdução do ESM no JavaScript, o CommonJS era o principal padrão de módulos para Node.js e ainda é muito usado hoje em dia.

# Principais Características

1. **Sintaxe:**
    - Para exportar funcionalidades, você usa `module.exports`
    - Para importar módulos, você usa `require`
2. **Carregamento síncrono:** o CommonJS carrega os módulos de forma síncrona. Isso significa que ele espera o carregamento completo de um módulos antes de continuar a execução do código. Isso é aceitável no Node.js, que roda em ambiente de servidor, mas não é tão eficiente para navegadores (que podem se beneficiar mais do carregamento assíncrono do ESM)
3. **Escopo:** cada módulo tem seu próprio escopo, o que significa que variáveis e funções definidas em um módulo não são automaticamente acessíveis em outros módulos, a menos que sejam explicitamente exportadas
4. **Suporte:** o CommonJS foi projetado inicialmente para Node.js, mas não é nativamente suportado em navegadores

# [[Próximo tópico: ESM]](./ESM.md)