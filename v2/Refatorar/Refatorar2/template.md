### Projeto de Reestruturação

# Palavras chave (keywords)

- "**Anotação:**": deve estar em negrito e seguida de dois pontos. Ela faz observações sobre o tópico em questão, que será utilizada para a estruturação do conteúdo (a formatação deste item está diferente do padrão para facilitar a sua compreensão)
- "**Definição resumida:**": deve estar em negrito e seguida de dois pontos. Ela faz um resumo do tópico em questão (a formatação deste item está diferente do padrão para facilitar a sua compreensão)

---

# Template

## Ideias

Se você achar interessante, inclua diagramas, desenhos para ilustrar a explicação.

## Código

Quando você for descrever a sintaxe básica de um comando, você pode utilizar acentuação e se o termo conter mais de uma palavra, as una com o underscore ("_". Em português, sublinhado ou underline).

Sempre pontuar a **sintaxe básica** do comando. Exemplo:

`sintaxe básica`**:** descrição básica.\
Mais informações.

Dentro do tópico que se refere a uma explicação mais detalhada do comando, se você for pontuar as opções mais comuns, utilize a seguinte estrutura:

"**Opções Comuns**"

Além da estrutura para "exemplos"

"**Exemplos**"

### JavaScript

**Response body.**

Quando o corpo da resposta puder incluir, por exemplo, vários objetos, você pontua a estrutura de um e adiciona três pontos ao final dele. Exemplo:

```json
{
    {
        "chave": "valor"
    }...
}
```

Caso o "`valor`" esteja entre crases, isso significa que o seu conteúdo é variável no sentido de não podermos estabelecer um "tipo". Por exemplo:

```json
{
    "chave": "`erro_capturado_pelo_catch`"
}
```

Quando se tratar de uma lista de possibilidades enumeráveis. Por exemplo, no caso do valor poder ser somente `valor1`, ou `valor2`, ou `valor3`, e esses valores são do "tipo" `[object String]`

```json
{
    "chave": "[object String]: valor1 || valor2 || valor3"
}
```

## Linguagens

\# Linguagem

Descrição dos pontos da linguagem

\# Executando Um Código Feito em Linguagem

## Negrito

- Em listas, quando o item em questão é representado por uma palavra ou frase chave, elas devem estar em negrito
- Dois pontos (":"): ajuda a identificar de forma rápida um ponto específico. Isso quando estão antecedidos de uma palavra ou frase chave
- Ponto final de sentenças que estão totalmente em negrito ("."): exemplo: **Sentença completamente em negrito.**
- Nome de diretórios, arquivos e extensões de arquivos devem estar em negrito

## Siglas e Acrônimos

Você deve pontuar o significado da sigla ou do acrônimo em conjunto deste uma vez por título, após isto, utilize a sigla ou o acrônimo para se acostumar com este.

## Listas

Não irei utilizar ponto e vírgula ou ponto final em itens de lista, mas se os seus subitens não forem uma lista, o que vale é a regra de sintaxe geral.

Caso você tenha uma lista em que um item seja composto por uma palavra ou frase chave dentro de uma palavra ou frase chave, você realiza uma quebra de linha. Exemplo

- Item 1
- **Palavra chave:**\
    **Frase chave:** texto.
- Item 3

## Arquivos

Dependendo do que o arquivo se trata, ele terá sua própria especificação adicional de template.