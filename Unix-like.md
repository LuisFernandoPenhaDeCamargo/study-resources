# Cron.

A palavra **Cron** geralmente se refere ao sistema de agendamento de tarefas em sistemas operacionais Unix-like, como o Linux. O Cron permite que os usuários programem a execução automática de tarefas em horários específicos, datas ou intervalos regulares. Essas tarefas agendadas são conhecidas como **cron jobs**. Alguns dos conceitos básicos relacionados ao Cron:

- **Cron jobs:** são as tarefas agendadas que você programa para serem executadas automaticamente em momentos específicos. Isso pode incluir coisas como backup de dados, geração de relatórios, limpeza de arquivos temporários e muito mais;
- **Sintaxe Cron:** a sintaxe utilizada para agendar tarefas no Cron é composta por cinco campos separados por espaços, que indicam o minuto, a hora, o dia do mês, o mês e o dia da semana em que a tarefa deve ser executada. A sintaxe é semelhante a esta:
`* * * * * comando_a_ser_executado`
    - Cada asterisco representa um campo e pode ser substítuido por um número ou um intervalo;
    - O campo `comando_a_ser_executado` contém o comando que você deseja executar.
- **Exemplos:** alguns exemplos de agendamento de tarefas no Cron:
    - `0 2 * * *`**:** executa uma tarefa todos os dias às 2h da manhã;
    - `30 8 * * 1-5`**:** executa uma tarefa às 8h30 de segunda a sexta-feira;
    - `0 0 1 1 *`**:** executa uma tarefa à meia-noite no primeiro dia de cada ano.
- **Comandos Cron:** os comandos executados pelo Cron podem ser qualquer comando que você normalmente executaria no terminal do sistema. Isso inclui scripts shell, comandos Linux, programas personalizados, etc;
- **Arquivo Crontab:** os cron jobs são geralmente configurados e gerenciados através do arquivo "crontab". Cada usuário pode ter seu próprio arquivo crontab para definir suas tarefas agendadas. Você pode editar o crontab do usuário usando o comando `crontab - e`;
- **Logs de saída:** quando um cron job é executado, ele normalmente gera uma saída. Essa saída é frequentemente enviada para o e-mail do usuário ou para um arquivo log, dependendo da configuração;
- **Ferramentas relacionadas:** existem ferramentas gráficas e utilitários de linha de comando que facilitam a configuração e a administração de cron jobs em sistemas Unix-like.