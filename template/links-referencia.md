# Links de Referência

Links de referência não devem incluir o conteúdo em parênteses do tópico (ou utilizar somente ele). Por exemplo:

O link de referência do tópico "IIFE (Immediately Invoked Function Expressions)" seria `iife` ou `immediately-invoked-function-expressions`, mas não `iife-immediately-invoked-function-expressions`.

---

Links de referência não devem incluir o parâmetro do tópico. Por exemplo:

O link de referência do tópico "`´pm2 describe A< ID >´`" seria `describe`, pois `ID` é o seu parâmetro.

- Observe também que `pm2` não foi incluído, pois em tópicos cujo nome é um comando, se o comando possui uma parte que se repete por vários tópicos, ela deve ser removida. Isso ocorre em comandos nos quais você tem que especificar a ferramenta a ser utilizada, como os comandos do npm, por exemplo
- [Sobre blocos de código e crases](./Markdown.md#blocos-codigo-crases)

---

Links de referência só devem utilizar uma das frases separadas pelos dois pontos. Por exemplo:

O link de referência do tópico "`TypeError: ES Modules cannot be stubbed`" seria `typeerror` ou `es-modules-cannot-be- stubbed`, mas não `typeerror-es-modules-cannot-be-stubbed`.

---

Links de referência devem substituir o ponto por um traço. Por exemplo:

O link de referência do tópico "dump.pm2" seria `dump-pm2`.

---

Quando for pontuar o próximo item de um tópico, utilize a estrutura conforme o exemplo abaixo:

```Markdown
<!-- Exemplo em Markdown. -->

<!-- ../JavaScript/JavaScript.md -->
# JavaScript

## Fundamentos de JavaScript

### 1. Sintaxe e Tipos de Dados

- [JavaScript](./fundamentos-Javascript/sintaxe-tipos-dados/JavaScript.md)
- [Declaração de Variáveis](./fundamentos-Javascript/sintaxe-tipos-dados/declaracao-variaveis.md)
- [Tipos de Dados Primitivos](./fundamentos-Javascript/sintaxe-tipos-dados/tipos-dados-primitivos.md)
- [Escopo](./fundamentos-Javascript/sintaxe-tipos-dados/escopo.md)
- [Operadores](./fundamentos-Javascript/sintaxe-tipos-dados/operadores.md)

<!-- ../JavaScript/fundamentos-Javascript/sintaxe-tipos-dados/JavaScript.md -->
<!-- Link de "Declaração de Variáveis" para o próximo item, "Tipos de Dados Primitivos": -->
# [[Próximo tópico: Tipos de Dados Primitivos]](./tipos-dados-primitivos.md)
```

---

Quando for pontuar o último item de tópico, utilize a estrutura conforme o exemplo abaixo:

```Markdown
<!-- Exemplo em Markdown. -->

<!-- ../JavaScript/JavaScript.md -->
# JavaScript

## Fundamentos de JavaScript

### 1. Sintaxe e Tipos de Dados

- [JavaScript](./fundamentos-Javascript/sintaxe-tipos-dados/JavaScript.md)
- [Declaração de Variáveis](./fundamentos-Javascript/sintaxe-tipos-dados/declaracao-variaveis.md)
- [Tipos de Dados Primitivos](./fundamentos-Javascript/sintaxe-tipos-dados/tipos-dados-primitivos.md)
- [Escopo](./fundamentos-Javascript/sintaxe-tipos-dados/escopo.md)
- [Operadores](./fundamentos-Javascript/sintaxe-tipos-dados/operadores.md)

<!-- ../JavaScript/fundamentos-Javascript/sintaxe-tipos-dados/JavaScript.md -->
<!-- Link de "Operadores" para o tópico inicial, "Sintaxe e Tipos de Dados": -->
# [[Voltar para: JavaScript]](../../JavaScript.md)
```

---

Ao final de um tópico, adicione um link para retornar "página inicial", conforme o exemplo abaixo:

```Markdown
<!-- ../AWS/AWS.md -->

# [[Voltar para a página inicial]](../README.md)
```

# [[Próximo tópico: Listas]](./listas.md)