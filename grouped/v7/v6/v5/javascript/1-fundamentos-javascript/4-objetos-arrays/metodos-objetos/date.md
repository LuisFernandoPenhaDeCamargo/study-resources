# Métodos do `Date`

## Observações Importantes

O termo "horário local" refere-se ao fuso horário e às regras de horário de verão do ambiente onde o código está sendo **executado**. Isso significa que a data e a hora são interpretadas de acordo com as configurações de tempo do SO do servidor ou dispositivo onde o código está rodando.

### Sumário

- [`getFullYear`](#getfullyear)
- [`toLocaleString`](#tolocalestring)

# <a id="getfullyear">`getFullYear`</a>

O método `getFullYear` é utilizado para **obter o ano completo (com quatro dígitos) de uma data especificada de acordo com o horário local**.

### Sintaxe Básica

```JavaScript
dateObj.getFullYear();
```

- **Retorno:** um número representando o ano (com quatro dígitos) da data especificada

# <a id="tolocalestring">`toLocaleString`</a>

O método `toLocaleString` é utilizado para **obter uma string com a representação da data e hora de acordo com a localização (locale) especificada**.

### Sintaxe Básica

```JavaScript
dateObj.toLocaleString([locales[, options]]);
```

- `locales`**:** uma string com um único idioma ou uma matriz de strings com idiomas, que especificam a localização a ser utilizada. Exemplo: `en-US`, `pt-BR`
- `options`**:** um objeto que contém propriedades que influenciam a formatação da data e hora. Exemplos de propriedades incluem:
    + `weekday`**:** `long`, `short`, `narrow`
    + `year`**:** `numeric`, `2-digit`
    + `month`**:** `numeric`, `2-digit`, `long`, `short`, `narrow`
    + `day`**:** `numeric`, `2-digit`
    + `hour`**:** `numeric`, `2-digit`
    + `minute`**:** `numeric`, `2-digit`
    + `second`**:** `numeric`, `2-digit`
    + `timeZoneName`**:** `short`, `long`
- **Retorno:** uma string com a representação da data e hora no formato especificado

## Exemplo

```JavaScript
const date    = new Date();
const options = {
    weekday:      "long",
    year:         "numeric",
    month:        "long",
    day:          "numeric",
    hour:         "2-digit",
    minute:       "2-digit",
    second:       "2-digit",
    timeZoneName: "short",
};

console.log(date.toLocaleString("en-US", options)); // Output: Wednesday, July 31, 2024 at 11:41:57 AM GMT-3
```

# [[Próximo tópico: Métodos do `JSON`]](./JSON.md)