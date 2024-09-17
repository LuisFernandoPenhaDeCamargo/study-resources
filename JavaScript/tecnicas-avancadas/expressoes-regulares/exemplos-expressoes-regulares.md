# Exemplos de Expressões Regulares

- [`/\s\s/g`](#ssg)
- [`/\n/g`](#ng)
- [`/^\s*const __filename = \(0, _url\.fileURLToPath\)\(import\.meta\.url\);[\r\n]*/gm`](#srngm)

# <a id="ssg">`/\s\s/g`</a>

A expressão regular `/\s\s/g` busca duas ocorrências consecutivas de espaços em branco em uma string.

- `\s`**:** representa um caractere de espaço em branco (incluindo espaço, tabulação, quebras de linhas)
- `\s\s`**:** procura dois espaços consecutivos
- `g`**:** flag global, que faz a busca em toda a string, não parando na primeira ocorrência

# <a id="ng">`/\n/g`</a>

A expressão regular `/\n/g` busca todas as quebras de linha (novas linhas) em um texto.

- `\n`**:** representa uma quebra de linha
- `g`**:** flag global, que faz a busca em toda a string, não parando na primeira ocorrência

# <a id="srngm">`/^\s*const __filename = \(0, _url\.fileURLToPath\)\(import\.meta\.url\);[\r\n]*/gm`</a>

Para remover uma linha específica de uma string sem deixar espaçamento ou afetar a indentação, você pode utilizar uma combinação de expressões regulares. A chave é garantir que a linha inteira seja removida, incluindo possíveis quebras de linha.

- `^\s*`**:** procura pelo início da linha (`^`) seguido de qualquer quantidade de espaços em branco (`\s*`)
- `const __filename = \(0, _url\.fileURLToPath\)\(import\.meta\.url\)`**:** correspondência exata com a linha que queremos remover (os parênteses e pontos precisam ser escapados com `\`)
- `[\r\n]*`**:** remove qualquer quebra de linha associada, seja `\r\n` (Windows) ou `\n` (Unix)
- `gm`**:** flags que garantem que a expressão funcione de forma global e em múltiplas linhas (`g`) e no início de cada linha (`m` para modo multilinha)

Isso garantirá que a linha seja removida sem alterar a indenteção ou deixar espaços extras.

# [[Voltar para: JavaScript]](../../JavaScript.md)