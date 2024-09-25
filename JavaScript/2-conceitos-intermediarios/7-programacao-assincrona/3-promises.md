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

# Benefícios

- Elimina o uso excessivo de callbacks, evitando o famoso "callback hell"
- Torna o código assíncrono mais legível e fácil de manter
- Promove uma melhor separação de responsabilidade ao lidar com sucesso e erro de forma distinta

Esse conceito de Promise foi criado para padronizar o controle de operações assíncronas, especialmente com a introdução de APIs modernas no JavaScript.

# [[Próximo tópico: Callbacks x Promessas]](./4-callbacks-x-promessas.md)