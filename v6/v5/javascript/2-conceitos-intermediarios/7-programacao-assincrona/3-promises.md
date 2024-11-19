# Promises

Promises são um conceito fundamental em programação assíncrona em JavaScript. Elas servem como um mecanismo para lidar com operações que podem levar algum tempo para serem concluídas, como requisições HTTP ou leitura de arquivos. Ao invés de bloquear a execução do código até que a operação seja finalizada, uma Promise permite que o código continue a ser executado enquanto a operação é realizada em segundo plano. Quando a operação termina, a Promise "promete" retornar o resultado ou o erro, permitindo ao programador gerenciar esses estados de forma clara e organizada.

### Estados de uma Promise

- **Pending:** o estado inicial, a operação ainda não foi concluída
- **Fulfilled:** a operação foi concluída com sucesso, e a Promise retorna um valor
- **Rejected:** a operação falhou, e a Promise retorna um motivo de falha (erro)

### Fluxos de uma Promise

1. Uma Promise é criada para uma operação assíncrona
2. O código continua a ser executado enquanto a Promise está em estado "pending"
3. Quando a operação assíncrona termina, a Promise é resolvida (com sucesso) ou rejeitada (com erro)
4. Métodos como `then` e `catch` são usados para lidar com o resultado da operação

# Vantagens e Desvantagens

### Vantagens

- **Encadeamento limpo:** Promises permitem encadear operações assíncronas de forma linear, sem o aninhamento profundo das callbacks
- **Maneja de erros centralizado:** com Promises, os erros podem ser tratados de forma centralizada com o método `catch`, evitando a necessidade de tratar erros em cada nível do aninhamento, promovendo assim uma melhor separação de responsabilidades ao lidar com sucesso e erro de forma distinta
- **Legibilidade:** o código fica mais legível e próximo de uma sequência lógica, facilitando a compreensão

### Desvantagens

- **Curva de aprendizado:** embora mais legíveis, Promises podem parecer confusas no início, especialmente devido ao uso de encadeamentos
- **Necessidade de refatoração:** para utilizar Promises em APIs legadas baseadas em callbacks, pode ser necessário envolvê-las em Promises manualmente (via `new Promise` ou `util.promisify`)

Esse conceito de Promise foi criado para padronizar o controle de operações assíncronas, especialmente com a introdução de APIs modernas no JavaScript.

# [[Próximo tópico: `then`/`catch`]](./4-then-catch.md)