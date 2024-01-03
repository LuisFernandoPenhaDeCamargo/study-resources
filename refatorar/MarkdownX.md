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

- **Link automático:** se você simplesmente colar uma URL em seu documento Markdown, ela será automaticamente convertida em um link:

```markdown
https://www.exemplo.com
```

- **Link de referência:** você também pode criar links de referência, onde define a URL em outro lugar no documento. Isso é útil para manter seu documento limpo e legível. Primeiro, defina a referência em algum lugar do seu documento:

```markdown
[Texto do Link][referencia].
...
[referencia]: https://www.exemplo.com
```

Em seguida, use a referência onde você quiser criar o link. Você pode fazer isso várias vezes no documento usando a mesma referência.

- **Link de e-mail:** para criar um link de e-mail, use a mesma sintaxe, mas coloque `mailto:` antes do endereço de e-mail:

```markdown
[E-mail de Suporte](mailto: suporte@exemplo.com).
```

- **Links com âncora:**  são links internos que leval a seções específicas do mesmo documento, para criar links com âncora, você utiliza a seguinte sintaxe:\
    Primeiro, crie uma âncora no local do documento que você deseja vincular. Use colchetes `[]` e parênteses `()` com um identificador exclusivo após o símbolo `#`.

```markdown
[Âncora de exemplo](#minhaancora).
```

Em seguida, vá para a seção do seu documento onde deseja que a âncora seja ancorada e insira a âncora usando o seguinte formato:

```markdown
<a id = "minhaancora"></a>
```

Dessa forma, o link com âncora apontará para a âncora criada no documento.

### `<a id = ""> x <a name = "">`

Ambos são utilizados para criar âncoras em documentos HTML, mas há uma diferença histórica de uso entre eles.

- `<a name = "">`**:** esta é uma forma mais antiga de criar âncoras em HTML e costumava ser amplamente usada;
- `<a id = "">`**:** este é um método mais moderno para criar âncoras em HTML e é considerado mais compatível com os padrões atuais.

A diferença fundamental entre eles é que `< a name = "">` costumava ser usado para criar âncoras em elementos específicos, enquanto `<a id = "">` é mais comum para criar âncoras em elementos de marcação semântica, como títulos ou divs.

# <a id = "imagens"></a>Imagens.

`![Texto alternativo](caminho_relativo/imagem.extensão)`

- `![Texto alternativo]`**:** isso é o texto alternativo da imagem, que é exibido se a imagem não puder ser carregada;
- `(caminho_relativo/imagem.extensão)`**:** o caminho relativo para a imagem.

# <a id = "citacoes"></a>Citações.

Em Markdown, você pode formatar citações usando o caractere `>` (sinal de maior que). As citações são comumente usadas para destacar trechos de texto que são citados de outras fonte ou para criar blocos de texto recuados.

- **Citações de texto único:** para criar uma única linha de citação, use o caractere `>` seguido pelo texto que deseja citar. Por exemplo: `> Isto é uma citação de texto.`;
- **Citações de vários parágrafos:** para criar citações de vários parágrafos, coloque o caractere `>` no início de cada parágrafo que deseja citar. Certifique-se de deixar uma linha em branco entre os parágrafos citados. Por exemplo

```markdown
> Este é o primeiro parágrafo da citação.
>
> Este é o segundo paragráfo da citação.
```

- **Citações aninhadas:** você também pode criar citações aninhadas, adicionando mais caracteres `>` no ínicio das linhas. Por exemplo:

```markdown
> Nível 1 da citação.
>> Nível 2 da citação.
>>> Nível 3 da citação.
```

# <a id = "tooglelist"></a>Toogle list.

- `<summary></summary>`**:** título do bloco. No caso do bloco de alternância é ele que aparecerá quando o bloco estiver fechado;
- `<details></details>`**:** cria o elemento de detalhes que é usado para criar o bloco de alternância.

<details>
    <summary>Exemplo de Toogle list: conteúdo dentro do `<summary></summary>`.</summary>
        Conteúdo dentro do `<details></details>`.
</details>