# Template Literals

## <a id="utilizando-acento-grave-dentro-template-literal">Utilizando o Acento Grave Dentro de um Template Literal</a>

Para incluir um acento gravo (backtik) dentro de um template literal, você deve usar a sequência de escape `\`. Isso permitirá que a crase seja tratada como um caractere literal e não como o delimitador do template literal.

### Exemplo

```JavaScript
let remoteQueries = await pool.query(`
    SELECT
        SUBSTRING_INDEX(SUBSTRING_INDEX(query, "'", -4), "'", 1) AS machine_id,
        SUBSTRING_INDEX(SUBSTRING_INDEX(query, '_', -3), '\`', 1) AS prize_name,
        date AS executed
    FROM
        remote_queries
    WHERE
        SUBSTRING_INDEX(query, '\`force', 1) = 'UPDATE \`settings\` SET'
        AND date >= '2024-06-01 00:00:00'
        AND date <= '2024-06-30 23:59:59'
        AND server_id = 2198
    ORDER BY date DESC;
`);
```

[Métodos de Objetos -->](./metodos-objetos/README.md)