# Markdown.

- Não aceita recuo (criados por espaços ou por tabulações);
- **Linguagem de marcação** leve, focada em estruturação do texto, por isso não suporta o controle direto de cores.

## Sumário.

- [Bloco de código](#blococodigo);
- [Títulos e cabeçalhos](#tituloscabecalhos);
- [Parágrafos](#paragrafos);
- [Ênfase e formatação de texto](#enfaseformatacaotexto);
- [Linhas horizontais](#linhashorizontais);
- [Listas](#listas);
- [Links](#links);
- [Imagens](#imagens);
- [Citações](#citacoes);
- [Blocos de citação de múltiplas linhas](#blocoscitacaomultiplaslinhas);
- [Tabelas](#tabelas);
- [Toogle list](#tooglelist).

# <a id = "blococodigo"></a>Bloco de código.

```
Abre o bloco com três acentos graves. Na frente deles você especifica o nome da linguagem.

Observando que a capitalização do nome da linguagem dentro do bloco de código em Markdown não é estritamente regulamentada, mas é uma boa prática seguir a convenção de nomenclatura da linguagem.

Lembrando ainda que alguns sistemas e editores de Markdown podem ser sensíveis à capitalização e podem reconhecer apenas um nome de linguagem específico.

Tags do (Tipos de) bloco de código:

- JavaScript;
- json;
- MySQL;
- bash;
- Python;
- markdown;
- plaintext.

Fecha o bloco com três acentos graves.
```

# <a id = "tituloscabecalhos"></a>Títulos e cabeçalhos.
Criado utilizando o caractere `#`, seguido de um espaço em branco. Quanto maior o número de caracteres `#` em sequência, menor será o nível do título. Exemplos:

# Título de nível `#`.

## Título de nível `##`.

### Título de nível `###`.

#### Titulo de nível `####`.

##### Título de nível `#####`.

###### Título de nível `######`. Este é o título de nível mais baixo.

# <a id = "paragrafos"></a>Parágrafos.

São criados simplesmente inserindo texto em linhas.

# <a id = "enfaseformatacaotexto"></a>Ênfase e formatação de texto.

No Markdown, você pode enfatizar e formatar texto de várias maneiras usando símbolos especiais. Aqui estão algumas das formatações de texto comuns em Markdonw:

- **Negrito:** para tornar o texto em negrito, você pode usar dois asteriscos `**` ou dois sublinhados `__` antes e depois do texto. Por exemplo:

```markdown
**Texto em negrito.**
__Texto em negrito.__
```

- **Itálico:** para tornar o texto em itálico, você pode usar um único asterisco `*` ou um único sublinhado `_` antes e depois do texto. Por exemplo:

```markdown
*Texto em itálico.*
_Texto em itálico._
```

- **Negrito e tálico combinados:** para texto em negrito e itálico ao mesmo tempo, você pode usar três asteriscos `***` ou três sublinhados `___` antes e depois do texto. Por exemplo:

```markdown
***Texto em negrito e itálico.***
___Texto em negrito e itálico.___
```

- **Tachado:** para criar texto tachado (riscado), você pode usar dois til `~~` antes e depois do texto. Por exemplo:

 ```markdown
 ~~Texto tachado~~
 ```

 Lembre-se de que a formatação de texto em Markdown pode variar dependendo do interpretador Markdown que você está usando, mas esses exemplos são amplamente suportados e devem funcionar na maioria das plataformas.

# <a id = "linhashorizontais"></a>Linhas horizontais.

Para criar linhas horizontais em Markdown, você pode usar três ou mais caracteres consecutivos, como asteriscos `*`, traços `-` ou sublinhados `_`. Você pode escolher qualquer um desses caracteres para criar a linha horizontal, contanto que haja pelo menos três deles consecutivos, eles estejam no começo do parágrafo e o paragráfo acima deles esteja vazio.

# <a id = "listas"></a>Listas.

Para criar listas ordenadas, use um número seguido de ponto. Para criar listas não ordenadas, use `-` ou `+` ou `*`. Exemplos:

Lista não ordenada.

- Item 1;
- Item 2;
- Item 3.

Lista ordenada.

1. Primeiro Item;
2. Segundo Item;
3. Terceiro Item;
1. Se você colocar um valor não sequencial, o índice é ajustado automaticamente (este item está numerado como `1` e não como `4`).

# <a id = "links"></a>Links.

Em Markdown, você pode criar links de várias maneiras. Aqui estão algumas das formas mais comuns:

- **Link in-line:** use colchetes `[]` para o texto do link e parênteses `()` para a URL do link:

```markdown
[Texto do Link](https://wwww.exemplo.com).
```

- **:**

# <a id = "imagens"></a>Imagens.

`![Texto alternativo](caminho_relativo/imagem.extensão)`

- `![Texto alternativo]`**:** isso é o texto alternativo da imagem, que é exibido se a imagem não puder ser carregada;
- `(caminho_relativo/imagem.extensão)`**:** o caminho relativo para a imagem.

# <a id = "citacoes"></a>Citações.

# <a id = "blocoscitacaomultiplaslinhas"></a>Blocos de citação de múltiplas linhas.

# <a id = "tabelas"></a>Tabelas.

Pipes (barras verticais, `|`) delimitam colunas e traços (`-`) criam uma linha de cabeçalho separada das linhas de conteúdo. O número mínimo de traços para construir essa estrutura é três, mas você pode utilizar mais traços para ajudar na compreensão em código.\
Dois pontos (`:`) definem o alinhamento, que por padrão é a esquerda.\
Exemplo:

```markdown
| Cabeçalho à esquerda | Cabeçalho centralizado | Cabeçalho à direita |
|:---|:---:|---:|
| Alinhado à esquerda | Alinhado ao centro | Alinhado à direita |
| mais | uma | coluna |
```

Saída:

| Cabeçalho à esquerda | Cabeçalho centralizado | Cabeçalho à direita |
|:---|:---:|---:|
| Alinhado à esquerda | Alinhado ao centro | Alinhado à direita |
| mais | uma | coluna |

# <a id = "tooglelist"></a>Toogle list.

- `<summary></summary>`**:** título do bloco. No caso do bloco de alternância é ele que aparecerá quando o bloco estiver fechado;
- `<details></details>`**:** cria o elemento de detalhes que é usado para criar o bloco de alternância.

<details>
    <summary>Exemplo de Toogle list: conteúdo dentro do `<summary></summary>`.</summary>
        Conteúdo dentro do `<details></details>`.
</details>