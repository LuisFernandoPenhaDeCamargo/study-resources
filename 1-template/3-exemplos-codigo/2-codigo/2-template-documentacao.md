# Template para Documentação

Este documento estabelece um padrão para a documentação de funções, métodos e propriedades, detalhando estrutura, formatação e uso de notações específicas para garantir clareza e consistência.

- Utilize inglês para nome de classes, objetos, funções, métodos, propriedades, variáveis e strings em exemplos
- Ao utilizar a notação `A < >`, insira o texto explicativo em português dentro dos colchetes angulares
- Ao mencionar um método ou propriedade fora do contexto de seu objeto ou módulo, forneça a referência completa. Exemplo: `fs.readFile` em vez de `readFile` quando o contexto não for o módulo fs
- Insira comentários e saídas no mesmo nível da linha de código (se possível), com uma linha de espaço entre o código e o comentário ou saída
- Alinhe comentários e saídas à direta, caso isso facilite a compreensão. Respeite o escopo correspondente sempre que possível, mas desconsidere-o se isso melhorar o entendimento
- Indique que se trata de uma saída com a estrutura "Output"

# Estrutura de Documentação

1. Descrição
2. **Sintaxe Básica:** inclua uma seção para sintaxe básica, exceto quando o título já indique isso
3. **Parâmetros:** "`A< parâmetro >`**:** A< descrição >"
4. **Retorno:** detalhe o valor retornado, quando aplicável. "**Retorno:** A< descrição >"
5. Principais Características
6. Opções Comuns
7. Exemplos
8. Dificuldades e Soluções Encontradas
9. Observações Importantes
10. Conclusão/Resumo

# Notação de Colchetes

Em documentações, utiliza-se a notação de colchetes (`[]`) para indicar que determinados parâmetros são opcionais em uma função ou método. Esse formato permite descrever a ordem e a opcionalidade de parâmetros de forma clara e padronizada.

Os colchetes indicam que o parâmetro dentro deles pode ser omitido sem causar erro de execução.

```JavaScript
// Exemplo em JavaScript.

optionalExample(mandatoryParameter[, optionalParameter]);
```

Em notações aninhadas, cada camada de colchetes indica que os parâmetros internos só podem ser utilizados quando os externos já tiverem sido fornecidos.

```JavaScript
// Exemplo em JavaScript.

func.bind(thisArg[, arg1[, arg2[, ...]]]);
```

- `thisArg` é obrigatório
- `arg1` é opcional, mas só pode ser fornecido se `thisArg` já estiver definido
- `arg2` e argumentos adicionais também são opcionais, mas só podem ser passados se `thisArg` e `arg1` forem fornecidos previamente

# [[ Voltar para: Código ]](./1-codigo.md)