# `--inspect-brk`

A flag `--inspect-brk` no Node.js é usada para depuração. Ela ativa o modo de inspeção e pausa automaticamente a execução do script logo no início, antes de executar qualquer linha de código. Isso permite que você conecte uma ferramenta de depuração (como o Chrome DevTools ou o VS Code) e inspecione o código desde o início, definindo pontos de interrupção (breakpoints) e analisando variáveis e o fluxo de execução logo na inicialização.

# Como Usar

Para usar a flag, execute um script com o seguinte comando:

```Bash
$ node --inspect-brk index.js
```

Isso iniciará o processo de inspeção e pausará a execução do script antes da primeira linha de código.

# Vantagens

- **Depuração completa desde o início:** ideal para depurar a fase de inicialização de um script
- **Ferramentas de depuração externas:** compatível com ferramentas como o Chrome DevTools e o depurador embutido no VS Code

Essa flag é especialmente útil quando você precisa entender o comportamento de scripts complexos ou investigar problemas que ocorrem logo ao iniciar o aplicativo.

# [[ Voltar para: Guia de Flags do Node.js ]](./1-guia-flags-node-js.md)