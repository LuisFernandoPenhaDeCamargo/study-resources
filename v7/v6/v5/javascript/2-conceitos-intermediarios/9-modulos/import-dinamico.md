# Import Dinâmico

O import dinâmico (ou importação dinâmica) é uma têcnica em JavaScript que permite **importar módulos de maneira assíncrona**, diferente das importações estáticas que são resolvidas durante a compilação. Ele é útil para carregar módulos apenas quando necessário, o que pode melhorar a performance e a organização do código. A sintaxe do import dinâmico utiliza a função `import` e retorna uma promessa.

### Principais Características

1. **Assíncrono:** retorna uma promessa que se resolve quando o módulo é carregado
2. **Condicional:** permite importar módulos com base em condições específicas
3. **Melhoria de performance:** pode ajudar a reduzir o tempo de carregamento inicial da aplicação, carregando módulos apenas quando eles são realmente necessários

### Benefícios

1. **Carregamento sob demanda:** módulos são carregados apenas quando necessários, o que pode economizar recursos e melhorar a performance
2. **Código mais limpo:** pode tornar o código mais limpo, evitando importações desnecessárias
3. **Facilidade em aplicações grandes:** em grandes aplicações, permite a divisão de código em partes menores e mais gerenciáveis

### Exemplo

```JavaScript
// Uma das maiores vantagens do import dinâmico é a capacidade de importar módulos condicionalmente.
async function loadComponent(componentName) {
    if (componentName === "header") {
        const { Header } = await import("./Header.js");

        return Header;
    } else if {
        const { Footer } =  await import("./Footer.js");

        return Footer;
    }
}

loadComponent("header").then(Header => {
    // Use o componente Header.
});
```

## Observações Interessantes

## <a id="importacao-dinamica-exportacao-padrao">Importação Dinâmica de Exportação Padrão</a>

No CommonJS, ao usar a sintaxe de importação dinâmica para importar um módulo ES, você pode acessar a exportação padrão do módulo ES, mas você não pode renomear diretamente essa exportação durante a importação. Em vez disso, você deve acessar a exportação padrão usando a propriedade `default`.

Suponha que você tenha um módulo ES **es-module.mjs**

```JavaScript
export const myVariable = 42;

export default function sayHello() {
    console.log("Hello from ES Module.");
}
```

e você quer importá-lo dinamicamente em um módulo CommonJS **commonjs-module.js**

```JavaScript
(async () => {
    const esModule = await import("./es-module.mjs");
    const sayHello = esModule.default;
    // "`const sayHello = (await import("./es-module.mjs")).default;`" também é válido, afinal você importa um objeto que contém todas as exportações do módulo ES.

    sayHello(); // Chama a função sayHello do módulo ES.
})();
```

`esModule` (`const esModule = await import("./es-module.mjs");`) é um objeto que contém todas as exportações do módulo ES e a exportação padrão está acessível através da propriedade `default`. Se você imprimisse o objeto `esModule` a saída seria a seguinte:

```JavaScript
[Module: null prototype] {
    default: [Function: sayHello],
    myVariable: 42
}
```

Você acessa a exportação padrão do módulo ES e pode atribuí-la a uma variável com o nome que preferir, no caso acima, `sayHello`.

Observe que a importação dinâmica retorna um objeto onde as exportações nomeadas são mapeadas diretamente para propriedades do objeto, enquanto a exportação padrão é tratada de forma especial e atribuída à propriedade `default`. Isto é parte do mecanismo de compatibilidade do JavaScript para suportar tanto módulos ES quanto CommonJS, onde a semântica das exportações precisa ser mantida consistente.

Por conta disso, embora `default` seja, tecnicamente, uma propriedade do objeto de exportação, ela não pode ser diretamente desestruturada como as exportações nomeadas devido à forma como a importação dinâmica lida com essa exportação.