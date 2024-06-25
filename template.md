# Template

Se atente que os arquivos são escritos em Markdown.

### Sumário

- [Estrutura dos Arquivos (Formatação do Documento)](#estrutura-arquivos)

# <a id="estrutura-arquivos">Estrutura dos Arquivos (Formatação do Documento)</a>

## Nomenclatura

### Diretórios e Arquivos

No Ubuntu, assim como na maioria dos SOs baseados em Unix, não há um padrão estrito para a sintaxe de nomes de diretórios (ou para a sintaxe de nomes de arquivos), mas existem algumas convenções e boas práticas recomendadas para evitar problemas e garantir a compatibilidade. Aqui estão algumas diretrizes importantes:

### 1. Caracteres permitidos:

- Podem ser usados letras (maiúsculas e minúsculas), números e os caracteres especiais hífen, sublinhado e ponto
- É permitido o uso de espaços, embora não seja recomendado, pois podem complicar a utilização em comandos de terminal

### 2. Caracteres não recomendados:

- Evite usar caracteres especiais. Caracteres especiais têm significados especiais no shell e podem causar comportamentos inesperados

### 3. Comprimento do nome:

- O comprimento máximo para um nome de diretório (ou arquivo) é geralmente 255 caracteres

### 4. Case sensitivity:

- Os nomes de diretórios (ou arquivos) são sensíveis a maiúsculas e minúsculas

### 5. Pontos no nome:

- Use apenas um ponto para separar o nome do arquivo da sua extensão. Evite múltiplos pontos no nome do arquivo para evitar confusões, especialmente com sistemas que podem interpretar múltiplos pontos de maneira diferente

### 6. Extensões de arquivo:

- Use extensões apropriadas para indicar o tipo de arquivo, como **.txt**, **.jpg**, **.pdf**, **.sh**, etc.
- Mantenha a extensão separada do nome principal por um ponto

### Boas Práticas

- **Use nomes descritivos:** escolha nomes que descrevam claramente o conteúdo do diretório (ou arquivo)
- **Use separadores consistentes:** se precisar usar separadores, escolha entre hífen ou sublinhado e seja consistente
- **Evite espaços:** substitua espaços por hífens ou sublinhados para evitar a necessidade de escapes no terminal
- **Mantenha a simplicidade:** evite nomes excessivamente longos e complexos
- **Use extensões apropriadas (arquivos):** sempre inclua a extensão apropriada para o tipo do arquivo

### Observações

- Diretórios irão terminar com uma barra

### Conclusão

Seguir essas diretrizes ajudará a evitar problemas de compatibilidade e facilitará o trabalho com o terminal e scripts automatizados.

## Títulos

- O título "`#`" é bastante adequado para começar um novo tópico
- O título "`##`" parece adequado para um subtópico mais longo
- O título "`###`" parece adequado para subtópicos mais curtos
    + Vai pertencer ao tópico (ou subtópico criado com "`##`") mais externo
    + Também é utilizado para pontuar subseções

## Subseções

Subseções não seguem a regra de nomenclatura dos tópicos. Subseções "comuns" seguem a regra de nomenclatura dos tópicos, observe que a lista segue a ordem na qual elas devem aparecer dentro de um tópico (ou subtópico).

Subseções comuns:

- `### Principais Características`
- `### Usos Comuns`
- `### Boas Práticas`
- `### Benefícios`
- `### Exemplos`  
    Nem sempre esta subseção se encaixa exatamente aqui, há cenários no qual o exemplo deve ser dado antes, para a explicação utilizá-lo
- `### Observações`
- `### Conclusão`
- `### Resumo`

Quando se trata de documentação de código:

- `### Sintaxe Básica`  
    Se o título da subtópico já "for" a "Sintaxe Básica", não precisamos fornecer esta subseção
- É necessário pontuar os **parâmetros**, mas não é necessário pontuar o título desta subseção  
    Tente pontuar o seu tipo
- Tente pontuar o valor de retorno, mas não é necessário pontuar o título desta subseção
- `### Opções Comuns`
- `### Observações`
- `### Exemplos`
- `### Observações Importantes`  
    Esta subseção trata de observações ainda mais técnicas do assunto em questão
- `### Exemplos Importantes`  
    Esta subseção trata de exemplos ainda mais técnicos do assunto em questão

## Links de Referência

Links de referência não iram possuir valores entre parênteses, exemplo: `[Template (template.md)](#template)`. Ou eles serão o valor em parênteses, exemplo: `[ECMAScript 2015 (ES6)](#versoes-features-especificas-es6)` (é um subtópico).

## Listas

Se a ordem dos itens da lista não tiver que seguir um significado específico, a ordene alfabeticamente.

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