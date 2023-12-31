# Template

# Contexto para o Chat GPT

## Novos Arquivos

Lista de tópicos para o aprendizado da _____ que considere a curva de aprendizado.

# Funções/métodos

`funcao/metodo` é um método ou uma função?

- O que ele faz?
- Assinatura do método;
- Parâmetros: quais os tipos deles, se eles são opcionais ou não;
- Retorno;
- Se ele possui uma subcategoria, por exemplo, é uma função de iteração e transformação ou de redução e agregação?
- Exemplo de uso.

- Para demonstrar a sua saída, utilize a estrutura `// Saída:`. Se no mesmo bloco de código houver mais de uma demonstração de "saída", as alinhe de acordo com a coluna da direita;
- Quando o comentário for muito grande, o coloque na linha acima da linha de código em questão ao invés de na mesma linha;
- Para valores de chave, quando eles forem uma string e você quiser indicar um espaçamento, você pode utilizar o underscore;
- Espaçamento de uma linha entre imports, declaração de variáveis, console logs e classes/funções/métodos.

### Template

"`.metodo()` é um método utilizado"

`Na assinatura do método você não utiliza ponto e vírgula ao final.`

# Bibliotecas/Frameworks

- `modulo` é uma biblioteca ou um framework?
- Precisa ser instalado?
- Para o que ele serve?

# Objetos/Propriedades

Para verificar o tipo deles:

`console.log("typeof:", Object.prototype.toString.call(objectOrPropriety))`

# Documentação

Descrição geral sobre o que o arquivo se trata no ínicio dele. Pule uma linha entre a descrição geral e o código.\
Parece útil deixar anotado as tabelas que ele manipula assim como os endpoints.

### Check-list Template

- Considerações gerais sobre o arquivo;
- Considerações linha a linha;

**TABELA(S):**.

**Request params**.

**Request body**.

**Response body**.

Os três itens acima:

- Colocar o conteúdo dentro de um bloco JSON;
- Especificar na frente de cada item se o conteúdo utilizado no bloco JSON é baseado em valores de um banco de dados (SQL values), ou no seu valor em código (tipo do objeto) ou uma mistura de ambos.

# Sumário

- Listas enumeradas;
- Não utilizar de pontuação ao final.

# Markdown e VS Code

Deixe o VS Code sugerir as âncoras, mas não utilize acentuação nelas.

# Marcadores de Posição

Eu uso cinco underscore.

---

# JavaScript: Uma Introdução.

JavaScript é uma linguagem de programação amplamente usada na programação web. É conhecida por ser síncrona e single-threaded, o que significa que é executada em uma única thread de execução e as operações são processadas uma após a outra, em ordem. No entanto, JavaScript tem a capacidade de lidar com operações assíncronas e não bloqueantes, permitindo que os desenvolvedores criem aplicativos eficientes e responsivos.

## Modelo de Execução.

O modelo de execução síncrona e single-threaded do JavaScript implica que as instruções são executadas em ordem, uma após a outra. No entanto, muitas tarefas em aplicativos web são assíncronas, como buscar dados de um servidor ou manipular eventos do usuário. Para lidar com essas situações, JavaScript oferece mecanismos como:

- **Callbacks:** funções que são passadas como argumentos e executadas após a conclusão de uma operação assíncrona.;
- **Promises:** um padrão que fornece uma maneira mais estruturada de lidar com operações assíncronas, permitindo encadear ações após sua conclusão;
- **async/await:** uma sintaxe moderna que simplifica a escrita de código assíncrono, tornando-o mais legível e fácil de entender.

## Shebang no Linux

Em sistemas Linux, é comum usar um Shebang (linha que começa com #!) para especificar o interpretador que deve ser usado para executar um script. Isso é útil para impressão de logs no terminal de comando e pode ser relevante ao executar scripts JavaScript.

Me gere um conjunto de tópicos do básico ao avançado para meu arquivo de estudo **tema**, até então eu tenho os tópicos (se for o caso):

### Dúvidas.

- Terminal x Prompt de comando;
- Diretório x pasta.

### Contexto para o ChatGPT.

**JavaScript.**

Contexto:

- Linux;
- JavaScript;
- Node.js;
- API;
- MySQL;
- Git/GitHub.

Linguagem: português (BR).

**Python.**

Contexto:

Python.

Linguagem: português (BR).

# Estruturas.

### Títulos.

- Títulos de palavras-chave devem estar entre acentos graves;
- Títulos de funções/métodos devem estar entre acentos graves, não devem conter nada em seu parâmetro e não terminam em ponto final. Exemplo: `funcao()`
- Títulos de bibliotecas devem ser nomeados igual ao nome utilizado em sua importação, também devem estar entre acentos graves.

### Listas e itens nominais.

Os itens nominais de uma lista e de forma geral devem estar em **negrito**, inclusive os dois pontos (":"). Caso o item seja uma estrutura de programação, ele deve estar entre `acentos graves` ("`").

### Negrito.

Diretórios, arquivos e extensões devem estar em negrito. O significado de anagramas/abreviações e a sua tradução também.

# Programação.

### Roteiro.

Roteiro a se seguir quando tratar de uma linguagem de programação.

- Cada linguagem de programação dever ter seu próprio diretório;
- Principais pontos sobre a linguagem;
- Executando arquivos;
- Funções/métodos;
- Bibliotecas padrão.