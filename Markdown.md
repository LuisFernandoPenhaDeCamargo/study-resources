# Markdown.

- Não aceita recuo (criados por espaços ou por tabulações);
- **Linguagem de marcação** leve, focada em estruturação do texto, por isso não suporta o controle direto de cores.

## Sumário.

- [Bloco de código](#blococodigo);
- [Títulos e cabeçalhos](#tituloscabecalhos);
- [Parágrafos](#paragrafos);
- [Ênfase e formatação de texto](#enfaseformatacaotexto);
- [Listas](#listas);
- [Linhas horizontais](#linhashorizontais);
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
- Python.

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

# <a id = "linhashorizontais"></a>Linhas horizontais.

# <a id = "links"></a>Links.

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