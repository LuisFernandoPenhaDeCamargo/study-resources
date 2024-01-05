# <a name = "shell"></a> Shell

Esta seção está destinada a descrever algumas características do Shell (a interface de linha de comando que permite o usuário interagir com o sistema operacional atráves de comandos de texto), além de alguns comandos aceitos por ele.

### Sintaxe Básica

`comando -opção argumento`

Sendo que para opções curtas, descritas por uma letra é utilizado somente um traço. Para opções longas, descritas por palavras ou frases, é utilizado dois traços. Exemplo:

- `comando -o argumento` (opção curta, descrita por uma letra)
- `comando --opção argumento` (opção longa, descrita por uma palavra ou frase)

### Comandos

- `whoami`**:** imprime o nome do usuário que está atualmente autenticado no sistema
- `id`**:** imprime informações detalhadas sobre o seu usuário\
    Inclui seu ID de usuário (UID), ID de grupo (GID), entre outras informações.
- `sudo passwd`**:** utilizado para mudar a senha do usuário em sessão
    Você pode fornecer o `nome_do_usuário` como argumento, para alterar a senha do usuário especificado.
- [`chmod -opções permissões arquivo`](#chmod)**:** altera as permissões de acesso de arquivos e diretórios
- [`which comando`](#which)**:** utilizado para encontrar o caminho do executável associado a um comando específico
- `type comando`**:** semelhante ao `which`, mas fornece informações adicionais, incluindo se o comando é um alias, uma função do shell ou um comando integrado
- [`sleep intervalo_de_tempo`](#sleep)**:** faz com que um script ou processo espere por um determinado período de tempo antes de continuar a execução

### Operadores

[`&`](#ecomercial)**:** indica que o comando deve ser executado em segundo plano

### Explicações Detalhes Sobre os Comando e Operadores

- <a id = "chmod"></a>`chmod`**:**

As permissões controlam quem pode ler, escrever ou executar um arquivo ou diretório. O comando `chmod` é uma ferramenta fundamental para gerenciar a segurança e o acesso a arquivos no sistema.

+ `opções`**:** pode incluir opções específicas do comando, como `-R` para aplicar recursivamente a permissão a diretórios e seu conteúdo
+ `permissões`**:** representa as permissões que você deseja conceder ao arquivo ou diretório. Elas podem ser especificadas de diversas maneiras, incluindo:
    - **Notação octal:** por exemplo, `chmod 755 arquivo` concede permissões de leitura, escrita e execução ao proprietário, e permissões de leitura e execução aos outros
    - **Notação simbólica:** por exemplo, `chmod u=rwx,go=rx arquivo` faz a mesma coisa, especificando as permissões diretamente para o proprietário (u), grupo (g) e outros (o)
+ `arquivo`**:** o caminho do arquivo ou diretório cujas permissões você deseja alterar

**Exemplo prático:**

+ `chmod 751 arquivo`**:** concede permissões de leitura e execução ao proprietário, permissões de leitura e execução ao grupo, e apenas permissões de execução aos outros
+ `chmod -R 700 diretório`**:** concede permissões de leitura, escrita e execução, recursivamente a um diretório e seu conteúdo
+ `chmod g+x arquivo`**:** adiciona a permissão de execução ao grupo
    Observe que cada parte das permissões (usuário, grupo e outros) pode ser modificada independentemente, sem afetar as permissões das outras partes, mesmo que estas não sejam especificadas.

- <a id = "which"></a>`which`**:** ele ajuda a determinar onde no sistema de arquivos está localizado o programa ou script que será executado quando você digitar um determinado comando no terminal

- <a id = "sleep"></a>`sleep`**:**

O comando `sleep` é utilizado para introduzir um atraso ou uma pausa no script antes de iniciar o próximo comando. Mesmo para comandos sendo executados em segundo plano, o `sleep` é usado para garantir que haja um intervalo de tempo entre o início de cada aplicativo.

O `intervalo_de_tempo` é especificado por padrão em segundos. Você pode colocar `m` ou `h` após o valor númerico para especificar o intervalo de tempo em minutos ou em horas, respectivamente, por exemplo.

Essa abordagem pode ser útil, pois permite dar tempo para que cada aplicativo seja iniciado antes de prosseguir para o próximo. O valor númerico fornecido como argumento para o `sleep` especifica a quantidade de segundos que o script deve aguardar antes de executar o próximo comando. Isso ajuda a evitar potenciais conflitos ou problemas que pode surgir se várias aplicações forem iniciadas muito rapidamente e simultaneamente.

O uso do `sleep` é uma técnica comum em scripts de automação para garantir que as operações ocorram de maneira ordenada e controlada, especialmente quando há dependências temporais entre as tarefas. Se você tiver certeza que a ordem de iniciação ou sincronização não são críticas para o seu caso específico, você pode optar por remover ou ajudar o tempo de espera fornecido pelo `sleep`.

- <a id = "ecomercial"></a>`&`**:**

O `&` é um operador especial que altera o comportamento de execução do comando. Ele indica ao shell que o comando deve ser executado em segundo plano. Isso significa que o shell não aguardará a conclusão do comando antes de continuar a executar outros comandos. O terminal fica disponível para receber novos comandos imediatamente.

Em termos técnicos, o `&` é um **operador de controle de fluxo** que afeta a execução do processo associado ao comando. Ele não é tratado como um argumento que seria passado para o comando em si. Se você deseja passar um caractere & como parte de um argumento para um comando, você geralmente precisa escapá-lo para evitar que o shell o inteprete como um operador especial.

### Script

A execução de scripts (extesão .sh) no terminal são feitas fornecendo o caminho absoluto ou relativo para o script.\
Além da forma citada acima, se o diretório contendo o script estiver listado na variável de ambiente `PATH`, você pode executá-lo diretamente pelo nome em qualquer lugar. No entanto, isso geralmente não é recomendado para scripts específicos, especialmente se você tiver vários scripts com o mesmo nome.