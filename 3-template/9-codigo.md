# Código

Este documento apresenta diretrizes para documentação e formatação de código, com orientações específicas para nomenclatura, estrutura e uso de espaços.

# Template para Documentação

- Utilize inglês para nomes de classes, objetos, funções, métodos, variáveis e strings em exemplos
- Quando utilizar a notação `A<>`, inclua texto explicativo em português dentro dos colchetes angulares, para identificar o valor esperado naquela posição
- Ao citar um método fora do contexto de seu objeto ou módulo, inclua a referência completa. Exemplo: `fs.readFile` em vez de `readFile` quando o contexto não for o módulo `fs`
- Comentários devem ser alinhados à direita, caso isso facilite o entendimento. Neste caso não considere o escopo
- As saídas devem ser alinhadas à direita. O escopo deve ser desconsiderado apenas se isso facilitar o entendimento
- Indique que se trata de uma saída com a estrutura "Output"

## Estrutura de Documentação de Métodos e Funções

1. **Descrição:** use o formato "O método `A< nome do método >` é utilizado para **A< descrição do método >**"
    - Para **propriedades**: "A propriedade `A< nome da propriedade >` é uma propriedade..."
    - Para **módulos nativos**: "O `A< nome do módulo >` é um módulo nativo que fornece **A< descrição do módulo >**"
2. **Sintaxe Básica:** inclua uma seção para sintaxe básica, exceto quando o título já indique isso
3. **Parâmetros:** "`A< parâmetro >`**:** A< descrição >"
4. **Retorno:** detalhe o valor retornado, quando aplicável. "**Retorno:** A< descrição >"
5. Principais Características
6. Opções Comuns
7. Exemplos
8. Observações
9. Dificuldades Encontradas
10. Exemplos Interessantes
11. Observações Importantes
12. Conclusão/Resumo

## Notação de Colchetes

Em documentações, utiliza-se a notação de colchetes (`[]`) para indicar que determinados parâmetros são opcionais em uma função ou método. Esse formato permite descrever a ordem e a opcionalidade de parâmetros de forma clara e padronizada.

Os colchetes indicam que o parâmetro dentro deles pode ser omitido sem causar erro de execução.

```JavaScript
// Exemplo em JavaScript

optionalExample(mandatoryParameter[, optionalParameter]);
```

Em notações aninhadas, cada camada de colchetes indica que os parâmetros internos só podem ser utilizados quando os externos já tiverem sido fornecidos.

```JavaScript
// Exemplo em JavaScript

func.bind(thisArg[, arg1[, arg2[, ...]]]);
```

- `thisArg` é obrigatório
- `arg1` é opcional, mas só pode ser fornecido se `thisArg` já estiver definido
- `arg2` e argumentos adicionais também são opcionais, mas só podem ser passados se `thisArg` e `arg1` forem fornecidos previamente

# Formatação do Código-fonte

# [[Próximo tópico: Markdown]]()

---

Para mensagens de erro, utilize o formato `"[A<função> ${error.name}], ${error.message}"`.

## Espaçamento

- Pule uma linha entre:
  - Importações externas e de arquivos internos.
  - Declarações, expressões, retornos e respostas, quando pertencentes a diferentes categorias.
- Agrupe itens do mesmo tipo para clareza visual.

## Comentários

- Posicione **comentários acima** da linha/bloco que documentam.
- Para múltiplas linhas, utilize blocos sem texto na abertura/fechamento:

```javascript
/*
Primeira linha do comentário
Segunda linha do comentário
*/
```

- Em comentários de múltiplas linhas contendo código, comente separadamente as linhas com código e sem código para facilitar a execução:

```javascript
/*
Exemplo em JavaScript.

- Exportando função padrão:
export default function myFunction() {
    console.log("This is the default export function");
}
*/
```