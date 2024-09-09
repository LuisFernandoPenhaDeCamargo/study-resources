# `strict mode`

O `strict mode` (modo estrito) é uma funcionalidade do JavaScript introduzida no ES5 que impõe uma versão mais rígida da linguagem. Ele ajuda a evitar erros silenciosos, tornando o código mais seguro e previsível. Ao ativar o strict mode, algumas práticas potencialmente problemáticas são desabilitadas, e certos erros são levantados em vez de serem ignorados.

# Principais Características

1. **Error lançados para más práticas comuns:**
    - Usar variáveis não declaradas levanta um erro
    - Atribuir valores a variáveis ou objetos protegidos (como `NaN` ou `undefined`) gera um erro
2. **Proíbe a definição de propriedades duplicadas em objetos:** objetos com chaves duplicadas geram um erro
3. **Evita o uso acidental de palavras reservadas futuras:** palavras reservadas para futuras versões, como `implements`, `interface`, `package`, `private`, `protected`, `etc`., não podem ser usadas como nomes de variáveis
4. **Elimina o uso do** `with`**:** o `with` é considerado uma fonte de ambiguidades e está proibido no strict mode
5. **Mudanças no comportamento do** `this`**:** no strict mode, o valor de `this` dentro de uma função regular não referenciada a um objeto será `undefined`, em vez de referenciar o objeto global

Para ativar o strict mode, basta adicionar a string `"strict mode";` no início de um arquivou ou função. O strict mode é uma prática recomendada em JavaScript moderno, pois ajuda a detectar erros mais cedo e evita comportamentos inesperados.

# Observações

A extensão **.mjs** (utilizada por ESM) habilita o stric mode automaticamente. Todo código dentro de um ESM opera no strict mode por padrão, sem a necessidade de adicionar explicitamente a linha `"strict mode;`.

# [[Próximo tópico: ECMA Internacional e o ECMAScript]](./ecma-internacional-ecmascript.md)