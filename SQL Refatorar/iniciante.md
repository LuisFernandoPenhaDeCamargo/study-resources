# Iniciante

### Sumário

1. [Introdução ao Banco de Dados:](#introducao-ao-banco-de-dados)
    - O que é um Banco de Dados
    - Tipos de Bancos de Dados (Relacional, NoSQL, etc.)
    - RDBMS (Sistema de Gerenciamento de Banco de Dados Relacional)

2. [Introdução ao SQL:](#introducao-ao-sql)
    - O que é SQL
    - Diferença entre SQL e MySQL, SQL Server, PostgreSQL, etc.

3. [Palavras Reservadas](#palavras-reservadas)
    - `USER`
    - `IDENTIFIED BY`
    - Sintaxe de Criação e Alteração de Usuários

4. [Comandos Básicos:](#comandos-basicos)
    - SELECT, FROM, WHERE
    - ORDER BY, GROUP BY
    - DISTINCT, LIMIT
    - Operadores Lógicos (AND, OR, NOT)

5. [Filtragem de Dados:](#filtragem-de-dados)
    - WHERE com Múltiplas Condições
    - IN, BETWEEN, LIKE
    - NULL e IS NULL

# <a name = "introducao-ao-banco-de-dados"></a>Introdução ao Banco de Dados

### O que é um Banco de Dados

### Tipos de Bancos de Dados (Relacional, NoSQL, etc.)

### RDBMS (Sistema de Gerenciamento de Banco de Dados Relacional)

# <a name = "introducao-ao-sql"></a> Introdução ao SQL

### O que é SQL

### Diferença entre SQL e MySQL, SQL Server, PostgreSQL, etc.

# <a name = "palavras-reservadas"></a>Palavras Reservadas

Palavras reservadas são palavras que têm significado especial na linguagem SQL, algumas palavras reservadas pode sem usadas em instruções específicas ou em contextos específicos, mas não são palavras-chaves universais. Por exemplo, as palavras reservadas `USER`, `DATE`, `TIME`, etc.\
Em resumo, todas as palavras-chave são palavras reservadas, mas nem todas as palavras reservadas são palavras-chave em todos os contextos do SQL. Algumas palavras reservadas podem ser usadas em determinadas situações sem ter um significado específico associado, enquanto outras têm significados mais específicos e são usadas como palavras-chave em certos contextos.\
Ao escrever instruções SQL, é importante consultar a documentação específica do sistema de gerenciamento de banco de dados (SGBD) que você está utilizando para entender completamente o significado e o uso de palavras-chave e palavras reservadas naquele contexto específico.

### `USER`

`USER` é uma palavra reservada utilizada para se referir a um usuário em muitos sistemas de gerenciamento de banco de dados (SGBDs). Com ela você pode criar ou alterar usuários.\
No momento de criação ou de alteração, de um usuário, você normalmente especifica um "host", o host refere-se a máquina ou servidor a partir da qual um usuário tem permissão para se conectar ao banco de dados. No contexo de criação de usuários em bancos de dados, o "host" é uma maneira de especificar de onde (ou de qual máquina) um usuário pode se conectar.\
Em muitos sistemas de gerenciamento de banco de dados (SGBDs), como MySQL, um usuário pode ser associado a um host específico. Isso é útil para controlar de quais locais ou servidores um usuário pode cessar o banco de dados. O host pode ser especificado de diversas formas, algumas comuns incluem:

- `localhost`**:** o usuário só pode se conectar a partir da máquina local;
- `%` **(coringa):** o usuário pode se conectar de qualquer host;
- `192.168.1.1 `**(por exemplo):** o usuário pode se conectar a partir de um host específico com um endereço IP.

`CREATE USER 'nome_do_usuario'@'localhost' IDENTIFIED BY 'senha';`

Neste exemplo, `'nome_do_usuario'` é o nome do usuário, e `'localhost'` é o host a partir do qual esse usuário pode se conectar. Se o usuário tentar se conectar de um host diferente, a tentativa será negada.\
Ao associar um host ao usuário, você tem mais controle sobre a segurança e o acesso ao banco de dados, limitando de onde as conexões são permitidas.\
Ou seja, no caso do exemplo acima, quando você associa um usuário ao host `'localhost'`, esse usuário só pode se conectar ao banco de dados a partir da mesma máquina (local) onde o banco está hospedado. Qualquer tentativa de conexão de uma máquina remota será negada.\
Quando o host não é especificado, o padrão pode variar dependendo do SGBD utilizado, em alguns, o padrão pode ser interpretado como um coringa, indicando que o usuário pode se conectar de qualquer host. Em outros casos, pode haver um host padrão predefinido.\
Em geral, é uma boa prática sempre verificar a documentação específica do SGBD que você está usando para entender o comportamento exato e as configurações padrão. Ainda é recomendável ser explícito sobre o host ao qual o usuário está associado, mesmo que seja `'%'` para permitir conexões de qualquer host, para garantir uma configuração clara e evitar ambiguidades.

### `IDENTIFIED BY`

A expressão `IDENTIFIED BY` não é uma cláusula SQL padrão, mas sim uma extenssão específica de alguns SGBDs. Ela é usada para definir uma senha associada a um usuário, mas a forma exata de criar usuários e definir senhas pode variar entre os diferentes SGBDs.

### Sintaxe de Criação e Alteração de Usuários

`CREATE USER 'nome_do_usuario'@'host' IDENTIFIED BY 'senha';`

`ALTER USER 'nome_do_usuario'@'host' IDENTIFIED BY 'senha';`

Em relação a alteração de um usuário, é necessário especificar um valor para "`'senha'`".

### `KEY`

`KEY` é uma palavra reservada utilizada para criar (dependendo do contexto):

1. **Chave Primária (**`PRIMARY KEY`**):** no contexto de criação de tabelas, `KEY` pode ser usado para especificar uma chave primária. Por exemplo:

```sql
CREATE TABLE tabela_exemplo (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);
```

Nesse exemplo, `KEY` é usado para indicar que a coluna `id` é chave primária da tabela.

2. **Índice (**`INDEX`**):** `KEY` também pode ser usado para criar índices em colunas específicas para melhorar o desempenho das consultas. Isso é comumente usado para acelerar operações de busca e junção. Exemplo:

```sql
CREATE INDEX idx_exemple ON tabela_exemplo (nome);
```

Aqui, `KEY` é usado como sinônimo de `INDEX` para criar um índice na coluna.

3. **Chave Estrangeira (**`PRIMARY KEY`**):** embora não seja uma prática comum, em alguns SGBDs, você pode encontrar o uso de `KEY` para definir uma chave estrangeira. Geralmente, `FOREIGN KEY` é preferido para essa finalidade. Exemplo:

```sql
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
```

Aqui, `KEY` não é usado diretamente, mas a definição de chave estrangeira é relacionada ao conceito de chaves.

4. `UNIQUE KEY`**:** em algumas sintaxes, como MySQL, você pode usar `KEY` para criar uma restrição de chave única. Exemplo:

```sql
CREATE TABLE tabela_exemplo (
    id INT,
    nome VARCHAR(255),
    UNIQUE KEY nome_unico (nome)
);
```

Neste caso, `KEY` é usado para indicar uma chave única na coluna `nome`.\
Em resumo, o significado de `KEY` varia dependendo do contexto em que é usado no SQL. Pode representar uma chave primária, um índice, uma chave estrangeira ou uma chave única, dependendo da sintaxe específica e das convenções do SGBD em questão.

# <a name = "comandos-basicos"></a> Comandos Básicos

### SELECT, FROM, WHERE

### ORDER BY, GROUP BY

### DISTINCT, LIMIT

### Operadores Lógicos (AND, OR, NOT)

# <a name = "filtragem-de-dados"></a> Filtragem de Dados

### WHERE com Múltiplas Condições

### IN, BETWEEN, LIKE

### NULL e IS NULL