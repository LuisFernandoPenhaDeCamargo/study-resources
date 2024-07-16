## Negrito

A lista abaixo pontua o que deverá estar em negrito:

- Nome de diretórios
- Nome de arquivos
- Extensões
- Nome de itens de lista

## Código

### Notação de Colchetes

Os colchetes em notações como

```JavaScript
funcao.bind(thisArg[, argumento1 [, argumento2 [, ...]]]);
```

indicam que os parâmetros `argumento1`, `argumento2`, `...`, são **opcionais**, se você não fornecer esses argumentos, a função ainda funcionará corretamente, apenas sem os agumentos predefinidos.

- A presença de colchetes ao redor dos parâmetros, indica que você pode optar por não passar nenhum desses argumentos, ou pode passar alguns ou todos eles
- Os colchetes aninhados na notação indicam que, para fornecer um argumento que está mais internamente aninhado, você deve primeiro fornecer todos os argumentos que estão nos níveis mais externos
    + `thisArg`**:** obrigatório
    + `argumento1`**:** opcional, mas só pode ser fornecido se `thisArg` também for fornecido
    + `argumento2`**:** opcional, mas só pode ser fornecido se `thisArg` e `argumento1` também forem fornecidos
    + `...`**:** opcionais, mas só podem ser fornecidos se `thisArg`, `argumento1` e `argumento2` também forem fornecidos

### Formatação

- **Mensagens de erro:** seguem o seguinte formato, "`[ $< nome da função ou método/ nome do arquivo > ERROR ], ${error.message}`", sendo que o template literal e `${error.message}` fazem parte da sintaxe específica do JavaScript, para outras linguagens, siga a mesma ideia, mas utilizando das propriedades da linguagem em questão