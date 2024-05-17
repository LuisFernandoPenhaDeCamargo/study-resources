# Template

Estrutura a se seguir em relação as anotações do conteúdo estudado.

### Sumário

- [Template](#template)
    + [Prático](#pratico)
    + [Contexto: SO Utilizado](#contexto-so-utilizado)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [Anotações](#anotacoes)
    + [Instalação](#instalacao)
    + [Comandos Utilizados Através do CLI](#comandos-utilizados-cli)
- [Formatação do Documento](#formatacao-documento)
    + [Código](#formatacao-documento-codigo)
    + [Subtópicos](#formatacao-documento-subtopicos)
    + [Nomenclatura](#formatacao-documento-nomenclatura)
    + [Negrito](#formatacao-documento-negrito)
- [Key Words](#formatacao-documento-key-words)

# <a id="template"></a>$< nome do conteúdo >

---

- ### Resumo

---

- ### Sumário

+ [Prático](#pratico)

+ [Contexto: SO Utilizado](#contexto-so-utilizado) <!-- Novo formato do tópico. -->
+ [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional) <!-- Antigo formato do tópico. -->

+ [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)

+ [Anotações](#anotacoes) <!-- Novo formato do tópico. -->
+ [Anotações Não Alocadas](#anotacoes-nao-alocadas) <!-- Antigo formato do tópico. -->

+ [Instalação](#instalacao)

+ [Comandos Utilizados Através do CLI](#comandos-utilizados-cli) <!-- Novo formato do tópico. -->
+ [Comandos](#comandos) <!-- Antigo formato do tópico. -->

- # <a id="pratico"></a>Prático
- # <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

- # <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos
- # <a id="anotacoes"></a>Anotações
- # <a id="instalacao"></a>Instalação
- # <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

# <a id="formatacao-documento"></a>Formatação do Documento

### Sumário

- [Código](#formatacao-documento-codigo)
- [Subtópicos](#formatacao-documento-subtopicos)
- [Nomenclatura](#formatacao-documento-nomenclatura)
- [Negrito](#formatacao-documento-negrito)

## <a id="formatacao-documento-codigo"></a>Código

- Primeiro eu importo os módulos externos, deixo um espaço em branco, ai importo os módulos internos
- **Normalmente** eu mantenho um espaço em branco acima e abaixo de mensagens de log e de "`response`s"
- As mensagens de erro seguem o seguinte formato, `[ $< arquivo ou função/método > ERROR ]` seguido pelo erro em si
- Para especificar que o comentário se trata de uma saída, uma impressão, pontue antes dele "Output:"
    + **Exemplo:** `// Output: number` (JavaScript)
Output:
- Links de referência não devem possuir em seu corpo o argumento
    + **Exemplo:** `## <a id="comandos-utilizados-cli-describe"></a>´pm2 describe $< ID >´` (Markdown)
- No primeiro paragráfo, primeira sentença, devemos fornecer uma descrição resumida do comando (comece com **"É utilizado para ..."**). Destaque a parte mais importante, se possível
    + Após isso, podemos fornecer mais informações sobre ele

## <a id="formatacao-documento-subtopicos"></a>Subtópicos

Existem alguns subtópicos comuns, abaixo segue a lista deles, observado que a lista segue a ordem na qual eles devem aparecer dentro de um tópico.

- **Sintaxe Básica**
    + Se o título do tópico já for a "**Sintaxe Básica**", não precisamos fornecer este subtópico
    + **Parâmetros:**
        - Pontuar se podem ser opcionais ou não
    + **Valor de Retorno:**
    + **Como Funciona:**
- **Saída Típica**
- Após o subtópico "**Saída Típica**", você pode fazer anotações sobre a utilizade do comando
- **Opções Comuns**
- **Exemplos**
- **Exemplos Interessantes**
- **Observações Interessantes**/**Observações Importantes**

## <a id="formatacao-documento-nomenclatura"></a>Nomenclatura

Tente utilizar palavras em português para nomes de função, variáveis, etc.

## <a id="formatacao-documento-negrito"></a>Negrito

Os nomes dos arquivos devem estar em negrito.

## <a id="formatacao-documento-"></a>Subtítulos

Existem alguns subtítulos comuns, abaixo segue a lista deles, observando que a lista segue a ordem na qual eles devem aparecer dentro de um título.

- ## <a id="-observacoes-interessantes"></a>Observações Interessantes/## <a id="-observacoes-importantes"></a>Observações Importantes
- ## <a id="metodos-"></a>Métodos

# <a id="key-words"></a>Key Words

- `<--`**:** indica o ponto onde parei
- `<!`**:** indica uma linha ou bloco de código, que eu preciso analisar. Para indicar o começo de um bloco, utilizaremos `<!1`, e para indicar o seu final, utilizaremos `<!2`
- `<M`**:** indica uma linha ou bloco de código, que eu modifiquei para ajustar o código para o meu ambiente de trabalho. Para indicar o começo de um bloco, utilizaremos `<M1`, e para indicar o seu final, utilizaremos `<M2`. Eu preciso reverter a alteração antes de realizar o commit, inclua uma mensagem descritiva do porque da alteração
- `<F`**:** indica uma linha ou bloco de código, que eu modifiquei para a minha versão pessoal. Para indicar o começo de um bloco, utilizaremos `<F1`, e para indicar o seu final, utilizaremos `<F2`. Inclua uma mensagem descritiva do porque da alteração
- `$< >`**:** dentro deste bloco, você especifica uma frase descritiva sobre um valor que será utilizado nesta posição. O item abaixo também é um exemplo de uso desta palavra-chave
- `$< Simbologia utilizada para documentação > TODO`**:** abaixo desta palavra-chave, você utiliza de documentação para especificar uma tarefa que você ainda precisa realizar na seção em questão. Exemplo:

```markdown
<!--
TODO

- O que é o PM2, para o que ele serve?
- termos-TI.md, adicionar SO
-->
```
- **Markdown:** entre crases, na hora de especificar um bloco de código simples, quando for necessário o uso de crases dentro deste bloco, como não está sendo possível escapar o caractere, utilize o acento agudo no lugar da crase. Exemplo: "`## <a id="comandos-utilizados-cli-describe"></a>´pm2 describe $< ID >´`"
- **Markdown:** entre asteriscos, na hora de especificar uma frase em negrito, quando for necessário o uso do "$" dentro deste bloco, como não está sendo possível escapar o caractere, utilize o "A" no lugar do cifrão. Exemplo: "**/home/A< usuário >/.nvm/versions/node/A< versões >/lib/node_modules**"