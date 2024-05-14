# Template

Estrutura a se seguir em relação as anotações do conteúdo estudado.

### Sumário

- [Template](#template)
    + [Prático](#pratico)
    + [Comandos](#comandos)
    + [Anotações Não Alocadas](#anotacoes-nao-alocadas)
    + [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
    + [Instalação](#instalacao)
    + [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
- [Formatação do Documento](#formatacao-documento)
    + [Código](#formatacao-documento-codigo)
    + [Subtópicos](#formatacao-documento-subtopicos)
    + [Nomenclatura](#formatacao-documento-nomenclatura)
    + [Negrito](#formatacao-documento-negrito)
- [Key Words](#formatacao-documento-key-words)

# <a id="template"></a>$< nome do conteúdo >

---

### Resumo

---

### Sumário

- [Prático](#pratico)
- [Comandos](#comandos)
- [Anotações Não Alocadas](#anotacoes-nao-alocadas)
- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Instalação](#instalacao)
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)

# <a id="pratico"></a>Prático

# <a id="comandos"></a>Comandos

# <a id="anotacoes-nao-alocadas"></a>Anotações Não Alocadas

# <a id="observacoes-sistema-operacional"></a>Observações Sobre o Sistema Operacional

# <a id="instalacao"></a>Instalação

# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos

# <a id="formatacao-documento"></a>Formatação do Documento

### Sumário

- [Código](#formatacao-documento-codigo)
- [Subtópicos](#formatacao-documento-subtopicos)
- [Nomenclatura](#formatacao-documento-nomenclatura)
- [Negrito](#formatacao-documento-negrito)

## <a id="formatacao-documento-codigo"></a>Código

- Primeiro eu importo os módulos externos, deixo um espaço em branco, ai importo os módulos internos
- Normalmente eu mantenho um espaço em branco acima e abaixo de mensagens de log e de `response`s
- As mensagens de erro seguem o seguinte formato, `[ $< arquivo ou função/método > ERROR ]` seguido pelo erro em si

## <a id="formatacao-documento-subtopicos"></a>Subtópicos

Existem alguns subtópicos comuns, abaixo segue a lista deles, observado que a lista segue a ordem na qual eles devem aparecer dentro de um tópico.

- **Sintaxe Básica**
    + **Parâmetros:**
        - Pontuar se podem ser opcionais ou não
    + **Valor de Retorno:**
    + **Como Funciona:**
- **Opções Comuns**
- **Exemplos**
- **Exemplos Interessantes**
- **Observações Interessantes**

## <a id="formatacao-documento-nomenclatura"></a>Nomenclatura

Tente utilizar palavras em português para nomes de função, variáveis, etc.

## <a id="formatacao-documento-negrito"></a>Negrito

Os nomes dos arquivos devem estar em negrito.

# <a id="key-words"></a>Key Words

- `<--`**:** indica o ponto onde parei
- `<!`**:** indica uma linha ou bloco de código, que eu preciso analisar. Para indicar o começo de um bloco, utilizaremos `<!1`, e para indicar o seu final, utilizaremos `<!2`
- `<M`**:** indica uma linha ou bloco de código, que eu modifiquei para ajustar o código para o meu ambiente de trabalho. Para indicar o começo de um bloco, utilizaremos `<M1`, e para indicar o seu final, utilizaremos `<M2`. Eu preciso reverter a alteração antes de realizar o commit
- `<F`**:** indica uma linha ou bloco de código, que eu modifiquei para a minha versão pessoal. Para indicar o começo de um bloco, utilizaremos `<F1`, e para indicar o seu final, utilizaremos `<F2`. Inclua uma mensagem descritiva do porque da alteração
- `$< >`**:** dentro deste bloco, você especifica uma frase descritiva sobre um valor que será utilizado nesta posição. O item abaixo também é um exemplo de uso desta palavra-chave
- `$< Simbologia utilizada para documentação > TODO`**:** abaixo desta palavra-chave, você utiliza de documentação para especificar uma tarefa que você ainda precisa realizar na seção em questão