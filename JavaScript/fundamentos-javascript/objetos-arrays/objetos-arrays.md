# Objetos e Arrays

### Sumário

- [Template Literals](#template-literals)

# <a id="template-literals">Template Literals</a>

## <a id="utilizando-crase-dentro-template-literal">Utilizando a Crase Dentro de um Template Literal</a>

Para incluir uma crase (backtik) dentro de um template literal, você deve usar a sequência de escape `\`. Isso permitirá que a crase seja tratada como um caractere literal e não como o delimitador do templa literal.

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