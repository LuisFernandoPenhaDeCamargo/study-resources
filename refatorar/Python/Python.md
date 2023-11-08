# Python.

O Python é uma linguagem de programação de alto nível e de código aberto que é conhecida por sua simplicidade e facilidade de aprendizado. Aqui estão alguns dos principais pontos sobre o Python:

- **Sintaxe clara e legível:** o Python foi projetado para ter uma sintaxe que é fácil de ler e escrever, tornando-o uma escolha popular para iniciantes em programação;
- **Multiplataforma:** o Python é compatível com várias plataformas, incluindo Windows, MacOS e Linux, o que o torna uma escolha versátil para o desenvolvimento de software;
- **Tipagem dinâmica:** Python é uma linguagem de tipagem dinâmica, o que significa que você não precisa declarar o tipo de uma variável explicitamente. Isso simplifica o desenvolvimento e permite uma maior flexibilidade;
- **Grande comunidade e ecossistema:** Python tem uma comunidade ativa e uma vasta biblioteca padrão que abrange uma ampla gama de funcionalidades, tornando-o adequado para uma variedade de aplicações, desde desenvolvimento web até análise de dados e aprendizado de máquina;
- **Orientação a objetos:** Python suporta programação orientada a objetos, permitindo que os desenvolvedores organizem seu código em classes e objetos;
- **Bibliotecas populares:** Python é conhecido por suas bibliotecas populares, como NumPy (para computação científica), pandas (para análise de dados), Matplotlib (para visualização de dados) e Django (para desenvolvimento web);
- **Facilidade de integração:** Python pode ser facilmente integrado com outras linguagens de programação, como C, C++ e Java, o que é útil para otimizar partes críticas de um programa;
- **Grande adoção em aprendizado de máquina e ciência de dados:** Python é amplamente utilizado em campos como aprendizado de máquina, inteligência artificial e análise de dados devido à sua rica ecologia de bibliotecas, como scikit-learn e TensorFlow;
- **Interpretado e compilado:** Python é uma linguagem interpretada, o que significa que o código fonte é executado diretamente por um interpretador. No entanto, também pode ser compilado para bytecode para melhorar o desempenho;
- **Comunidade ativa e documentação:** a comunidade Python é conhecida por ser acolhedora e há uma abundância de recursos educacionais, tutoriais e documentação disponíveis para ajudar os programadores a aprender e dominar a linguagem.

# Sumário.

- [Função sem instrução de retorno explícito](#funcaoinstrucaoretornoexplicito);
- [Biblioteca padrão](#bibliotecapadrao);
- [Executando arquivos **.py**](#executandoarquivospy);
- [Palavras chave](#palavraschave);
- [Funções](#funcoes);
- [Bibliotecas padrão](#bibliotecaspadrao).

### <a id = "funcaoinstrucaoretornoexplicito"></a>Função sem instrução de retorno explícito.

Em Python uma função que não possui uma instrução de retorno explícita sempre retorna `None`.

### <a id = "bibliotecapadrao"></a>Biblioteca padrão.

A expressão "biblioteca padrão do Python" refere-se a um conjunto abrangente de módulos e pacotes que fazem parte da distribuição oficial do Python. Esse módulos são fornecidos junto com a instalação padrão do Python e estão disponíveis para uso imediato sem a necessidade de instalação adicional a partir de fontes externas. Em outras palavras, fazem parte do Python "padrão".

# <a id = "executandoarquivospy"></a>Executando arquivos .py

Para executar arquivos com extensão **.py** (que são arquivos de código-fonte Python), você precisa de um interpretador Python instalado em seu sistema. Aqui estão os passos básicos para executar um arquivo **.py**:

- Instale o Python;
- Crie ou obtenha um arquivo **.py**;
- Abra um terminal ou prompt de comando;
- Navegue até o diretório onde o arquivo **.py** está localizado;
- **Execute o arquivo .py:** `python meu_programa.py`.

### `python meu_programa.py`.

Em alguns sistemas operacionais, especialmente em distribuições Unix-like mais recentes, o comando `python` pode se referir à versão 2.x do Python, que pode não estar mais instalada por padrão. Nesse caso, você deve usar `python3` para executar seu programa Python 3.x, uma vez que as versões mais recentes da linguagem são incompatíveis com o Python 2.x.

# <a id = "palavraschave"></a>Palavras chave.

## `import`

A palavra-chave `import` é usada para incluir módulos ou pacotes externos em seu programa. Alguns pontos importantes:

- **Inclusão de módulos e pacotes:** o `import` permite que você inclua módulos ou pacotes externos em seu código Python, tornando suas funcionalidades disponíveis para uso;
- **Sintaxe básica:** a sintaxe básica do `import` é a seguinte:\
    `import nome_do_modulo`
- **Renomeando módulos:** você pode renomear um módulo ou pacote ao importá-lo, o que é útil para evitar conflitos de nomes ou tornar o código mais legível;\
    `import nome_do_modulo as alias`
- **Importação de funções e variáveis específicas:** além de importar um módulo inteiro, você pode importar funções ou variáveis específicas de um módulo;\
    `from nome_do_modulo import funcao_especifica, variavel_especifica`
- **Importação de todos os itens:** você pode importar todos os itens de um módulo usando um asterisco (*). No entanto, isso não é recomendável, pois pode poluir o espaço de nomes e tornar o seu código menos legível;\
    `from nome_do_modulo import *`
- **Localização de módulos:** o Python procura módulos em locais específicos, incluindo o diretório atual, os diretórios listados na variável de ambiente `PYTHONPATH` e os diretórios padrão do Python;
- **Módulo padrão:** o Python possui uma biblioteca padrão rica de módulos que estão prontamente disponíveis para uso com `import`. Você pode importar módulos da biblioteca padrão da mesma maneira que outros módulos;
- **Módulos personalizados:** você também pode criar seus próprios módulos personalizados em Python, organizar seu código em pacotes e importá-los em outros programas;
- **Evite importações excessivas:** importar muitos módulos desnecessários pode aumentar o tempo de inicialização de seu programa e a sobrecarga de memória. Portanto, é uma boa prática importar apenas os módulos necessários para a tarefa atual;
- **Ciclos de importação:** evite ciclos de importação, onde dois ou mais módulos se importam mutuamente. Isso pode levar a problemas de lógica e deve ser evitado.

### Importação de sintaxe básica x Importação de todos os itens.

Ambas as formas de importação importam todo o conteúdo do módulo. A diferença principal entre elas é a maneira como você acessa os itens importados.

- **Importação de sintaxe básica:**
    - **Sintaxe:** `import nome_do_modulo`;
    - Importa todo o conteúdo do módulo especificado;
    - Você acessa os itens importandos usando a notação de ponto (`nome_do_modulo.item`).

Exemplo:

```Python
import math

resultado = math.sqrt(25)
```

- **Importação de todos os itens:**
    - **Sintaxe:** `from nome_do_modulo import *`;
    - Importa todo o conteúdo do módulo diretamente, sem notação de ponto;
    - Essa abordagem é menos recomendada, pois pode poluir o espaço de nomes e causar conflitos de nomes.

Exemplo:

```Python
from math import *

resultado = sqrt(25) #Você pode usar sqrt diretamente, sem math.

```

# <a id = "funcoes"></a>Funções.

### `print()`

Imprime uma mensagem na saída padrão do terminal.

`print(parametro)`

- **Argumentos:** a função `print()` aceita zero ou mais argumentos, separados por vírgulas, que podem ser de diferentes tipos, como strings, números, variáveis e até mesmo expressões. Ela irá imprimir todos os argumentos na saída padrão do terminal;
- **Tipo de retorno:** a função `print()` retorna `None`.

# <a id = "bibliotecaspadrao"></a>Bibliotecas padrão.

### `hashlib`

A biblioteca `hashlib` fornece uma interface para calcular hashes de dados.