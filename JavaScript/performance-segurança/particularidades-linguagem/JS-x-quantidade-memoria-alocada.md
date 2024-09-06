# JS x Quantidade de Memória Alocada

Em JavaScript, a quantidade de memória alocada por uma aplicação depende de vários fatores, como os tipos de dados, a complexidade dos objetos e a quantidade de recursos que ela consome, como variáveis, arrays, objetos, e funções.

Aqui estão os principais aspectos que impactam a memória alocada em JavaScript:

### 1. Tipos primitivos x tipos de referência

- Tipos primitivos (números, strings, booleanos, null, undefined) são armazenados diretamente na stack memory. A alocação de memória para esses valores é geralmente pequena, pois são dados simples e de tamanho fixo
- Tipos de referência (objetos, arrays, funções) são armazenados na heap memory. Esses tipos podem ocupar mais memória, dependendo da sua complexidade e tamanho. Além disso, o JavaScript gerencia a memória alocada para eles automaticamente, por meio do garbage collector

### 2. Memória para arrays e objetos

Arrays e objetos podem crescer dinamicamente, o que implica uma alocação adicional de memória conforme novos elementos são adicionados. Um array que contém 10 números pode ocupar mais memória do que 10 variáveis de números individuais.

### 3. Funções e closures

Funções também alocam memória, especialmente quando criam closures. Closures podem manter referências a variáveis fora de seu escopo, o que pode prolongar a vida útil de certos dados na memória.

### 4. Garbage collection

JavaScript utiliza coleta de lixo (garbage collection) para liberar automaticamente a memória não utilizada. Quando uma variável ou objeto não é mais referenciado, o JavaScript tenta liberar a memória ocupada. Contudo, esse processo não é imediato e depende da implementação do motor JavaScript (como V8 no chrome e no Node.js).

### 5. Limites de memória

Por padrão, o Node.js limita a quantidade de memória heap que pode ser alocada para a aplicação, geralmente em torno de 1.5 GB para sistemas de 64 bits. Esse limite pode ser ajustado através de comandos.

### 6. Boas práticas para gerenciar memória

- Evite manter referências a objetos ou arrays desnecessários
- Use estruturas de dados eficientes (como Map e Set ao invés de grandes objetos ou arrays, quando apropriado)
- Closures devem ser utilizadas com cuidado para evitar a criação de memory leaks
- Gere logs e monitore o uso de memória durante a execução de scripts de longa duração (especialmente em servidores com Node.js)

JavaScript pode alocar mais memória do que outras linguagens para resolver a mesma problemática, especialmente por ser uma linguagem intepretada e orientada a objetos. O JavaScript utiliza o garbage colletor para gerenciar memória, o que pode introduzir overhead adicional. Além disso, a naturaza da dinâmica da linguagem, como a alocação de objetos e arrays, pode resultar em uma maior utilização de memória em comparação a linguagens como C, que permitem uma gestão mais explícita e eficiente de recursos.

# [[Próximo tópico: ]]() <!-- TODO: definir o próximo tópico. -->