# JavaScript

<!-- - Pontuar o que é JavaScript -->
<!-- - Pontuar que o arquivo que trata de objetos é o objetos.md -->

### Sumário

- [Assincronicidade](#assincronicidade)
<!-- - Pontuar o que são Callbacks -->
<!-- - Pontuar o que são Promises -->
<!-- - Pontuar o que é `async`/`await` -->
- [Funções Assíncronas](#funcoes-assincronas)
- [Top Level Modules](#top-level-modules)
- [Custo da Importação](#custo-importacao)

# <a id="assincronicidade">Assincronicidade</a>

Assincronicidade se refere à capacidade de um programa de iniciar uma operação, continuar a execução de outras operações e reagir aos resultados da operação iniciada posteriormente, sem precisar esperar que ela termine. Em JavaScript, isso é especialmente importante porque o JavaScript é single-thread, o que significa que ele executa uma operação por vez.

### Callbacks

Callbacks são funções passadas como argumentos para outras funções, que são invocadas quando uma operação assíncrona é concluída.

### Promises

Promises são objetos que representam a eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante.

### `async`/`await`

`async`/`await` é uma sintaxe mais recente para trabalhar com Promises, tornando o código assíncrono mais legível e fácil de escrever.

### Benefícios da Assincronicidade

- **Performance:** permite que o JavaScript inicie operações longas (como I/O de arquivos ou chamadas de rede) sem bloquear a thread principal, permitindo que operações continuem a ser executadas
- **Escalabilidade:** aplicações web podem lidar com mais requisições simultâneas, pois podem iniciar operações e continuar a processar outras requisições enquanto aguardam respostas

### Desafios da Assincronicidade

- **Complexidade:** gerenciar a lógica de fluxo e manipulação de erros pode ser mais complexo com callbacks aninhadas (callback hell) e promises encadeadas
- **Legibilidade:** o código assíncrono pode ser mais difícil de ler e entender, especialmente com múltiplas operações assíncronas independentes

### Exemplos

- **Requisições HTTP:** utilização de `fetch` ou bibliotecas como `axios` para realizar chamadas a API
- **Manipulação de arquivos:** uso de APIs como `fs` para ler e escrever arquivos no sistema de arquivos de maneira não bloqueante
- **Timers:** uso de `setTimeout()` e `setInterval()` para executar código após um atraso ou repetidamente

# <a id="funcoes-assincronas">Funções Assíncronas</a>

Quando você declara um função com `async`, **ela automaticamente retorna uma Promise**, o valor retornado da função será **encapsulado nessa Promise**. Dentro de uma função assíncrona, você pode usar `await` para esperar a resolução de uma Promise, o `await` faz com que a execução da função assíncrona pause até que a Promise seja resolvida, e então retoma com o valor resolvido da Promise.

### Exemplos

```JavaScript
async function exemploAssincrono() {
    return "Resultado";
}

console.log(exemploAssincrono()); // Output: Promise { 'Resultado' }

async function exemploComAwait() {
    let resultado = await new Promise(resolve => {
        setTimeout(() => {
            resolve("Resultado depois de 1 segundo.");
        }, 1000);
    });

    return resultado;
}

exemploComAwait().then(resultado => {
    console.log(resultado);       // Output: Resultado depois de 1 segundo. Observe que está linha só será impressa depois da resolução da promise, ou seja, a mensagem abaixo será impressa antes desta.
});

console.log(exemploComAwait());   // Output: Promise { <pending> }
```

- `exemploAssincrono()`**:** mesmo que esta função retorne um valor, por ser uma função assíncrona, ela retorna uma Promise que resolve com o valor `"Resultado"`
- `exemploComAwait()`**:**
    + Usa `await` para esperar a resolução de uma Promise que é resolvida após 1 segundo
    + A função ainda retorna uma Promise, mas o valor da Promise será `"Resultado depois de 1 segundo."`, após ela ser resolvida

# <a id="top-level-modules">Top Level Modules</a>

Top Level Modules (Módulos de Nível Superior) referem-se a módulos que não estão aninhados dentro de outro módulo ou escopo, mas são carregados diretamente no nível superior do contexto de execução. Em outras palavras, um módulo de nível superior é um arquivo de código que é executado como uma unidade independente, sem ser aninhado ou encapsulado por outro módulo.

Em Node.js, um top-level module é qualquer arquivo JavaScript que é executado diretamente pelo interpretador Node.js. Cada arquivo é tratado como um módulo separado. No contexto do ESM (ECMAScript Modules), um top-level module pode ser um módulo que importa outros módulos, mas não é importado por nenhum outro módulo.

### Principais Características

1. **:**
. **:**
. **:**
. **:**

# <a id="custo-importacao">Custo da Importação</a>

Considere o seguinte cenário, você está verificando os benefícios de utilizar desestruturação para importar apenas o método `.readFileSync()` do módulo `fs`, o objetivo é aumentar o desempenho da sua aplicação.

Os benefícios de utilizar a técnica acima pe que seu código se tornará mais claro e conciso, especialmente quando você só precisa de um ou dois métodos de um módulo grande. No entanto, **o benefício de desempenho ao fazer isso é neglifível, pois o Node.js carrega o módulo inteiro na memória independentemente de como você o importa**.

Quando você importa um módulo, seja utilizando `require()` ou `import`, o módulo inteiro é carregado na memória, independentemente de você acessar apenas uma parte dele. Isso ocorre porque Node.js carrega o código do módulo na primeira vez que ele é importando e armazena o resultado em cache. Subsequentemente, todas as importações subsequentes do mesmo módulo reutilizam o módulo carregado a partir do cache.

### Observações

### Tree Shaking em Webpack

Em ambientes como Webpack (usado para aplicações web), técnicas de tree shaking podem ser aplicadas para remover código não utilizado durante o processo de build, mas isso é específico ao bundler e ao ambiente de build, não ao Node.js em si.

### Conclusão

O comportamento de carregamento e cache é consistente para todos os módulos em Node.js, incluindo grandes frameworks como o Express. Independente de você usar `require()` ou `import`, o módulo inteiro é carregado na memória na primeira importação e todas as importações subsequentes reutilizam o módulo a partir do cache. Desestruturar partes de um módulo pode melhorar a legibilidade do código, mas não afeta o desempenho ou o uso de memória.