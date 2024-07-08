# Template (Ok)

Estrutura a se seguir em relação as anotações do conteúdo estudado.

### Sumário

- [Template](#template)
    + [Prático](#pratico)
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Instalação](#instalacao)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [Anotações](#anotacoes)
    + [Arquivos Relacionados](#arquivos-relacionados)
    + [Erros Enfrentados](#erros-enfrentados)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
- [Formatação do Documento](#formatacao-documento)
    + [Código](#formatacao-documento-codigo)
        - [Subtópicos](#formatacao-documento-subtopicos)
        - [Exemplos](#formatacao-documento-exemplos)
    + [Subtítulos](#formatacao-documento-subtitulos)
    + [Negrito](#formatacao-documento-negrito)
- [Key Words](#formatacao-documento-key-words)

# <a id="template"></a>$< nome do documento >

- `### Resumo`
- `### Sumário`

+ `- [Prático](#pratico)`
+ `- [Contexto: SO Utilizado](#contexto-so-utilizado)`
+ `- [Instalação](#instalacao)`
+ `- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)`
+ `- [Anotações](#anotacoes)`
+ `- [Arquivos Relacionados](#arquivos-relacionados)`
+ `- [Erros Enfrentados](#erros-enfrentados)`
+ `- [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)`

- `# <a id="pratico"></a>Prático`
- `# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado`

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

- `# <a id="instalacao"></a>Instalação`
- `# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos`
- `# <a id="anotacoes"></a>Anotações`
- `# <a id="arquivos-relacionados"></a>Arquivos Relacionados`
- `# <a id="erros-enfrentados"></a>Erros Enfrentados`
- `# <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI`/`# <a id="metodos"></a>Métodos`

# <a id="formatacao-documento"></a>Formatação do Documento

- Nem todo subtítulo (`###`) precisa de link de referência
- **Markdown:** entre asteriscos, na hora de especificar uma frase em negrito, quando for necessário o uso do "$" dentro deste bloco, como não está sendo possível escapar o caractere, utilize o "A" no lugar do cifrão. Exemplo: **~/.nvm/versions/node/A< versões >/lib/node_modules**

### Sumário

- [Código](#formatacao-documento-codigo)
    + [Notação de Colchetes](#formatacao-documento-codigo-notacao-colchetes)
    + [Subtópicos](#formatacao-documento-codigo-subtopicos)
    + [Exemplos](#formatacao-documento-codigo-exemplos)
- [Subtítulos](#formatacao-documento-subtitulos)
- [Negrito](#formatacao-documento-negrito)
- [Siglas e Abreviações](#formatacao-documento-siglas-abreviacoes)

## <a id="formatacao-documento-codigo"></a>Código

- No primeiro paragráfo, primeira sentença, devemos fornecer uma descrição resumida do comando (comece com "É utilizado para **...**" ou "Ele fornece **...**"). Destaque a parte mais importante, se possível  
    + Após isso, podemos fornecer mais informações sobre ele
- Eu prefiro utilizar listas para ressaltar pontos importantes, se possível
    + A listas serão numeradas se isso fizer sentido para mim
- Se eu estiver pontuando sobre uma função (ou método) em um tópico que não se trata do módulo (ou objeto) associado a ele, também o insira na hora de citar o método. Exemplo:  
    `.readFile()` do módulo `fs`, seria citado como `fs.readFile()` no módulo `util`
- Primeiro eu importo os módulos externos, deixo um espaço em branco, ai importo os módulos internos
- **Normalmente** eu mantenho um espaço em branco acima e abaixo de mensagens de log, de `return`s e de `response`s
- Links de referência não devem possuir em seu corpo o parâmetro
    + **Exemplo:** `## <a id="comandos-utilizados-cli-describe"></a>´pm2 describe $< ID >´` (Markdown)
- Em links de referência você deve substituir o ponto pelo traço
    +  **Exemplo:** `## <a id="dump-pm2"></a>dump.pm2` (Markdown)
- Para especificar que o comentário se trata de uma saída, uma impressão, pontue antes dele "Output:"
    + **Exemplo:** `// Output: number` (JavaScript)

### <a id="formatacao-documento-codigo-exemplos"></a>Exemplos

- Se eu não "encontrar" um substituto adequado para o nome de uma váriavel (função, método, classe) em português, eu usarei o nome em inglês mesmo
- O acento agudo será substituído pela letra "h", se for necessário para o entendimento

## <a id="formatacao-documento-subtitulos"></a>Subtítulos

Existem alguns subtítulos comuns, abaixo segue a lista deles, observando que a lista segue a ordem na qual eles devem aparecer dentro de um título.

- `### Principais Características/### Principais Características e Funcionalidades`
- `### Observações Importantes`
- `### Exemplos de Casos de Uso`
- `### Conclusão`

## <a id="formatacao-documento-negrito"></a>Negrito

- Os nomes dos arquivos e diretórios devem estar em negrito

## <a id="formatacao-documento-siglas-abreviacoes"></a>Siglas e Abreviações

- A decisão de usar somente a sigla (a abreviação) ou não, vai de acordo com a minha dificuldade de lembrar o significado dela

# <a id="key-words"></a>Key Words

- `<--`**:** indica o ponto onde parei
- `<!`**:** indica uma linha ou bloco de código, que eu preciso analisar. Para indicar o começo de um bloco, utilizaremos `<!1`, e para indicar o seu final, utilizaremos `<!2`
- `<M`**:** indica uma linha ou bloco de código, que eu modifiquei para ajustar o código para o meu ambiente de trabalho. Para indicar o começo de um bloco, utilizaremos `<M1`, e para indicar o seu final, utilizaremos `<M2`
    + Inclua uma mensagem descritiva do porque da alteração após a palavra-chave
    + Não esqueça de reverter a alteração antes de realizar o commit
- `<F`**:** indica uma linha ou bloco de código, que eu modifiquei para a minha versão pessoal. Para indicar o começo de um bloco, utilizaremos `<F1`, e para indicar o seu final, utilizaremos `<F2`
    + Inclua uma mensagem descritiva do porque da alteração após a palavra-chave
    + Não esqueça de reverter a alteração antes de realizar o commit
- `$< >`**:** dentro deste bloco, você especifica uma frase descritiva sobre um valor que será utilizado nesta posição. O item abaixo também é um exemplo de uso desta palavra-chave
- `$< Simbologia utilizada para documentação > TODO`**:** abaixo desta palavra-chave, você utiliza de documentação para especificar uma tarefa que você ainda precisa realizar na seção em questão. Exemplo:

```Markdown
<!--
TODO

- O que é o PM2, para o que ele serve?
- termos-TI.md, adicionar SO
-->
```