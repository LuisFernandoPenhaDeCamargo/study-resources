# Segurança

Este arquivo trata de técnicas maliciosas para obter informações sensíveis do seu código e de como previni-las.

### Sumário

- [Inspeção de Memória ou Dump de Processo](#inspeção-memoria-ou-dump-processo)

# <a id="inspeção-memoria-ou-dump-processo">Inspeção de Memória ou Dump de Processo</a>

A técnica de Inspeção de Memória ou Dump de Processo é uma abordagem avançada utilizada por pessoas com **acesso privilegiado a máquina onde um processo está sendo executado**. Esse método visa obter informações sensíveis, como valores de variáveis, diretamente da memória do processo em execução.

Quando um aplicativo Node.js está em execução, ele aloca espaço na memória para armazenar variáveis, funções, dados temporários e outras estruturas de dados necessárias para seu funcionamento.

Um dump de memória é uma captura ou cópia do conteúdo da memória de um processo em um determinado momento. Esse dump pode ser criado usando ferramentas de diagnóstico de baixo nível ou comandos específicos do SO, por exemplo, para criar um dump de processo no Linux: `sudo gcore PID`, onde PID é o indentificador de processo do Node.js.

Após criar o dump de memória, os dados capturados podem ser analisados usando ferramentas especializadas para inspecionar o conteúdo da memória. A análise pode revelar informações sensíveis, como valores de variáveis, strings, buffers ou outros dados armazenados na memória durante a execução do processo Node.js.

As medidas preventivas para mitigar esse tipo de ameaça, são:

- Restrições de acesso a máquina e aos processos
- Monitoramento contínuo de atividades suspeitas
- Criptografia de dados sensíveis em memória e em trânsito
- Implementação de políticas de segurança robustas e atualizações regulares de segurança