# Exemplos de Expressões Regulares

- [`/\s\s/g`](#ssg)
- [`/\n/g`](#ng)

# <a id="ssg">`/\s\s/g`</a>

A expressão regular `/\s\s/g` busca duas ocorrências consecutivas de espaços em branco em uma string.

- `\s`**:** representa um caractere de espaço em branco (incluindo espaço, tabulação, quebras de linhas)
- `\s\s`**:** procura dois espaços consecutivos
- `g`**:** flag global, que faz a busca em toda a string, não parando na primeira ocorrência

# <a id="ng">`/\n/g`</a>

A expressão regular `/\n/g` busca todas as quebras de linha (novas linhas) em um texto.

- `\n`**:** representa uma quebra de linha
- `g`**:** flag global, que faz a busca em toda a string, não parando na primeira ocorrência

# [[Voltar para: JavaScript (Expressões Regulares)]](../../JavaScript.md#15-expressoes-regulares)