<F

# Importações e Exportações nos Módulos ES
DDL (Data Definition Language)

- Quando eu utilizar a palavra-chave "revisão" seguida de dois pontos, quero que você realize a correção gramatical do texto fornecido
- Quando der exemplos, a explicação deve estar em português, mas o nome das variáveis e o texto no exemplo devem estar em inglês

+ Usos Comuns
+ Exemplos
+ Considerações
+ Conclusão

- `IN`
- Uso do underscore no SQL

+ Docker

- Testando módulos que não exportam nada, mas invocam uma função. Isso teria um nome?

+ should call these methods n times per function call
+ Caso de sucesso para a função

- objetoMetodoSpy

+ return 'fee5d4acdd915f9032b7d6a850f262deedef8532debf24a8cfbb836d3836c52323033d426437df25191a2e6192e330aa41c1a69772575362b7e7201277ae367d'; // <F Apagar.

#

SELECT id, compete_acumulado, payout_enabled, accumulated_enabled, jackpot_enabled, credit_balance, client_modified_at, online from machines WHERE online = 1 ORDER BY client_modified_at;
-- SELECT id FROM machines WHERE online = 1 AND compete_acumulado = 1 AND payout_enabled = 0 AND accumulated_enabled = 0 AND credit_balance > 100 ORDER BY client_modified_at LIMIT 1 OFFSET 0;

# `EXISTS`

O operador `EXISTS` é usado em uma consulta SQL para testar a existência de linhas retornadas por uma subconsulta. Ele retorna um valor booleano -- verdadeiro se a subconsulta retornar uma ou mais linhas, e falso se a subconsulta não retornar nenhuma linha.

O `EXISTS` é uma maneira eficiente de verificar a presença de registros, pois a execução da subconsulta para quando a primeira linha correspondente é encontrada, tornando-a mais rápido que funções como `COUNT` quando você só quer saber se existe pelo menos um registro.

### Sintaxe Básica

```SQL
SELECT A< campos >
FROM A< tabela principal >
WHERE EXISTS (
    SELECT 1
    FROM A< tabela secundária >
    WHERE A< condição >
);

-- EXISTS(subconsulta)
```

- `EXISTS` é acompanhado por uma subconsulta (consulta interna) dentro dos parênteses
- A subconsulta normalmente verifica alguma condição específica
- O `SELECT 1` dentro do `EXISTS` é uma prática comum, pois o valor real retornado (seja `1` ou qualquer outro valor) não é relevante -- apenas o fato de que existe uma linha retornada é o que importa
- A condição no `WHERE` da subconsulta define os critérios para a existência <F

# Function x Procedure x Trigger

A diferença entre uma função, procedimento armazenado e gatilho em banco de dados está no uso, comportamento e contexto de execução. Cada um tem uma finalidade específica e é usado em diferentes cenários. Abaixo está uma explicação detalhada de cada um:

## 1. Função

Uma função é um bloco de código reutilizável que reliza uma tarefa e retorna um valor. Funções são usadas para calcular e devolver um resultado, sendo mais focadas em operações que podem ser reutilizadas em consultas SQL ou outros processos.

### Características

- Retorna sempre um valor (pode ser escalar, tabela, etc.)
- Pode receber parâmetros de entrada
- Usada dentro de `SELECT`, `WHERE`, `GROUP BY`, ou em exoressões de cálculo
- Geralmente não faz modificações em dados (em muitos bancos, funções não podem executar comandos de alteração de dados como `INSERT`, `UPDATE`, ou `DELETE`)
- Pode ser chamada em qualquer parte de uma query SQL

## 2. Procedimento Armazenado

Um procedimento armazenado é um bloco de código que pode executar uma série de operações, incluindo modificações de dados no banco (inserção, atualização, exclusão). Ao contrário de uma função, um procedimento armazenado não retorna diretamente um valor (mas pode retornar dados via parâmetros ou com `OUT`).

### Características

- Pode ou não retornar valores
- Pode receber parâmetros de entrada e de saída
- Usada para realizar uma série de operações complexas, como várias queries SQL, loops, e lógica condicional
- Pode modificar o estado do banco de dados (inserir, atualizar ou excluir dados)
- Executada com o comando `CALL` ou `EXECUTE`
- Não pode ser usada diretamente em consultas `SELECT` como uma função

## 3. Gatilho

Um gatilho é um bloco de código que é automaticamente executado (ou disparado) em resposta a um evento específico no banco de dados, como uma inserção, atualização ou exclusão de dados em uma tabela. Diferentemente de uma função ou procedimento armazenado, um gatilho é associado a uma tabela específica e é executado automaticamente.

### Características

- Não é chamado diretamente, mas é disparado por eventos (`INSERT`, `UPDATE`, `DELETE`) em uma tabela
- Associado a uma tabela específica e a eventos específicos
- Usado para automatizar tarefas relacionadas à integridade de dados, como auditoria, validação de regras de negócios, etc
- Pode executar comandos SQL, incluindo modificações no banco de dados
- Não retorna valores
- Pode ser `BEFORE` (antes do evento) ou `AFTER` (depois do evento)

## Resumo das Diferenças

|Característica          |Função                                               |Procedimento armazenado                         |Gatilho                          |
|------------------------|-----------------------------------------------------|------------------------------------------------|---------------------------------|
|**Retorno**             |Retorna um valor                                     |Não retorna (pode retornar via `OUT`)           |Não retorna                      |
|**Modificação de dados**|Geralmente, não (depende do banco)                   |Sim, pode alterar dados                         |Sim, pode alterar dados          |
|**Quando é chamado**    |Diretamente em queries SQL                           |Executado explicitamente com `CALL` ou `EXECUTE`|Automaticamente quando um evento (`INSERT`, `UPDATE`, `DELETE`) ocorre|
|**Uso comum**           |Cálculos ou transformações, reutilização em consultas|Lógica complexa, operações em lote              |Automação de regras de negócios, auditoria                            |
|**Chamado em** `SELECT` |Sim                                                  |Não                                             |Não                              |

## Aplicação

- **Funções** são ideais para operações que retornam um resultado e são usadas em consultas
- **Procedimento armazenado** são úteis para realizar várias operações ou fluxos complexos de modificações no banco de dados
- **Gatilhos** são usados para automatizar respostas a eventos no banco de dados, como auditorias, logs ou cálculos automáticos

# `DECLARE` (Procedimentos Armazenados)

No contexto de procedimentos armazenados em muitos bancos de dados (como MySQL/MariaDB), você não pode executar operações SQL ou outros comandos entre as declarações de variáveis (`DECLARE`). As declarações de variáveis devem aparecer antes de qualquer outro comando no procedimento armazenado.

### Regras para o uso de `DECLARE` em procedimentos armazenados

1. As instruções `DECLARE` devem ser colocadas **logo no início do bloco** do procedimento armazenado
2. Não é permitido realizar operações SQL, como `SELECT`, `INSERT`, `UPDATE` ou `DELETE`, entre as declarações `DECLARE`
3. Após o último `DECLARE`, você pode começar a escrever a lógica da procedure

# `COUNT` x `EXISTS` x `LIMIT` (Verificando a Existência de um Registro)

Usar `COUNT` para verificar a existência de um registro que atende a uma condição é uma prática comum, mas pode não ser a maneira mais eficiente quando você está apenas tentando determinar se **existe** pelo menos um registro que satisfaça a condição. A função `COUNT` retornará o número de registros que atendem à condição, enquanto você só precisa de uma resposta booleana (verdadeiro ou falso) para saber se há algum registro.

## Alternativas mais Eficientes

### 1. Uso de `EXISTS`

A função `EXISTS` é mais eficiente quando você só quer saber se um ou mais registros atendem a uma condição, já que ela retorna verdadeiro assim que encontra o primeiro registro que satisfaça a condição.

```SQL
SELECT EXISTS (
    SELECT 1
    FROM settings
    WHERE accumulated_paid_at < DATE_SUB(NOW(), INTERVAL 15 MINUTE)
) AS accumulated_raffle_enabled;
```

- Isso retorna `1` (verdadeiro) se pelo menos um registro atender à condição, ou `0` (falso) caso contrário
- O `EXISTS` para de procurar assim que encontra o primeiro registro, o que o torna mais eficiente que `COUNT`, que precisa processar todos os registros

### 2. Uso de `LIMIT 1`

Outra abordagem é fazer uma consulta simples com `LIMIT 1`, que para de procurar assim que encontra um registro. Isso é útil se você ainda precisa recuperar alguma informação específica de um registro.

```SQL
SELECT COUNT(1) > 0 AS accumulated_raffle_enabled
FROM settings
WHERE accumulated_paid_at < DATE_SUB(NOW(), INTERVAL 15 MINUTE)
LIMIT 1;
```

Esse exemplo ainda usa `COUNT`, mas restringe a busca para parar após o primeiro registro encontrado, o que otimiza o desempenho.

## Comparação com `COUNT`

Quando você usa `COUNT`, o banco de dados tem que verificar e contar **todos os registros** que satisfazem a condição, mesmo que você só precise de um valor booleano. Isso pode ser ineficiente se houver muitros registros.

```SQL
SELECT COUNT(id) > 0 AS accumulated_raffle_enabled
FROM settings
WHERE accumulated_paid_at < DATA_SUB(NOW(), INTERVAL 15 MINUTE);
```

Aqui, o resultado será verdadeiro ou falso com base no número de registros que atendem à condição. No entanto, a consulta pode acabar processando mais registros do que o necessário.

## Resumo

- Se você precisa apenas verificar a **existência** de um registro, use `EXISTS`, pois é mais eficiente do que `COUNT`
- Se for necessário contar os registros, use `COUNT`, mas lembre-se de que ele verificará todos os registros
- Para otimizar ainda mais, se for suficiente apenas saber se existe **um** registro, `LIMIT 1` pode ser usado com `COUNT`

No seu caso, onde você quer apenas um valor booleano para verificar a existência de registros que atendem a uma condição, a abordagem com `EXISTS` seria mais recomendada.

#

# Estudar

- `COUNT`