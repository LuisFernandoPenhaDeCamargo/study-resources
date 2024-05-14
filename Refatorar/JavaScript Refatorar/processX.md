# `process`

- **Argumentos da linha de comando:** você pode acessar os argumentos passados para o script Node.js a partir de `process.argv`. Por exemplo `process.argv[2]` fornecerá o terceiro argumento passado na linha de comando;
- **Variáveis de ambiente:** você pode acessar variáveis de ambiente do sistema operacional por meio de `process.env`. Isso é útil para configurar seu aplicativo com base em variáveis de ambiente, como chaves de API, portas de servidor, etc;\
    As variáveis de ambiente são frequentemente usadas para configurar e personalizar o comportamento de um aplicativo sem a necessidade de alterar o código-fonte. Isso torna mais fácil ajustar o comportamento do aplicativo em diferentes ambientes (por exemplo, desenvolvimento, teste, produção) ou para diferentes configurações específicas.
- **Controle de saída:** você pode controlar a saída padrão e de erro usando `process.stdout` e `process.stderr`, respectivamente. Isso permite que você imprima informações para o console;
- **Eventos de processo:** o objeto `process` emite vários eventos que você pode ouvir para responder a eventos específicos, como o evento `exit` que é acionado quando o processo Node.js está prestes a encerrar;
- **Método** `process.exit()`**:** permite encerrar explicitamente o processo Node.js com um código de saída personalizado. Isso é útil para indicar o status de saída do processo;
- **Gerenciamento de diretórios e caminhos:** `process.pwd` retorna o diretório de trabalho atual e `process.chdir` permite que você mude o diretório de trabalho atual;
- **Funcionalidades de tempo:** você pode usar `process.nextTick()` para agendar uma função para ser executada na próxima iteração do ciclo de eventos do Node.js. Também é possível usar `setTimeout()` e `setInterval()` para controlar o tempo de execução;
- **Infomações sobre o ID do processo:** você pode obter o ID do processo atual usando `process.pid`;
- **Acesso ao fluxo de entrada:** `process.stdin` permite ler dados de entrada do console;
- **Método** `process.on()`**:** permite registrar manipuladores de eventos para eventos específicos do processo. Por exemplo, `process.on('uncaughtException', handler)` pode ser usado para capturar exceções não tratadas.