# JavaScript

<!-- - Pontuar o que é JavaScript >
<!-- - Pontuar que o arquivo que trata de objetos é o objetos.md -->

### Sumário

- [Custo da Importação](#custo-importacao)

# <a id="custo-importacao">Custo da Importação</a>

Considere o seguinte cenário, você está verificando os benefícios de utilizar desestruturação para importar apenas o método `.readFileSync()` do módulo `fs`, o objetivo é aumentar o desempenho da sua aplicação.

Os benefícios de utilizar a técnica acima pe que seu código se tornará mais claro e conciso, especialmente quando você só precisa de um ou dois métodos de um módulo grande. No entanto, **o benefício de desempenho ao fazer isso é neglifível, pois o Node.js carrega o módulo inteiro na memória independentemente de como você o importa**.

Quando você importa um módulo, seja utilizando `require()` ou `import`, o módulo inteiro é carregado na memória, independentemente de você acessar apenas uma parte dele. Isso ocorre porque Node.js carrega o código do módulo na primeira vez que ele é importando e armazena o resultado em cache. Subsequentemente, todas as importações subsequentes do mesmo módulo reutilizam o módulo carregado a partir do cache.

### Observações

### Tree Shaking em Webpack

Em ambientes como Webpack (usado para aplicações web), técnicas de tree shaking podem ser aplicadas para remover código não utilizado durante o processo de build, mas isso é específico ao bundler e ao ambiente de build, não ao Node.js em si.

### Conclusão

O comportamento de carregamento e cache é consistente para todos os módulos em Node.js, incluindo grandes frameworks como o Express. Independente de você usar `require()` ou `import`, o módulo inteiro é carregado na memória na primeira importação e todas as importações subsequentes reutilizam o módulo a partir do cache. Desestruturar partes de um módulo pode melhorar a legibilidade do código, mas não afeta o desempenho ou o uso de memória.