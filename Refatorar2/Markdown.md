<a name = "markdown"></a>
### Criação de Tabelas

Em Markdown, você pode criar tabelas utilizando a notação de barras verticais (pipes, "|") e hifens ("-") para separar as colunas e linhas, respectivamente. Aqui está um exemplo básico de como criar uma tabela em Markdown:

```Markdown
|Cabeçalho 1|Cabeçalho 2|Cabeçalho 3|
|---|---|---|
|Linha 1, Coluna 1|Linha 1, Coluna 2|Linha 1, Coluna 3|
|Linha 2, Coluna 1|Linha 2, Coluna 2|Linha 2, Coluna 3|
|Linha 3, Coluna 1|Linha 3, Coluna 2|Linha 3, Coluna 3|
```

Neste exemplo:

- As linhas começam e terminam com barras verticais
- Os cabeçalhos são separados das células por meio de hifens
- O número de barras verticais na primeira linha determina o número de colunas na tabela

O número mínimo de hifens para construir esta estrutura é três, mas você pode utilizar mais para ajudar na compreensão em código.

Dois pontos (":") definem o alinhamento, que por padrão é a esquerda. Exemplo:

```Markdown
|Cabeçalho à esquerda|Cabeçalho centralizado|Cabeçalho à direita|
|:---|:---:|---:|
|Alinhado à esquerda|Alinhado ao centro|Alinhado à direita|
|mais|uma|coluna|
```

Os dois pontos definem o alinhamento tanto dos cabeçalhos quanto das células.

### Links Clicáveis

O GitHub (e outras plataformas que suportam Markdown) interpreta o conteúdo do arquivo Markdown e o renderiza em uma visualização formatada para facilitar a leitura. No caso específico de como o GitHub se comporta em relação a links clicáveis, ele os reconhece automaticamente (URLs, e-mails, devido ao seu formato).\
Para você fazer com que os links não sejam mais clicáveis, o método que eu consegui fazer com que dê certo é envolver o link entre acentos graves (também chamada de crases, "`").