# Expressões Regulares

Expressões regulares (ou regex) são padrões utilizados para realizar buscas e manipulações de texto. Elas permitem definir um conjunto de caracteres que desejamos encontrar ou modificar dentro de uma string. Expressões regulares são muito utilizadas em tarefas como validação de dados, busca de padrões complexos, substituições em massa e processamento de strings em geral.

Expressões regulares possuem uma sintaxe compacta para descrever padrões. Alguns exemplos de componentes básicos incluem:

- **Letras e números:** `a`, `b`, `1`, `2` correspondem exatamente a esses caracteres
- **Metacaracteres:** caracteres especiais que têm significados específicos, como:
    + `.`**:** qualquer caractere (exceto nova linha)
    + `^`**:** início da string
    + `$`**:** final da string
    + `*`**:** zero ou mais ocorrências
    + `+`**:** uma ou mais ocorrências
    + `?`**:** zero ou uma ocorrência
    + `[]`**:** conjunto de caracteres. Exemplo: `[a-z]` corresponde a qualquer letra minúscula
    + `()`**:** agrupa partes da expressão para capturar grups
    + `|`**:** alternância (ou)

# JavaScript

Em JavaScript, expressões regulares podem ser criadas com a notação literal entre barras `/` ou utilizando o construtor `RegExp`.

Flags comuns:

- `g`**:** busca global (não para na primeira correspondência)
- `i`**:** busca case-insensitive (ignora maiúsculas/minúsculas)
- `m`**:** multi-linha (altera o comportamento de `^` e `$`)

As expressões regulares são ferramentas poderosas, mas também podem ser complexas. A sua eficácia depende da clareza no entendimento do padrão que se deseja buscar ou manipular.

O próximo tópico apresenta exemplos de expressões regulares usadas em casos reais, visando a prática do uso dessa ferramenta.

# [[Próximo tópico: Exemplos de Expressões Regulares]](./exemplos-expressoes-regulares.md)