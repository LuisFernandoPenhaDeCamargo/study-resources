# Markdown <--

Markdown é uma **linguagem de marcação** leve e de fácil leitura que é usada para formatar texto de forma simples. Foi criada por John Gruber em 2004, com a colaboração de Aaron Swartz, com o objetivo de oferecer uma forma fácil de escrever documentos que podem ser convertidos em HTML.

### Principais Características

1. **Sintaxe simples e intuitiva:** Markdown usa uma sintaxe minimalista e intuitiva, tornando fácil a escrita e leitura de texto formatado
2. **Conversão para HTML:** pode ser facilmente convertido para HTML, permitindo que seja usado em blogs, sites, e documentos web
3. **Compatibilidade:** é amplamente suportado em muitas plataformas, incluindo GitHub, Stack Overflow, Reddit, e muitos editores de texto

### Usos Comuns

- **Documentação:** ideal para escrever documentação de software devido à sua sintaxe simples e legível
- **Blogs e sites:** muitos sistemas de blogs e plataformas de publicação suportam Markdown, facilitando a formatação de posts
- **Notas e listas de tarefas:** usado em aplicativos de notas e gerenciamento de tarefas, como o Evernote e o Todoist

### Ferramentas e Plataformas que Suportam Markdown

- **GitHub:** utiliza Markdown para arquivos README.md, issues, e pull requests
- **Slack e Discord:** suporta Markdown para a formatação de texto nas células
- **Jupyter Notebooks:** suporta Markdown para a formatação de texto nas células
- **Static Site Generators:** como Jekyll e Hugo, que usam Markdown para criar sites estáticos

### Conclusão

Markdown é uma ferramenta poderosa para a criação de documentos estruturados e formatados com simplicidade, sendo amplamente adotado pela sua eficiência e versatilidade.

### Sumário

- [Links de Referência](#links-referencia)

# <a id="links-referencia">Links de Referência</a>

Você pode criar links de referência de várias maneiras, dependendo de onde os arquivos estão localizados.

```Markdown
<!-- - Linkando para uma seção no mesmo arquivo -->
[Link para uma seção no mesmo arquivo](#ancora)

<a id="ancora">Outra seção no mesmo arquivo</a>

<!-- - Linkando para um arquivo no mesmo diretório -->
[Link para o arquivo 2](arquivo2.md)

<!-- - Linkando para um arquivo no diretório pai -->
[Link para um arquivo no diretório pai](../arquivo.md)

<!-- - Linkando para um arquivo em um subdiretório -->
[Link para um arquivo em um subdiretório](./subdiretorio/arquivo.md)

<!-- - Linkando para uma seção específica em outro arquivo -->
[Link para o arquivo 2](arquivo2.md#ancora)

<!-- - Você pode utilizar URLs para Linkar recursos externos -->
[Link para este repositório](https://github.com/LuisFernandoPenhaDeCamargo/study-resources)
```

### Linkando para uma seção no mesmo arquivo.

Este tópico no exemplo acima, mostra como criar um link de uma parte do arquivo para outra. Entre colchetes teremos o que será exibido como o "nome" (`Link para uma seção no mesmo arquivo`) do link e entre parênteses o atual link de referência (`ancora`) para a outra seção do mesmo arquivo.

A âncora (um ID) é utilizada para estabelecer a ligação entre o ponto inicial e o seu destino. Ela é o conteúdo entre as aspas (`ancora`) e é criada utilizando a tag `<a id="">` (abertura da tag), e  `</a>` (fechamento da tag).

Com isso o ponto inicial será `Link para uma seção no mesmo arquivo` e, ao clicar nele, você irá para `Outra seção no mesmo arquivo`.

### Linkando para um arquivo no mesmo diretório.

Este tópico no exemplo acima, mostra como criar um link de um arquivo para outro, no mesmo diretório. `arquivo2.md` deve ser o nome do arquivo para o qual você deseja ir.

Observe que você está direcionando para o arquivo inteiro (isto te levará para o início do arquivo) e não para um ponto específico.

### Diretório Pai e Subdiretórios.

A navegação para o diretório pai ou para subdiretórios, segue a regra de sistemas Unix-like. `.` para indicar o diretório em que você se encontra e `..` para indicar o diretório pai.

### Linkando para uma seção específica em outro arquivo.

Ao criar uma link de referência para uma seção específica em outro arquivo, você utiliza o caminho para este arquivo, o seu nome, mais a âncora após o `#`.

### Observações

Para linkar um arquivo a um diretório, você fornece o caminho para o diretório e coloca uma barra ao final dele como link de referência. Exemplo: `[./JavaScript/](./JavaScript/)`.

Se atente que isso só irá funcionar se **o diretório não estiver vazio**.

Os IDs de âncora são gerados automaticamente a partir dos títulos (headers), mas não é obrigatório utilizá-los, você pode escolher como nomeá-los. As IDs de âncora geraddas automaticamente seguem as seguintes regras:

- Os títulos são convertidos para minúsculas
- Espaços são substituídos por hifens
- Caracteres especiais são removidos