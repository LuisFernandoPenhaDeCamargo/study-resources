# <a id="cluster"></a>`cluster`

Ao usar o módulo `cluster` do Node.js você cria processos filhos (workers) que compartilham a mesma porta para lidar com a carga de trabalho de forma eficiente.

Caso você encerre um processo filho, apenas esse processo específico será encerrado, os outros processos continuarão em execução normalmente. No entanto, observe que, quando um dos processos filhos morre (por qualquer motivo), o evento `'exit'` é acionado no processo mestre (master).