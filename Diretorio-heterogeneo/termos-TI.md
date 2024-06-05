# Termos Utilizados na Área de TI

### Sumário

- [blob e glob](#blob-glob)
- [CLI](#cli)
- [CWD](#cwd)
- [foo](#foo)
- [Linter](#linter)
- [LTS](#lts)
- [Snapshot](#snapshot)
- [SO](#so)

# <a id="blob-glob"></a>blob e glob

Considerando o seguinte contexto, que é uma explicação de como o pacote Nexe funciona, pacote este utilizado para compilar Node.js:

"All dependencies and entrypoint are bundled together in a blob that nexe refers to as a virtual file system. This is then appended to a prebuilt binary.

The prebuilt binaries inspect themselves for this blob and interpret the entrypoint. If the blob is not present an error will appear "Invalid nexe binary"

This works well in environments where you don't need to sign the executable, as the arbitrary payload is not signable.

To create a signable binary you have to use nexe as a build tool for adding additional native modules to node, or using the embedding api. In addition to likely providing more robust application bundling."

No contexto mencionado, "blob" se refere a um conjunto de dados binários que é tratado como uma única unidade. É uma abstração comum em progração para representar dados não estruturados ou binários. No caso específico do Nexe, a "blob" é uma maneira de agrupar todas as dependências e o ponto de entrada do aplicativo em um único pacote, que é então anexado ao binário principal gerado pelo Nexe. Essa "blob" é essencialmente um sistema de arquivos virtual que contém todos os arquivos necessários para o aplicativo funcionar.

Já um "glob" é um padrão de pesquisa de arquivos que pode incluir caracteres curinga, como asteriscos e pontos de interrogação, para corresponder vários arquivos ou diretórios em um sistema de arquivos. Por exemplo, ".js" é um glob que corresponde a todos os arquivos com extensão **.js**. No contexto do Nexe, a opção `--resources "./**/*"` indica que todos os arquivos e diretórios presentes no diretório atual e em todos os seus subdiretórios serão incluídos como recursos no "blob" mencionado acima.

"Blob" é um abreviação para "Binary Large Object" e é comumente usado para se referir a um conjunto de dados binários não estruturados ou grandes. "Glob" é uma abreviação de "Global", que nesse contexto significa uma expressão de pesquisa de arquivos que pode ser aplicada globalmente em um sistema de arquivos.

Sobre "blob" e o GitHub. O termo "blob" faz parte da URL do GitHub por causa da estruturação padrão de URLs para exibir arquivos em repositórios do GitHub.

No GitHub, os arquivos em um repositório são acessados através de URLs que seguem a seguinte estrutura:

```
https://github.com/$< nome do usuário ou organização >/$< nome do repositório >/blob/$< nome do branch ou commit >/$< caminho para o arquivo >
```

A parte `blob` na URL indica que o recurso sendo acessado é um arquivo específico dentro do repositório. Não se refere diretamente ao conceito de "blob" no sentindo de um objeto binário. É apenas uma convenção de nomenclatura usada pelo GitHub para representar arquivos dentro de um repositório.

# <a id="cli"></a>CLI

O termo "CLI" refere-se a "Command Line Interface" ou "Interface de Linha de Comando". Uma CLI é uma forma de interação com um sistema ou aplicação através de comandos de texto inseridos em um terminal ou prompt de comando. O usuário fornece instruções digitando comandos e recebendo saídas textuais como resposta.

Uma CLI oferece uma maneira eficiente e flexível de interagir com sistemas operacionais, aplicativos e serviços. Ela é especialmente valorizada por usuários avançados, administradores de sistemas e desenvolvedores que preferem trabalhar na linha de comando devido à sua velocidade, automação e capacidade de integração com scripts e ferramentas.

# <a id="cwd"></a>CWD

"CWD" é uma abreviação para "Current Working Directory", que em português significa "diretório de trabalho atual". É o diretório no sistema de arquivos onde um processo está atualmente trabalhando ou onde um comando está sendo executado.

Por exemplo, se você estiver no diretório **/home/usuario** e executar um comando, o CWD para esse comando será **/home/usuario**, a menos que o comando mude o diretório de trabalho. É uma parte importante do contexto de execução de um processo ou comando no sistema operacional.

# <a id="foo"></a>foo

A palavra "foo" é um termo genérico usado em muitos exemplos de código, tutoriais e documentações como um nome fictício ou placeholder para representar algo semelhante a uma variável ou valor qualquer. É uma convenção comum em ciência da computação e programação.

"foo" é frequentemente combinado com "bar" e "baz" para formar uma sequência de nomes de variáveis fictícias. Esses termos são usados porque são curtos, fáceis de lembrar e não têm significado real, o que os torna úteis para exemplos e ilustrações sem distrair com detalhes específicos.

Por exemplo:

- `var foo = 'Hello, world!'`**:** aqui, "foo" é apenas um nome de variável usado para armazenar uma string
- `function foo() { return 'bar'; }`**:** aqui, "foo" é apenas o nome de uma função que retorna "bar"
- `npm install foo`**:** aqui, "foo" é usado como um nome fictício para representar o nome de um pacote que você deseja instalar via npm

Em resumo, "foo" é apenas um marcador de posição sem significado real, usado para ilustrar conceitos em exemplos de código.

# <a id="linter"></a>Linter

Um "linter" é uma ferramenta de análise de código estático usada principalmente em programação para encontrar problemas potenciais em um código-fonte. O termo "linter" vem de "lint", que originalmente era um programa que verificava o texto de arquivos de código-fonte em linguagens de programação como C, destacando erros de sintaxe, problemas de estilo e possíveis bugs.

Os linters modernos estão disponíveis para uma variedade de linguagens de programação e são capazes de fazer muito mais do que apenas verificar a sintaxe. Eles podem identificar problemas de estilo, conformidade com padrões de codificação, práticas de programação inseguras e até mesmo possíveis bugs ou problemas de desempenho.

Alguns linters também podem fornecer sugestões de correção ou formatação automática do código-fonte para melhorar a legibilidade e a qualidade do código. Eles são amplamente utilizados em desenvolvimento de software para ajudar os desenvolvedores a manter um alto padrão de qualidade no código-fonte e evitar erros comuns.

# <a id="lts"></a>LTS

"LTS" é uma abreviação para "Long-Term Support".

# <a id="snapshot"></a>Snapshot

Um "snapshot" em programação refere-se a um instantâneo ou imagem do estado de um sistema em um determinado momento. No contexto do Node.js, um "snapshot" é uma forma de otimização de desempenho que captura o estado inicial de uma aplicação e o salva para uso posterior durante a inicialização.

Ao criar um snapshot, o Node.js registra o estado inicial da aplicação, incluindo o estado da memória, variáveis, funções, e outras estruturas de dados, em um formato otimizado. Este snapshot é então armazenado em um arquivo e pode ser usado para acelerar a inicialização da aplicação no futuro.

Quando a aplicação é iniciada novamente, o Node.js pode carregar o snapshot em vez de iniciar a aplicação do zero. Isso economiza tempo e recursos, pois o estado inicial da aplicação já está pré-carregado, evitando a necessidade de recriar esse estado a partir do zero.

Em resumo, um snapshot no Node.js, é uma técnica de otimização que captura e reutiliza o estado inicial da aplicação para melhorar o tempo de inicialização e o desempenho geral da aplicação.

# <a id="so"></a>SO

"SO" é uma abreviação para "Sistema Operacional"/"Sistemas Operacionais".