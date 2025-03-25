# Monitoramento de Alterações `--watch`

A flag `--watch` no Node.js é utilizada para monitorar automaticamente alterações nos arquivos de um projeto ("modo observação") enquanto o servidor está em execução. Ao adicionar `--watch` ao executar um script com Node.js, ele reinicia automaticamente o processo sempre que um arquivo é modificado, o que é útil para ambientes de desenvolvimento, pois elimina a necessidade de reiniciar o servidor manualmente após cada mudança.

# Exemplos

### 1. Exemplo de uso

```Bash
$ node --watch index.js
```

No exemplo acima, o Node monitorará alterações em `index.js` e reiniciará o process sempre que uma mudança for detectada. Essa funcionalidade é similar a ferramentas como o Nodemon, mas é uma opção nativa do Node.js a partir da versão 18.

# [[ Voltar para: Guia de Flags do Node.js ]](./1-guia-flags-node-js.md)