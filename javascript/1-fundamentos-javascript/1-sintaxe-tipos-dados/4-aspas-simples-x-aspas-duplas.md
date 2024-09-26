# Aspas Simples x Aspas Duplas

Em JavaScript, você pode usar tanto aspas duplas (`"`) quanto aspas simples (`'`) para definir strings. Não há diferença significativa no comportamento de ambas, e o uso de uma ou outra depende mais de estilo de codificação ou convenção adotada.

### Diferença Prática

A única diferença prática entre aspas duplas e aspas simples está relacionada à necessidade de incluir aspas dentro da string:

- Se você usar aspas duplas, pode incluir aspas simples no interior da string sem precisar escapá-las
- Se você usar aspas simples, pode incluir aspas duplas no interior da string sem precisar escapá-las

### Padrão de Estilização

Muitas vezes, o uso de aspas simples ou duplas é uma questão de convenção. Por exemplo:

- O ESLint (um linter popular para JavaScript) pode ser configurado para exigir consistência no uso de aspas
- Algumas equipes preferem aspas simples para strings e aspas duplas para HTML ou JSON

# Exemplos

### 1. Usando aspas duplas

```JavaScript
const text = "I'm learning JavaScript!";
```

### 2. Usando aspas simples

```JavaScript
const text = 'He said, "JavaScript is awesome!"';
```

### 3. Escapando aspas

Se precisar incluir o mesmo tipo de aspas dentro da string, você deve escapá-las usando uma barra invertida (`\`):

```JavaScript
const text  = "He said, \"JavaScript is awesome!\"";
const text2 = 'I\'m learning JavaScript!';
```

# Resumo

Embora aspas duplas e simples sejam intercambiáveis na maioria dos casos, é importante ser consistente com o estilo escolhido e considerar a necessidade de escape ao incluir aspas dentro das strings.

# [[Voltar para: Fundamentos de JavaScript]](../fundamentos-Javascript.md)