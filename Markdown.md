# Markdown.

# Bloco de código.

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

# Imagens.

`![Texto alternativo](caminho_relativo/imagem.extensão)`

- `![Texto alternativo]`**:** isso é o texto alternativo da imagem, que é exibido se a imagem não puder ser carregada;
- `(caminho_relativo/imagem.extensão)`**:** o caminho relativo para a imagem.

---

# Tabelas.

Pipes (barras verticais, `|`) delimitam colunas e traços (`-`) criam uma linha de cabeçalho separada das linhas de conteúdo. O número mínimo de traços para construir essa estrutura é três, mas você pode utilizar de mais para ajudar na compreensão em código.\
Dois pontos (`:`) definem o alinhamento, que por padrão é a esqueda.\
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

---

## Regras gerais.

- Não aceita recuo (criados por espaços ou por tabulações);
- **Linguagem de marcação** leve, focada em estruturação do texto, por isso não suporta o controle direto de cores.

# Estruturas.

- [Títulos e cabeçalhos;](#tc)
- [Parágrafos;](#prg)
- [Listas;](#lists)
- [Enfase e formatação de texto;](#eft)
- [Citações;](#cit)
- [Linhas horizontais;](#lh)
- [Tabelas;](#tables)
- [Blocos de citação de múltiplas linhas;](#xcit)
- [Links;](#links)
- [Imagens;](#img)
- [Blocos de código;](#code)
- [Toogle list.](#tl)

## <a id = "tc"></a>Títulos e cabeçalhos.
Criado utilizando o caractere `#<espaço em branco>`. Quanto maior o número de caracteres `#` em sequência, menor será o nível do título.

### Exemplos
# Título de nível `#`
## Título de nível `##`
### Título de nível `###`
#### Titulo de nível `####`
##### Título de nível `#####`
###### Título de nível `######`
Este é o título de nível mais baixo.

## <a id = "prg"></a>Parágrafos.

São criados simplesmente inserindo texto em linhas.

## <a id = "lists"></a>Listas.

Para criar listas ordenadas, use `<número>.`. Para criar listas não ordenadas, use `- ou + ou *` .

### Exemplo.

Lista não ordenada.

- Item 1;
- Item 2;
- Item 3.

Lista ordenada.

1. Primeiro Item;
2. Segundo Item;
3. Terceiro Item;
1. Se você colocar um valor não sequencial, o índice é ajustado automaticamente (este item está numerado como "1" e não "4").

## <a id = "tl"></a>Toogle list.

-  **\<summary> \</summary>:** título do bloco. No caso do bloco de alternância é ele que aparecerá quando o bloco estiver fechado;
- **\<details> \</details>:** cria o elemento de detalhes que é usado para criar o bloco de alternância.

### Exemplo

<details>
    <summary>Exemplo de Toogle List: conteúdo dentro do &ltsummary>.</summary>
        Conteúdo dentro do &ltdetails>.
</details>